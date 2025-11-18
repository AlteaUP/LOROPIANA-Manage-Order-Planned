/* checksum : f16fed0706ecb6bfe3a6b03bcbac2cc0 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZZ1_MARA_CUSTOM_FIELDS_API_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'ZZ1_MARA_CUSTOM_FIELDS_API'
entity ZZ1_MARA_CUSTOM_FIELDS_API_CDS.ZZ1_MARA_CUSTOM_FIELDS_API {
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Product'
  @sap.quickinfo : 'Product Number'
  key Product : String(40) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Color'
  zzcolor : String(4);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Proj Code'
  zzproj : String(7);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Proj Description'
  zzprojdesc : String(50);
};

