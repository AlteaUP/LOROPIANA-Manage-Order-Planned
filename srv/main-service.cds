using {ZZ1_COMBINEDPLNORDERSAPI_CDS} from './external/ZZ1_COMBINEDPLNORDERSAPI_CDS';
using {ZZ1_MASTERPLANNEDORDERAPI_CDS} from './external/ZZ1_MASTERPLANNEDORDERAPI_CDS';
using {ZZ1_PLANNEDORDERSAPI_CDS} from './external/ZZ1_PLANNEDORDERSAPI_CDS';

service MainService {
  // Combined Planned Order - Start
  // Associations
  entity ZZ1_MasterPlannedOrders    as projection on ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_MasterPlannedOrders;
  entity ZZ1_CombinPlannedOrdersCom as projection on ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_CombinPlannedOrdersCom;
  entity ZZ1_PLOCAPACITYCORD        as projection on ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_PLOCAPACITYCORD;

  // Entity
  entity ZZ1_CombinedPlnOrdersAPI   as
    projection on ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_CombinedPlnOrdersAPI {
      *,
      to_ZZ1_MasterPlannedOrders : Composition of many ZZ1_MasterPlannedOrders on CplndOrd = $self.CplndOrd,
      to_CombinPlannedOrdersCom  : Composition of many ZZ1_CombinPlannedOrdersCom on CplndOrd = $self.CplndOrd,
      to_PLOCAPACITYCORD         : Composition of many ZZ1_PLOCAPACITYCORD on CplndOrd = $self.CplndOrd,
    };
  // Combined Planned Order - End

  // Master Planned Order - Start
  entity ZZ1_MasterPlannedOrderAPI  as projection on ZZ1_MASTERPLANNEDORDERAPI_CDS.ZZ1_MasterPlannedOrderAPI;
  // Master Planned Order - End
  // Planned Orders - Start
  entity ZZ1_PlannedOrdersAPI       as projection on ZZ1_PLANNEDORDERSAPI_CDS.ZZ1_PlannedOrdersAPI;
// Planned Orders - End
}
