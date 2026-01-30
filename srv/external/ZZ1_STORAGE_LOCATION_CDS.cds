/* checksum : 6804a4de5e279ff23238d09b716bd5f8 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZZ1_STORAGE_LOCATION_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'STORAGE_LOCATION'
entity ZZ1_STORAGE_LOCATION_CDS.ZZ1_STORAGE_LOCATION {
  @sap.label : 'UUID'
  @sap.quickinfo : '16 Byte UUID in 16 Bytes (Raw Format)'
  key SAP_UUID : UUID not null;
  @sap.label : 'PLANT'
  PLANT : String(4);
  @sap.label : 'STORAGELOCATION'
  STORAGELOCATION : String(4);
};

@cds.external : true
action ZZ1_STORAGE_LOCATION_CDS.ZZ1_STORAGE_LOCATIONSap_upsert(
  @sap.label : 'Text of length 4'
  PLANT : String(4),
  @sap.label : 'Text of length 4'
  STORAGELOCATION : String(4)
) returns ZZ1_STORAGE_LOCATION_CDS.ZZ1_STORAGE_LOCATION;

