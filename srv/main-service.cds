// using {Records} from './types/types';
using {ZZ1_COMBINEDPLNORDERSAPI_CDS} from './external/ZZ1_COMBINEDPLNORDERSAPI_CDS';
using {ZZ1_MASTERPLANNEDORDERAPI_CDS} from './external/ZZ1_MASTERPLANNEDORDERAPI_CDS';
using {ZZ1_PLANNEDORDERSAPI_CDS} from './external/ZZ1_PLANNEDORDERSAPI_CDS';
using {ZZ1_COMBPLNORDERSSTOCKAPI_CDS} from './external/ZZ1_COMBPLNORDERSSTOCKAPI_CDS';
using {ZZ1_MFP_ASSIGNMENT_CDS} from './external/ZZ1_MFP_ASSIGNMENT_CDS';
using {ZMPF_ASS_BATCH_SRV} from './external/ZMPF_ASS_BATCH_SRV';
using {ZI_RFM_ATP_RULES_CDS} from './external/ZI_RFM_ATP_RULES_CDS';
using {ZZ1_MFP_WRKC_UPDATE_CDS} from './external/ZZ1_MFP_WRKC_UPDATE_CDS';
using {ZZ1_MATERIAL_F4_CDS} from './external/ZZ1_MATERIAL_F4_CDS';
using {ZZ1_MFP_BATCHCUSTOM_CDS} from './external/ZZ1_MFP_BATCHCUSTOM_CDS';
using {ZZ1_ALT_LAB_CDS} from './external/ZZ1_ALT_LAB_CDS';
using {zmfp_mrp_plant_f4} from './external/zmfp_mrp_plant_f4';
using {ZMFP_MRP_COMBINEDPLNDORDER_F4} from './external/ZMFP_MRP_COMBINEDPLNDORDER_F4';
using {ZMFP_MRP_CONTROLLER_F4} from './external/ZMFP_MRP_CONTROLLER_F4';
using {ZMFP_MRP_PLANNEDORDER_TYPE_F4} from './external/ZMFP_MRP_PLANNEDORDER_TYPE_F4';
using {ZMFP_MRP_PRODUCT_SEASON_F4} from './external/ZMFP_MRP_PRODUCT_SEASON_F4';
using {ZMFP_MRP_WORKCENTER_F4} from './external/ZMFP_MRP_WORKCENTER_F4';
using {ZZ1_RFM_WRKCHARVAL_F4_CDS} from './external/ZZ1_RFM_WRKCHARVAL_F4_CDS';


// using {ZS_RFM_ATP_PLANNED_ORDERS} from './external/ZS_RFM_ATP_PLANNED_ORDERS';

type AtpPloItemType             : {
  id            : String(3);
  fsh_cplnd_ord : String(12);
  flag          : Boolean;
}

type AtpPloType                 : {
  id     : String;
  atpplo : array of AtpPloItemType;
}

type WorkCenterChangeActionType : {
  CombPlOrder : String;
  Operation   : String;
  Sequence    : String;
  WorkCenter  : String;
  PRICE_V     : String;
  PRICE_C     : String;
}

type BatchCustKeys              : {
  Material     : String;
  Gruppo_Merce : String;
  Plant        : String;
}

type BatchCustResult            : {
  Mandassign : Boolean;
  AssignRule : Boolean;
}

type FissazioneType             : {
  CplndOrd : String(12);
}

type AltLabType                 : {
  Operation            : String(4);
  WorkCenterInternalID : String(8);
  CombinedMasterOrder  : String(12);
  ProductionPlant      : String(4);
  Product              : String(40);
  AvailableQuantity    : Decimal(16, 3);
}

type AssegnaAutoType            : {
  Material                      : String(40);
  RequiredQuantity              : Decimal(14, 3);
  ProductionPlant               : String(4);
  CplndOrd                      : String(12);
  StorageLocation               : String(4);
  Batch                         : String(10);
  CrossPlantConfigurableProduct : String(40);
  BillOfMaterialItemNumber_2    : String(4);
  AvailableQuantity             : Decimal(16, 3);
}

type AssegnaAutoAggType         : {
  Material                      : String(40);
  RequiredQuantity              : Decimal(14, 3);
  ProductionPlant               : String(4);
  StorageLocation               : String(4);
  Batch                         : String(10);
  CrossPlantConfigurableProduct : String(40);
  BillOfMaterialItemNumber_2    : String(4);
  AvailableQuantity             : Decimal(16, 3);
  orderDetails                  : array of String(12);
}

