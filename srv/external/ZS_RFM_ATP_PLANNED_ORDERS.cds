/* checksum : 31543fb9d410ab9b9a2d4eb7ca36d7df */
@cds.external : true
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
service ZS_RFM_ATP_PLANNED_ORDERS {};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'CDS for ATP of Planned Orders'
@Capabilities.NavigationRestrictions.RestrictedProperties : [
  {
    NavigationProperty: atpplo,
    InsertRestrictions: { Insertable: true }
  }
]
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.ReadRestrictions.Readable : false
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity ZS_RFM_ATP_PLANNED_ORDERS.atp_header {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Campo (3 bytes)'
  key id : String(3) not null;
  @Common.Composition : true
  atpplo : Composition of many ZS_RFM_ATP_PLANNED_ORDERS.atp_item {  };
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Custom entity per ATP Planned Orders'
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.ReadRestrictions.Readable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity ZS_RFM_ATP_PLANNED_ORDERS.atp_item {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Campo (3 bytes)'
  key id : String(3) not null;
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : 'Campo di testo di 12 caratteri'
  key fsh_cplnd_ord : String(12) not null;
  @Common.Label : 'Variabile booleana (X=true, -=false, space=unknown)'
  flag : Boolean not null;
  parent : Association to one ZS_RFM_ATP_PLANNED_ORDERS.atp_header {  };
};
