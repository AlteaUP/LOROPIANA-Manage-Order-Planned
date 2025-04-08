const cds = require("@sap/cds");

module.exports = class MainService extends cds.ApplicationService {
  async init() {
    // PLANNED ORDERS API (Combined, Master, Planned Orders)
    const ZZ1_COMBINEDPLNORDERSAPI_CDS = await cds.connect.to("ZZ1_COMBINEDPLNORDERSAPI_CDS");
    const ZZ1_MASTERPLANNEDORDERAPI_CDS = await cds.connect.to("ZZ1_MASTERPLANNEDORDERAPI_CDS");
    const ZZ1_PLANNEDORDERSAPI_CDS = await cds.connect.to("ZZ1_PLANNEDORDERSAPI_CDS");
    // STOCKS API
    const ZZ1_COMBPLNORDERSSTOCKAPI_CDS = await cds.connect.to("ZZ1_COMBPLNORDERSSTOCKAPI_CDS");
    // ZZ1_I_ARUN_BDBSSUMQTY_CDS
    const ZZ1_I_ARUN_BDBSSUMQTY_CDS = await cds.connect.to("ZZ1_I_ARUN_BDBSSUMQTY_CDS_CDS");
    // ZZ1_MFP_ASSIGNMENT
    const ZZ1_MFP_ASSIGNMENT_CDS = await cds.connect.to("ZZ1_MFP_ASSIGNMENT_CDS");
    // ZZ1_I_SUMQTYDELIVERY_T_CDS
    const ZZ1_I_SUMQTYDELIVERY_T_CDS = await cds.connect.to("ZZ1_I_SUMQTYDELIVERY_T_CDS");

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

      if (!Array.isArray(res)) return res;

      const aReturn = []
      const PlannedCombinedOrder = req.params.at(-1).CplndOrd

      for (let i = 0; i < res.length; i++) {
        const item = res[i];
        const { Plant, Material, StorageLocation, Batch } = item;
        let TotalProdAllQty = 0;
        try {
          // ZZ1_I_ARUN_BDBSSUMQTY_CDS (PLANT, MATERIAL, STORAGELOCATION, BATCH)
          const resTotalProdAllQty = await ZZ1_I_ARUN_BDBSSUMQTY_CDS.run(SELECT.from('ZZ1_I_ARUN_BDBSSUMQTY_CDS').where({ Plant, Material, StorageLocation, Batch }));
          // console.log({ Plant, Material, StorageLocation, Batch, resTotalProdAllQty })
          TotalProdAllQty += resTotalProdAllQty.reduce((sum, item) => sum + parseFloat(item.TotalAllocQty), 0);
        } catch (error) {
          console.log('Error in resTotalProdAllQty', error);
        }
        let TotalPlanAllQty = 0;
        try {
          // ZZ1_MFP_ASSIGNMENT fare la somma QTA_ASS accedendo per werks = PLANT, MATNR = MATERIAL, CHARG = BATCH,
          const resTotalPlanAllQty = await ZZ1_MFP_ASSIGNMENT_CDS.run(SELECT.from('ZZ1_MFP_ASSIGNMENT').where({ WERKS: Plant, MATNR: Material, CHARG: Batch, LGORT: StorageLocation }));
          // console.log({ Plant, Material, StorageLocation, Batch, resTotalPlanAllQty })
          TotalPlanAllQty += resTotalPlanAllQty.reduce((sum, item) => sum + parseFloat(item.QTA_ASS_V), 0);
        } catch (e) {
          console.log('Error in resTotalPlanAllQty', e)
        }
        let CombPlanAllQty = 0;
        try {
          // ZZ1_MFP_ASSIGNMENT fare la somma QTA_ASS accedendo per FSH_MPLO_ORD = planned combined order werks = PLANT, MATNR = MATERIAL, CHARG = BATCH,
          const resCombPlanAllQty = await ZZ1_MFP_ASSIGNMENT_CDS.run(SELECT.from('ZZ1_MFP_ASSIGNMENT').where({ FSH_MPLO_ORD: PlannedCombinedOrder, WERKS: Plant, MATNR: Material, CHARG: Batch, LGORT: StorageLocation }));
          // console.log({
          //   PlannedCombinedOrder,
          //   Material,
          //   StorageLocation,
          //   Batch,
          //   resCombPlanAllQty
          // })
          CombPlanAllQty = resCombPlanAllQty.reduce((sum, item) => sum + parseFloat(item.QTA_ASS_V), 0);
        } catch (error) {
          console.log('Error in resCombPlanAllQty', error)
        }
        // StorageLocationStock - TotalProdAllQty - CombPlanAllQty
        let AvaibilityQty = (parseFloat(item.MatlWrhsStkQtyInMatlBaseUnit) - parseFloat(TotalProdAllQty) - parseFloat(CombPlanAllQty)).toFixed(3).toString();
        if (AvaibilityQty < 0) AvaibilityQty = 0;

        // somma ZZ1_I_SUMQTYDELIVERY_T.TOTDELIVERYQTY accedendo con MATERIAL, STORLOC, BATCH
        let TotalDeliveryQty = 0;
        try {
          const resTotalDeliveryQty = await ZZ1_I_SUMQTYDELIVERY_T_CDS.run(SELECT.from('ZZ1_I_SUMQTYDELIVERY_T').where({ Material: Material, StorLoc: StorageLocation, Batch: Batch }));
          // console.log({
          //   Material,
          //   StorLoc: StorageLocation,
          //   Batch,
          //   resTotalDeliveryQty
          // })
          TotalDeliveryQty += resTotalDeliveryQty.reduce((sum, item) => sum + parseFloat(item.TotDeliveryQty), 0);
        } catch (error) {
          console.log('Error in resTotalDeliveryQty', error);
        }

        aReturn.push({
          ...item,
          StorageLocationStock: parseInt(item.MatlWrhsStkQtyInMatlBaseUnit).toFixed(3).toString(),
          TotalProdAllQty: TotalProdAllQty.toFixed(3).toString(),
          TotalPlanAllQty: TotalPlanAllQty.toFixed(3).toString(),
          CombPlanAllQty: CombPlanAllQty.toFixed(3).toString(),
          AvaibilityQty: AvaibilityQty,
          TotalInDelQty: TotalDeliveryQty.toFixed(3).toString(),
          CustomQty: parseInt(item.MatlWrhsStkQtyInMatlBaseUnit).toFixed(3).toString(),
        })
      }
      return aReturn;
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
    this.on("disassemble", async (req) => {
      debugger;
    });
    this.on("assemble", async (req) => {
      debugger;
    });
  }
};
