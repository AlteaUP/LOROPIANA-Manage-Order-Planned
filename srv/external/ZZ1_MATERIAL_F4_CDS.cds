/* checksum : 4049a7c4b2eb2a4724741a7c2800ddb0 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZZ1_MATERIAL_F4_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'MATERIAL_F4'
entity ZZ1_MATERIAL_F4_CDS.ZZ1_MATERIAL_F4 {
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Material'
  @sap.quickinfo : 'Codice materiale'
  key Product : String(40) not null;
  @sap.required.in.filter : 'false'
  @sap.label : 'Language Key'
  @sap.quickinfo : 'Chiave lingua'
  key Language : String(2) not null;
  @sap.required.in.filter : 'false'
  @sap.label : 'Product Description'
  @sap.quickinfo : 'Descrizione prodotto'
  ProductName : String(40);
};

