const cds = require("@sap/cds");

module.exports = class MainService extends cds.ApplicationService {
  async init() {
    // console.log('*** init ZZ1_COMBINEDPLNORDERSAPI_CDS')
    const ZZ1_COMBINEDPLNORDERSAPI_CDS = await cds.connect.to("ZZ1_COMBINEDPLNORDERSAPI_CDS");
    const ZZ1_MASTERPLANNEDORDERAPI_CDS = await cds.connect.to("ZZ1_MASTERPLANNEDORDERAPI_CDS");
    const ZZ1_PLANNEDORDERSAPI_CDS = await cds.connect.to("ZZ1_PLANNEDORDERSAPI_CDS");


    const ZZ1_COMBPLNORDERSSTOCKAPI_CDS = await cds.connect.to("ZZ1_COMBPLNORDERSSTOCKAPI_CDS");

    // ZZ1_CombinedPlnOrdersAPI - Start
    this.on("*", "ZZ1_CombinedPlnOrdersAPI", async (req) => {
      const res = await ZZ1_COMBINEDPLNORDERSAPI_CDS.run(req.query)
      // check res is an array
      if (!Array.isArray(res)) {
        return res;
      }
      return res.map((item => {
        let committed_percent = item.PlndOrderCommittedQty / item.PlannedTotalQtyInBaseUnit * 100
        let committed_criticality;
        if (committed_percent === 100) {
          committed_criticality = 3
        } else if (committed_percent < 100 && committed_percent > 0) {
          committed_criticality = 2
        } else {
          committed_criticality = 1
          committed_percent = 100
        }
        console.log({ committed_criticality, committed_percent })
        return {
          ...item,
          committed_percent,
          committed_criticality
        }
      }));
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
      // where = where.slice(0, 3)
      const res = await ZZ1_COMBPLNORDERSSTOCKAPI_CDS.run(SELECT.from(from).where(where))
      return res;
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
      const res = await ZZ1_COMBPLNORDERSSTOCKAPI_CDS.run(SELECT.from(from));
      if (!Array.isArray(res)) {
        return res;
      }

      return res.map(item => {
        console.log(parseInt(item.MatlWrhsStkQtyInMatlBaseUnit).toFixed(3))
        return {
          ...item,
          StorageLocationStock: parseInt(item.MatlWrhsStkQtyInMatlBaseUnit).toFixed(3).toString(),
          TotalProdAllQty: parseInt('0').toFixed(3).toString(),
          TotalPlanAllQty: parseInt('0').toFixed(3).toString(),
          CombPlanAllQty: parseInt('0').toFixed(3).toString(),
          AvaibilityQty: parseInt('0').toFixed(3).toString(),
          TotalInDelQty: parseInt('0').toFixed(3).toString(),
          CustomQty: parseInt(item.MatlWrhsStkQtyInMatlBaseUnit).toFixed(3).toString(),
        }
      })
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
