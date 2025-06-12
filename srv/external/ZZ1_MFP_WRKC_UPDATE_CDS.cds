/* checksum : fe31bd3e16846a91c539ebde86fd943c */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZZ1_MFP_WRKC_UPDATE_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.addressable : 'false'
@sap.content.version : '1'
@sap.label : 'User'
entity ZZ1_MFP_WRKC_UPDATE_CDS.P_Scbo_User {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Utente'
  @sap.quickinfo : 'Nome riportato nell''anagrafica utente'
  key name : String(12) not null;
  @sap.label : 'Descrizione'
  @sap.quickinfo : 'Descrizione del conto utente tecnico'
  description : String(80);
};

@cds.external : true
@cds.persistence.skip : true
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'MFP_WRKC_UPDATE'
entity ZZ1_MFP_WRKC_UPDATE_CDS.ZZ1_MFP_WRKC_UPDATE {
  @sap.label : 'UUID'
  @sap.quickinfo : '16 Byte UUID in 16 Bytes (Raw Format)'
  key SAP_UUID : UUID not null;
  @sap.label : 'FSH_CPLND_ORD'
  FSH_CPLND_ORD : String(12);
  @sap.label : 'MANUFACTURINGORDEROPERATION'
  MANUFACTURINGORDEROPERATION : String(4);
  @sap.label : 'MANUFACTURINGORDERSEQUENCE'
  MANUFACTURINGORDERSEQUENCE : String(6);
  @sap.display.format : 'NonNegative'
  @sap.label : 'WORKCENTER'
  WORKCENTER : String(8);
  @sap.display.format : 'Date'
  @sap.label : 'OPLTSTSCHEDLDEXECSTRTDTE'
  OPLTSTSCHEDLDEXECSTRTDTE : Date;
  @sap.display.format : 'Date'
  @sap.label : 'OPLTSTSCHEDLDEXECENDDTE'
  OPLTSTSCHEDLDEXECENDDTE : Date;
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.label : 'Data creazione'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SAP_CreatedDateTime : Timestamp;
  @sap.display.format : 'UpperCase'
  @sap.text : 'SAP_CreatedByUser_Text'
  @sap.label : 'Autore creazione'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SAP_CreatedByUser : String(12);
  @sap.label : 'Descrizione'
  @sap.quickinfo : 'Descrizione del conto utente tecnico'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SAP_CreatedByUser_Text : String(80);
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.label : 'Data dell''ultima modifica'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SAP_LastChangedDateTime : Timestamp;
  @sap.display.format : 'UpperCase'
  @sap.text : 'SAP_LastChangedByUser_Text'
  @sap.label : 'Autore dell''ultima modifica'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SAP_LastChangedByUser : String(12);
  @sap.label : 'Descrizione'
  @sap.quickinfo : 'Descrizione del conto utente tecnico'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SAP_LastChangedByUser_Text : String(80);
  to_SAPSysAdminDataChangeUser : Association to ZZ1_MFP_WRKC_UPDATE_CDS.P_Scbo_User {  };
  to_SAPSysAdminDataCreateUser : Association to ZZ1_MFP_WRKC_UPDATE_CDS.P_Scbo_User {  };
};

@cds.external : true
action ZZ1_MFP_WRKC_UPDATE_CDS.ZZ1_MFP_WRKC_UPDATESap_upsert(
  @sap.label : 'Testo di lungh. 12'
  FSH_CPLND_ORD : String(12),
  @sap.label : 'Testo di lunghezza 4'
  MANUFACTURINGORDEROPERATION : String(4),
  @sap.label : 'Testo di lunghezza 6'
  MANUFACTURINGORDERSEQUENCE : String(6),
  @sap.label : 'Testo num.lungh. 8'
  WORKCENTER : String(8),
  @sap.label : 'OPLTSTSCHEDLDEXECSTRTDTE'
  @sap.display.format : 'Date'
  OPLTSTSCHEDLDEXECSTRTDTE : Date,
  @sap.label : 'OPLTSTSCHEDLDEXECENDDTE'
  @sap.display.format : 'Date'
  OPLTSTSCHEDLDEXECENDDTE : Date
) returns ZZ1_MFP_WRKC_UPDATE_CDS.ZZ1_MFP_WRKC_UPDATE;

