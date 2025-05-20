// using {Records} from './types/types';
using {ZZ1_COMBINEDPLNORDERSAPI_CDS} from './external/ZZ1_COMBINEDPLNORDERSAPI_CDS';
using {ZZ1_MASTERPLANNEDORDERAPI_CDS} from './external/ZZ1_MASTERPLANNEDORDERAPI_CDS';
using {ZZ1_PLANNEDORDERSAPI_CDS} from './external/ZZ1_PLANNEDORDERSAPI_CDS';
using {ZZ1_COMBPLNORDERSSTOCKAPI_CDS} from './external/ZZ1_COMBPLNORDERSSTOCKAPI_CDS';
using {ZZ1_MFP_ASSIGNMENT_CDS} from './external/ZZ1_MFP_ASSIGNMENT_CDS';
using {ZMPF_ASS_BATCH_SRV} from './external/ZMPF_ASS_BATCH_SRV';
// using {ZS_RFM_ATP_PLANNED_ORDERS} from './external/ZS_RFM_ATP_PLANNED_ORDERS';

type AtpPloItemType : {
  id            : String(3);
  fsh_cplnd_ord : String(12);
  flag          : Boolean;
}

type AtpPloType     : {
  id     : String;
  atpplo : array of AtpPloItemType;
}

service MainService {

  entity ZZ1_Plant                  as projection on ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_Plant;
  entity ZZ1_MFI_CR_TYPE_V          as projection on ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_MFI_CR_TYPE_V;
  // MASTER PLANNED ORDER
  entity ZZ1_MasterPlannedOrders    as projection on ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_MasterPlannedOrders;

  // COMPONENTS
  entity ZZ1_CombinPlannedOrdersCom as
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
          null as CombPlanAllQty     : Decimal(13, 3), // String(20),
          null as TotalPlanAllQty    : Decimal(13, 3), // String(20),
          null as TotalProdAllQty    : Decimal(13, 3), //String(20), // rappresenta il totale di tutte le righe
          null as FinishedProductQty : Integer, //Decimal(13, 3), //String(20),
          null as chart_criticality  : String(20),
          null as chart_percent      : Integer,
          null as RequestFinished    : Integer, // String(20),
          to_ZZ1_CombPlnOrdersStock  : Composition of many ZZ1_CombPlnOrdersStock
                                         on  Material = $self.Material
                                         and Plant    = $self.Plant
                                         and CplndOrd = $self.CplndOrd
      };


  // CAPACITY
  entity ZZ1_PLOCAPACITYCORD        as projection on ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_PLOCAPACITYCORD;

  @cds.redirection.target
  entity ZZ1_PLOCAPACITYCORD_TEXT   as projection on ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_PLOCAPACITYCORD;


  // COMBINED PLANNED ORDER
  entity ZZ1_CombinedPlnOrdersAPI   as
    projection on ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_CombinedPlnOrdersAPI {
      *,
      // cast(PlannedTotalQtyInBaseUnit as Integer) as ZPlannedTotalQtyInBaseUnit,
      // cast(PlndOrderCommittedQty as Integer) as ZPlndOrderCommittedQty,
      // null as PlannedTotalQtyInBaseUnit : Integer,
      // null as PlndOrderCommittedQty : Integer,
      null as committed_criticality : String(20),
      null as committed_percent     : Integer,
      // master planned orders
      to_ZZ1_MasterPlannedOrders    : Composition of many ZZ1_MasterPlannedOrders
                                        on CplndOrd = $self.CplndOrd,
      // componenti
      to_CombinPlannedOrdersCom     : Composition of many ZZ1_CombinPlannedOrdersCom
                                        on CplndOrd = $self.CplndOrd,
      // null as combinplannedorderscomcount,
      // capacità
      to_ZZ1_PLOCAPACITYCORD        : Composition of many ZZ1_PLOCAPACITYCORD
                                        on CplndOrd = $self.CplndOrd,
      // null as plocapacitycordcount

      to_ZZ1_PLOCAPACITYCORD_TEXT   : Composition of one ZZ1_PLOCAPACITYCORD_TEXT
                                        on CplndOrd = $self.CplndOrd,

      to_ZZ1_Plant                  : Composition of many ZZ1_Plant
                                        on MRPPlant = $self.MRPPlant,

      to_ZZ1_MFI_CR_TYPE_PLA        : Composition of one ZZ1_MFI_CR_TYPE_V
                                        on to_ZZ1_MFI_CR_TYPE_PLA.Code = $self.ZZ1_MFI_CR_TYPE_PLA,
                                      };

  // add count of master
  // Combined Planned Order - End

  // Master Planned Order - Start
  entity ZZ1_MasterPlannedOrderAPI  as projection on ZZ1_MASTERPLANNEDORDERAPI_CDS.ZZ1_MasterPlannedOrderAPI;
  // Master Planned Order - End
  // Planned Orders - Start
  entity ZZ1_PlannedOrdersAPI       as projection on ZZ1_PLANNEDORDERSAPI_CDS.ZZ1_PlannedOrdersAPI;

  // Stock - Start
  entity ZZ1_CombPlnOrdersStock     as
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
      null as chart_criticality    : Integer
    };

  entity ZZ1_CombPlnOrdersStockAPI  as
    projection on ZZ1_COMBPLNORDERSSTOCKAPI_CDS.ZZ1_CombPlnOrdersStockAPI {
      *
    };

  @sap.creatable: 'true'
  @sap.deletable: 'true'
  @sap.updatable: 'true'
  entity ZZ1_MFP_ASSIGNMENT         as
    projection on ZZ1_MFP_ASSIGNMENT_CDS.ZZ1_MFP_ASSIGNMENT {
      *,
      // null as QTY_CALCOLATA : String(20),
      null as AvaibilityQty : String(40)
    };

  @sap.creatable: 'true'
  @sap.deletable: 'true'
  entity ConvertPLO                 as
    projection on ZMPF_ASS_BATCH_SRV.ConvertPLO {
      *,
      null as PlannedTotalQtyInBaseUnit     : String(40),
      null as CrossPlantConfigurableProduct : String(40)
    };

  // entity atp_item                   as projection on ZS_RFM_ATP_PLANNED_ORDERS.atp_item;
  action atpPlo(Payload : AtpPloType) returns Boolean;
}
