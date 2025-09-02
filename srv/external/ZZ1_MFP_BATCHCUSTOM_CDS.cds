/* checksum : 4a3f52d3a96ace85ca31408ccb6843fa */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZZ1_MFP_BATCHCUSTOM_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'ZZ1_MFP_BATCHCUSTOM'
entity ZZ1_MFP_BATCHCUSTOM_CDS.ZZ1_MFP_BATCHCUSTOM {
  @sap.label : 'UUID'
  @sap.quickinfo : '16 Byte UUID in 16 Bytes (Raw Format)'
  key SAP_UUID : UUID not null;
  @sap.label : 'Werks'
  Plant : String(4);
  @sap.label : 'Matkl'
  Gruppo_Merce : String(9);
  @sap.label : 'Family'
  Famiglia : String(3);
  @sap.label : 'Cites'
  Cites : String(1);
  @sap.label : 'Matnr'
  Material : String(40);
  @sap.label : 'Mandassign'
  Mandassign : Boolean;
  @sap.label : 'AssignRule'
  AssignRule : Boolean;
  @sap.label : 'Campo1'
  Campo1 : String(40);
  @sap.label : 'Campo2'
  Campo2 : String(40);
  @sap.label : 'Campo3'
  Campo3 : String(40);
  @sap.label : 'Campo4'
  Campo4 : String(40);
  @sap.label : 'Campo5'
  Campo5 : String(40);
  @sap.label : 'Campo6'
  Campo6 : String(40);
  @sap.label : 'Campo7'
  Campo7 : String(40);
  @sap.label : 'Campo8'
  Campo8 : String(40);
  @sap.label : 'Campo9'
  Campo9 : String(40);
  @sap.label : 'Campo10'
  Campo10 : String(40);
  @sap.label : 'Campo11'
  Campo11 : String(40);
  @sap.label : 'Campo12'
  Campo12 : String(40);
  @sap.label : 'Campo13'
  Campo13 : String(40);
  @sap.label : 'Campo14'
  Campo14 : String(40);
  @sap.label : 'Campo15'
  Campo15 : String(40);
};

@cds.external : true
action ZZ1_MFP_BATCHCUSTOM_CDS.ZZ1_MFP_BATCHCUSTOMSap_upsert(
  @sap.label : 'Testo di lunghezza 4'
  Plant : String(4),
  @sap.label : 'Testo di lunghezza 9'
  Gruppo_Merce : String(9),
  @sap.label : 'Testo di lunghezza 3'
  Famiglia : String(3),
  @sap.label : 'Testo di lunghezza 1'
  Cites : String(1),
  @sap.label : 'Testo di lungh. 40'
  Material : String(40),
  @sap.label : 'VERO'
  Mandassign : Boolean,
  @sap.label : 'VERO'
  AssignRule : Boolean,
  @sap.label : 'Testo di lungh. 40'
  Campo1 : String(40),
  @sap.label : 'Testo di lungh. 40'
  Campo2 : String(40),
  @sap.label : 'Testo di lungh. 40'
  Campo3 : String(40),
  @sap.label : 'Testo di lungh. 40'
  Campo4 : String(40),
  @sap.label : 'Testo di lungh. 40'
  Campo5 : String(40),
  @sap.label : 'Testo di lungh. 40'
  Campo6 : String(40),
  @sap.label : 'Testo di lungh. 40'
  Campo7 : String(40),
  @sap.label : 'Testo di lungh. 40'
  Campo8 : String(40),
  @sap.label : 'Testo di lungh. 40'
  Campo9 : String(40),
  @sap.label : 'Testo di lungh. 40'
  Campo10 : String(40),
  @sap.label : 'Testo di lungh. 40'
  Campo11 : String(40),
  @sap.label : 'Testo di lungh. 40'
  Campo12 : String(40),
  @sap.label : 'Testo di lungh. 40'
  Campo13 : String(40),
  @sap.label : 'Testo di lungh. 40'
  Campo14 : String(40),
  @sap.label : 'Testo di lungh. 40'
  Campo15 : String(40)
) returns ZZ1_MFP_BATCHCUSTOM_CDS.ZZ1_MFP_BATCHCUSTOM;

