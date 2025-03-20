using {
  planned_order.C_RFM_ManageCombinedPlndOrder,
  planned_order.C_RFM_ManageMasterPlndOrder,
  planned_order.C_RFM_ManagePlndOrder,
  planned_order.C_RFM_MngCombinedPlndOrdComp,
  planned_order.C_RFM_MngMasterPlndOrdComp,
// planned_order.I_MfgOrderTypeVH,
// planned_order.SAP__Currencies,
// planned_order.SAP__UnitsOfMeasure,
// planned_order.SAP__MyDocumentDescriptions,
// planned_order.SAP__FormatSet,
// planned_order.SAP__PDFStandardSet,
// planned_order.SAP__TableColumnsSet,
// planned_order.SAP__CoverPageSet,
// planned_order.SAP__SignatureSet,
// planned_order.SAP__HierarchySet,
// planned_order.SAP__PDFHeaderSet,
// planned_order.SAP__PDFFooterSet,
// planned_order.SAP__ValueHelpSet,
} from '../srv/external/planned-order';

@path: '/api'
service PlannedOrderService {

  @readonly
  entity ZC_RFM_ManageCombinedPlndOrder as projection on C_RFM_ManageCombinedPlndOrder;

  @readonly
  entity ZC_RFM_ManageMasterPlndOrder   as projection on C_RFM_ManageMasterPlndOrder;

  @readonly
  entity ZC_RFM_ManagePlndOrder         as projection on C_RFM_ManagePlndOrder;

  @readonly
  entity ZC_RFM_MngCombinedPlndOrdComp  as projection on C_RFM_MngCombinedPlndOrdComp;

  @readonly
  entity ZC_RFM_MngMasterPlndOrdComp    as projection on C_RFM_MngMasterPlndOrdComp;
}
