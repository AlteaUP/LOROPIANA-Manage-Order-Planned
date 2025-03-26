/* checksum : fb912788244432ea10289fa317edb3b5 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZZ1_MASTERPLANNEDORDERAPI_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Master Planned Order API'
entity ZZ1_MASTERPLANNEDORDERAPI_CDS.ZZ1_MasterPlannedOrderAPI {
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Master Plnd Ord.'
  @sap.quickinfo : 'Numero ordine pianificato principale'
  key FshMplndOrd : String(12) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Combined Plnd. Order'
  @sap.quickinfo : 'Ordine pianificato combinato principale'
  CplndOrd : String(12);
  @sap.required.in.filter : 'false'
  @sap.label : 'Base Unit of Measure'
  @sap.quickinfo : 'Unità di misura di base'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'PlannedTotalQtyInBaseUnit'
  PlannedTotalQtyInBaseUnit : Decimal(13, 3);
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'RequirementQuantityInBaseUnit'
  RequirementQuantityInBaseUnit : Decimal(13, 3);
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'QuantityWithdrawnInBaseUnit'
  QuantityWithdrawnInBaseUnit : Decimal(13, 3);
};

