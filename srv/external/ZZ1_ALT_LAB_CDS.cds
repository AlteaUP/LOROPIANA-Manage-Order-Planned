/* checksum : bfc25f18c05716a9591dab92f8bf31b8 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZZ1_ALT_LAB_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Currency'
entity ZZ1_ALT_LAB_CDS.I_Currency {
  @sap.display.format : 'UpperCase'
  @sap.text : 'Currency_Text'
  @sap.label : 'Currency'
  @sap.quickinfo : 'Currency Key'
  @sap.semantics : 'currency-code'
  key Currency : String(5) not null;
  @sap.label : 'Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  Currency_Text : String(40);
  @odata.Type : 'Edm.Byte'
  @sap.label : 'Decimal Places'
  @sap.quickinfo : 'Number of decimal places'
  Decimals : Integer;
  @sap.display.format : 'UpperCase'
  @sap.label : 'ISO Code'
  @sap.quickinfo : 'ISO Currency Code'
  CurrencyISOCode : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Alternative Key'
  AlternativeCurrencyKey : String(3);
  @sap.label : 'Primary'
  @sap.quickinfo : 'Primary SAP Currency Code for ISO Code'
  IsPrimaryCurrencyForISOCrcy : Boolean;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Currency Text'
entity ZZ1_ALT_LAB_CDS.I_CurrencyText {
  @sap.text : 'to_Language/Language_Text'
  @sap.label : 'Language Key'
  @sap.value.list : 'standard'
  key Language : String(2) not null;
  @sap.display.format : 'UpperCase'
  @sap.text : 'to_Currency/Currency_Text'
  @sap.label : 'Currency'
  @sap.quickinfo : 'Currency Key'
  @sap.value.list : 'standard'
  @sap.semantics : 'currency-code'
  key Currency : String(5) not null;
  @sap.label : 'Description'
  CurrencyName : String(40);
  @sap.label : 'Short text'
  CurrencyShortName : String(15);
  to_Currency : Association to ZZ1_ALT_LAB_CDS.I_Currency {  };
  to_Language : Association to ZZ1_ALT_LAB_CDS.I_Language {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Language'
entity ZZ1_ALT_LAB_CDS.I_Language {
  @sap.text : 'Language_Text'
  @sap.label : 'Language Key'
  key Language : String(2) not null;
  @sap.label : 'Name'
  @sap.quickinfo : 'Name of Language'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  Language_Text : String(16);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Language Code'
  @sap.quickinfo : '2-Character SAP Language Code'
  LanguageISOCode : String(2);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.addressable : 'false'
@sap.content.version : '1'
@sap.label : 'User'
entity ZZ1_ALT_LAB_CDS.P_Scbo_User {
  @sap.display.format : 'UpperCase'
  @sap.label : 'User'
  @sap.quickinfo : 'User Name in User Master Record'
  key name : String(12) not null;
  @sap.label : 'Description'
  @sap.quickinfo : 'Description of the Technical User Account'
  description : String(80);
};

@cds.external : true
@cds.persistence.skip : true
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'ALT_LAB'
entity ZZ1_ALT_LAB_CDS.ZZ1_ALT_LAB {
  @sap.label : 'UUID'
  @sap.quickinfo : '16 Byte UUID in 16 Bytes (Raw Format)'
  key SAP_UUID : UUID not null;
  @sap.label : 'Description'
  SAP_Description : String(80);
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.label : 'Created On'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SAP_CreatedDateTime : Timestamp;
  @sap.display.format : 'UpperCase'
  @sap.text : 'SAP_CreatedByUser_Text'
  @sap.label : 'Created By'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SAP_CreatedByUser : String(12);
  @sap.label : 'Description'
  @sap.quickinfo : 'Description of the Technical User Account'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SAP_CreatedByUser_Text : String(80);
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.label : 'Last Changed On'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SAP_LastChangedDateTime : Timestamp;
  @sap.display.format : 'UpperCase'
  @sap.text : 'SAP_LastChangedByUser_Text'
  @sap.label : 'Last Changed By'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SAP_LastChangedByUser : String(12);
  @sap.label : 'Description'
  @sap.quickinfo : 'Description of the Technical User Account'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SAP_LastChangedByUser_Text : String(80);
  @sap.label : 'MATKL'
  MATKL : String(20);
  @sap.label : 'LIFNR'
  LIFNR : String(20);
  @sap.label : 'ZZPROJ'
  ZMD_PROJCODE : String(7);
  @sap.label : 'ZZCOLOR'
  ZMD_COLORCODE : String(20);
  @sap.display.format : 'Date'
  @sap.label : 'DATAB'
  KODATAB : Date;
  @sap.display.format : 'Date'
  @sap.label : 'DATBI'
  KODATBI : Date;
  @sap.unit : 'VFPRC_ELEMENT_AMOUNT_C'
  @sap.label : 'KBETR'
  VFPRC_ELEMENT_AMOUNT_V : Decimal(16, 3);
  @sap.text : 'VFPRC_ELEMENT_AMOUNT_C_Text'
  @sap.label : 'KBETR'
  @sap.value.list : 'standard'
  @sap.semantics : 'currency-code'
  VFPRC_ELEMENT_AMOUNT_C : String(5);
  @sap.label : 'Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  VFPRC_ELEMENT_AMOUNT_C_Text : String(40);
  to_SAPSysAdminDataChangeUser : Association to ZZ1_ALT_LAB_CDS.P_Scbo_User {  };
  to_SAPSysAdminDataCreateUser : Association to ZZ1_ALT_LAB_CDS.P_Scbo_User {  };
  to_VFPRC_ELEMENT_AMOUNT : Association to ZZ1_ALT_LAB_CDS.I_Currency {  };
  to__VFPRC_ELEMENT_AMOUNT : Association to many ZZ1_ALT_LAB_CDS.I_CurrencyText {  };
};

@cds.external : true
action ZZ1_ALT_LAB_CDS.ZZ1_ALT_LABSap_upsert(
  @sap.label : 'Text of length 80'
  SAP_Description : String(80),
  @sap.label : 'Text of length 20'
  MATKL : String(20),
  @sap.label : 'Text of length 20'
  LIFNR : String(20),
  @sap.label : 'Text of length 7'
  ZMD_PROJCODE : String(7),
  @sap.label : 'Text of length 20'
  ZMD_COLORCODE : String(20),
  @sap.label : 'DATAB'
  @sap.display.format : 'Date'
  KODATAB : Date,
  @sap.label : 'DATBI'
  @sap.display.format : 'Date'
  KODATBI : Date,
  @sap.label : 'KBETR'
  VFPRC_ELEMENT_AMOUNT_V : Decimal(16, 3),
  @sap.label : 'KBETR'
  VFPRC_ELEMENT_AMOUNT_C : String(5)
) returns ZZ1_ALT_LAB_CDS.ZZ1_ALT_LAB;

