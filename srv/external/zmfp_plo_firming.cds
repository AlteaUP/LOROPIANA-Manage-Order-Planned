/* checksum : a1d83b6fddf3d7d5b3e4bfc2ca24dbfc */
@cds.external : true
type zmfp_plo_firming.headerCbAControl {
  @Common.Label : 'Dynamic CbA-Control'
  @Common.Heading : 'Dynamic Create by Association Control'
  @Common.QuickInfo : 'Dynamic Create via Association Control Property'
  to_array : Boolean not null;
};

@cds.external : true
type zmfp_plo_firming.EntityControl {
  @Common.Label : 'Dyn. Method Control'
  @Common.Heading : 'Dynamic Method Control'
  @Common.QuickInfo : 'Dynamic Method Property'
  Deletable : Boolean not null;
  @Common.Label : 'Dyn. Method Control'
  @Common.Heading : 'Dynamic Method Control'
  @Common.QuickInfo : 'Dynamic Method Property'
  Updatable : Boolean not null;
};

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
service zmfp_plo_firming {};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Header Entity for Planned Orders Firming'
@Capabilities.NavigationRestrictions.RestrictedProperties : [
  {
    NavigationProperty: to_array,
    InsertRestrictions: { Insertable: ![__CreateByAssociationControl/to_array] }
  }
]
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.FilterRestrictions.NonFilterableProperties : [ '__CreateByAssociationControl', '__EntityControl' ]
@Capabilities.SortRestrictions.NonSortableProperties : [ '__CreateByAssociationControl', '__EntityControl' ]
@Capabilities.ReadRestrictions.Readable : false
@Capabilities.DeleteRestrictions.Deletable : ![__EntityControl/Deletable]
@Capabilities.UpdateRestrictions.Updatable : ![__EntityControl/Updatable]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity zmfp_plo_firming.header {
  @Common.IsUpperCase : true
  @Common.Label : '3-Byte field'
  key id : String(3) not null;
  @Core.Computed : true
  @UI.HiddenFilter : true
  @UI.Hidden : true
  @Common.Label : 'Dynamic CbA-Control'
  @Common.Heading : 'Dynamic Create by Association Control'
  @Common.QuickInfo : 'Dynamic Create via Association Control Property'
  __CreateByAssociationControl : zmfp_plo_firming.headerCbAControl;
  @Core.Computed : true
  @UI.HiddenFilter : true
  @UI.Hidden : true
  @Common.Label : 'Dyn. Method Control'
  @Common.Heading : 'Dynamic Method Control'
  @Common.QuickInfo : 'Dynamic Method Property'
  __EntityControl : zmfp_plo_firming.EntityControl;
  @Common.Composition : true
  to_array : Composition of many zmfp_plo_firming.item {  };
};

@cds.external : true
@cds.persistence.skip : true
@Common.Label : 'Item Entity for Planned Orders Firming'
@Capabilities.NavigationRestrictions.RestrictedProperties : [
  { NavigationProperty: parent, InsertRestrictions: { Insertable: false } }
]
@Capabilities.SearchRestrictions.Searchable : false
@Capabilities.FilterRestrictions.NonFilterableProperties : [ '__EntityControl' ]
@Capabilities.SortRestrictions.NonSortableProperties : [ '__EntityControl' ]
@Capabilities.ReadRestrictions.Readable : false
@Capabilities.InsertRestrictions.Insertable : false
@Capabilities.DeleteRestrictions.Deletable : ![__EntityControl/Deletable]
@Capabilities.UpdateRestrictions.Updatable : ![__EntityControl/Updatable]
@Capabilities.UpdateRestrictions.QueryOptions.SelectSupported : true
entity zmfp_plo_firming.item {
  @Core.Computed : true
  @Common.IsUpperCase : true
  @Common.Label : '3-Byte field'
  key id : String(3) not null;
  @Common.IsUpperCase : true
  @Common.Label : 'Combined Plnd. Order'
  @Common.Heading : 'Combined Master Planned Order'
  @Common.QuickInfo : 'Combined Master Planned Order'
  combplnord : String(12) not null;
  @Core.Computed : true
  @UI.HiddenFilter : true
  @UI.Hidden : true
  @Common.Label : 'Dyn. Method Control'
  @Common.Heading : 'Dynamic Method Control'
  @Common.QuickInfo : 'Dynamic Method Property'
  __EntityControl : zmfp_plo_firming.EntityControl;
  parent : Association to one zmfp_plo_firming.header {  };
};

