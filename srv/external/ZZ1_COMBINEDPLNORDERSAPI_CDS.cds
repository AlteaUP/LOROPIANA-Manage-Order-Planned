/* checksum : 8158359d112477b0fd14ac04d670aae8 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZZ1_COMBINEDPLNORDERSAPI_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Combined Planned Orders API'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_CombinedPlnOrdersAPI {
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Combined Plnd. Order'
  @sap.quickinfo : 'Ordine pianificato combinato principale'
  key CplndOrd : String(12) not null;
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

