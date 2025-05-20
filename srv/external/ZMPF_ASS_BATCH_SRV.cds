/* checksum : c98b0e8ce69129700e7a113a359b3ce4 */
@cds.external : true
@CodeList.UnitsOfMeasure : {
  Url: '../../../../default/iwbep/common/0001/$metadata',
  CollectionPath: 'UnitsOfMeasure'
}
@Aggregation.ApplySupported : { Transformations: [ 'aggregate', 'groupby', 'filter' ], Rollup: #None }
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
service ZMPF_ASS_BATCH_SRV {};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Entity assegnazione da cruscotto'
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.ReadRestrictions.Readable : false
@Capabilities.FilterRestrictions.FilterExpressionRestrictions : [ { Property: AUART, AllowedExpressions: 'MultiValue' } ]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity ZMPF_ASS_BATCH_SRV.ConvertPLO {
  @Common.Label : 'Combined Order'
  @Common.IsUpperCase : true
  @Common.QuickInfo : 'Character Field of Length 12'
  key FSH_CPLND_ORD : String(12) not null;
  @Common.Label : 'Tipo Ordine'
  @Common.IsUpperCase : true
  @Common.Heading : 'SaTy'
  @Common.QuickInfo : 'Sales Document Type'
  AUART : String(4) not null;
  @Common.Label : 'Quantità totale ordine'
  @Common.IsUpperCase : true
  @Common.Heading : 'Char20'
  @Common.QuickInfo : 'Char 20'
  TOT_QTY : String(20) not null;
  @Common.IsUnit : true
  @Common.Label : 'Base Unit of Measure'
  @Common.Heading : 'BUn'
  UNIT : String(3) not null;
};

