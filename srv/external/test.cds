/* checksum : 735b09497a72336294ed3caba42cc41e */
@cds.external : true
@CodeList.UnitsOfMeasure : {
  Url: '../../../../default/iwbep/common/0001/$metadata',
  CollectionPath: 'UnitsOfMeasure'
}
@Aggregation.ApplySupported : {
  Transformations: [ 'aggregate', 'groupby', 'filter' ],
  Rollup: #None
}
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
@PDF.Features : {
  DocumentDescriptionReference: '../../../../default/iwbep/common/0001/$metadata',
  DocumentDescriptionCollection: 'MyDocumentDescriptions',
  ArchiveFormat: true,
  Border: true,
  CoverPage: true,
  FitToPage: true,
  FontName: true,
  FontSize: true,
  Margin: true,
  Padding: true,
  Signature: true,
  HeaderFooter: true,
  ResultSizeDefault: 20000,
  ResultSizeMaximum: 20000
}
@Capabilities.KeyAsSegmentSupported : true
@Capabilities.AsynchronousRequestsSupported : true
service test {};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Combined Order Component List'
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : false
@Capabilities.UpdateRestrictions.Updatable : false
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [
  {
    Property: ConfirmedAvailableQuantity,
    AllowedExpressions: 'MultiValue'
  }
]
entity test.ZTEST_COMBORDERCOMPLIST {
  @Common.IsUpperCase : true
  @Common.Label : 'Master Plnd Ord.'
  @Common.Heading : 'Master Planned Order'
  @Common.QuickInfo : 'Master Planned Order Number'
  key MasterPlannedOrder : String(12) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Planned Order'
  @Common.Heading : 'Plnd Ord.'
  PlannedOrder : String(10) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Material'
  @Common.QuickInfo : 'Material Number'
  Material : String(18) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Plant'
  @Common.Heading : 'Plnt'
  Plant : String(4) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Batch'
  @Common.QuickInfo : 'Batch Number'
  Batch : String(10) not null;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  BaseUnit : String(3) not null;
  @Measures.Unit : BaseUnit
  @Common.Label : 'Available Quantity'
  ConfirmedAvailableQuantity : Decimal(15, 3) not null;
};

