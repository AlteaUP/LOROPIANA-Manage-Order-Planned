using {ZZ1_COMBINEDPLNORDERSAPI_CDS} from './external/ZZ1_COMBINEDPLNORDERSAPI_CDS';
using {ZZ1_MASTERPLANNEDORDERAPI_CDS} from './external/ZZ1_MASTERPLANNEDORDERAPI_CDS';
using {ZZ1_PLANNEDORDERSAPI_CDS} from './external/ZZ1_PLANNEDORDERSAPI_CDS';


service MainService {
  @readonly
  entity ZZ1_CombinedPlnOrdersAPI  as projection on ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_CombinedPlnOrdersAPI;

  @readonly
  entity ZZ1_MasterPlannedOrderAPI as projection on ZZ1_MASTERPLANNEDORDERAPI_CDS.ZZ1_MasterPlannedOrderAPI;

  @readonly
  entity ZZ1_PlannedOrdersAPI      as projection on ZZ1_PLANNEDORDERSAPI_CDS.ZZ1_PlannedOrdersAPI;
}
