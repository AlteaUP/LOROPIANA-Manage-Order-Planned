/* checksum : 96a65eb82d4dac37142baac565183f0e */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZZ1_ZMFG_SEGMENT_DOCTYPE_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'ZMFG_SEGMENT_DOCTYPE'
entity ZZ1_ZMFG_SEGMENT_DOCTYPE_CDS.ZZ1_ZMFG_SEGMENT_DOCTYPE {
  @sap.label : 'UUID'
  @sap.quickinfo : '16 Byte UUID in 16 Bytes (Raw Format)'
  key SAP_UUID : UUID not null;
  @sap.label : 'zsegment'
  @sap.quickinfo : 'segment'
  zsegment : String(10);
  @sap.label : 'zdoctype'
  @sap.quickinfo : 'doctype'
  zdoctype : String(4);
  @sap.label : 'zdefault'
  @sap.quickinfo : 'default'
  zdefault : String(1);
};

@cds.external : true
action ZZ1_ZMFG_SEGMENT_DOCTYPE_CDS.ZZ1_ZMFG_SEGMENT_DOCTYPESap_upsert(
  @sap.label : 'Testo di lungh. 10'
  zsegment : String(10),
  @sap.label : 'Testo di lunghezza 4'
  zdoctype : String(4),
  @sap.label : 'Testo di lunghezza 1'
  zdefault : String(1)
) returns ZZ1_ZMFG_SEGMENT_DOCTYPE_CDS.ZZ1_ZMFG_SEGMENT_DOCTYPE;

