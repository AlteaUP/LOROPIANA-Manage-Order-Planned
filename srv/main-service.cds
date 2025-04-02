using {ZZ1_COMBINEDPLNORDERSAPI_CDS} from './external/ZZ1_COMBINEDPLNORDERSAPI_CDS';
using {ZZ1_MASTERPLANNEDORDERAPI_CDS} from './external/ZZ1_MASTERPLANNEDORDERAPI_CDS';
using {ZZ1_PLANNEDORDERSAPI_CDS} from './external/ZZ1_PLANNEDORDERSAPI_CDS';
using {ZZ1_COMBPLNORDERSSTOCKAPI_CDS} from './external/ZZ1_COMBPLNORDERSSTOCKAPI_CDS';

service MainService {

  // MASTER PLANNED ORDER
  entity ZZ1_MasterPlannedOrders   as projection on ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_MasterPlannedOrders;

  // COMPONENTS
  entity ZZ1_CombinPlannedOrdersCom {
    key CplndOrd        : String(12) not null;
    key Material        : String(40) not null;
    key Plant           : String(4) not null;
    key StorageLocation : String(4) not null;

        to_Stock        : Composition of many ZZ1_CombPlnOrdersStock
                            on  Material = $self.Material
                            and Plant    = $self.Plant
                            and CplndOrd = $self.CplndOrd
  };


  // CAPACITY
  entity ZZ1_PLOCAPACITYCORD       as projection on ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_PLOCAPACITYCORD;

  // COMBINED PLANNED ORDER
  entity ZZ1_CombinedPlnOrdersAPI  as
    projection on ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_CombinedPlnOrdersAPI {
      *,
      // master planned orders
      to_ZZ1_MasterPlannedOrders : Composition of many ZZ1_MasterPlannedOrders
                                     on CplndOrd = $self.CplndOrd,
      // componenti
      to_CombinPlannedOrdersCom  : Composition of many ZZ1_CombinPlannedOrdersCom
                                     on CplndOrd = $self.CplndOrd,
      // capacità
      to_PLOCAPACITYCORD         : Composition of many ZZ1_PLOCAPACITYCORD
                                     on CplndOrd = $self.CplndOrd,
                                   };
  // Combined Planned Order - End

  // Master Planned Order - Start
  entity ZZ1_MasterPlannedOrderAPI as projection on ZZ1_MASTERPLANNEDORDERAPI_CDS.ZZ1_MasterPlannedOrderAPI;
  // Master Planned Order - End
  // Planned Orders - Start
  entity ZZ1_PlannedOrdersAPI      as projection on ZZ1_PLANNEDORDERSAPI_CDS.ZZ1_PlannedOrdersAPI;
  // Stock - Start
  entity ZZ1_CombPlnOrdersStock    as projection on ZZ1_COMBPLNORDERSSTOCKAPI_CDS.ZZ1_CombPlnOrdersStock;
  entity ZZ1_CombPlnOrdersStockAPI as projection on ZZ1_COMBPLNORDERSSTOCKAPI_CDS.ZZ1_CombPlnOrdersStockAPI;
// Stock - End

}
