/* checksum : 86cbfedbe6c4256dc9e464aa6664413a */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZZ1_MRP_PLANT_F4_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'ZZ1_MRP_PLANT_F4'
entity ZZ1_MRP_PLANT_F4_CDS.ZZ1_MRP_PLANT_F4 {
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'PlantName'
  @sap.label : 'Plant'
  key Plant : String(4) not null;
  @sap.required.in.filter : 'false'
  @sap.label : 'Plant Name'
  PlantName : String(30);
};

