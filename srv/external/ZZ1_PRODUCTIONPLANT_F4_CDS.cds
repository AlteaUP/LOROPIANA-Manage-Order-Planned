/* checksum : 4c92429da09bd3f1e32c24490655fc95 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZZ1_PRODUCTIONPLANT_F4_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'PRODUCTION PLANT F4'
entity ZZ1_PRODUCTIONPLANT_F4_CDS.ZZ1_PRODUCTIONPLANT_F4 {
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Plant'
  @sap.quickinfo : 'Divisione'
  key Plant : String(4) not null;
  @sap.required.in.filter : 'false'
  @sap.label : 'Plant Name'
  @sap.quickinfo : 'Nome divisione'
  PlantName : String(30);
};

