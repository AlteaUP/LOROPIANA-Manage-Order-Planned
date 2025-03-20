using {
  planned_order.C_RFM_CmbndMfgOrdOpComponents as C_RFM_CmbndMfgOrdOpComponents,
  planned_order.C_RFM_ManageCombinedMfgOrder as C_RFM_ManageCombinedMfgOrder,
  planned_order.C_RFM_ManageMasterMfgOrder as C_RFM_ManageMasterMfgOrder,
  planned_order.C_RFM_ManageMfgOrder as C_RFM_ManageMfgOrder,
  planned_order.C_RFM_MasterMfgOrdOpComponents as C_RFM_MasterMfgOrdOpComponents,
  planned_order.C_RFM_MasterMfgOrdOpSchedule as C_RFM_MasterMfgOrdOpSchedule,
  planned_order.C_RSHSchedulingTypeVH as C_RSHSchedulingTypeVH,
// SAP__Currencies
// SAP__UnitsOfMeasure
// SAP__MyDocumentDescriptions
// SAP__FormatSet
// SAP__PDFStandardSet
// SAP__TableColumnsSet
// SAP__CoverPageSet
// SAP__SignatureSet
// SAP__HierarchySet
// SAP__PDFHeaderSet
// SAP__PDFFooterSet
// SAP__ValueHelpSet
} from '../srv/external/planned-order';

@path: '/api'
service PlannedOrderService {

  @readonly
  entity ZC_RFM_CmbndMfgOrdOpComponents  as projection on C_RFM_CmbndMfgOrdOpComponents;

  @readonly
  entity ZC_RFM_ManageCombinedMfgOrder   as projection on C_RFM_ManageCombinedMfgOrder;

  @readonly
  entity ZC_RFM_ManageMasterMfgOrder     as projection on C_RFM_ManageMasterMfgOrder;

  @readonly
  entity ZC_RFM_ManageMfgOrder           as projection on C_RFM_ManageMfgOrder;

  @readonly
  entity ZC_RFM_MasterMfgOrdOpComponents as projection on C_RFM_MasterMfgOrdOpComponents;

  @readonly
  entity ZC_RFM_MasterMfgOrdOpSchedule   as projection on C_RFM_MasterMfgOrdOpSchedule;

  @readonly
  entity ZC_RSHSchedulingTypeVH          as projection on C_RSHSchedulingTypeVH;
}
