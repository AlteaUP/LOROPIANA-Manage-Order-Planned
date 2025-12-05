/* checksum : 9c172e64765b0d253be20bf510fa3afa */
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
service ZMFP_MRP_PRODUCT_SEASON_F4 {};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'CDS for Planned Orders Product Season Year Matchcode'
@Capabilities.SearchRestrictions.Searchable : true
@Capabilities.SearchRestrictions.UnsupportedExpressions : #phrase
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.UpdateRestrictions.Updatable : false
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity ZMFP_MRP_PRODUCT_SEASON_F4.ZC_RFM_PLO_PRODUCT_SEASON_F4 {
  @Common.IsUpperCase : true
  @Common.Label : 'Planned Order'
  @Common.Heading : 'Plnd Ord.'
  key PlannedOrder : String(10) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Material'
  @Common.QuickInfo : 'Planning material'
  Material : String(18) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Product'
  @Common.QuickInfo : 'Product Number'
  Product : String(18) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Planning Plant'
  @Common.Heading : 'PlPl'
  MRPPlant : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'MRP Area'
  MRPArea : String(10) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'MRP Controller'
  MRPController : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Production Plant'
  @Common.Heading : 'PrPl.'
  ProductionPlant : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Season Year'
  ProductSeasonYear : String(4) not null;
  @Common.Text : ProductSeason
  @Common.IsUpperCase : true
  @Common.ValueListReferences : [
    '../../../../srvd_f4/sap/i_plannedorder/0001;ps=''srvd-zmfp_mrp_product_season_f4-0001'';va=''com.sap.gateway.srvd.zmfp_mrp_product_season_f4.v0001.et-zc_rfm_plo_product_season_f4.productseason'';o=LOCAL/$metadata'
  ]
  @Common.Label : 'Season'
  ProductSeason : String(10) not null;
};

