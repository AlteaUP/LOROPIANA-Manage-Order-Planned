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

    const ZMPF_ASS_BATCH_SRV = await cds.connect.to('ZMPF_ASS_BATCH_SRV');

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
      const res = await ZZ1_COMBINEDPLNORDERSAPI_CDS.run(req.query)
      debugger;
      return res;
    });

    this.on("*", "ZZ1_CombinedPlnOrdersAPI/to_CombinPlannedOrdersCom", async (req) => {
      let from, where;
      from = "ZZ1_CombPlnOrdersStockAPI"
      where = req.query.SELECT.from.ref[0].where.slice(0, 4)
      let resAll = []
      let TotalProdAllQty = 0;
      if (req.query.SELECT.from.ref[1] && req.query.SELECT.from.ref[1].where && req.query.SELECT.from.ref[1].where.length > 0) {
        // 1. Fetch the data
        resAll = await ZZ1_COMBPLNORDERSSTOCKAPI_CDS.run(SELECT.from(from).where(where.slice(0, where.length - 1)))
        const materialWhere = req.query.SELECT.from.ref[1].where.slice(0, 3)
        where.push(...materialWhere)

        // 2. Exit early if no data
        if (Array.isArray(resAll) && resAll.length > 0) {
          const PlannedCombinedOrder = req.params.at(-1)?.CplndOrd;

          if (PlannedCombinedOrder) {
            // 3. Query assignment data in batch for better performance
            const assignmentData = await ZZ1_MFP_ASSIGNMENT_CDS.run(
              SELECT.from('ZZ1_MFP_ASSIGNMENT')
                .where({
                  FSH_MPLO_ORD: PlannedCombinedOrder,
                  WERKS: { in: resAll.map(i => i.Plant) },
                  MATNR: { in: resAll.map(i => i.Material) }
                })
            );
            // 4. Create lookup map for faster access
            const combPlanAllQtyMap = createLookupMap(assignmentData, 'WERKS', 'MATNR');

            // 5. Calculate CombPlanAllQty for each record and sum up
            TotalProdAllQty = resAll.reduce((sum, item) => {
              const { Plant, Material } = item;
              const key = `${Plant}|${Material}`;
              const combPlanItems = combPlanAllQtyMap[key] || [];
              const itemCombPlanAllQty = sumValues(combPlanItems, 'QTA_ASS_V');
              return sum + itemCombPlanAllQty;
            }, 0);
          }
        }
      } else {
        // remove latest where condition from where array
        where.pop()
      }

      const res = await ZZ1_COMBPLNORDERSSTOCKAPI_CDS.run(SELECT.from(from).where(where))
      res['$count'] = res.length.toString();
      // if the res is array of one row
      if (Array.isArray(res) && res.length === 1) {
        res[0].TotalProdAllQty = TotalProdAllQty.toFixed(3);
        // AvailableQuantity / RequiredQuantity
        let chart_percent = Math.round(parseFloat(res[0].AvailableQuantity) / parseFloat(res[0].RequiredQuantity) * 100);
        let chart_criticality;
        if (chart_percent === 100) {
          chart_criticality = 3
        } else if (chart_percent < 100 && chart_percent > 0) {
          chart_criticality = 2
        } else {
          chart_criticality = 1
          chart_percent = 100
        }
        res[0].chart_percent = chart_percent;
        res[0].chart_criticality = chart_criticality;

      } else {
        // Calculate TotalPlanAllQty and CombPlanAllQty for each record
        if (Array.isArray(res) && res.length > 0) {
          const PlannedCombinedOrder = req.params.at(-1)?.CplndOrd;

          // Batch query to get all assignment data
          const allAssignmentData = await ZZ1_MFP_ASSIGNMENT_CDS.run(
            SELECT.from('ZZ1_MFP_ASSIGNMENT')
              .where({
                WERKS: { in: res.map(i => i.Plant) },
                MATNR: { in: res.map(i => i.Material) }
              })
          );

          // Create lookup maps
          const allAssignmentsMap = createLookupMap(allAssignmentData, 'WERKS', 'MATNR');

          // If we have a specific combined order, get its assignments too
          let combPlanAssignmentsMap = {};
          if (PlannedCombinedOrder) {
            const combPlanAssignmentData = await ZZ1_MFP_ASSIGNMENT_CDS.run(
              SELECT.from('ZZ1_MFP_ASSIGNMENT')
                .where({
                  FSH_MPLO_ORD: PlannedCombinedOrder,
                  WERKS: { in: res.map(i => i.Plant) },
                  MATNR: { in: res.map(i => i.Material) }
                })
            );
            combPlanAssignmentsMap = createLookupMap(combPlanAssignmentData, 'WERKS', 'MATNR');
          }

          // Calculate and add the values to each record
          res.forEach(item => {
            const { Plant, Material } = item;
            const key = `${Plant}|${Material}`;

            const allAssignments = allAssignmentsMap[key] || [];
            const combPlanAssignments = combPlanAssignmentsMap[key] || [];

            const TotalPlanAllQty = sumValues(allAssignments, 'QTA_ASS_V');
            const CombPlanAllQty = sumValues(combPlanAssignments, 'QTA_ASS_V');

            item.TotalPlanAllQty = TotalPlanAllQty.toFixed(3);
            item.CombPlanAllQty = CombPlanAllQty.toFixed(3);
            // AvailableQuantity / RequiredQuantity
            let chart_percent = Math.round(parseFloat(item.AvailableQuantity) / parseFloat(item.RequiredQuantity) * 100);
            let chart_criticality;
            if (chart_percent === 100) {
              chart_criticality = 3
            } else if (chart_percent < 100 && chart_percent > 0) {
              chart_criticality = 2
            } else {
              chart_criticality = 1
              chart_percent = 100
            }
            item.chart_percent = chart_percent;
            item.chart_criticality = chart_criticality;
          });
        }
      }

      return res;
    });

    this.on("*", "ZZ1_CombinedPlnOrdersAPI/to_CombinPlannedOrdersCom/to_ZZ1_CombPlnOrdersStock", async (req) => {
      // 1. Get base stock data
      debugger;
      // add InventoryStockType eq 1
      let from = {
        ref: [
          {
            id: "ZZ1_CombPlnOrdersStockAPI",
            where: req.query.SELECT.from.ref[1].where
          },
          req.query.SELECT.from.ref[2]
          // {
          // id: req.query.SELECT.from.ref[2],
          // where: [
          //   { ref: ['InventoryStockType'] },
          //   'eq',
          //   { val: '1' }
          // ]
          // }
        ]
      };
      const stockData = await ZZ1_COMBPLNORDERSSTOCKAPI_CDS.run(SELECT.from(from));
      if (!Array.isArray(stockData) || stockData.length === 0) return stockData;

      const PlannedCombinedOrder = req.params.at(-1).CplndOrd;

      // 2. Extract all unique combinations for batch queries
      const materialPlantBatchLocations = stockData.map(item => ({
        Plant: item.Plant,
        Material: item.Material,
        StorageLocation: item.StorageLocation,
        Batch: item.Batch
      }));

      // 3. Batch query for TotalProdAllQty
      const prodAllQtyPromise = ZZ1_I_ARUN_BDBSSUMQTY_CDS.run(
        SELECT.from('ZZ1_I_ARUN_BDBSSUMQTY_CDS')
          .where({
            Plant: { in: stockData.map(i => i.Plant) },
            Material: { in: stockData.map(i => i.Material) }
          })
      );

      // 4. Batch query for TotalPlanAllQty
      const planAllQtyPromise = ZZ1_MFP_ASSIGNMENT_CDS.run(
        SELECT.from('ZZ1_MFP_ASSIGNMENT')
          .where({
            WERKS: { in: stockData.map(i => i.Plant) },
            MATNR: { in: stockData.map(i => i.Material) }
          })
      );

      // 5. Batch query for CombPlanAllQty with the specific planned order
      const combPlanAllQtyPromise = ZZ1_MFP_ASSIGNMENT_CDS.run(
        SELECT.from('ZZ1_MFP_ASSIGNMENT')
          .where({
            FSH_MPLO_ORD: PlannedCombinedOrder,
            WERKS: { in: stockData.map(i => i.Plant) },
            MATNR: { in: stockData.map(i => i.Material) }
          })
      );

      // 6. Batch query for TotalDeliveryQty
      const deliveryQtyPromise = ZZ1_I_SUMQTYDELIVERY_T_CDS.run(
        SELECT.from('ZZ1_I_SUMQTYDELIVERY_T')
          .where({
            Material: { in: stockData.map(i => i.Material) },
            StorLoc: { in: stockData.map(i => i.StorageLocation) }
          })
      );

      // 7. Execute all queries in parallel
      const [prodAllQtyData, planAllQtyData, combPlanAllQtyData, deliveryQtyData] =
        await Promise.all([prodAllQtyPromise, planAllQtyPromise, combPlanAllQtyPromise, deliveryQtyPromise]);

      // 8. Create lookup maps for faster association
      const prodAllQtyMap = createLookupMap(prodAllQtyData, 'Plant', 'Material', 'StorageLocation', 'Batch');
      const planAllQtyMap = createLookupMap(planAllQtyData, 'WERKS', 'MATNR', 'LGORT', 'CHARG');
      const combPlanAllQtyMap = createLookupMap(combPlanAllQtyData, 'WERKS', 'MATNR', 'LGORT', 'CHARG');
      const deliveryQtyMap = createLookupMap(deliveryQtyData, 'Material', 'StorLoc', 'Batch');


      debugger;
      // 9. Process results with maps instead of additional queries
      const res = stockData.filter(({ InventoryStockType }) => InventoryStockType === '01').map(item => {
        const { Plant, Material, StorageLocation, Batch } = item;
        const key = `${Plant}|${Material}|${StorageLocation}|${Batch}`;

        const prodItems = prodAllQtyMap[key] || [];
        const planItems = planAllQtyMap[`${Plant}|${Material}|${StorageLocation}|${Batch}`] || [];
        const combPlanItems = combPlanAllQtyMap[`${Plant}|${Material}|${StorageLocation}|${Batch}`] || [];
        const deliveryItems = deliveryQtyMap[`${Material}|${StorageLocation}|${Batch}`] || [];

        const TotalProdAllQty = sumValues(prodItems, 'TotalAllocQty');
        const TotalPlanAllQty = sumValues(planItems, 'QTA_ASS_V');
        const CombPlanAllQty = sumValues(combPlanItems, 'QTA_ASS_V');
        const TotalDeliveryQty = sumValues(deliveryItems, 'TotDeliveryQty');

        let AvaibilityQty = (parseFloat(item.MatlWrhsStkQtyInMatlBaseUnit) -
          TotalProdAllQty - TotalPlanAllQty - TotalDeliveryQty).toFixed(3).toString();
        if (AvaibilityQty < 0) AvaibilityQty = "0.000";
        return {
          ...item,
          StorageLocationStock: parseFloat(item.MatlWrhsStkQtyInMatlBaseUnit).toFixed(3).toString(),
          TotalProdAllQty: TotalProdAllQty.toFixed(3).toString(),
          TotalPlanAllQty: TotalPlanAllQty.toFixed(3).toString(),
          CombPlanAllQty: CombPlanAllQty.toFixed(3).toString(),
          AvaibilityQty,
          TotalInDelQty: TotalDeliveryQty.toFixed(3).toString(),
          CustomQty: parseFloat(item.MatlWrhsStkQtyInMatlBaseUnit).toFixed(3).toString()
        };
      });

      res['$count'] = res.length.toString();
      return res;
    });

    // Helper functions
    function createLookupMap(data, ...keys) {
      const map = {};
      if (!Array.isArray(data)) return map;

      data.forEach(item => {
        const keyValues = keys.map(k => item[k]);
        const key = keyValues.join('|');
        if (!map[key]) map[key] = [];
        map[key].push(item);
      });
      return map;
    }

    function sumValues(items, propertyName) {
      if (!Array.isArray(items)) return 0;
      return items.reduce((sum, item) => sum + parseFloat(item[propertyName] || 0), 0);
    }

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
      return ZZ1_COMBPLNORDERSSTOCKAPI_CDS.run(req.query)
    });
    this.on("*", "ZZ1_CombPlnOrdersStock", async (req) => {
      return ZZ1_COMBPLNORDERSSTOCKAPI_CDS.run(req.query);
    });
    // ZZ1_COMBPLNORDERSSTOCKAPI - End
    this.on('INSERT', 'ZZ1_MFP_ASSIGNMENT', async (req) => {
      console.log('[INSERT]*************')
      return ZZ1_MFP_ASSIGNMENT_CDS.run(req.query);
    });

    this.on('UPDATE', 'ZZ1_MFP_ASSIGNMENT', async (req) => {
      console.log('[PATCH]*************')
      let res;
      try {
        res = await ZZ1_MFP_ASSIGNMENT_CDS.run(req.query);
      } catch (error) {
        console.error('Error in UPDATE ZZ1_MFP_ASSIGNMENT:', error);
        return req.error(500, error.message);
      };
    });

    this.on("READ", "ZZ1_MFP_ASSIGNMENT", async (req) => {
      console.log('[GET]*************')
      const res = await ZZ1_MFP_ASSIGNMENT_CDS.run(req.query)
      return res;

    });
    this.on("DELETE", "ZZ1_MFP_ASSIGNMENT", async (req) => {
      console.log('[DELETE]*************')
      const res = await ZZ1_MFP_ASSIGNMENT_CDS.run(req.query)
      return res;

    });

    this.on("disassemble", async (req) => {
      debugger;
    });

    this.on("assemble", async (req) => {
      const data = req.body;
      const res = await ZZ1_MFP_ASSIGNMENT_CDS.insert("ZZ1_MFP_ASSIGNMENT").entries([data]);
      return res;
    });


    this.on("*", "ConvertPLO", async (req) => {
      return await ZMPF_ASS_BATCH_SRV.run(req.query);
    });

    this.on('myNewAction', async (req) => {
      return true; // or any appropriate response
    });

    // ATP Planned Orders action handler
    this.on('atpPlo', async (req) => {
      try {
        const { Payload: { id, atpplo } } = req.data;

        if (!id || !Array.isArray(atpplo)) {
          return false;
        }
        debugger;
        // Access the ATP service
        const ZS_RFM_ATP_PLANNED_ORDERS = await cds.connect.to('ZS_RFM_ATP_PLANNED_ORDERS');

        // Create header record
        // const headerResult = await ZS_RFM_ATP_PLANNED_ORDERS.create('atp_header').entries({ id });

        // Create items with reference to the header
        // const itemEntries = atpplo.map(item => ({
        //   id: item.id,
        //   fsh_cplnd_ord: item.fsh_cplnd_ord,
        //   flag: item.flag,
        //   parent_id: id
        // }));

        // Insert all items in one batch
        // const itemsResult = await ZS_RFM_ATP_PLANNED_ORDERS.create('atp_item').entries(itemEntries);

        return ZS_RFM_ATP_PLANNED_ORDERS.tx(req).post("/atp_header", {
          id,
          atpplo
        })
      } catch (error) {
        console.error('Error in atpPlo action:', error);
        req.error(500, error.message);
        return false;
      }
    });
  }
};
