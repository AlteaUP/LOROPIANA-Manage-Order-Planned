/* checksum : 213b0533bc802f652aa177a10379e06c */
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
service ZMFP_MRP_CONTROLLER_F4 {};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'CDS for MRP Controller Matchcode'
@Capabilities.SearchRestrictions.Searchable : true
@Capabilities.SearchRestrictions.UnsupportedExpressions : #phrase
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.UpdateRestrictions.Updatable : false
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity ZMFP_MRP_CONTROLLER_F4.ZC_RFM_MRPCONTROLLER_F4 {
  @Common.IsUpperCase : true
  @Common.Label : 'Plant'
  @Common.Heading : 'Plnt'
  key Plant : String(4) not null;
  @Common.Text : MRPControllerName
  @Common.IsUpperCase : true
  @Common.Label : 'MRP Controller'
  key MRPController : String(3) not null;
  @Common.Label : 'MRP Controller Name'
  MRPControllerName : String(18) not null;
};

