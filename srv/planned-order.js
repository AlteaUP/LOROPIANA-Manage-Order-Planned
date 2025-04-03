const cds = require("@sap/cds");
const fixExtension = require("./utils/extension");
const plannedOrderUtils = require("./utils/planned-order");

module.exports = class PlannedOrderService extends cds.ApplicationService {
  async init() {
    // console.log('*** init plannedOrder')
    const plannedOrder = await cds.connect.to("planned_order");
    // console.log({ plannedOrder })
    // Get the original entity definition from the on-premise service. Because it's been extended, it will contain
    // the added fields from the extension aspect
    const originalEntity = plannedOrder.model.definitions["planned_order.C_RFM_ManageMfgOrder"];
    // console.log({ originalEntity })
    // Extract the added fields from the extension aspect

    let excludeFields = [];
    if (cds.model.definitions["api.ExtensionAspect"]) {
      excludeFields = Object.keys(
        cds.model.definitions["api.ExtensionAspect"].elements
      );
    }
    // console.log({ excludeFields })
    // Create a list of valid fields, which is all original fields minus excluded fields.
    let validFields = [];
    if (originalEntity) {
      validFields = Object.keys(originalEntity.elements).filter(
        (field) => !excludeFields.includes(field)
      );
    }
    // console.log({ validFields })
    /**
     * Handles the "READ" event for the "PlannedOrder" entity.
     *
     * @param {Object} req - The request object.
     * @param {Object} req.query - The query object from the request.
     * @returns {Promise<Object>} The result of executing the query.
     */
    this.on("READ", "C_RFM_ManageMfgOrder", async (req) => {
      // console.log('*** READ plannedOrder')
      // Clone the original query and remove the extension fields
      let modifiedQuery = fixExtension(req.query, excludeFields, validFields);

      const originalSelect = req.query.SELECT;
      const { from, where, limit, count } = originalSelect;
      const { columns, orderBy } = modifiedQuery.SELECT;
      const qry = SELECT.from(from);

      // single entity vs entityset. Entityset queries have more options.
      if (originalSelect.one) {
        if (columns) qry.columns(columns);
      } else {
        if (where) qry.where(where);
        if (orderBy) qry.orderBy(orderBy);
        if (columns) qry.columns(columns);
        if (count) qry.SELECT.count = true;
        qry.limit(limit || { rows: { val: 10 }, offset: { val: 0 } });
      }

      const data = await plannedOrder.run(qry);

      // !!!! Now add your virtual fields and custom extension data !!!!
      if (Array.isArray(data)) {
        const beerIds = data.map((beer) => beer.ID);
        let plannedOrderExtensions = await SELECT.from("devtoberfest.PlannedOrderExtensions")
          .columns((beer) => {
            beer`.*`;
          })
          .where({ ID: { in: beerIds } });

        data.map(async (d) => {
          const beerExtension = plannedOrderExtensions.find((e) => e.ID === d.ID);
          if (beerExtension) {
            d.strength = await plannedOrderUtils.determineStrength(d.abv);
            d.style = beerExtension.style;
            d.about = beerExtension.about;
          }
          return d;
        });
      } else {
        const beerExtension = await SELECT.one
          .from("devtoberfest.PlannedOrderExtensions")
          .columns((beer) => {
            beer`.*`;
          })
          .where({ ID: data.ID });
        if (beerExtension) {
          data.strength = await plannedOrderUtils.determineStrength(data.abv);
          data.style = beerExtension.style;
          data.about = beerExtension.about;
        }
      }

      return data;
    });

    // /**
    //  * Handles the "CREATE" event for the "PlannedOrder" entity.
    //  * Clones the original query, removes extension fields, and persists custom extension data.
    //  *
    //  * @param {Object} req - The request object.
    //  * @param {Object} req.query - The query object containing the data to be inserted.
    //  * @returns {Promise<Object>} The result of the query execution.
    //  */
    // this.on("CREATE", "PlannedOrder", async (req) => {
    //   // Clone the original query and remove the extension fields
    //   // from the entities that are being created
    //   let qry = fixExtension(req.query, excludeFields, validFields);

    //   const data = await plannedOrder.run(qry);

    //   // Now persist the custom extension data
    //   const plannedOrderExtensions = req.query.INSERT.entries.map((beer) => {
    //     return {
    //       ID: beer.ID,
    //       style: beer.style,
    //       about: beer.about,
    //     };
    //   });

    //   await INSERT.into("devtoberfest.PlannedOrderExtensions").entries(plannedOrderExtensions);

    //   // Update the data object with the properties from the extension entity
    //   Object.assign(data, plannedOrderExtensions);

    //   return data;
    // });

    // /**
    //  * Handles the "UPDATE" event for the "PlannedOrder" entity.
    //  * Clones the original query, removes extension fields, and persists custom extension data.
    //  *
    //  * @param {Object} req - The request object.
    //  * @param {Object} req.query - The query object containing the data to be updated.
    //  * @returns {Promise<Object>} The result of the query execution.
    //  */
    // this.on("UPDATE", "PlannedOrder", async (req) => {
    //   // Clone the original query and remove the extension fields
    //   // from the entities that are being updated
    //   let qry = fixExtension(req.query, excludeFields, validFields);

    //   const data = await plannedOrder.run(qry);

    //   // Now persist the custom extension data
    //   const updateData = req.query.UPDATE.data;
    //   const beerExtension = {};
    //   if (updateData.style !== undefined)
    //     beerExtension.style = updateData.style;
    //   if (updateData.about !== undefined)
    //     beerExtension.about = updateData.about;
    //   await UPDATE("devtoberfest.PlannedOrderExtensions")
    //     .with(beerExtension)
    //     .where({ ID: updateData.ID });

    //   // Update the data object with the properties from the extension entity
    //   Object.assign(data, beerExtension);

    //   return data;
    // });

    // this.on("DELETE", "PlannedOrder", async (req) => {
    //   const data = await plannedOrder.run(req.query);
    //   await DELETE("devtoberfest.PlannedOrderExtensions").where(req.query.DELETE.from.ref[0].where);
    //   return data;
    // });

    /**
     * Handles all incoming requests for any event and any entity.
     * (This has to be last!!!)
     *
     * @param {string} event - The event name.
     * @param {string} entity - The entity name.
     * @param {Function} handler - The handler function to process the request.
     * @param {Object} handler.req - The request object.
     * @param {Object} handler.req.query - The query object from the request.
     * @returns {Promise<Object>} The result of executing the query.
     */
    this.on("*", "*", async (req) => {
      return plannedOrder.run(req.query);
    });
  }
};