service MainService {

  entity ZZ1_Plant                       as projection on ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_Plant;
  entity ZZ1_MFI_CR_TYPE_V               as projection on ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_MFI_CR_TYPE_V;
  // MASTER PLANNED ORDER
  entity ZZ1_MasterPlannedOrders         as projection on ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_MasterPlannedOrders;

  //ENTITY MATCH CODE FILTRI
  entity ZZ1_MATERIAL_F4                 as projection on ZZ1_MATERIAL_F4_CDS.ZZ1_MATERIAL_F4;
  /* entity ZZ1_CombPlannedOrder_F4         as projection on ZZ1_COMBPLANNEDORDER_F4_CDS.ZZ1_CombPlannedOrder_F4; */
  //CplndOrd
  entity ZC_RFM_COMBPLANNEDORD_F4        as projection on ZMFP_MRP_COMBINEDPLNDORDER_F4.ZC_RFM_COMBPLANNEDORD_F4;
  //productionPlant
  entity ZC_RFM_PRODUCTION_PLANT_F4      as projection on zmfp_mrp_plant_f4.ZC_RFM_PRODUCTION_PLANT_F4;
  //MRPController
  entity ZC_RFM_MRPCONTROLLER_F4         as projection on ZMFP_MRP_CONTROLLER_F4.ZC_RFM_MRPCONTROLLER_F4;
  //PlannedOrderType
  entity ZC_RFM_PLANNED_ORDER_TYPE_F4    as projection on ZMFP_MRP_PLANNEDORDER_TYPE_F4.ZC_RFM_PLANNED_ORDER_TYPE_F4;
  //ProductSeason
  entity ZC_RFM_PLO_PRODUCT_SEASON_F4    as projection on ZMFP_MRP_PRODUCT_SEASON_F4.ZC_RFM_PLO_PRODUCT_SEASON_F4;
  //WorkCenter
  entity ZC_RFM_WORKCENTER_F4            as projection on ZMFP_MRP_WORKCENTER_F4.ZC_RFM_WORKCENTER_F4;

  entity ZZ1_MFP_BATCHCUSTOM             as projection on ZZ1_MFP_BATCHCUSTOM_CDS.ZZ1_MFP_BATCHCUSTOM;

  entity ZZ1_RFM_WRKCHARVAL_F4           as projection on ZZ1_RFM_WRKCHARVAL_F4_CDS.ZZ1_RFM_WRKCHARVAL_F4;

  // COMPONENTS
  entity ZZ1_CombinPlannedOrdersCom      as
    projection on ZZ1_COMBPLNORDERSSTOCKAPI_CDS.ZZ1_CombPlnOrdersStockAPI {
      key CplndOrd,
      key CrossPlantConfigurableProduct,
      key Material,
      key Plant,
      key StorageLocation,
      key Batch,
      key BillOfMaterialItemNumber_2,
          RequiredQuantity,
          TotalAllocQty,
          AvailableQuantity,
          WithdrawnQuantity,
          BaseUnit,
          BillOfMaterialCategory,
          // BOMItem,
          BOMItemDescription,
          MatlCompRequirementDate,
          MRPController,
          MRPControllerName,
          PlantName,
          ProductCharacteristic1,
          ProductCharacteristic2,
          ProductCharacteristic3,
          ProductDescription,
          Operation_2,
          ProductGroup,
          // StockSegment,
          // RequirementSegment,
          null as CombPlanAllQty     : Decimal(13, 3), // String(20),
          null as TotalPlanAllQty    : Decimal(13, 3), // String(20),
          null as TotalProdAllQty    : Decimal(13, 3), //String(20), // rappresenta il totale di tutte le righe
          null as FinishedProductQty : Integer, //Decimal(13, 3), //String(20),
          null as chart_criticality  : Integer,
          null as chart_percent      : Integer,
          null as priority           : Integer,
          null as RequestFinished    : Integer, // String(20),

          null as IconActive         : String,
          null as flaghighlights     : String,
          to_ZZ1_CombPlnOrdersStock  : Composition of many ZZ1_CombPlnOrdersStock
                                         on  Material = $self.Material
                                         and Plant    = $self.Plant
                                         and CplndOrd = $self.CplndOrd
    };

  //clone entity componenti
  entity ZZ1_CombinPlannedOrdersComClone as
    projection on ZZ1_CombinPlannedOrdersCom {
      *,
      to_ZZ1_CombPlnOrdersStock : Composition of many ZZ1_CombPlnOrdersStockClone
                                    on  Material = $self.Material
                                    and Plant    = $self.Plant
                                    and CplndOrd = $self.CplndOrd

    };
  //clone entity stock
  /*  entity ZZ1_CombPlnOrdersStockClone as
     projection on ZZ1_CombPlnOrdersStock {
       *,
     }; */

  entity ZZ1_CombPlnOrdersStockClone     as
    projection on ZZ1_COMBPLNORDERSSTOCKAPI_CDS.ZZ1_CombPlnOrdersStock {
      *,
      null as StorageLocationStock : Decimal(13, 3), //String(20),
      null as CustomQty            : String(20),
      null as TotalProdAllQty      : Decimal(13, 3), // String(20), // ZZ1_I_ARUN_BDBSSUMQTY_CDS (PLANT, MATERIAL, STORAGELOCATION, BATCH)
      null as TotalPlanAllQty      : Decimal(13, 3), //String(20), // ZZ1_MFP_ASSIGNMENT fare la somma QTA_ASS accedendo per werks = PLANT, MATNR = MATERIAL, CHARG = BATCH,
      null as CombPlanAllQty       : Decimal(13, 3), //String(20), // ZZ1_MFP_ASSIGNMENT fare la somma QTA_ASS accedendo per FSH_MPLO_ORD = planned combined order werks = PLANT, MATNR = MATERIAL, CHARG = BATCH,
      null as AvaibilityQty        : Decimal(13, 3), // String(20), // REQUIREDQUANTITY - TotalProdAllQty - CombPlanAllQty
      null as TotalInDelQty        : Decimal(13, 3), // String(20), // somma ZZ1_I_SUMQTYDELIVERY_T.TOTDELIVERYQTY accedendo con MATERIAL, STORLOC, BATCH
      null as chart_percent        : Integer,
      null as chart_criticality    : Integer,
      null as StockSegmentCode     : String,
      null as Scorta               : String(1)
    };


  // CAPACITY
  entity ZZ1_PLOCAPACITYCORD             as projection on ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_PLOCAPACITYCORD;

  @cds.redirection.target
  entity ZZ1_PLOCAPACITYCORD_TEXT        as projection on ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_PLOCAPACITYCORD;

  entity ZZ1_PlannedOrdersCapacity       as projection on ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_PlannedOrdersCapacity;

  entity ZZ1_ALT_LAB                     as projection on ZZ1_ALT_LAB_CDS.ZZ1_ALT_LAB;

  // COMBINED PLANNED ORDER
  @cds.query.limit: {
    default: 1000,
    max    : 1000
  }
  entity ZZ1_CombinedPlnOrdersAPI        as
    projection on ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_CombinedPlnOrdersAPI {
      *,
      // cast(PlannedTotalQtyInBaseUnit as Integer) as ZPlannedTotalQtyInBaseUnit,
      // cast(PlndOrderCommittedQty as Integer) as ZPlndOrderCommittedQty,
      // null as PlannedTotalQtyInBaseUnit : Integer,
      // null as PlndOrderCommittedQty : Integer,
      null as committed_criticality  : Integer,
      null as committed_percent      : Integer,
      null as confirmed_criticality  : Integer,
      null as confirmed_percent      : Integer,
      null as zsed_priority          : String(15),
      null as PlannedOrderBOMIsFixed : Boolean,
      // master planned orders
      to_ZZ1_MasterPlannedOrders     : Composition of many ZZ1_MasterPlannedOrders
                                         on CplndOrd = $self.CplndOrd,
      // componenti
      to_CombinPlannedOrdersCom      : Composition of many ZZ1_CombinPlannedOrdersCom
                                         on  CplndOrd                      = $self.CplndOrd
                                         and CrossPlantConfigurableProduct = $self.to_CombinPlannedOrdersCom.CrossPlantConfigurableProduct,
      //to_ZZ1_CombinPlannedOrdersComClone : Composition of many ZZ1_CombinPlannedOrdersCom
      //on  CplndOrd                      = $self.CplndOrd,
      // null as combinplannedorderscomcount,
      // capacità
      to_ZZ1_PLOCAPACITYCORD         : Composition of many ZZ1_PLOCAPACITYCORD
                                         on CplndOrd = $self.CplndOrd,
      // null as plocapacitycordcount

      to_ZZ1_PLOCAPACITYCORD_TEXT    : Composition of one ZZ1_PLOCAPACITYCORD_TEXT
                                         on CplndOrd = $self.CplndOrd,

      to_ZZ1_Plant                   : Composition of many ZZ1_Plant
                                         on MRPPlant = $self.MRPPlant,

      to_ZZ1_PlannedOrdersCapacity   : Composition of many ZZ1_PlannedOrdersCapacity
                                         on CplndOrd = $self.CplndOrd,

      to_ZZ1_MFI_CR_TYPE_PLA         : Composition of one ZZ1_MFI_CR_TYPE_V
                                         on  MRPController = $self.MRPController
                                         and MRPPlant      = $self.MRPPlant,
      to_ZZ1_I_PLANNEDORDER          : Composition of many ZZ1_I_PLANNEDORDER
                                         on CplndOrd = $self.CplndOrd
    };

  // add count of master
  // Combined Planned Order - End
  entity ZZ1_I_PLANNEDORDER              as
    projection on ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_I_PLANNEDORDER {
      *
    };

  // Master Planned Order - Start
  entity ZZ1_MasterPlannedOrderAPI       as projection on ZZ1_MASTERPLANNEDORDERAPI_CDS.ZZ1_MasterPlannedOrderAPI;
  // Master Planned Order - End
  // Planned Orders - Start
  entity ZZ1_PlannedOrdersAPI            as projection on ZZ1_PLANNEDORDERSAPI_CDS.ZZ1_PlannedOrdersAPI;

  // Stock - Start
  @cds.redirection.target
  entity ZZ1_CombPlnOrdersStock          as
    projection on ZZ1_COMBPLNORDERSSTOCKAPI_CDS.ZZ1_CombPlnOrdersStock {
      *,
      null as StorageLocationStock : Decimal(13, 3), //String(20),
      null as CustomQty            : String(20),
      null as TotalProdAllQty      : Decimal(13, 3), // String(20), // ZZ1_I_ARUN_BDBSSUMQTY_CDS (PLANT, MATERIAL, STORAGELOCATION, BATCH)
      null as TotalPlanAllQty      : Decimal(13, 3), //String(20), // ZZ1_MFP_ASSIGNMENT fare la somma QTA_ASS accedendo per werks = PLANT, MATNR = MATERIAL, CHARG = BATCH,
      null as CombPlanAllQty       : Decimal(13, 3), //String(20), // ZZ1_MFP_ASSIGNMENT fare la somma QTA_ASS accedendo per FSH_MPLO_ORD = planned combined order werks = PLANT, MATNR = MATERIAL, CHARG = BATCH,
      null as AvaibilityQty        : Decimal(13, 3), // String(20), // REQUIREDQUANTITY - TotalProdAllQty - CombPlanAllQty
      null as TotalInDelQty        : Decimal(13, 3), // String(20), // somma ZZ1_I_SUMQTYDELIVERY_T.TOTDELIVERYQTY accedendo con MATERIAL, STORLOC, BATCH
      null as chart_percent        : Integer,
      null as chart_criticality    : Integer,
      null as StockSegmentCode     : String,
      null as Scorta               : String(1)
    };

  entity ZI_RFM_ATP_RULES                as projection on ZI_RFM_ATP_RULES_CDS.ZI_RFM_ATP_RULES;

  entity ZZ1_MFP_WRKC_UPDATE             as projection on ZZ1_MFP_WRKC_UPDATE_CDS.ZZ1_MFP_WRKC_UPDATE;

  entity ZZ1_CombPlnOrdersStockAPI       as
    projection on ZZ1_COMBPLNORDERSSTOCKAPI_CDS.ZZ1_CombPlnOrdersStockAPI {
      *
    };

  @sap.creatable: 'true'
  @sap.deletable: 'true'
  @sap.updatable: 'true'
  entity ZZ1_MFP_ASSIGNMENT              as
    projection on ZZ1_MFP_ASSIGNMENT_CDS.ZZ1_MFP_ASSIGNMENT {
      *,
      // null as QTY_CALCOLATA : String(20),
      null as AvaibilityQty   : String(40),
      null as BatchBySupplier : String(40),
      null as SpecialStock    : String(1)
    };

  @sap.creatable: 'true'
  @sap.deletable: 'true'
  entity ConvertPLO                      as
    projection on ZMPF_ASS_BATCH_SRV.ConvertPLO {
      *,
      null as PlannedTotalQtyInBaseUnit     : String(40),
      null as CrossPlantConfigurableProduct : String(40)
    };

  // entity atp_item                   as projection on ZS_RFM_ATP_PLANNED_ORDERS.atp_item;
  action atpPlo(Payload: AtpPloType)                           returns Boolean;

  action ChangeWorkCenter(Payload: WorkCenterChangeActionType) returns String;

  action ReadBatchCust(Payload: BatchCustKeys)                 returns ZZ1_MFP_BATCHCUSTOM; //BatchCustResult

  action AltLabAction(Payload: AltLabType)                     returns array of ZZ1_ALT_LAB;

  action Fissazione(Payload: FissazioneType)                   returns String;

  action AssegnaAuto(Payload: AssegnaAutoType)                 returns String;

  action AssegnaAutoAgg(Payload: AssegnaAutoAggType)           returns String;

//action GetComponentsForOrders(orders: array of String)       returns many ZZ1_CombinPlannedOrdersCom;
}
