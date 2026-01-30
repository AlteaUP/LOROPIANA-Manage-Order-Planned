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
    const zmfp_plo_firming = await cds.connect.to('zmfp_plo_firming');

    const ZI_RFM_ATP_RULES_CDS = await cds.connect.to('ZI_RFM_ATP_RULES_CDS');

    const changeWorkCenter = await cds.connect.to('ZZ1_MFP_WRKC_UPDATE_CDS');

    const ButchCustService = await cds.connect.to('ZZ1_MFP_BATCHCUSTOM_CDS');

    const externalATPService = await cds.connect.to("ZSD_RFM_ATP_CHANGE_WC");
    const ZZ1_ALT_LAB_CDS = await cds.connect.to("ZZ1_ALT_LAB_CDS");
    const ZZ1_PLO_OPERATIONS_CDS = await cds.connect.to("ZZ1_PLO_OPERATIONS_CDS");
    const ZZ1_MARA_CUSTOM_FIELDS_API_CDS = await cds.connect.to("ZZ1_MARA_CUSTOM_FIELDS_API_CDS");
    const zmfp_mrp_plant_f4 = await cds.connect.to("zmfp_mrp_plant_f4");
    const ZMFP_MRP_COMBINEDPLNDORDER_F4 = await cds.connect.to("ZMFP_MRP_COMBINEDPLNDORDER_F4");
    const ZMFP_MRP_CONTROLLER_F4 = await cds.connect.to("ZMFP_MRP_CONTROLLER_F4");
    const ZMFP_MRP_PLANNEDORDER_TYPE_F4 = await cds.connect.to("ZMFP_MRP_PLANNEDORDER_TYPE_F4");
    const ZMFP_MRP_PRODUCT_SEASON_F4 = await cds.connect.to("ZMFP_MRP_PRODUCT_SEASON_F4");
    const ZMFP_MRP_WORKCENTER_F4 = await cds.connect.to("ZMFP_MRP_WORKCENTER_F4");
    const ZZ1_RFM_WRKCHARVAL_F4_CDS = await cds.connect.to("ZZ1_RFM_WRKCHARVAL_F4_CDS");
    const ZZ1_ZZ1_MFP_CHECKCAMPIBATC_CDS = await cds.connect.to("ZZ1_ZZ1_MFP_CHECKCAMPIBATC_CDS");
    const ZZ1_STORAGE_LOCATION_CDS = await cds.connect.to("ZZ1_STORAGE_LOCATION_CDS");
    //const ZMF_PLPO_PLAS_CDS = await cds.connect.to("ZMF_PLPO_PLAS_CDS");






    // ZZ1_CombinedPlnOrdersAPI - Start
    this.on("*", "ZZ1_CombinedPlnOrdersAPI", async (req) => {
      let fullCycleVal = null;
      const where = req.query?.SELECT?.where;

      if (Array.isArray(where)) {
        for (let i = 0; i <= where.length - 3; i++) {
          if (
            where[i]?.ref?.[0] === "FullCycleFilter" &&
            where[i + 1] === "=" &&
            typeof where[i + 2]?.val === "boolean"
          ) {
            fullCycleVal = where[i + 2].val; // true | false


            // rimuove anche AND / OR adiacente
            if (where[i + 3] === "and" || where[i + 3] === "or") {
              where.splice(i, 4);
            } else if (where[i - 1] === "and" || where[i - 1] === "or") {
              where.splice(i - 1, 4);
            } else {
              where.splice(i, 3);
            }


            break;
          }
        }

        if (where.length === 0) delete req.query.SELECT.where;
      }
      const cols = req.query.SELECT.columns || [];
      /*  if (!cols.some(c => c.ref && c.ref[0] === 'ConfirmedQuantity_V')) {
         req.query.SELECT.columns.push({ ref: ['ConfirmedQuantity_V'] });
       } */
      if (!cols.some(c => c.ref && c.ref[0] === 'BillOfOperationsGroup')) {
        req.query.SELECT.columns.push({ ref: ['BillOfOperationsGroup'] });
      }

      if (!cols.some(c => c.ref && c.ref[0] === 'FullCycle')) {
        req.query.SELECT.columns.push({ ref: ['FullCycle'] });
      }

      const res = await ZZ1_COMBINEDPLNORDERSAPI_CDS.run(req.query);
      const records = Array.isArray(res) ? res : [res];

      if (records.length === 0) return res;

      // 3) prendi le chiavi per entrare in ZZ1_I_PLANNEDORDER
      const keys = [...new Set(records.map(r => r.CplndOrd).filter(Boolean))];
      let childByKey = new Map();

      if (keys.length) {
        const childRows = await ZZ1_COMBINEDPLNORDERSAPI_CDS.run(
          SELECT.from('ZZ1_I_PLANNEDORDER')
            .columns(['CplndOrd', 'zsed_priority', 'PlannedOrderBOMIsFixed'])
            .where({ CplndOrd: { in: keys } })
        );

        // se ci sono più righe per stesso CplndOrd, tiengo il primo record
        for (const row of (childRows || [])) {
          if (!childByKey.has(row.CplndOrd)) {
            childByKey.set(row.CplndOrd, {
              zsed_priority: row.zsed_priority ?? null,
              PlannedOrderBOMIsFixed: row.PlannedOrderBOMIsFixed ?? null
            });
          }
        }
      }

      for (const rec of records) {
        const child = childByKey.get(rec.CplndOrd);
        rec.zsed_priority = child?.zsed_priority ?? null;
        rec.PlannedOrderBOMIsFixed = child?.PlannedOrderBOMIsFixed ?? null;
      }
      //filtro se presente valore fullCycle 
      if (fullCycleVal === true || fullCycleVal === false) {
        const filtered = records.filter(r => {
          const isFullCycle = r.FullCycle === "FULLCYCLE";
          return fullCycleVal ? isFullCycle : !isFullCycle;
        });


        if (filtered.length === 0) {
          return Array.isArray(res) ? [] : null;
        }


        records.length = 0;
        records.push(...filtered);
      }
      const processed = records.map(item => {
        const total = Number(item.PlannedTotalQtyInBaseUnit) || 0;
        const committed = Number(item.PlndOrderCommittedQty) || 0;
        //const confirmed = Number(item.ConfirmedQuantity_V) || 0;

        let committed_percent = total ? (committed / total) * 100 : 0;
        //let confirmed_percent = total ? (confirmed / total) * 100 : 0;

        const committed_criticality =
          committed_percent === 100 ? 3 : (committed_percent > 0 ? 2 : 1);
        /*         const confirmed_criticality =
                  confirmed_percent === 100 ? 3 : (confirmed_percent > 0 ? 2 : 1); */


        if (committed_percent === 0) committed_percent = 100;
        //if (confirmed_percent === 0) confirmed_percent = 100;

        return {
          ...item,
          committed_percent,
          committed_criticality,
          //confirmed_percent,
          //confirmed_criticality
        };
      });

      return Array.isArray(res) ? processed : processed[0];
    });

    this.on("*", "ZZ1_CombinedPlnOrdersAPI/to_ZZ1_MasterPlannedOrders", async (req) => {

      return ZZ1_COMBINEDPLNORDERSAPI_CDS.run(req.query);
    });

    this.on("*", "ZZ1_CombinedPlnOrdersAPI/to_ZZ1_CombinPlannedOrdersCom", async (req) => {

      return ZZ1_COMBINEDPLNORDERSAPI_CDS.run(req.query);
    });

    this.on("*", "ZZ1_CombinedPlnOrdersAPI/to_ZZ1_PLOCAPACITYCORD", async (req) => {
      const cols = req.query.SELECT.columns || [];
      if (!cols.some(c => c.ref && c.ref[0] === 'BOOWorkCenterInternalID')) {
        req.query.SELECT.columns.push({ ref: ['BOOWorkCenterInternalID'] });
      }
      let res = await ZZ1_COMBINEDPLNORDERSAPI_CDS.run(req.query)
      //rimuovi eventuali duplicati usando solo CombinedMasterOrder Sequence Operation SubOperation come chiave
      const key = item =>
        `${item.CombinedMasterOrder}::${item.Sequence}::${item.Operation}::${item.SubOperation}`;

      res = Array.from(
        new Map(res.map(item => [key(item), item])).values()
      );
      return res;
    });

    this.on("*", "ZZ1_CombinedPlnOrdersAPI/to_ZZ1_PLOCAPACITYCORD_TEXT", async (req) => {
      const res = await ZZ1_COMBINEDPLNORDERSAPI_CDS.run(req.query)
      return res;
    });

    this.on("*", "ZZ1_PLOCAPACITYCORD_TEXT", async (req) => {
      const cols = req.query.SELECT.columns || [];
      if (!cols.some(c => c.ref && c.ref[0] === 'fornitore')) {
        req.query.SELECT.columns.push({ ref: ['fornitore'] });
      }
      const res = await ZZ1_COMBINEDPLNORDERSAPI_CDS.run(req.query)
      const unique = Object.values(
        res.reduce((acc, item) => {
          const key = item.BOOWorkCenterInternalID;
          if (!acc[key]) {
            acc[key] = item; // prendi il primo e basta
          }
          return acc;
        }, {})
      );

      return unique;
    });

    this.on("*", "ZZ1_RFM_WRKCHARVAL_F4", async (req) => {
      /*  const cols = req.query.SELECT.columns || [];
       if (!cols.some(c => c.ref && c.ref[0] === 'fornitore')) {
         req.query.SELECT.columns.push({ ref: ['fornitore'] });
       } */
      const res = await ZZ1_RFM_WRKCHARVAL_F4_CDS.run(req.query)
      /*  const unique = Object.values(
         res.reduce((acc, item) => {
           const key = item.BOOWorkCenterInternalID;
           if (!acc[key]) {
             acc[key] = item; // prendi il primo e basta
           }
           return acc;
         }, {})
       ); */

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

      //escludo i record che hanno "FreeDefinedIndicator1" === false
      //res = res.filter(item => item.FreeDefinedIndicator1 === true);

      return res;
    });

    //creo new map per memorizzare cpnldOrd per i componenti aggregati
    const userOrdersCache = new Map();
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
      //salvo i valori cplndOrd nella cache
      const cacheKey = req.user?.id || "anonymous";
      userOrdersCache.set(cacheKey, keys.CplndOrd);

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
        const reqQty = Number(row.RequiredQuantity || 0);

        if (!grouped[mat]) {
          grouped[mat] = {
            ...row,
            RequiredQuantity: 0,
            CombPlanAllQty: 0,
            AvailableQuantity: 0,
            orderDetails: []
          };
        }

        grouped[mat].RequiredQuantity += reqQty;
        grouped[mat].CombPlanAllQty += Number(row.CombPlanAllQty || 0);
        grouped[mat].AvailableQuantity += Number(row.AvailableQuantity || 0);

        //dettaglio ordine + materiale
        grouped[mat].orderDetails.push({
          CplndOrd: row.CplndOrd,
          Material: row.Material,
          RequiredQuantity: reqQty
        });
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

      //escludo record con "FreeDefineIndicator" === false
      //aggregated = aggregated.filter(item => item.FreeDefinedIndicator1 === true);

      return aggregated;
      //return res;
    });

    this.on("READ", "ZZ1_CombinPlannedOrdersComClone/to_ZZ1_CombPlnOrdersStock", async (req) => {
      let cplndOrd = req.params.at(-1)?.CplndOrd;
      let material = req.params.at(-1)?.Material;

      //recupero cpnldOrd degli aggregati
      const cacheKey = req.user?.id || "anonymous";
      const allSelectedOrders = userOrdersCache.get(cacheKey) || [];
      const ordersToUse =
        allSelectedOrders.length > 0 ? allSelectedOrders : [cplndOrd];

      if (!cplndOrd) {
        //cplndOrd = req.params[0].CplndOrd;
        return;
      }
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
          .where({
            Material: material,
            CplndOrd: { in: ordersToUse }
          })
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
            FSH_MPLO_ORD: { in: ordersToUse },
            WERKS: { in: stockData.map(i => i.Plant) },
            MATNR: { in: stockData.map(i => i.Material) }
          })
      );
      const combPlanAllQtyO_Promise = ZZ1_MFP_ASSIGNMENT_CDS.run(
        SELECT.from('ZZ1_MFP_ASSIGNMENT')
          .where({
            FSH_MPLO_ORD: { in: ordersToUse.map(o => `${o}_O`) },
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
            CplndOrd:
              { in: ordersToUse },

            CrossPlantConfigurableProduct:
              req.params.at(-1)?.CrossPlantConfigurableProduct !== undefined
                ? req.params.at(-1).CrossPlantConfigurableProduct
                : req.params[0]?.CrossPlantConfigurableProduct,

            Material:
              req.params.at(-1)?.Material !== undefined
                ? req.params.at(-1).Material
                : req.params[0]?.Material,

            Plant:
              req.params.at(-1)?.Plant !== undefined
                ? req.params.at(-1).Plant
                : req.params[0]?.Plant,

            StorageLocation:
              req.params.at(-1)?.StorageLocation !== undefined
                ? req.params.at(-1).StorageLocation
                : req.params[0]?.StorageLocation,

            Batch:
              req.params.at(-1)?.Batch !== undefined
                ? req.params.at(-1).Batch
                : req.params[0]?.Batch,

            BillOfMaterialItemNumber_2:
              req.params.at(-1)?.BillOfMaterialItemNumber_2 !== undefined
                ? req.params.at(-1).BillOfMaterialItemNumber_2
                : req.params[0]?.BillOfMaterialItemNumber_2
          })
      );
      // modifica DL - 10/06/2025 - recupero atp - FINE

      // 7. Execute all queries in parallel
      const [prodAllQtyData, planAllQtyDataRaw, combPlanAllQtyDataRaw, deliveryQtyData, atpRulesData, combPlanAllQtyO_Data] =
        await Promise.all([prodAllQtyPromise, planAllQtyPromise, combPlanAllQtyPromise, deliveryQtyPromise, atpRulesPromise, combPlanAllQtyO_Promise]);

      const combPlanAllQtyData = (combPlanAllQtyDataRaw || []).filter(row =>
        !(
          typeof row.FSH_MPLO_ORD === 'string' &&
          row.FSH_MPLO_ORD.endsWith('_O')
        )
      )
      const planAllQtyData = (planAllQtyDataRaw || []).filter(row =>
        !(
          typeof row.FSH_MPLO_ORD === 'string' &&
          row.FSH_MPLO_ORD.endsWith('_O')
        )
      )
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
            CombinedMasterOrder: { in: ordersToUse }
          })
      );
      const wasEmpty = new WeakSet();
      for (const row of res) {
        if (!row.StorageLocation) wasEmpty.add(row);
      }
      const validSuppliers = [...new Set(capacityData.map(c => c.fornitore))];
      const maxSupplierLength = Math.max(...validSuppliers.map(s => s.length));

      //recupero storageLocation da CBO
      const storageLocationsData = await ZZ1_STORAGE_LOCATION_CDS.run(
        SELECT
          .from('ZZ1_STORAGE_LOCATION')
          .columns('STORAGELOCATION')
          .where({ PLANT: parentKeys.Plant, }));
      const storageLocations = storageLocationsData.map(item => item.STORAGELOCATION);
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
      for (const row of res) {
        if (wasEmpty.has(row) && row.StorageLocation) {
          const { Plant, Material, StorageLocation, Batch } = row;

          const key = `${Plant}|${Material}|${StorageLocation}|${Batch}`;

          const planItems = planAllQtyMap[key] || [];
          const combPlanItems = combPlanAllQtyMap[key] || [];
          const combPlanO_Items = combPlanAllQtyO_Map[key] || [];

          const CombPlanAllQty = sumValues(combPlanItems, 'QTA_ASS_V');
          const TotalPlanAllQty = sumValues(planItems, 'QTA_ASS_V');
          const Scorta = combPlanO_Items.length > 0
            ? combPlanO_Items[0].Scorta
            : "";

          row.CombPlanAllQty = CombPlanAllQty;
          row.TotalPlanAllQty = TotalPlanAllQty.toFixed(3).toString();
          row.Scorta = Scorta;
        }
      }
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
      finalRes = finalRes.filter(item => parseFloat(item.StorageLocationStock) !== 0);

      const isZeroRecord = item =>
        Number(item.AvaibilityQty) === 0 &&
        Number(item.CombPlanAllQty) === 0;

      finalRes.sort((a, b) => isZeroRecord(a) - isZeroRecord(b));
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
      const [prodAllQtyData, planAllQtyDataRaw, combPlanAllQtyData, deliveryQtyData, atpRulesData, combPlanAllQtyO_Data] =
        await Promise.all([prodAllQtyPromise, planAllQtyPromise, combPlanAllQtyPromise, deliveryQtyPromise, atpRulesPromise, combPlanAllQtyO_Promise]);
      const planAllQtyData = (planAllQtyDataRaw || []).filter(row =>
        !(
          typeof row.FSH_MPLO_ORD === 'string' &&
          row.FSH_MPLO_ORD.endsWith('_O')
        )
      )
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
      const wasEmpty = new WeakSet();
      for (const row of res) {
        if (!row.StorageLocation) wasEmpty.add(row);
      }
      const validSuppliers = [...new Set(capacityData.map(c => c.fornitore))];
      const maxSupplierLength = Math.max(...validSuppliers.map(s => s.length));

      //recupero storageLocation da CBO
      const storageLocationsData = await ZZ1_STORAGE_LOCATION_CDS.run(
        SELECT
          .from('ZZ1_STORAGE_LOCATION')
          .columns('STORAGELOCATION')
          .where({ PLANT: req.params.at(-1).Plant }));
      const storageLocations = storageLocationsData.map(item => item.STORAGELOCATION);
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
      for (const row of res) {
        if (wasEmpty.has(row) && row.StorageLocation) {
          const { Plant, Material, StorageLocation, Batch } = row;

          const key = `${Plant}|${Material}|${StorageLocation}|${Batch}`;

          const planItems = planAllQtyMap[key] || [];
          const combPlanItems = combPlanAllQtyMap[key] || [];
          const combPlanO_Items = combPlanAllQtyO_Map[key] || [];

          const CombPlanAllQty = sumValues(combPlanItems, 'QTA_ASS_V');
          const TotalPlanAllQty = sumValues(planItems, 'QTA_ASS_V');
          const Scorta = combPlanO_Items.length > 0
            ? combPlanO_Items[0].Scorta
            : "";

          row.CombPlanAllQty = CombPlanAllQty;
          row.TotalPlanAllQty = TotalPlanAllQty.toFixed(3).toString();
          row.Scorta = Scorta;
        }
      }
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
      finalRes = finalRes.filter(item => parseFloat(item.StorageLocationStock) !== 0);

      const isZeroRecord = item =>
        Number(item.AvaibilityQty) === 0 &&
        Number(item.CombPlanAllQty) === 0;

      finalRes.sort((a, b) => isZeroRecord(a) - isZeroRecord(b));
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
      const uniqueRes = Array.from(
        new Map(res.map(item => [item.CplndOrd, item])).values()
      );

      return uniqueRes;
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
        // Conto quanti ordini ci sono
        const countFSH = JSON.stringify(where).split("FSH_MPLO_ORD").length - 1;
        const multiFSH = countFSH > 1;
        console.log("Numero occorrenze FSH_MPLO_ORD:", countFSH);
        // Flag: più di 1 valore
        if (multiFSH && Array.isArray(res)) {
          const grouped = {};

          for (const row of res) {
            const qty = Number(row.QTA_ASS_V || 0);
            const isSurplusOrder = String(row.FSH_MPLO_ORD || "").endsWith("_O");

            if (isSurplusOrder) {
              const uniqueKey = `KEEP_${row.LGORT}_${row.CHARG}_${row.FSH_MPLO_ORD}`;
              grouped[uniqueKey] = { ...row, QTA_ASS_V: qty };
              continue;
            }

            const key = `${row.LGORT}_${row.CHARG}`;

            if (!grouped[key]) {
              grouped[key] = { ...row, QTA_ASS_V: qty };
            } else {
              grouped[key].QTA_ASS_V += qty;
            }
          }

          res = Object.values(grouped);

          res = res.map(r => ({
            ...r,
            QTA_ASS_V: r.QTA_ASS_V.toString()
          }));
        }
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

    this.on("Fissazione", async (req) => {
      const object = req.data.Payload;
      var plannedOrderNumbers = [];
      const fixedId = "1"; //id fisso
      object.CplndOrd.forEach(item => {
        if (item !== undefined) {
          plannedOrderNumbers.push(item);
        }
      });
      console.log("combplnord" + plannedOrderNumbers);
      var to_array = plannedOrderNumbers.map(number => {
        return {
          "id": fixedId, // ID fisso per ogni riga
          "combplnord": number
        };
      });
      // payload finale con testata e righe
      var oPayload = {
        "id": fixedId, // ID fisso per la testata
        "to_array": to_array
      };
      console.log("Payload per la POST: " + JSON.stringify(oPayload));
      const result = await zmfp_plo_firming.tx(req).post("/header", oPayload);

      console.log('Risultato della POST:', result);
      return result
    })

    this.on("ChangeWorkCenter", async (req) => {

      const object = req.data.Payload;

      /*   var payload = {
          "FSH_CPLND_ORD": object.CombPlOrder,
          "MANUFACTURINGORDEROPERATION": object.Operation,
          "MANUFACTURINGORDERSEQUENCE": object.Sequence,
          "WORKCENTER": object.WorkCenter
        } */

      try {
        //se WC presente faccio UPDATE altrimenti inserisco record nel CBO
        let WRKC = await changeWorkCenter.run(
          SELECT.from("ZZ1_MFP_WRKC_UPDATE").where({ FSH_CPLND_ORD: object.CombPlOrder })
        );

        if (WRKC.length > 0) {

          const uuid = WRKC[0].SAP_UUID;

          await changeWorkCenter.run(
            UPDATE("ZZ1_MFP_WRKC_UPDATE")
              .set({
                WORKCENTER: object.WorkCenter,
                MANUFACTURINGORDERSEQUENCE: object.Sequence,
                MANUFACTURINGORDEROPERATION: object.Operation,
                PRICE_V: object.PRICE_V,
                PRICE_C: object.PRICE_C
              })
              .where({ SAP_UUID: uuid })
          );
          console.log("Record aggiornato");
        }
        else {
          await changeWorkCenter.run(
            INSERT.into("ZZ1_MFP_WRKC_UPDATE").entries({
              FSH_CPLND_ORD: object.CombPlOrder,
              MANUFACTURINGORDEROPERATION: object.Operation,
              MANUFACTURINGORDERSEQUENCE: object.Sequence,
              WORKCENTER: object.WorkCenter,
              PRICE_V: object.PRICE_V,
              PRICE_C: object.PRICE_C
            })
          );
          console.log("Record creato");
        }
        //console.log(changeWorkCenter.actions);
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
        console.log(error.response?.data);
        console.log(error.response?.status);
        console.log(error.response?.headers);
        return error.message
      }
    });

    this.on("AltLabAction", async (req) => {
      const object = req.data.Payload;

      const isEmpty = v => v === undefined || v === null || v === "";

      try {
        const plannedPromise = ZZ1_PLANNEDORDERSAPI_CDS.run(
          SELECT
            .columns('BillOfOperationsGroup')
            .from('ZZ1_PlannedOrdersAPI')
            .where({ CplndOrd: object.CombinedMasterOrder })
            .limit(1)
        );

        // attendo SOLO la prima
        const PlannedOrdersAPI = await plannedPromise;

        if (!PlannedOrdersAPI || PlannedOrdersAPI.length === 0) {
          return [];
        }

        const BillOfOperationsGroup = PlannedOrdersAPI[0].BillOfOperationsGroup;

        const ploPromise = ZZ1_PLO_OPERATIONS_CDS.run(
          SELECT
            .columns('Matkl')
            .from('ZZ1_PLO_OPERATIONS')
            .where({
              Plnnr: BillOfOperationsGroup,
              Arbid: object.WorkCenterInternalID
            })
            .limit(1)
        );

        const maraPromise = ZZ1_MARA_CUSTOM_FIELDS_API_CDS.run(
          SELECT
            .columns('zzproj', 'zzcolor')
            .from('ZZ1_MARA_CUSTOM_FIELDS_API')
            .where({ Product: object.Product })
            .limit(1)
        );

        const altLabPromise = ZZ1_ALT_LAB_CDS.run(
          SELECT.from("ZZ1_ALT_LAB")
            .columns(
              "*"
            )
            .where({
              // Plant: object.ProductionPlant,
              MATKL: { "!=": null }
            })
        );

        const [PloOperations, MaraCustomFields, allAltLab] =
          await Promise.all([ploPromise, maraPromise, altLabPromise]);

        // estraggo valori
        const matkl = PloOperations?.[0]?.Matkl;
        const zzproj = MaraCustomFields?.[0]?.zzproj;
        const zzcolor = MaraCustomFields?.[0]?.zzcolor;

        if (!matkl) return [];

        const seq1 = allAltLab.filter(r =>
          r.MATKL === matkl &&
          r.ZMD_PROJCODE === zzproj &&
          r.ZMD_COLORCODE === zzcolor
        );

        if (seq1.length > 0) return seq1;

        const seq2 = allAltLab.filter(r =>
          r.MATKL === matkl &&
          r.ZMD_PROJCODE === zzproj &&
          isEmpty(r.ZMD_COLORCODE)
        );

        if (seq2.length > 0) return seq2;

        const seq3 = allAltLab.filter(r =>
          r.MATKL === matkl &&
          isEmpty(r.ZMD_PROJCODE) &&
          isEmpty(r.ZMD_COLORCODE)
        );

        if (seq3.length > 0) return seq3;

        return [];

      } catch (err) {
        return req.error(500, err.message);
      }
    });

    //action Assegnazione automatica
    this.on("AssegnaAuto", async (req) => {
      const object = req.data.Payload;
      const material = object.Material;
      const cplndOrd = object.CplndOrd;

      const where = {
        Material: object.Material,
        Plant: object.ProductionPlant
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

      const PlannedCombinedOrder = cplndOrd;

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
            CplndOrd: object.CplndOrd,
            CrossPlantConfigurableProduct: object.CrossPlantConfigurableProduct,
            Material: object.Material,
            Plant: object.ProductionPlant,
            StorageLocation: object.StorageLocation,
            Batch: object.Batch,
            BillOfMaterialItemNumber_2: object.BillOfMaterialItemNumber_2
          })
      );
      // modifica DL - 10/06/2025 - recupero atp - FINE

      // 7. Execute all queries in parallel
      const [prodAllQtyData, planAllQtyDataRaw, combPlanAllQtyDataRaw, deliveryQtyData, atpRulesData, combPlanAllQtyO_Data] =
        await Promise.all([prodAllQtyPromise, planAllQtyPromise, combPlanAllQtyPromise, deliveryQtyPromise, atpRulesPromise, combPlanAllQtyO_Promise]);

      const combPlanAllQtyData = (combPlanAllQtyDataRaw || []).filter(row =>
        !(
          typeof row.FSH_MPLO_ORD === 'string' &&
          row.FSH_MPLO_ORD.endsWith('_O')
        )
      )
      const planAllQtyData = (planAllQtyDataRaw || []).filter(row =>
        !(
          typeof row.FSH_MPLO_ORD === 'string' &&
          row.FSH_MPLO_ORD.endsWith('_O')
        )
      )
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
      const wasEmpty = new WeakSet();
      for (const row of res) {
        if (!row.StorageLocation) wasEmpty.add(row);
      }
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
      for (const row of res) {
        if (wasEmpty.has(row) && row.StorageLocation) {
          const { Plant, Material, StorageLocation, Batch } = row;

          const key = `${Plant}|${Material}|${StorageLocation}|${Batch}`;

          const planItems = planAllQtyMap[key] || [];
          const combPlanItems = combPlanAllQtyMap[key] || [];
          const combPlanO_Items = combPlanAllQtyO_Map[key] || [];

          const CombPlanAllQty = sumValues(combPlanItems, 'QTA_ASS_V');
          const TotalPlanAllQty = sumValues(planItems, 'QTA_ASS_V');
          const Scorta = combPlanO_Items.length > 0
            ? combPlanO_Items[0].Scorta
            : "";

          row.CombPlanAllQty = CombPlanAllQty;
          row.TotalPlanAllQty = TotalPlanAllQty;
          row.Scorta = Scorta;
        }
      }
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
      finalRes = finalRes.filter(item => parseFloat(item.StorageLocationStock) !== 0);

      const isZeroRecord = item =>
        Number(item.AvaibilityQty) === 0 &&
        Number(item.CombPlanAllQty) === 0;

      finalRes.sort((a, b) => isZeroRecord(a) - isZeroRecord(b));
      // modifica MDB - 16/09/2025 - sommare StorageLocationStock a parità di StorageLocation e batch e riassegnare AvaibilityQty con StorageLocationStock - FINE
      finalRes['$count'] = finalRes.length.toString();

      //raggruppamento per assegnazione automatica
      const items = [];
      let _selectedItems = [];

      for (let i = 0; i < finalRes.length; i++) {
        const item = finalRes[i];
        //Escludi i record con AvaibilityQty === 0 e CombPlanAllQty === 0
        const AvaibilityQty = parseFloat(item.AvaibilityQty);
        const CombPlanAllQty = parseFloat(item.CombPlanAllQty);

        // Se ENTRAMBI sono zero → salta questo record
        if (AvaibilityQty === 0 && CombPlanAllQty === 0) {
          continue; // salta il push
        }

        items.push(item);
      }

      let RequiredQty = Number(object.RequiredQuantity);

      const grouped = Object.values(
        items.reduce((acc, item, index) => {
          const key = `${item.BatchBySupplier}_${item.StorageLocation}`;

          if (!acc[key]) {
            acc[key] = {
              BatchBySupplier: item.BatchBySupplier,
              StorageLocation: item.StorageLocation,
              StorageLocationStock: 0,
              indices: [] // salvo gli indici degli elementi originali
            };
          }

          acc[key].StorageLocationStock += Number(item.StorageLocationStock) || 0;
          acc[key].indices.push(index);

          return acc;
        }, {})
      );

      // 2. Trovo il record col valore più piccolo > RequiredQty
      const selected = grouped
        .filter(g => Number(g.StorageLocationStock) > RequiredQty)
        .sort((a, b) => Number(a.StorageLocationStock) - Number(b.StorageLocationStock))[0];

      if (selected) {
        // 3. Se contiene più di un indice → era un aggregato
        if (selected.indices.length > 1) {

          _selectedItems = selected.indices.map(i => items[i]);

        } else {

          // Caso singolo
          _selectedItems = [items[selected.indices[0]]];

        }
        //Aggiunta codice per assegnazione 
        let TotCombPlanAllQty = 0;
        let OpenQty = 0;
        for (let i = 0; i < _selectedItems.length; i++) {
          const oObj = _selectedItems[i]
          TotCombPlanAllQty += parseFloat(oObj.CombPlanAllQty)
        }

        OpenQty = object.RequiredQuantity - TotCombPlanAllQty;
        const TotAvaibilityQty = _selectedItems.reduce((acc, item) => acc + parseFloat(item.AvaibilityQty || 0), 0);
        const selectedItemLength = _selectedItems.length;
        //controllo se ci sono assegnazioni per l'ordine
        const existingAssignment = await ZZ1_MFP_ASSIGNMENT_CDS.run(
          SELECT.from("ZZ1_MFP_ASSIGNMENT").where({
            FSH_MPLO_ORD: cplndOrd,
            MATNR: material
          })
        );
        // somma delle quantità già assegnate (0 se array vuoto)
        const assignedQty = existingAssignment.reduce(
          (sum, row) => sum + Number(row.QTA_ASS_V ?? 0),
          0
        );

        // quantità residua
        const remainingQty = RequiredQty - assignedQty;

        // controllo
        if (remainingQty <= 0) {
          return "SKIPPED";
        }

        const insertPromises = _selectedItems.map(async (_item) => {
          const item = structuredClone(_item);

          const qty = parseFloat(item.AvaibilityQty);
          const tot = parseFloat(TotAvaibilityQty);

          const COPERTURA = tot > 0
            ? Math.round((qty / tot) * 100)
            : 0;

          let QTA_ASS_V;
          if (selectedItemLength === 1) {
            QTA_ASS_V = remainingQty;
          } else {
            QTA_ASS_V = Math.min(
              Number(object.AvailableQuantity),
              (object.AvailableQuantity * (COPERTURA / 100))
            );
          }

          const SAP_UUID = crypto.randomUUID();

          if (item.InventorySpecialStockType?.startsWith('_')) {
            item.InventorySpecialStockType = '';
          }
          if (item.SpecialStock?.startsWith('_')) {
            item.SpecialStock = '';
          }

          const newCreate = {
            SAP_UUID,
            WERKS: item.Plant,
            LGORT: item.StorageLocation || "X",
            FSH_MPLO_ORD: object.CplndOrd,
            BAGNI: item.dye_lot || "X",
            MATNR: item.Material,
            CHARG: item.Batch,
            QTA_ASS_V: QTA_ASS_V.toFixed(3).toString(),
            FABB_TOT_V: item.AvaibilityQty || 0,
            COPERTURA,
            SORT: 0,
            StockSegment: item.StockSegment,
            SAP_CreatedDateTime: new Date(),
            SAP_CreatedByUser: "LASPATAS",
            SAP_LastChangedDateTime: new Date(),
            SAP_LastChangedByUser: "LASPATAS",
            BatchBySupplier: item.BatchBySupplier,
            SpecialStock: item.InventorySpecialStockType,
            SaldoScorta: false,
            Scorta: ""
          };

          const existing = await ZZ1_MFP_ASSIGNMENT_CDS.run(
            SELECT.from("ZZ1_MFP_ASSIGNMENT").where({
              FSH_MPLO_ORD: newCreate.FSH_MPLO_ORD,
              CHARG: newCreate.CHARG,
              LGORT: newCreate.LGORT
            })
          );

          if (existing.length > 0) {
            return; // skip
          }

          return ZZ1_MFP_ASSIGNMENT_CDS.run(
            INSERT.into("ZZ1_MFP_ASSIGNMENT").entries(newCreate)
          );
        });

        await Promise.all(insertPromises);

        return "ASSIGNED";

      } else {
        return "SKIPPED";
      }

    });

    //action Assegnazione automatica Aggregato
    this.on("AssegnaAutoAgg", async (req) => {
      const object = req.data.Payload;
      const material = object.Material;
      const orderDetails = object.orderDetails;

      const ordNumbers = orderDetails
        .map(d => d.CplndOrd)
        .filter(Boolean);

      const where = {
        Material: object.Material,
        Plant: object.ProductionPlant
      };

      const stockData = await ZZ1_COMBPLNORDERSSTOCKAPI_CDS.run(
        SELECT.from("ZZ1_CombPlnOrdersStock").where(where)
      );

      // modifica MDB - 06/08/2025 - estraggo record selezionato da tabella Componenti - INIZIO
      const stockByMaterial = await ZZ1_COMBPLNORDERSSTOCKAPI_CDS.run(
        SELECT
          .from("ZZ1_CombPlnOrdersStockAPI")
          .columns("*")
          .where({
            Material: material,
            CplndOrd: { in: ordNumbers }
          })
      );
      // modifica MDB - 06/08/2025 - estraggo record selezionato da tabella Componenti - FINE
      if (!Array.isArray(stockData) || stockData.length === 0) return stockData;

      //const PlannedCombinedOrder = req.params.at(-1).CplndOrd;

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
            FSH_MPLO_ORD: { in: ordNumbers },
            WERKS: { in: stockData.map(i => i.Plant) },
            MATNR: { in: stockData.map(i => i.Material) }
          })
      );
      const combPlanAllQtyO_Promise = ZZ1_MFP_ASSIGNMENT_CDS.run(
        SELECT.from('ZZ1_MFP_ASSIGNMENT')
          .where({
            FSH_MPLO_ORD: { in: ordNumbers.map(o => `${o}_O`) },
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
            CplndOrd: { in: ordNumbers },
            CrossPlantConfigurableProduct: object.CrossPlantConfigurableProduct,
            Material: object.Material,
            Plant: object.ProductionPlant,
            StorageLocation: object.StorageLocation,
            Batch: object.Batch,
            BillOfMaterialItemNumber_2: object.BillOfMaterialItemNumber_2
          })
      );
      // modifica DL - 10/06/2025 - recupero atp - FINE
      // 7. Execute all queries in parallel
      const [prodAllQtyData, planAllQtyDataRaw, combPlanAllQtyDataRaw, deliveryQtyData, atpRulesData, combPlanAllQtyO_Data] =
        await Promise.all([prodAllQtyPromise, planAllQtyPromise, combPlanAllQtyPromise, deliveryQtyPromise, atpRulesPromise, combPlanAllQtyO_Promise]);

      const combPlanAllQtyData = (combPlanAllQtyDataRaw || []).filter(row =>
        !(
          typeof row.FSH_MPLO_ORD === 'string' &&
          row.FSH_MPLO_ORD.endsWith('_O')
        )
      )
      const planAllQtyData = (planAllQtyDataRaw || []).filter(row =>
        !(
          typeof row.FSH_MPLO_ORD === 'string' &&
          row.FSH_MPLO_ORD.endsWith('_O')
        )
      )
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
            CombinedMasterOrder: { in: ordNumbers }
          })
      );
      const wasEmpty = new WeakSet();
      for (const row of res) {
        if (!row.StorageLocation) wasEmpty.add(row);
      }
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
      for (const row of res) {
        if (wasEmpty.has(row) && row.StorageLocation) {
          const { Plant, Material, StorageLocation, Batch } = row;

          const key = `${Plant}|${Material}|${StorageLocation}|${Batch}`;

          const planItems = planAllQtyMap[key] || [];
          const combPlanItems = combPlanAllQtyMap[key] || [];
          const combPlanO_Items = combPlanAllQtyO_Map[key] || [];

          const CombPlanAllQty = sumValues(combPlanItems, 'QTA_ASS_V');
          const TotalPlanAllQty = sumValues(planItems, 'QTA_ASS_V');
          const Scorta = combPlanO_Items.length > 0
            ? combPlanO_Items[0].Scorta
            : "";

          row.CombPlanAllQty = CombPlanAllQty;
          row.TotalPlanAllQty = TotalPlanAllQty;
          row.Scorta = Scorta;
        }
      }
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
      finalRes = finalRes.filter(item => parseFloat(item.StorageLocationStock) !== 0);

      const isZeroRecord = item =>
        Number(item.AvaibilityQty) === 0 &&
        Number(item.CombPlanAllQty) === 0;

      finalRes.sort((a, b) => isZeroRecord(a) - isZeroRecord(b));
      // modifica MDB - 16/09/2025 - sommare StorageLocationStock a parità di StorageLocation e batch e riassegnare AvaibilityQty con StorageLocationStock - FINE
      finalRes['$count'] = finalRes.length.toString();

      //gestione assegnazione automatica
      const items = [];
      let _selectedItems = [];

      for (let i = 0; i < finalRes.length; i++) {
        const item = finalRes[i];
        const AvaibilityQty = parseFloat(item.AvaibilityQty);
        const CombPlanAllQty = parseFloat(item.CombPlanAllQty);

        // Escludi i record con AvaibilityQty === 0 e CombPlanAllQty === 0
        if (AvaibilityQty === 0 && CombPlanAllQty === 0) {
          continue;
        }

        items.push(item);
      }

      let RequiredQty = Number(object.RequiredQuantity);

      // raggruppamento per BatchBySupplier + StorageLocation
      const grouped = Object.values(
        items.reduce((acc, item, index) => {
          const key = `${item.BatchBySupplier}_${item.StorageLocation}`;

          if (!acc[key]) {
            acc[key] = {
              BatchBySupplier: item.BatchBySupplier,
              StorageLocation: item.StorageLocation,
              StorageLocationStock: 0,
              indices: []
            };
          }

          acc[key].StorageLocationStock += Number(item.StorageLocationStock) || 0;
          acc[key].indices.push(index);

          return acc;
        }, {})
      );

      // 2. Trovo il record col valore più piccolo > RequiredQty
      const selected = grouped
        .filter(g => Number(g.StorageLocationStock) > RequiredQty)
        .sort((a, b) => Number(a.StorageLocationStock) - Number(b.StorageLocationStock))[0];

      if (!selected) {
        return "SKIPPED";
      }

      // 3. Se contiene più di un indice → era un aggregato
      if (selected.indices.length > 1) {
        _selectedItems = selected.indices.map(i => items[i]);
      } else {
        // Caso singolo
        _selectedItems = [items[selected.indices[0]]];
      }

      let TotCombPlanAllQty = 0;
      for (let i = 0; i < _selectedItems.length; i++) {
        const oObj = _selectedItems[i];
        TotCombPlanAllQty += parseFloat(oObj.CombPlanAllQty);
      }

      const TotAvaibilityQty = _selectedItems.reduce(
        (acc, item) => acc + parseFloat(item.AvaibilityQty || 0),
        0
      );
      const selectedItemLength = _selectedItems.length;

      const ordersForMaterial = (object.orderDetails || []).filter(d =>
        d.Material === material && Number(d.RequiredQuantity) > 0
      );

      // se il materiale non è in nessun ordine → skip
      if (!ordersForMaterial.length) {
        return "SKIPPED";
      }

      const allInsertPromises = [];

      for (const det of ordersForMaterial) {
        const ordCplnd = det.CplndOrd;
        const ordRequiredQty = Number(det.RequiredQuantity); // required per QUESTO ordine

        // controllo se ci sono già assegnazioni per QUESTO ordine + materiale
        const existingAssignment = await ZZ1_MFP_ASSIGNMENT_CDS.run(
          SELECT.from("ZZ1_MFP_ASSIGNMENT").where({
            FSH_MPLO_ORD: ordCplnd,
            MATNR: material
          })
        );

        // somma delle quantità già assegnate (0 se array vuoto)
        const assignedQty = existingAssignment.reduce(
          (sum, row) => sum + Number(row.QTA_ASS_V ?? 0),
          0
        );

        // quantità residua per QUESTO ordine
        const remainingQty = ordRequiredQty - assignedQty;

        // se non ho più niente da assegnare per questo ordine → passo al prossimo
        if (remainingQty <= 0) {
          continue;
        }

        //creo i record per QUESTO ordine, splittando su _selectedItems
        const insertPromises = _selectedItems.map(async (_item) => {
          const item = structuredClone(_item);

          const qty = parseFloat(item.AvaibilityQty);
          const tot = parseFloat(TotAvaibilityQty);

          const COPERTURA = tot > 0
            ? Math.round((qty / tot) * 100)
            : 0;

          let QTA_ASS_V;
          if (selectedItemLength === 1) {
            // un solo item di stock: tutta la residua dell'ordine
            QTA_ASS_V = remainingQty;
          } else {
            // split proporzionale della required dell'ordine
            QTA_ASS_V = remainingQty * (COPERTURA / 100);
          }

          const SAP_UUID = crypto.randomUUID();

          if (item.InventorySpecialStockType?.startsWith('_')) {
            item.InventorySpecialStockType = '';
          }
          if (item.SpecialStock?.startsWith('_')) {
            item.SpecialStock = '';
          }

          const newCreate = {
            SAP_UUID,
            WERKS: item.Plant,
            LGORT: item.StorageLocation || "X",
            FSH_MPLO_ORD: ordCplnd,                //ordine specifico
            BAGNI: item.dye_lot || "X",
            MATNR: item.Material,
            CHARG: item.Batch,
            QTA_ASS_V: QTA_ASS_V.toFixed(3).toString(),
            FABB_TOT_V: item.AvaibilityQty || 0,
            COPERTURA,
            SORT: 0,
            StockSegment: item.StockSegment,
            SAP_CreatedDateTime: new Date(),
            SAP_CreatedByUser: "LASPATAS",
            SAP_LastChangedDateTime: new Date(),
            SAP_LastChangedByUser: "LASPATAS",
            BatchBySupplier: item.BatchBySupplier,
            SpecialStock: item.InventorySpecialStockType,
            SaldoScorta: false,
            Scorta: ""
          };

          // controllo duplicati per stesso ORDINE + batch + magazzino
          const existing = await ZZ1_MFP_ASSIGNMENT_CDS.run(
            SELECT.from("ZZ1_MFP_ASSIGNMENT").where({
              FSH_MPLO_ORD: newCreate.FSH_MPLO_ORD,
              CHARG: newCreate.CHARG,
              LGORT: newCreate.LGORT
            })
          );

          if (existing.length > 0) {
            return; // skip
          }

          return ZZ1_MFP_ASSIGNMENT_CDS.run(
            INSERT.into("ZZ1_MFP_ASSIGNMENT").entries(newCreate)
          );
        });

        allInsertPromises.push(...insertPromises);
      }

      await Promise.all(allInsertPromises);

      return allInsertPromises.length ? "ASSIGNED" : "SKIPPED";

    })
    //action per gestire highlights in tab Componenti
    this.on("ReadBatchCust", async req => {
      try {
        const { Material, Gruppo_merce, Plant } = req.data.Payload;
        let batch = null;

        const isEmptyOrN = v => v === undefined || v === null || v === "" || v === "N";

        const q1 = Material
          ? ButchCustService.run(
            SELECT.one("*")
              .from("ZZ1_MFP_BATCHCUSTOM")
              .where({ Material: Material })
          )
          : Promise.resolve(null);

        const q2 = (Gruppo_merce && Plant)
          ? ButchCustService.run(
            SELECT.one("*")
              .from("ZZ1_MFP_BATCHCUSTOM")
              .where({ Gruppo_Merce: Gruppo_merce, Plant: Plant })
          )
          : Promise.resolve(null);

        const q3 = Plant
          ? ButchCustService.run(
            SELECT.one("*")
              .from("ZZ1_MFP_BATCHCUSTOM")
              .where({ Plant: Plant })
          )
          : Promise.resolve(null);

        let [res1, res2, res3] = await Promise.all([q1, q2, q3]);
        // 1) prova solo Material
        if (res1) {
          const others = ["Gruppo_Merce", "Plant", "Famiglia", "Cites"];
          if (others.some(key => !isEmptyOrN(res1[key]))) {
            res1 = null;
          }
        }
        if (res1) return res1;

        // 2) prova Gruppo + Plant
        if (res2) {
          const others = ["Material", "Famiglia", "Cites"];
          if (others.some(key => !isEmptyOrN(res2[key]))) {
            res2 = null;
          }
        }
        if (res2) return res2;

        // 3) prova solo Plant
        if (res3) {
          const others = ["Material", "Gruppo_Merce", "Famiglia", "Cites"];
          if (others.some(key => !isEmptyOrN(res3[key]))) {
            res3 = null;
          }
        }
        if (res3) return res3;

        return null;

      } catch (err) {
        return req.error(500, err.message);
      }
    });

    this.on("*", "ZZ1_CombinedPlnOrdersAPI/to_ZZ1_PlannedOrdersCapacity", async (req) => {
      return ZZ1_COMBINEDPLNORDERSAPI_CDS.run(req.query);
    });

    /*  this.on("*", "ZZ1_PRODUCTIONPLANT_F4", async (req) => {
       // Cerca eventuale Symbol(original)
       const symbols = Object.getOwnPropertySymbols(req.query);
       const symOriginal = symbols.find(s => s.toString() === 'Symbol(original)');
 
       let select;
 
       if (symOriginal && req.query[symOriginal] && req.query[symOriginal].SELECT) {
         select = req.query[symOriginal];
       } else {
         select = req.query;
       }
       const newQuery = JSON.parse(JSON.stringify(select));
       delete newQuery.SELECT.limit;
       delete newQuery.SELECT.offset;
       //delete newQuery.offset;
       const res = await ZZ1_PRODUCTIONPLANT_F4_CDS.run(newQuery);
       res.$count = res.length;
       return res;
     }); */

    /*    this.on("*", "ZZ1_MRP_PLANT_F4", async (req) => {
         const newQuery = JSON.parse(JSON.stringify(req.query));
         if (newQuery.SELECT) {
           delete newQuery.SELECT.limit;
           delete newQuery.SELECT.offset;
         }
         const res = await ZZ1_MRP_PLANT_F4_CDS.run(newQuery);
         console.log({ query: JSON.stringify(req.query), res });
         res['$count'] = res.length;
         return res;
       }); */
    //Match code ProductionPlant
    this.on("*", "ZC_RFM_PRODUCTION_PLANT_F4", async (req) => {
      const result = await zmfp_mrp_plant_f4.run(req.query);
      return result;
    });
    //Match code CplndOrd
    this.on("*", "ZC_RFM_COMBPLANNEDORD_F4", async (req) => {
      const result = await ZMFP_MRP_COMBINEDPLNDORDER_F4.run(req.query);
      return result;
    });
    //Match code MRPController
    this.on("*", "ZC_RFM_MRPCONTROLLER_F4", async (req) => {
      const result = await ZMFP_MRP_CONTROLLER_F4.run(req.query);
      return result;
    });
    //Match code PlannedOrderType
    this.on("*", "ZC_RFM_PLANNED_ORDER_TYPE_F4", async (req) => {
      const result = await ZMFP_MRP_PLANNEDORDER_TYPE_F4.run(req.query);
      return result;
    });
    //Match code ProductSeason
    this.on("*", "ZC_RFM_PLO_PRODUCT_SEASON_F4", async (req) => {
      const result = await ZMFP_MRP_PRODUCT_SEASON_F4.run(req.query);
      return result;
    });
    //Match code WorkCenter
    this.on("*", "ZC_RFM_WORKCENTER_F4", async (req) => {
      const result = await ZMFP_MRP_WORKCENTER_F4.run(req.query);
      return result;
    });

    this.on("*", "ZZ1_ZZ1_MFP_CHECKCAMPIBATC", async (req) => {
      const result = await ZZ1_ZZ1_MFP_CHECKCAMPIBATC_CDS.run(req.query);
      return result;
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

      const passesFilter = each =>
        each.flagHighlights === 'X' || each.FreeDefinedIndicator1 === true;

      if (Array.isArray(data)) {

        await Promise.all(data.map(processRecord));

        let filtered = data.filter(passesFilter);

        filtered.sort((a, b) => {
          const pA = a.flagHighlights === 'X' ? 0 : 1;
          const pB = b.flagHighlights === 'X' ? 0 : 1;
          return pA - pB;
        });

        data.length = 0;            // svuota l'array originale
        filtered.forEach(r => data.push(r));

      } else if (data) {
        await processRecord(data);

        if (!passesFilter(data)) {
          return null;
        }

        return data;
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

      const passesFilter = each =>
        each.flagHighlights === 'X' || each.FreeDefinedIndicator1 === true;

      if (Array.isArray(data)) {
        await Promise.all(data.map(processRecord));

        // 2) filtro
        let filtered = data.filter(passesFilter);

        // 3) sort con priorità ai flagHighlights = 'X'
        filtered.sort((a, b) => {
          const pA = a.flagHighlights === 'X' ? 0 : 1;
          const pB = b.flagHighlights === 'X' ? 0 : 1;
          return pA - pB;
        });

        data.length = 0;            // svuota l'array originale
        filtered.forEach(r => data.push(r));

      } else if (data) {
        await processRecord(data);

        if (!passesFilter(data)) {
          return null;
        }

        return data;
      }
    });
  }
};
