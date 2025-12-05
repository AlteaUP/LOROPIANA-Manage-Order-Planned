/* checksum : 992e95ebd3ad36effe4894a7548ecca8 */
@cds.external : true
@Aggregation.ApplySupported.Transformations : [ 'aggregate', 'groupby', 'filter' ]
@Aggregation.ApplySupported.Rollup : #None
@Common.ApplyMultiUnitBehaviorForSortingAndFiltering : true
@Capabilities.FilterFunctions : [
  'eq',
  'ne',
  'gt',
  'ge',
  'lt',
  'le',
  'and',
  'or',
  'contains',
  'startswith',
  'endswith',
  'any',
  'all'
]
@Capabilities.SupportedFormats : [ 'application/json', 'application/pdf' ]
@PDF.Features.DocumentDescriptionReference : '../../../../default/iwbep/common/0001/$metadata'
@PDF.Features.DocumentDescriptionCollection : 'MyDocumentDescriptions'
@PDF.Features.ArchiveFormat : true
@PDF.Features.Border : true
@PDF.Features.CoverPage : true
@PDF.Features.FitToPage : true
@PDF.Features.FontName : true
@PDF.Features.FontSize : true
@PDF.Features.Margin : true
@PDF.Features.Padding : true
@PDF.Features.Signature : true
@PDF.Features.HeaderFooter : true
@PDF.Features.ResultSizeDefault : 20000
@PDF.Features.ResultSizeMaximum : 20000
@Capabilities.KeyAsSegmentSupported : true
@Capabilities.AsynchronousRequestsSupported : true
service ZMFP_MRP_PLANNEDORDER_TYPE_F4 {};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'CDS for Planned Orders Type Matchcode'
@Capabilities.SearchRestrictions.Searchable : true
@Capabilities.SearchRestrictions.UnsupportedExpressions : #phrase
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.UpdateRestrictions.Updatable : false
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity ZMFP_MRP_PLANNEDORDER_TYPE_F4.ZC_RFM_PLANNED_ORDER_TYPE_F4 {
  @Common.Text : PlannedOrderType
  @Common.IsUpperCase : true
  @Common.ValueListReferences : [
    '../../../../srvd_f4/sap/i_plannedordertype/0001;ps=''srvd-zmfp_mrp_plannedorder_type_f4-0001'';va=''com.sap.gateway.srvd.zmfp_mrp_plannedorder_type_f4.v0001.et-zc_rfm_planned_order_type_f4.plannedordertype'';o=LOCAL/$metadata'
  ]
  @Common.ValueListWithFixedValues : true
  @Common.Label : 'Planned Order Type'
  @Common.Heading : 'Procurement proposal type'
  key PlannedOrderType : String(4) not null;
};

