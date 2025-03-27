using {ZZ1_COMBINEDPLNORDERSAPI_CDS} from './external/ZZ1_COMBINEDPLNORDERSAPI_CDS';
using {ZZ1_MASTERPLANNEDORDERAPI_CDS} from './external/ZZ1_MASTERPLANNEDORDERAPI_CDS';
using {ZZ1_PLANNEDORDERSAPI_CDS} from './external/ZZ1_PLANNEDORDERSAPI_CDS';


service MainService {
  entity ZZ1_MasterPlannedOrders   as projection on ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_MasterPlannedOrders;

  entity ZZ1_CombinedPlnOrdersAPI  as
    projection on ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_CombinedPlnOrdersAPI {
      *,
      to_ZZ1_MasterPlannedOrders : Composition of many ZZ1_MasterPlannedOrders on CplndOrd = $self.CplndOrd,
    // to_ZZ1_CombinPlannedOrdersCom : Composition of many ZZ1_CombinedPlnOrdersAPI on CplndOrd = $self.CplndOrd,
    // to_ZZ1_PLOCAPACITYCORD        : Composition of many ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_PLOCAPACITYCORDndOrd on CplndOrd = $self.CplndOrd,

    // to_CombinPlannedOrdersCom     : Composition of many ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_CombinedPlnOrdersAPI on CplndOrd = $self.CplndOrd,
    // to_MasterPlannedOrders        : Composition of many ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_CombinedPlnOrdersAPI on CplndOrd = $self.CplndOrd,
    // to_PLOCAPACITYCORD            : Composition of many ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_CombinedPlnOrdersAPI on CplndOrd = $self.CplndOrd,
    };


  entity ZZ1_MasterPlannedOrderAPI as projection on ZZ1_MASTERPLANNEDORDERAPI_CDS.ZZ1_MasterPlannedOrderAPI;
  entity ZZ1_PlannedOrdersAPI      as projection on ZZ1_PLANNEDORDERSAPI_CDS.ZZ1_PlannedOrdersAPI;
}
