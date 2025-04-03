const cds = require("@sap/cds");

module.exports = class MainService extends cds.ApplicationService {
  async init() {
    // console.log('*** init ZZ1_COMBINEDPLNORDERSAPI_CDS')
    const ZZ1_COMBINEDPLNORDERSAPI_CDS = await cds.connect.to("ZZ1_COMBINEDPLNORDERSAPI_CDS");
    const ZZ1_MASTERPLANNEDORDERAPI_CDS = await cds.connect.to("ZZ1_MASTERPLANNEDORDERAPI_CDS");
    const ZZ1_COMBPLNORDERSSTOCKAPI_CDS = await cds.connect.to("ZZ1_COMBPLNORDERSSTOCKAPI_CDS");
    const ZZ1_PLANNEDORDERSAPI_CDS = await cds.connect.to("ZZ1_PLANNEDORDERSAPI_CDS");
    // ZZ1_CombinedPlnOrdersAPI - Start
    this.on("*", "ZZ1_CombinedPlnOrdersAPI", async (req) => {
      return ZZ1_COMBINEDPLNORDERSAPI_CDS.run(req.query);
    });

    this.on("*", "ZZ1_CombinedPlnOrdersAPI/to_ZZ1_MasterPlannedOrders", async (req) => {
      return ZZ1_COMBINEDPLNORDERSAPI_CDS.run(req.query);
    });

    this.on("*", "ZZ1_CombinedPlnOrdersAPI/to_ZZ1_CombinPlannedOrdersCom", async (req) => {
      return ZZ1_COMBINEDPLNORDERSAPI_CDS.run(req.query);
    });

    this.on("*", "ZZ1_CombinedPlnOrdersAPI/to_ZZ1_PLOCAPACITYCORD", async (req) => {
      return ZZ1_COMBINEDPLNORDERSAPI_CDS.run(req.query);
    });

    this.on("*", "ZZ1_CombinedPlnOrdersAPI/to_CombinPlannedOrdersCom", async (req) => {
      let from, where;
      from = "ZZ1_CombPlnOrdersStockAPI"
      where = req.query.SELECT.from.ref[0].where
      where = where.slice(0, 3)
      return ZZ1_COMBPLNORDERSSTOCKAPI_CDS.run(SELECT.from(from).where(where));
    });

    this.on("*", "ZZ1_CombinedPlnOrdersAPI/to_CombinPlannedOrdersCom/to_ZZ1_CombPlnOrdersStock", async (req) => {
      let from = {
        ref: [
          {
            id: "ZZ1_CombPlnOrdersStockAPI",
            where: req.query.SELECT.from.ref[1].where
          },
          req.query.SELECT.from.ref[2]
        ]
      }
      return ZZ1_COMBPLNORDERSSTOCKAPI_CDS.run(SELECT.from(from));
    });
    // ZZ1_CombinedPlnOrdersAPI - End
    // ZZ1_MASTERPLANNEDORDERAPI - Start
    this.on("*", "ZZ1_MasterPlannedOrderAPI", async (req) => {
      return ZZ1_MASTERPLANNEDORDERAPI_CDS.run(req.query);
    })
    // ZZ1_MASTERPLANNEDORDERAPI - End

    // ZZ1_PLANNEDORDERSAPI - Start
    this.on("*", "ZZ1_PlannedOrdersAPI", async (req) => {
      return ZZ1_PLANNEDORDERSAPI_CDS.run(req.query);
    })
    // ZZ1_PLANNEDORDERSAPI - End

    // ZZ1_COMBPLNORDERSSTOCKAPI - Start
    this.on("*", "ZZ1_CombPlnOrdersStockAPI", async (req) => {
      return ZZ1_COMBPLNORDERSSTOCKAPI_CDS.run(req.query);
    });
    this.on("*", "ZZ1_CombPlnOrdersStock", async (req) => {
      return ZZ1_COMBPLNORDERSSTOCKAPI_CDS.run(req.query);
    });
    // ZZ1_COMBPLNORDERSSTOCKAPI - End
  }
};
