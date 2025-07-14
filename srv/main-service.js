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

    const ZI_RFM_ATP_RULES_CDS = await cds.connect.to('ZI_RFM_ATP_RULES_CDS');

    const changeWorkCenter = await cds.connect.to('ZZ1_MFP_WRKC_UPDATE_CDS');

    const externalATPService = await cds.connect.to("ZSD_RFM_ATP_CHANGE_WC");

    const ZZ1_COMBPLANNEDORDER_F4_CDS = await cds.connect.to("ZZ1_COMBPLANNEDORDER_F4_CDS");
    const ZZ1_PRODUCTIONPLANT_F4_CDS = await cds.connect.to("ZZ1_PRODUCTIONPLANT_F4_CDS");
    const ZZ1_MRPCONTROLLER_F4_CDS = await cds.connect.to("ZZ1_MRPCONTROLLER_F4_CDS");
    const ZZ1_WORKCENTER_F4_CDS = await cds.connect.to("ZZ1_WORKCENTER_F4_CDS");
    const ZZ1_PRODUCTSEASON_F4_CDS = await cds.connect.to("ZZ1_PRODUCTSEASON_F4_CDS");
    const ZZ1_PLANNEDORDERTYPE_F4_CDS = await cds.connect.to("ZZ1_PLANNEDORDERTYPE_F4_CDS");


    


    // ZZ1_CombinedPlnOrdersAPI - Start
    this.on("*", "ZZ1_CombinedPlnOrdersAPI", async (req) => {

      const res = await ZZ1_COMBINEDPLNORDERSAPI_CDS.run(req.query)
      // console.log(res)
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
      return res;
    });

    this.on("*", "ZZ1_CombinedPlnOrdersAPI/to_ZZ1_PLOCAPACITYCORD_TEXT", async (req) => {

      const res = await ZZ1_COMBINEDPLNORDERSAPI_CDS.run(req.query)
      return res;
    });

    this.on("*", "ZZ1_PLOCAPACITYCORD_TEXT", async (req) => {

      const res = await ZZ1_COMBINEDPLNORDERSAPI_CDS.run(req.query)
      return res;
    });



    this.on("*", "ZZ1_CombinedPlnOrdersAPI/to_ZZ1_MFI_CR_TYPE_PLA", async (req) => {
      return ZZ1_COMBINEDPLNORDERSAPI_CDS.run(req.query);
    });


    // Table - Components
    this.on("*", "ZZ1_CombinedPlnOrdersAPI/to_CombinPlannedOrdersCom", async (req) => {
      debugger;
      let from, where;
      from = "ZZ1_CombPlnOrdersStockAPI"
      where = req.query.SELECT.from.ref[0].where //.slice(0, 4)
      const whereAll = [].concat(where);
      if (req.params.at(-1)?.Material) {
        where.push('and', {
          ref: ['Material'],
        }, '=', {
          val: req.params.at(-1).Material,
        });

      }

      let resAll = []
      let TotalProdAllQty = 0;
      if (req.query.SELECT.from.ref[1] && req.query.SELECT.from.ref[1].where && req.query.SELECT.from.ref[1].where.length > 0) {
        // 1. Fetch the data
        debugger;
        resAll = await ZZ1_COMBPLNORDERSSTOCKAPI_CDS.run(SELECT.from(from).where(whereAll));
        // const materialWhere = req.query.SELECT.from.ref[1].where.slice(0, 3)
        // where.push(...materialWhere)

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
        // where.pop()
      }

      const res = await ZZ1_COMBPLNORDERSSTOCKAPI_CDS.run(SELECT.from(from).where(where))
      res['$count'] = res.length.toString();
      // if the res is array of one row
      if (Array.isArray(res) && res.length === 1) {
        const PlannedCombinedOrder = req.params.at(-1)?.CplndOrd;
        const CrossPlantConfigurableProduct = req.params.at(-1)?.CrossPlantConfigurableProduct;

        // Batch query to get all assignment data


        // Create lookup maps

        // If we have a specific combined order, get its assignments too
        let combPlanAssignmentsMap = {};
        let allAssignmentsMap = {}
        if (PlannedCombinedOrder) {
          const allAssignmentData = await ZZ1_MFP_ASSIGNMENT_CDS.run(
            SELECT.from('ZZ1_MFP_ASSIGNMENT')
              .where({
                FSH_MPLO_ORD: PlannedCombinedOrder,
                WERKS: { in: res.map(i => i.Plant) },
                MATNR: { in: res.map(i => i.Material) }
              })
          );

          allAssignmentsMap = createLookupMap(allAssignmentData, 'WERKS', 'MATNR');

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

        res[0].TotalProdAllQty = TotalProdAllQty.toFixed(3);

        const key = `${res[0].Plant}|${res[0].Material}`;
        const allAssignments = allAssignmentsMap[key] || [];
        const combPlanAssignments = combPlanAssignmentsMap[key] || [];

        res[0].TotalPlanAllQty = sumValues(allAssignments, 'QTA_ASS_V').toFixed(3);
        res[0].CombPlanAllQty = sumValues(combPlanAssignments, 'QTA_ASS_V').toFixed(3); // Added toFixed(3)

        // TotalPlanAllQty / AvailableQuantity
        let chart_percent = Math.round(parseFloat(res[0].TotalPlanAllQty) / parseFloat(res[0].AvailableQuantity) * 100);
        let chart_criticality;
        debugger;
        if (chart_percent >= 100) {
          chart_criticality = 3
        } else if (chart_percent < 100 && chart_percent > 0) {
          chart_criticality = 2
        } else {
          chart_criticality = 1
          // chart_percent = 100
        }
        res[0].chart_percent = chart_percent;
        res[0].chart_criticality = chart_criticality;



        // call combinend order api to retrieve CommittedQty
        const CommittedQty = await ZZ1_COMBINEDPLNORDERSAPI_CDS.run(
          SELECT.from('ZZ1_CombinedPlnOrdersAPI')
            .where({
              CplndOrd: PlannedCombinedOrder,
              CrossPlantConfigurableProduct: CrossPlantConfigurableProduct,
            })
        );

        res[0].RequestFinished = parseInt(CommittedQty[0].PlndOrderCommittedQty);

        // (Request Finished / Required) * Tot Assigned Comb
        // (60 / 39) * 35

        if (parseInt(res[0].TotalPlanAllQty) > 0 && parseInt(res[0].CombPlanAllQty) > 0) {
          res[0].FinishedProductQty = parseInt((parseFloat(res[0].RequestFinished) / parseFloat(res[0].RequiredQuantity) * parseFloat(res[0].CombPlanAllQty)));
        } else {
          res[0].FinishedProductQty = parseInt("0");
        }



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
            if (chart_percent >= 100) {
              chart_criticality = 3
            } else if (chart_percent < 100 && chart_percent > 0) {
              chart_criticality = 2
            } else {
              chart_criticality = 1
              chart_percent = 100
            }
            item.chart_percent = chart_percent; // Components
            item.chart_criticality = chart_criticality; // Components
            // Finished product qty: (Required Quantity (del componente) / Planned Total Qty) * Comb Plan All qty;
            if (parseInt(item.TotalPlanAllQty) > 0 && parseInt(item.CombPlanAllQty) > 0) {
              item.FinishedProductQty = (parseFloat(item.RequiredQuantity) / parseFloat(item.TotalPlanAllQty) * parseFloat(item.CombPlanAllQty)).toFixed(3);
            } else {
              item.FinishedProductQty = parseInt("0").toFixed(3);
            }
          });
        }
      }

      return res;
    });

    this.on("*", "ZZ1_CombinedPlnOrdersAPI/to_CombinPlannedOrdersCom/to_ZZ1_CombPlnOrdersStock", async (req) => {
      // 1. Get base stock data
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

      // modifica DL - 10/06/2025 - recupero atp
      const atpRulesPromise = ZI_RFM_ATP_RULES_CDS.run(
        SELECT.from('ZI_RFM_ATP_RULES')
          .where({
            CplndOrd: req.params.at(-1).CplndOrd,
            CrossPlantConfigurableProduct: req.params.at(-1).CrossPlantConfigurableProduct,
            Material: req.params.at(-1).Material,
            Plant: req.params.at(-1).Plant,
            StorageLocation: req.params.at(-1).StorageLocation,
            Batch: req.params.at(-1).Batch,
            BillOfMaterialItemNumber_2: req.params.at(-1).BillOfMaterialItemNumber_2
          })
      );
      // modifica DL - 10/06/2025 - recupero atp - FINE

      // 7. Execute all queries in parallel
      const [prodAllQtyData, planAllQtyData, combPlanAllQtyData, deliveryQtyData, atpRulesData] =
        await Promise.all([prodAllQtyPromise, planAllQtyPromise, combPlanAllQtyPromise, deliveryQtyPromise, atpRulesPromise]);

      // 8. Create lookup maps for faster association
      const prodAllQtyMap = createLookupMap(prodAllQtyData, 'Plant', 'Material', 'StorageLocation', 'Batch');
      const planAllQtyMap = createLookupMap(planAllQtyData, 'WERKS', 'MATNR', 'LGORT', 'CHARG');
      const combPlanAllQtyMap = createLookupMap(combPlanAllQtyData, 'WERKS', 'MATNR', 'LGORT', 'CHARG');
      const deliveryQtyMap = createLookupMap(deliveryQtyData, 'Material', 'StorLoc', 'Batch');

      // 9. Process results with maps instead of additional queries
      var res = stockData.filter(({ InventoryStockType }) => InventoryStockType === '01').map(item => {
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

      // modifica DL - 10/06/2025 - elimino record che non hanno valore atp nello stockSegmentation
      if(atpRulesData.length > 0){
        var atpRulesArray = JSON.parse(atpRulesData[0].atp)
        var filteredData = res.filter(item => atpRulesArray.includes(item.StockSegment));

        // sorto per valori atpRulesData
        filteredData.sort((a, b) => atpRulesArray.indexOf(a.StockSegment) - atpRulesArray.indexOf(b.StockSegment));

        // valorizzo campo StockSegmentCode
        var result = filteredData.map(obj => ({
          ...obj,
          StockSegmentCode: (atpRulesArray.indexOf(obj.StockSegment))+1
        }));

        res = result
      }
      // modifica DL - 10/06/2025 - elimino record che non hanno valore atp nello stockSegmentation - FINE

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



    this.on("*", "ZZ1_Plant", async (req) => {
      // req.query.SELECT.from.ref[0] = "ZZ1_CombinedPlnOrdersAPI/to_ZZ1_Plant";
      const res = await ZZ1_COMBINEDPLNORDERSAPI_CDS.run(req.query)
      console.log({ query: JSON.stringify(req.query), res })
      res['$count'] = res.length.toString();
      return res
    });

    this.on("*", "ZZ1_MFI_CR_TYPE_V", async (req) => {
      const res = await ZZ1_COMBINEDPLNORDERSAPI_CDS.run(req.query)
      console.log({ query: JSON.stringify(req.query), res })
      res['$count'] = res.length.toString();
      return res
    });

    this.on('READ', "ZI_RFM_ATP_RULES", async request => {
        request.query.SELECT.count = false
        var data = await ZI_RFM_ATP_RULES_CDS.tx(request).run(request.query);

        return data;
    });

    this.on("ChangeWorkCenter", async (req) => {

        const object = req.data.Payload;

        var payload = {
          "FSH_CPLND_ORD" : object.CombPlOrder,
          "MANUFACTURINGORDEROPERATION" : object.Operation,
          "MANUFACTURINGORDERSEQUENCE" : object.Sequence,
          "WORKCENTER" : object.WorkCenter
        }

        try {

            /*const csrfRes = await changeWorkCenter.get("/ZZ1_MFP_WRKC_UPDATE", {
                headers: { 'X-CSRF-Token': 'fetch' }
            });

            const csrfToken = csrfRes.headers['X-CSRF-Token'];*/

            let callCreate = await changeWorkCenter.tx(req).post("/ZZ1_MFP_WRKC_UPDATE", payload)
            /*let callCreate = await changeWorkCenter.post("/ZZ1_MFP_WRKC_UPDATE", payload, {
                headers: { 'X-CSRF-Token': csrfToken }
            });*/
            console.log("Risultato chiamata " + JSON.stringify(callCreate))
            //return callCreate

            //recupero plannedOrder
            var plannedOrderNumbers = [];
            const fixedId = "123"; //id fisso
            const plannedOrdersCapacity = await ZZ1_COMBINEDPLNORDERSAPI_CDS.run(
              SELECT.from("ZZ1_PlannedOrdersCapacity") .where({
                Sequence: object.Sequence,
                Operation: object.Operation,
                CplndOrd: object.CombPlOrder,
              }) 
            ); 
            console.log("Risultato chiamata " + JSON.stringify(plannedOrdersCapacity));

            if (plannedOrdersCapacity.length > 0) {
              plannedOrdersCapacity.forEach((item) => {
                if (item.PlannedOrder !== undefined) {
                  plannedOrderNumbers.push(item.PlannedOrder);
                }
              });
              console.log("plannedOrder" + plannedOrderNumbers);
              var chgwcLines = plannedOrderNumbers.map(number => {
                    return {
                      "id": fixedId, // ID fisso per ogni riga
                      "PlannedOrder": number
            };
              });
              // payload finale con testata e righe
              var oPayload = {
                  "id": fixedId, // ID fisso per la testata
                  "chgwc": chgwcLines 
              };
              console.log("Payload per la POST: " + JSON.stringify(oPayload));
              const result = await externalATPService.tx(req).post("/changewc_header", oPayload);
              console.log('Risultato della POST:', result);
                return result
            }

        } catch (error) {

            console.log(error.message)
            return error.message
        }
    }),

    this.on("*", "ZZ1_CombinedPlnOrdersAPI/to_ZZ1_PlannedOrdersCapacity", async (req) => {
      return ZZ1_COMBINEDPLNORDERSAPI_CDS.run(req.query);
    }); 

    this.on("*", "ZZ1_CombPlannedOrder_F4", async (req) => {
      const newQuery = JSON.parse(JSON.stringify(req.query));
      if (newQuery.SELECT) {
        delete newQuery.SELECT.limit;
        delete newQuery.SELECT.offset;
      }
      const res =  await ZZ1_COMBPLANNEDORDER_F4_CDS.run(newQuery);
      console.log({ query: JSON.stringify(req.query), res });
      res['$count'] = res.length;
      return res;
    });  
    
    this.on("*", "ZZ1_PRODUCTIONPLANT_F4", async (req) => {
     const newQuery = JSON.parse(JSON.stringify(req.query));
     if (newQuery.SELECT) {
       delete newQuery.SELECT.limit;
       delete newQuery.SELECT.offset;
     }
    const res =  await ZZ1_PRODUCTIONPLANT_F4_CDS.run(newQuery);
    console.log({ query: JSON.stringify(req.query), res });
    res['$count'] = res.length;
    return res;
    }); 

    this.on("*", "ZZ1_MRPCONTROLLER_F4", async (req) => {
      const newQuery = JSON.parse(JSON.stringify(req.query));
      if (newQuery.SELECT) {
        delete newQuery.SELECT.limit;
        delete newQuery.SELECT.offset;
      }
      const res =  await ZZ1_MRPCONTROLLER_F4_CDS.run(newQuery);
      console.log({ query: JSON.stringify(req.query), res });
      res['$count'] = res.length;
      return res;
    }); 

    this.on("*", "ZZ1_WORKCENTER_F4", async (req) => {
      const newQuery = JSON.parse(JSON.stringify(req.query));
      if (newQuery.SELECT) {
        delete newQuery.SELECT.limit;
        delete newQuery.SELECT.offset;
      }
      const res =  await ZZ1_WORKCENTER_F4_CDS.run(newQuery);
      console.log({ query: JSON.stringify(req.query), res });
      res['$count'] = res.length;
      return res;
    });

    this.on("*", "ZZ1_PRODUCTSEASON_F4", async (req) => {
      const newQuery = JSON.parse(JSON.stringify(req.query));
      if (newQuery.SELECT) {
        delete newQuery.SELECT.limit;
        delete newQuery.SELECT.offset;
      }
      const res =  await ZZ1_PRODUCTSEASON_F4_CDS.run(newQuery);
      console.log({ query: JSON.stringify(req.query), res });
      res['$count'] = res.length;
      return res;
    });

    this.on("*", "ZZ1_PLANNEDORDERTYPE_F4", async (req) => {
      const newQuery = JSON.parse(JSON.stringify(req.query));
      if (newQuery.SELECT) {
        delete newQuery.SELECT.limit;
        delete newQuery.SELECT.offset;
      }
      const res =  await ZZ1_PLANNEDORDERTYPE_F4_CDS.run(newQuery);
      console.log({ query: JSON.stringify(req.query), res });
      res['$count'] = res.length;
      return res;
    });
  }
};
