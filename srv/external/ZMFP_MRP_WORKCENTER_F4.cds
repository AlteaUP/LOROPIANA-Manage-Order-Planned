/* checksum : e7a3aa3ce98805c5466da6aeca75ce9a */
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
service ZMFP_MRP_WORKCENTER_F4 {};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'CDS for Work Centers Matchcode'
@Capabilities.SearchRestrictions.Searchable : true
@Capabilities.SearchRestrictions.UnsupportedExpressions : #phrase
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.UpdateRestrictions.Updatable : false
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity ZMFP_MRP_WORKCENTER_F4.ZC_RFM_WORKCENTER_F4 {
  @Common.Text : WorkCenterText
  @Common.IsDigitSequence : true
  @Common.Label : 'Object ID'
  @Common.Heading : 'ID'
  @Common.QuickInfo : 'Object ID of the resource'
  key WorkCenterInternalID : String(8) not null;
  @Common.Label : 'Language Key'
  @Common.Heading : 'Language'
  key Language : String(2) not null;
  @Common.Label : 'Work Center Text'
  @Common.Heading : 'Text'
  WorkCenterText : String(40) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Plant'
  @Common.Heading : 'Plnt'
  Plant : String(4) not null;
};

