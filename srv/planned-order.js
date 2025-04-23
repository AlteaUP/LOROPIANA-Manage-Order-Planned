const cds = require("@sap/cds");
const fixExtension = require("./utils/extension");
const plannedOrderUtils = require("./utils/planned-order");

module.exports = class PlannedOrderService extends cds.ApplicationService {
  async init() {
    // const plannedOrder = await cds.connect.to("planned_order");
    // const originalEntity = plannedOrder.model.definitions["planned_order.C_RFM_ManageMfgOrder"];
    // let excludeFields = [];
    // if (cds.model.definitions["api.ExtensionAspect"]) {
    //   excludeFields = Object.keys(
    //     cds.model.definitions["api.ExtensionAspect"].elements
    //   );
    // }
    // let validFields = [];
    // if (originalEntity) {
    //   validFields = Object.keys(originalEntity.elements).filter(
    //     (field) => !excludeFields.includes(field)
    //   );
    // }

    // this.on("READ", "C_RFM_ManageMfgOrder", async (req) => {
    //   let modifiedQuery = fixExtension(req.query, excludeFields, validFields);
    //   const originalSelect = req.query.SELECT;
    //   const { from, where, limit, count } = originalSelect;
    //   const { columns, orderBy } = modifiedQuery.SELECT;
    //   const qry = SELECT.from(from);
    //   if (originalSelect.one) {
    //     if (columns) qry.columns(columns);
    //   } else {
    //     if (where) qry.where(where);
    //     if (orderBy) qry.orderBy(orderBy);
    //     if (columns) qry.columns(columns);
    //     if (count) qry.SELECT.count = true;
    //     qry.limit(limit || { rows: { val: 10 }, offset: { val: 0 } });
    //   }

    //   const data = await plannedOrder.run(qry);
    //   if (Array.isArray(data)) {
    //     const beerIds = data.map((beer) => beer.ID);
    //     let plannedOrderExtensions = await SELECT.from("devtoberfest.PlannedOrderExtensions")
    //       .columns((beer) => {
    //         beer`.*`;
    //       })
    //       .where({ ID: { in: beerIds } });

    //     data.map(async (d) => {
    //       const beerExtension = plannedOrderExtensions.find((e) => e.ID === d.ID);
    //       if (beerExtension) {
    //         d.strength = await plannedOrderUtils.determineStrength(d.abv);
    //         d.style = beerExtension.style;
    //         d.about = beerExtension.about;
    //       }
    //       return d;
    //     });
    //   } else {
    //     const beerExtension = await SELECT.one
    //       .from("devtoberfest.PlannedOrderExtensions")
    //       .columns((beer) => {
    //         beer`.*`;
    //       })
    //       .where({ ID: data.ID });
    //     if (beerExtension) {
    //       data.strength = await plannedOrderUtils.determineStrength(data.abv);
    //       data.style = beerExtension.style;
    //       data.about = beerExtension.about;
    //     }
    //   }

    //   return data;
    // });
    // this.on("*", "*", async (req) => {
    //   return plannedOrder.run(req.query);
    // });
  }
};
