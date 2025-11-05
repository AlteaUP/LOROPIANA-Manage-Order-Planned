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

    const ButchCustService = await cds.connect.to('ZZ1_MFP_BATCHCUSTOM_CDS');

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

      let res = await ZZ1_COMBPLNORDERSSTOCKAPI_CDS.run(SELECT.from(from).where(where))
      //rimuovi eventuali duplicati usando solo MATERIAL come chiave
      const key = item => item.Material;

      res = Array.from(
        new Map(res.map(item => [key(item), item])).values()
      );
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
        if (chart_percent >= 100) {
          chart_criticality = 3
        } else if (chart_percent < 100 && chart_percent > 0) {
          chart_criticality = 2
        } else {
          chart_criticality = 1
          //chart_percent = 100
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
            // modifica DL - 22/07/2025 - calcolo campo priorità
            if (item.BaseUnit && item.BaseUnit.toUpperCase() === 'M2') {
              if (parseFloat(item.RequiredQuantity) === parseFloat(item.CombPlanAllQty)) {
                item.priority = 2
              } else {
                item.priority = 1
              }
            } else {
              item.priority = 3
            }
            // modifica DL - 22/07/2025 - calcolo campo priorità - FINE
          });
        }
      }

      res.sort((a, b) => parseFloat(a.priority) - parseFloat(b.priority));

      return res;
    });

    this.on("*", "ZZ1_CombinPlannedOrdersComClone", async (req) => {
      const from = "ZZ1_CombPlnOrdersStockAPI";
      const where = req.
        query.SELECT?.where;

      if (!where) {
        return [];
      }

      const keys = {
        CplndOrd: [],
        CrossPlantConfigurableProduct: []
      };

      let currentField = null;

      const walk = (node) => {
        if (!node) return;

        if (Array.isArray(node)) {
          node.forEach(walk);
        } else if (typeof node === "object") {
          if (node.ref && node.ref[0]) {
            // trovato il nome del campo
            currentField = node.ref[0];
          } else if (node.val !== undefined && currentField) {
            // trovato il valore per l'ultimo campo visto
            if (keys[currentField]) {
              keys[currentField].push(node.val);
            }
            currentField = null; // resetto per sicurezza
          } else {
            // scendo nei figli
            Object.values(node).forEach(walk);
          }
        }
      };

      walk(where);

      console.log("Valori trovati:", keys);

      let res = await ZZ1_COMBPLNORDERSSTOCKAPI_CDS.run(
        SELECT.from(from).where({
          CplndOrd: { in: keys.CplndOrd },
          CrossPlantConfigurableProduct: { in: keys.CrossPlantConfigurableProduct }
        })
      );
      //togli duplicati usando Material + CplndOrd
      const key = item => `${item.Material}|${item.CplndOrd}`;
      res = Array.from(
        new Map(res.map(item => [key(item), item])).values()
      );
      // mappo Batch se vuoto
      res = res.map((r, i) => ({
        ...r,
        Batch: r.Batch && r.Batch.trim() !== "" ? r.Batch : `TEMP-Batch-${i}`
      }));


      // Calculate TotalPlanAllQty and CombPlanAllQty for each record
      const PlannedCombinedOrders = Array.isArray(keys.CplndOrd)
        ? keys.CplndOrd
        : [keys.CplndOrd];

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
      if (PlannedCombinedOrders) {
        const combPlanAssignmentData = await ZZ1_MFP_ASSIGNMENT_CDS.run(
          SELECT.from('ZZ1_MFP_ASSIGNMENT')
            .where({
              FSH_MPLO_ORD: { in: PlannedCombinedOrders },
              WERKS: { in: res.map(i => i.Plant) },
              MATNR: { in: res.map(i => i.Material) }
            })
        );
        combPlanAssignmentsMap = createLookupMap(combPlanAssignmentData, 'WERKS', 'MATNR');
      }
      //raggruppo per material
      const grouped = {};
      for (const row of res) {
        const mat = row.Material;

        if (!grouped[mat]) {
          grouped[mat] = {
            ...row,
            RequiredQuantity: 0,
            CombPlanAllQty: 0,
            AvailableQuantity: 0
          };
        }

        grouped[mat].RequiredQuantity += Number(row.RequiredQuantity || 0);
        grouped[mat].CombPlanAllQty += Number(row.CombPlanAllQty || 0);
        grouped[mat].AvailableQuantity += Number(row.AvailableQuantity || 0);
      }

      const aggregated = Object.values(grouped);

      aggregated.forEach(item => {
        const { Plant, Material } = item;
        const key = `${Plant}|${Material}`;

        const allAssignments = allAssignmentsMap[key] || [];
        const combPlanAssignments = combPlanAssignmentsMap[key] || [];

        const TotalPlanAllQty = sumValues(allAssignments, 'QTA_ASS_V');
        const CombPlanAllQty = sumValues(combPlanAssignments, 'QTA_ASS_V');

        item.TotalPlanAllQty = TotalPlanAllQty.toFixed(3);
        item.CombPlanAllQty = CombPlanAllQty.toFixed(3);

        let chart_percent = Math.round(parseFloat(item.AvailableQuantity) / parseFloat(item.RequiredQuantity) * 100);
        let chart_criticality;
        if (chart_percent >= 100) {
          chart_criticality = 3;
        } else if (chart_percent > 0) {
          chart_criticality = 2;
        } else {
          chart_criticality = 1;
          chart_percent = 100;
        }
        item.chart_percent = chart_percent;
        item.chart_criticality = chart_criticality;

        if (parseFloat(item.TotalPlanAllQty) > 0 && parseFloat(item.CombPlanAllQty) > 0) {
          item.FinishedProductQty = (
            parseFloat(item.RequiredQuantity) /
            parseFloat(item.TotalPlanAllQty) *
            parseFloat(item.CombPlanAllQty)
          ).toFixed(3);
        } else {
          item.FinishedProductQty = "0.000";
        }

        if (item.BaseUnit && item.BaseUnit.toUpperCase() === 'M2') {
          item.priority = parseFloat(item.RequiredQuantity) === parseFloat(item.CombPlanAllQty) ? 2 : 1;
        } else {
          item.priority = 3;
        }
      });

      aggregated.sort((a, b) => parseFloat(a.priority) - parseFloat(b.priority));

      aggregated.forEach(g => {
        g.RequiredQuantity = String(g.RequiredQuantity);
        g.CombPlanAllQty = String(g.CombPlanAllQty);
        g.AvailableQuantity = String(g.AvailableQuantity);
      });

      return aggregated;
      //return res;
    });

    this.on("*", "ZZ1_CombinPlannedOrdersComClone/to_ZZ1_CombPlnOrdersStock", async (req) => {
      const cplndOrd = req.params.at(-1)?.CplndOrd;
      const material = req.params.at(-1)?.Material;
      if (req.params.at(-1)) {
        req.params.at(-1).Batch = '';
      }
      const parentKeys = req.params.at(-1) || {};
      const where = {
        Material: parentKeys.Material,
        Plant: parentKeys.Plant
      };

      const stockData = await ZZ1_COMBPLNORDERSSTOCKAPI_CDS.run(
        SELECT.from("ZZ1_CombPlnOrdersStock").where(where)
      );
      // modifica MDB - 06/08/2025 - estraggo record selezionato da tabella Componenti - INIZIO
      const stockByMaterial = await ZZ1_COMBPLNORDERSSTOCKAPI_CDS.run(
        SELECT
          .from("ZZ1_CombPlnOrdersStockAPI")
          .columns("*")
          .where([
            { ref: ['Material'] }, '=', { val: material },
            'and',
            { ref: ['CplndOrd'] }, '=', { val: cplndOrd }
          ])
      );
      // modifica MDB - 06/08/2025 - estraggo record selezionato da tabella Componenti - FINE
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
            //FSH_MPLO_ORD: PlannedCombinedOrder,
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
        let StorageLocationStock = parseFloat(item.MatlWrhsStkQtyInMatlBaseUnit).toFixed(3).toString();

        let AvaibilityQty = (parseFloat(item.MatlWrhsStkQtyInMatlBaseUnit) -
          TotalProdAllQty - TotalPlanAllQty - TotalDeliveryQty).toFixed(3).toString();
        if (AvaibilityQty < 0) AvaibilityQty = "0.000";
        return {
          ...item,
          StorageLocationStock,
          TotalProdAllQty: TotalProdAllQty.toFixed(3).toString(),
          TotalPlanAllQty: TotalPlanAllQty.toFixed(3).toString(),
          CombPlanAllQty: CombPlanAllQty.toFixed(3).toString(),
          AvaibilityQty,
          TotalInDelQty: TotalDeliveryQty.toFixed(3).toString(),
          CustomQty: parseFloat(item.MatlWrhsStkQtyInMatlBaseUnit).toFixed(3).toString()
        };
      });

      // modifica DL - 10/06/2025 - elimino record che non hanno valore atp nello stockSegmentation
      if (atpRulesData.length > 0) {
        var atpRulesArray = JSON.parse(atpRulesData[0].atp)
        var filteredData = res.filter(item => atpRulesArray.includes(item.StockSegment));

        // sorto per valori atpRulesData
        filteredData.sort((a, b) => atpRulesArray.indexOf(a.StockSegment) - atpRulesArray.indexOf(b.StockSegment));

        // valorizzo campo StockSegmentCode
        var result = filteredData.map(obj => ({
          ...obj,
          StockSegmentCode: (atpRulesArray.indexOf(obj.StockSegment)) + 1
        }));

        res = result
      }
      // modifica DL - 10/06/2025 - elimino record che non hanno valore atp nello stockSegmentation - FINE

      // modifica MDB - 06/08/2025 - filtrare record in base a fornitore e valorizzare StorageLocation vuoto INIZIO
      const operation = stockByMaterial.map(item => item.Operation_2);
      const capacityData = await ZZ1_COMBINEDPLNORDERSAPI_CDS.run(
        SELECT
          .from('ZZ1_PLOCAPACITYCORD')
          .columns('*')
          .where({
            Operation: operation,
            fornitore: { '!=': '' },
            CombinedMasterOrder: cplndOrd
          })
      );
      const validSuppliers = [...new Set(capacityData.map(c => c.fornitore))];
      const maxSupplierLength = Math.max(...validSuppliers.map(s => s.length));

      const storageLocations = ['H100', 'P100', 'K100'];
      res = res
        // filtra StorageLocation vuoto o valido
        .filter(row => !row.StorageLocation || storageLocations.includes(row.StorageLocation))
        // filtra e valida Supplier
        .filter(row => {
          if (!row.Supplier && !row.StorageLocation) return false; // entrambi vuoti → scarta

          if (row.Supplier) {
            const paddedSupplier = row.Supplier.padStart(maxSupplierLength, '0');
            if (!validSuppliers.includes(paddedSupplier)) return false; // non valido → scarta
            row.Supplier = row.Supplier.replace(/^0+/, ''); // rimuove padding subito
          }
          return true;
        })
        // assegna StorageLocation = Supplier quando manca
        .map(row => {
          if (!row.StorageLocation && row.Supplier) {
            row.StorageLocation = row.Supplier;
          }
          return row;
        });
      res.forEach((rec, idx) => {
        // Generiamo un valore univoco solo con l'indice
        const unique = () => `_${idx}`;

        rec.Material = rec.Material || unique();
        rec.Plant = rec.Plant || unique();
        rec.StorageLocation = rec.StorageLocation || unique();
        rec.Batch = rec.Batch || unique();
        rec.Supplier = rec.Supplier || unique();
        rec.SDDocument = rec.SDDocument || unique();
        rec.SDDocumentItem = rec.SDDocumentItem || unique();
        rec.WBSElementInternalID = rec.WBSElementInternalID || unique();
        rec.Customer = rec.Customer || unique();
        rec.SpecialStockIdfgStockOwner = rec.SpecialStockIdfgStockOwner || unique();
        rec.InventoryStockType = rec.InventoryStockType || unique();
        rec.InventorySpecialStockType = rec.InventorySpecialStockType || unique();
        rec.MaterialBaseUnit = rec.MaterialBaseUnit || unique();
        rec.CostEstimate = rec.CostEstimate || unique();
        rec.ResourceID = rec.ResourceID || unique();

        // Log leggibile con nomi dei campi
        console.log(
          `Index: ${idx}`,
          `Material: ${rec.Material}`,
          `Plant: ${rec.Plant}`,
          `StorageLocation: ${rec.StorageLocation}`,
          `Batch: ${rec.Batch}`,
          `Supplier: ${rec.Supplier}`,
          `SDDocument: ${rec.SDDocument}`,
          `SDDocumentItem: ${rec.SDDocumentItem}`,
          `WBSElementInternalID: ${rec.WBSElementInternalID}`,
          `Customer: ${rec.Customer}`,
          `SpecialStockIdfgStockOwner: ${rec.SpecialStockIdfgStockOwner}`,
          `InventoryStockType: ${rec.InventoryStockType}`,
          `InventorySpecialStockType: ${rec.InventorySpecialStockType}`,
          `MaterialBaseUnit: ${rec.MaterialBaseUnit}`,
          `CostEstimate: ${rec.CostEstimate}`,
          `ResourceID: ${rec.ResourceID}`
        );
      });

      // modifica MDB - 06/08/2025 - filtrare record in base a fornitore e valorizzare StorageLocation vuoto FINE

      // modifica MDB - 16/09/2025 - sommare StorageLocationStock a parità di StorageLocation e batch e riassegnare AvaibilityQty con StorageLocationStock - INIZIO
      // raggruppamento per StorageLocation + Batch
      let consolidatedMap = new Map();

      res.forEach(item => {
        const groupKey = `${item.StorageLocation}|${item.Batch}`;

        if (!consolidatedMap.has(groupKey)) {
          // Primo record del gruppo - mantieni tutti i campi
          consolidatedMap.set(groupKey, {
            ...item,  // Copia tutti i campi dal primo record
            StorageLocationStock: parseFloat(item.StorageLocationStock)  // Converti a number per la somma
          });
        } else {
          // Record successivi - somma SOLO StorageLocationStock
          const existingRecord = consolidatedMap.get(groupKey);
          existingRecord.StorageLocationStock += parseFloat(item.StorageLocationStock);
        }
      });

      // Converti Map in array
      let consolidatedRes = Array.from(consolidatedMap.values());

      //Ricalcolo AvaibilityQty
      let finalRes = consolidatedRes.map(item => {
        // Ricalcola AvaibilityQty usando il StorageLocationStock sommato
        let newAvaibilityQty = (item.StorageLocationStock -
          parseFloat(item.TotalProdAllQty) -
          parseFloat(item.TotalPlanAllQty) -
          parseFloat(item.TotalInDelQty)).toFixed(3).toString();

        if (parseFloat(newAvaibilityQty) < 0) newAvaibilityQty = "0.000";

        return {
          ...item,
          StorageLocationStock: item.StorageLocationStock.toFixed(3).toString(), // Riconverti a string
          AvaibilityQty: newAvaibilityQty
        };
      });
      // modifica MDB - 16/09/2025 - sommare StorageLocationStock a parità di StorageLocation e batch e riassegnare AvaibilityQty con StorageLocationStock - FINE
      finalRes['$count'] = finalRes.length.toString();
      return finalRes;
    });

    this.on("*", "ZZ1_CombinedPlnOrdersAPI/to_CombinPlannedOrdersCom/to_ZZ1_CombPlnOrdersStock", async (req) => {
      // 1. Get base stock data
      // add InventoryStockType eq 1
      const cplndOrd = req.params.at(-1)?.CplndOrd;
      const material = req.params.at(-1)?.Material;

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
      // modifica MDB - 06/08/2025 - estraggo record selezionato da tabella Componenti - INIZIO
      const stockByMaterial = await ZZ1_COMBPLNORDERSSTOCKAPI_CDS.run(
        SELECT
          .from("ZZ1_CombPlnOrdersStockAPI")
          .columns("*")
          .where([
            { ref: ['Material'] }, '=', { val: material },
            'and',
            { ref: ['CplndOrd'] }, '=', { val: cplndOrd }
          ])
      );
      // modifica MDB - 06/08/2025 - estraggo record selezionato da tabella Componenti - FINE
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

      const combPlanAllQtyO_Promise = ZZ1_MFP_ASSIGNMENT_CDS.run(
        SELECT.from('ZZ1_MFP_ASSIGNMENT')
          .where({
            FSH_MPLO_ORD: `${PlannedCombinedOrder}_O`,
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
      const [prodAllQtyData, planAllQtyData, combPlanAllQtyData, deliveryQtyData, atpRulesData, combPlanAllQtyO_Data] =
        await Promise.all([prodAllQtyPromise, planAllQtyPromise, combPlanAllQtyPromise, deliveryQtyPromise, atpRulesPromise, combPlanAllQtyO_Promise]);

      // 8. Create lookup maps for faster association
      const prodAllQtyMap = createLookupMap(prodAllQtyData, 'Plant', 'Material', 'StorageLocation', 'Batch');
      const planAllQtyMap = createLookupMap(planAllQtyData, 'WERKS', 'MATNR', 'LGORT', 'CHARG');
      const combPlanAllQtyMap = createLookupMap(combPlanAllQtyData, 'WERKS', 'MATNR', 'LGORT', 'CHARG');
      const deliveryQtyMap = createLookupMap(deliveryQtyData, 'Material', 'StorLoc', 'Batch');
      const combPlanAllQtyO_Map = createLookupMap(combPlanAllQtyO_Data, 'WERKS', 'MATNR', 'LGORT', 'CHARG');

      // 9. Process results with maps instead of additional queries
      var res = stockData.filter(({ InventoryStockType }) => InventoryStockType === '01').map(item => {
        const { Plant, Material, StorageLocation, Batch } = item;
        const key = `${Plant}|${Material}|${StorageLocation}|${Batch}`;

        const prodItems = prodAllQtyMap[key] || [];
        const planItems = planAllQtyMap[`${Plant}|${Material}|${StorageLocation}|${Batch}`] || [];
        const combPlanItems = combPlanAllQtyMap[`${Plant}|${Material}|${StorageLocation}|${Batch}`] || [];
        const deliveryItems = deliveryQtyMap[`${Material}|${StorageLocation}|${Batch}`] || [];
        const combPlanO_Items = combPlanAllQtyO_Map[`${Plant}|${Material}|${StorageLocation}|${Batch}`] || [];

        const TotalProdAllQty = sumValues(prodItems, 'TotalAllocQty');
        const TotalPlanAllQty = sumValues(planItems, 'QTA_ASS_V');
        const CombPlanAllQty = sumValues(combPlanItems, 'QTA_ASS_V');
        const TotalDeliveryQty = sumValues(deliveryItems, 'TotDeliveryQty');
        const Scorta = combPlanO_Items.length > 0
          ? combPlanO_Items[0].Scorta
          : "";
        let StorageLocationStock = parseFloat(item.MatlWrhsStkQtyInMatlBaseUnit).toFixed(3).toString();

        let AvaibilityQty = (parseFloat(item.MatlWrhsStkQtyInMatlBaseUnit) -
          TotalProdAllQty - TotalPlanAllQty - TotalDeliveryQty).toFixed(3).toString();
        if (AvaibilityQty < 0) AvaibilityQty = "0.000";
        return {
          ...item,
          StorageLocationStock,
          TotalProdAllQty: TotalProdAllQty.toFixed(3).toString(),
          TotalPlanAllQty: TotalPlanAllQty.toFixed(3).toString(),
          CombPlanAllQty: CombPlanAllQty.toFixed(3).toString(),
          AvaibilityQty,
          TotalInDelQty: TotalDeliveryQty.toFixed(3).toString(),
          CustomQty: parseFloat(item.MatlWrhsStkQtyInMatlBaseUnit).toFixed(3).toString(),
          Scorta
        };
      });

      // modifica DL - 10/06/2025 - elimino record che non hanno valore atp nello stockSegmentation
      if (atpRulesData.length > 0) {
        var atpRulesArray = JSON.parse(atpRulesData[0].atp)
        var filteredData = res.filter(item => atpRulesArray.includes(item.StockSegment));

        // sorto per valori atpRulesData
        filteredData.sort((a, b) => atpRulesArray.indexOf(a.StockSegment) - atpRulesArray.indexOf(b.StockSegment));

        // valorizzo campo StockSegmentCode
        var result = filteredData.map(obj => ({
          ...obj,
          StockSegmentCode: (atpRulesArray.indexOf(obj.StockSegment)) + 1
        }));

        res = result
      }
      // modifica DL - 10/06/2025 - elimino record che non hanno valore atp nello stockSegmentation - FINE

      // modifica MDB - 06/08/2025 - filtrare record in base a fornitore e valorizzare StorageLocation vuoto INIZIO
      const operation = stockByMaterial.map(item => item.Operation_2);
      const capacityData = await ZZ1_COMBINEDPLNORDERSAPI_CDS.run(
        SELECT
          .from('ZZ1_PLOCAPACITYCORD')
          .columns('*')
          .where({
            Operation: operation,
            fornitore: { '!=': '' },
            CombinedMasterOrder: cplndOrd
          })
      );
      const validSuppliers = [...new Set(capacityData.map(c => c.fornitore))];
      const maxSupplierLength = Math.max(...validSuppliers.map(s => s.length));

      const storageLocations = ['H100', 'P100', 'K100'];
      res = res
        // filtra StorageLocation vuoto o valido
        .filter(row => !row.StorageLocation || storageLocations.includes(row.StorageLocation))
        // filtra e valida Supplier
        .filter(row => {
          if (!row.Supplier && !row.StorageLocation) return false; // entrambi vuoti → scarta

          if (row.Supplier) {
            const paddedSupplier = row.Supplier.padStart(maxSupplierLength, '0');
            if (!validSuppliers.includes(paddedSupplier)) return false; // non valido → scarta
            row.Supplier = row.Supplier.replace(/^0+/, ''); // rimuove padding subito
          }
          return true;
        })
        // assegna StorageLocation = Supplier quando manca
        .map(row => {
          if (!row.StorageLocation && row.Supplier) {
            row.StorageLocation = row.Supplier;
          }
          return row;
        });
      res.forEach((rec, idx) => {
        // Generiamo un valore univoco solo con l'indice
        const unique = () => `_${idx}`;

        rec.Material = rec.Material || unique();
        rec.Plant = rec.Plant || unique();
        rec.StorageLocation = rec.StorageLocation || unique();
        rec.Batch = rec.Batch || unique();
        rec.Supplier = rec.Supplier || unique();
        rec.SDDocument = rec.SDDocument || unique();
        rec.SDDocumentItem = rec.SDDocumentItem || unique();
        rec.WBSElementInternalID = rec.WBSElementInternalID || unique();
        rec.Customer = rec.Customer || unique();
        rec.SpecialStockIdfgStockOwner = rec.SpecialStockIdfgStockOwner || unique();
        rec.InventoryStockType = rec.InventoryStockType || unique();
        rec.InventorySpecialStockType = rec.InventorySpecialStockType || unique();
        rec.MaterialBaseUnit = rec.MaterialBaseUnit || unique();
        rec.CostEstimate = rec.CostEstimate || unique();
        rec.ResourceID = rec.ResourceID || unique();

        // Log leggibile con nomi dei campi
        console.log(
          `Index: ${idx}`,
          `Material: ${rec.Material}`,
          `Plant: ${rec.Plant}`,
          `StorageLocation: ${rec.StorageLocation}`,
          `Batch: ${rec.Batch}`,
          `Supplier: ${rec.Supplier}`,
          `SDDocument: ${rec.SDDocument}`,
          `SDDocumentItem: ${rec.SDDocumentItem}`,
          `WBSElementInternalID: ${rec.WBSElementInternalID}`,
          `Customer: ${rec.Customer}`,
          `SpecialStockIdfgStockOwner: ${rec.SpecialStockIdfgStockOwner}`,
          `InventoryStockType: ${rec.InventoryStockType}`,
          `InventorySpecialStockType: ${rec.InventorySpecialStockType}`,
          `MaterialBaseUnit: ${rec.MaterialBaseUnit}`,
          `CostEstimate: ${rec.CostEstimate}`,
          `ResourceID: ${rec.ResourceID}`
        );
      });

      // modifica MDB - 06/08/2025 - filtrare record in base a fornitore e valorizzare StorageLocation vuoto FINE

      // modifica MDB - 16/09/2025 - sommare StorageLocationStock a parità di StorageLocation e batch e riassegnare AvaibilityQty con StorageLocationStock - INIZIO
      // raggruppamento per StorageLocation + Batch
      let consolidatedMap = new Map();

      res.forEach(item => {
        const groupKey = `${item.StorageLocation}|${item.Batch}`;

        if (!consolidatedMap.has(groupKey)) {
          // Primo record del gruppo - mantieni tutti i campi
          consolidatedMap.set(groupKey, {
            ...item,  // Copia tutti i campi dal primo record
            StorageLocationStock: parseFloat(item.StorageLocationStock)  // Converti a number per la somma
          });
        } else {
          // Record successivi - somma SOLO StorageLocationStock
          const existingRecord = consolidatedMap.get(groupKey);
          existingRecord.StorageLocationStock += parseFloat(item.StorageLocationStock);
        }
      });

      // Converti Map in array
      let consolidatedRes = Array.from(consolidatedMap.values());

      //Ricalcolo AvaibilityQty
      let finalRes = consolidatedRes.map(item => {
        // Ricalcola AvaibilityQty usando il StorageLocationStock sommato
        let newAvaibilityQty = (item.StorageLocationStock -
          parseFloat(item.TotalProdAllQty) -
          parseFloat(item.TotalPlanAllQty) -
          parseFloat(item.TotalInDelQty)).toFixed(3).toString();

        if (parseFloat(newAvaibilityQty) < 0) newAvaibilityQty = "0.000";

        return {
          ...item,
          StorageLocationStock: item.StorageLocationStock.toFixed(3).toString(), // Riconverti a string
          AvaibilityQty: newAvaibilityQty
        };
      });
      // modifica MDB - 16/09/2025 - sommare StorageLocationStock a parità di StorageLocation e batch e riassegnare AvaibilityQty con StorageLocationStock - FINE
      finalRes['$count'] = finalRes.length.toString();
      return finalRes;
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
    // ZZ1_MASTERPLANNEDORDERAPI - Startr
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
      const where = req.query.SELECT.where;
      if (!where) return [];

      const res = await ZZ1_COMBPLNORDERSSTOCKAPI_CDS.run(
        SELECT.from('ZZ1_CombPlnOrdersStockAPI').columns('*').where(where)
      );

      if (!res || res.length === 0) return [];

      //Estraggo gli ordini ESISTENTI IN RES (con filtro !=)
      const norm = v => String(v ?? '').trim();
      const orderList = [...new Set(res.map(r => norm(r.CplndOrd)))];

      console.log("Ordini effettivi da RES:", orderList);

      const whereCapacity =
        orderList.length === 1
          ? { CombinedMasterOrder: orderList[0], FreeDefinedIndicator1: true }
          : { CombinedMasterOrder: { in: orderList }, FreeDefinedIndicator1: true };

      const capacityData = await ZZ1_COMBINEDPLNORDERSAPI_CDS.run(
        SELECT.from('ZZ1_PLOCAPACITYCORD').columns('*').where(whereCapacity)
      );

      const capacityMap = {};
      if (capacityData?.length > 0) {
        for (const c of capacityData) {
          capacityMap[norm(c.CombinedMasterOrder)] = {
            BOOWorkCenterInternalID: c.BOOWorkCenterInternalID ?? '',
            BOOWorkCenterText: c.BOOWorkCenterText ?? ''
          };
        }
      }

      const productData = await ZZ1_COMBINEDPLNORDERSAPI_CDS.run(
        SELECT.from('ZZ1_CombinedPlnOrdersAPI')
          .columns('CplndOrd', 'ProductDescription')
          .where({ CplndOrd: orderList })
      );

      const productMap = {};
      if (productData?.length > 0) {
        for (const p of productData) {
          productMap[norm(p.CplndOrd)] = p.ProductDescription ?? '';
        }
      }

      for (const item of res) {
        const match = capacityMap[norm(item.CplndOrd)];
        item.BOOWorkCenterInternalID = match?.BOOWorkCenterInternalID ?? '';
        item.BOOWorkCenterText = match?.BOOWorkCenterText ?? '';
        item.ProductDescription = productMap[norm(item.CplndOrd)] ?? '';
      }

      return res;
    });

    this.on("*", "ZZ1_CombPlnOrdersStock", async (req) => {
      return ZZ1_COMBPLNORDERSSTOCKAPI_CDS.run(req.query);
    });
    // ZZ1_COMBPLNORDERSSTOCKAPI - End
    this.on('INSERT', 'ZZ1_MFP_ASSIGNMENT', async (req) => {
      console.log('[INSERT]*************')
      console.log("Insert backend:", req.data);
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
      const where = req.query?.SELECT?.where;
      let res;

      if (!where) {
        res = await ZZ1_MFP_ASSIGNMENT_CDS.run(
          SELECT.from('ZZ1_MFP_ASSIGNMENT')
        );
      } else {
        res = await ZZ1_MFP_ASSIGNMENT_CDS.run(
          SELECT.from('ZZ1_MFP_ASSIGNMENT').where(where)
        );
      }

      return res;
    });

    this.after("READ", "ZZ1_MFP_ASSIGNMENT", async (data) => {
      console.log('[GET]*************')
      if (Array.isArray(data)) {
        data.sort((a, b) => {
          // Estrai l’ordine (prima del "_O")
          const ordA = Number(String(a.FSH_MPLO_ORD).split("_")[0]) || 0;
          const ordB = Number(String(b.FSH_MPLO_ORD).split("_")[0]) || 0;

          if (ordA !== ordB) return ordA - ordB;

          const chargA = Number(a.CHARG) || 0;
          const chargB = Number(b.CHARG) || 0;

          return chargA - chargB;
        });
      }
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
        "FSH_CPLND_ORD": object.CombPlOrder,
        "MANUFACTURINGORDEROPERATION": object.Operation,
        "MANUFACTURINGORDERSEQUENCE": object.Sequence,
        "WORKCENTER": object.WorkCenter
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
          SELECT.from("ZZ1_PlannedOrdersCapacity").where({
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

      //action per gestire highlights in tab Componenti
      this.on("ReadBatchCust", async req => {
        try {
          const { Material, Gruppo_merce, Plant } = req.data.Payload;
          let batch = null;

          const isEmptyOrN = v => v === undefined || v === null || v === "" || v === "N";
          // 1) prova solo Material
          if (Material) {
            batch = await ButchCustService.run(
              SELECT.one("*")                              // prendo tutto il record
                .from("ZZ1_MFP_BATCHCUSTOM")
                .where({ Material: Material })
            );
            if (batch) {
              // tolgo batch se QUALSIASI degli altri campi è valorizzato
              const others = ["Gruppo_Merce", "Plant", "Famiglia", "Cites"];
              if (others.some(key => !isEmptyOrN(batch[key]))) {
                batch = null;
              }
            }
          }
          // 2) prova Gruppo + Plant
          if (!batch && Gruppo_merce && Plant) {
            batch = await ButchCustService.run(
              SELECT.one("*")
                .from("ZZ1_MFP_BATCHCUSTOM")
                .where({
                  Gruppo_Merce: Gruppo_merce,
                  Plant: Plant
                })
            );
            if (batch) {
              // tolgo batch se Material, Famiglia o Cites sono valorizzati
              const others = ["Material", "Famiglia", "Cites"];
              if (others.some(key => !isEmptyOrN(batch[key]))) {
                batch = null;
              }
            }
          }
          // 3) prova solo Plant
          if (!batch && Plant) {
            batch = await ButchCustService.run(
              SELECT.one("*")
                .from("ZZ1_MFP_BATCHCUSTOM")
                .where({ Plant: Plant })
            );
            if (batch) {
              // tolgo batch se Material, Gruppo_Merce, Famiglia o Cites sono valorizzati
              const others = ["Material", "Gruppo_Merce", "Famiglia", "Cites"];
              if (others.some(key => !isEmptyOrN(batch[key]))) {
                batch = null;
              }
            }
          }
          /*           return {
                      Mandassign: batch?.Mandassign ?? false,
                      AssignRule: batch?.AssignRule ?? null
                    }; */
          return batch;
        }
        catch (err) {
          return req.error(500, err.message);
        }
      });
    this.on("*", "ZZ1_CombinedPlnOrdersAPI/to_ZZ1_PlannedOrdersCapacity", async (req) => {
      return ZZ1_COMBINEDPLNORDERSAPI_CDS.run(req.query);
    });

    this.on("*", "ZZ1_CombPlannedOrder_F4", async (req) => {
      const newQuery = JSON.parse(JSON.stringify(req.query));
      if (newQuery.SELECT) {
        delete newQuery.SELECT.limit;
        delete newQuery.SELECT.offset;
      }
      const res = await ZZ1_COMBPLANNEDORDER_F4_CDS.run(newQuery);
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
      const res = await ZZ1_PRODUCTIONPLANT_F4_CDS.run(newQuery);
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
      const res = await ZZ1_MRPCONTROLLER_F4_CDS.run(newQuery);
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
      const res = await ZZ1_WORKCENTER_F4_CDS.run(newQuery);
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
      const res = await ZZ1_PRODUCTSEASON_F4_CDS.run(newQuery);
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
      const res = await ZZ1_PLANNEDORDERTYPE_F4_CDS.run(newQuery);
      console.log({ query: JSON.stringify(req.query), res });
      res['$count'] = res.length;
      return res;
    });

    //hook per gestire icona in tab Componenti
    this.after('READ', "ZZ1_CombinedPlnOrdersAPI/to_CombinPlannedOrdersCom", async (data) => {
      const isEmptyOrN = v => v === undefined || v === null || v === '' || v === 'N';
      const processRecord = async each => {
        const { Material, Plant, ProductGroup } = each;
        let batch = null;
        // 1) prova solo su Material
        if (Material) {
          batch = await ButchCustService.run(
            SELECT.one('*')
              .from('ZZ1_MFP_BATCHCUSTOM')
              .where({ Material })
          );
          if (batch && ['Gruppo_Merce', 'Plant', 'Famiglia', 'Cites']
            .some(k => !isEmptyOrN(batch[k]))) {
            batch = null;
          }
        }
        // 2) prova su Gruppo_Merce + Plant
        if (!batch && ProductGroup && Plant) {
          batch = await ButchCustService.run(
            SELECT.one('*')
              .from('ZZ1_MFP_BATCHCUSTOM')
              .where({ Gruppo_Merce: ProductGroup, Plant })
          );
          if (batch && ['Material', 'Famiglia', 'Cites']
            .some(k => !isEmptyOrN(batch[k]))) {
            batch = null;
          }
        }
        // 3) prova solo su Plant
        if (!batch && Plant) {
          batch = await ButchCustService.run(
            SELECT.one('*')
              .from('ZZ1_MFP_BATCHCUSTOM')
              .where({ Plant })
          );
          if (batch && ['Material', 'Gruppo_Merce', 'Famiglia', 'Cites']
            .some(k => !isEmptyOrN(batch[k]))) {
            batch = null;
          }
        }
        // Assegna icona solo se AssignRule === true
        each.IconActive = (batch && batch.AssignRule === true)
          ? 'sap-icon://activate'
          : '';
        // Assegna flagHighlights se Mandassign === true
        each.flagHighlights = (batch && batch.Mandassign === true)
          ? 'X'
          : '';
      };
      if (Array.isArray(data)) {
        await Promise.all(data.map(processRecord));

        data.sort((a, b) => {
          const pA = a.flagHighlights === 'X' ? 0 : 1;
          const pB = b.flagHighlights === 'X' ? 0 : 1;
          return pA - pB;
        });

      } else if (data) {
        await processRecord(data);
      }
    });
    this.after('READ', "ZZ1_CombinPlannedOrdersComClone", async (data) => {
      const isEmptyOrN = v => v === undefined || v === null || v === '' || v === 'N';
      const processRecord = async each => {
        const { Material, Plant, ProductGroup } = each;
        let batch = null;
        // 1) prova solo su Material
        if (Material) {
          batch = await ButchCustService.run(
            SELECT.one('*')
              .from('ZZ1_MFP_BATCHCUSTOM')
              .where({ Material })
          );
          if (batch && ['Gruppo_Merce', 'Plant', 'Famiglia', 'Cites']
            .some(k => !isEmptyOrN(batch[k]))) {
            batch = null;
          }
        }
        // 2) prova su Gruppo_Merce + Plant
        if (!batch && ProductGroup && Plant) {
          batch = await ButchCustService.run(
            SELECT.one('*')
              .from('ZZ1_MFP_BATCHCUSTOM')
              .where({ Gruppo_Merce: ProductGroup, Plant })
          );
          if (batch && ['Material', 'Famiglia', 'Cites']
            .some(k => !isEmptyOrN(batch[k]))) {
            batch = null;
          }
        }
        // 3) prova solo su Plant
        if (!batch && Plant) {
          batch = await ButchCustService.run(
            SELECT.one('*')
              .from('ZZ1_MFP_BATCHCUSTOM')
              .where({ Plant })
          );
          if (batch && ['Material', 'Gruppo_Merce', 'Famiglia', 'Cites']
            .some(k => !isEmptyOrN(batch[k]))) {
            batch = null;
          }
        }
        // Assegna icona solo se AssignRule === true
        each.IconActive = (batch && batch.AssignRule === true)
          ? 'sap-icon://activate'
          : '';
        // Assegna flagHighlights se Mandassign === true
        each.flagHighlights = (batch && batch.Mandassign === true)
          ? 'X'
          : '';
      };
      if (Array.isArray(data)) {
        await Promise.all(data.map(processRecord));

        data.sort((a, b) => {
          const pA = a.flagHighlights === 'X' ? 0 : 1;
          const pB = b.flagHighlights === 'X' ? 0 : 1;
          return pA - pB;
        });

      } else if (data) {
        await processRecord(data);
      }
    });
  }
};
