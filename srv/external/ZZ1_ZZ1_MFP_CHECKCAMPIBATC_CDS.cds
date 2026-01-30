/* checksum : 42ebf06d475a480e74e542772d1c9e25 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZZ1_ZZ1_MFP_CHECKCAMPIBATC_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'ZZ1_MFP_ID_CriteriCheck'
entity ZZ1_ZZ1_MFP_CHECKCAMPIBATC_CDS.ZZ1_MFP_ID_CRITERICHEC {
  @sap.label : 'UUID'
  @sap.quickinfo : '16 Byte UUID in 16 Bytes (Raw Format)'
  key SAP_UUID : UUID not null;
  @sap.label : 'ID Criterio'
  ID_Criterio : String(10);
  @sap.label : 'Description'
  SAP_Description : String(80);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'ZZ1_TIPOCHECK'
entity ZZ1_ZZ1_MFP_CHECKCAMPIBATC_CDS.ZZ1_TIPOCHECK {
  @sap.text : 'Description'
  @sap.label : 'Code'
  key Code : String(2) not null;
  @sap.label : 'Description'
  Description : String(60);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'ZZ1_MFP_ID_CriteriCheck'
entity ZZ1_ZZ1_MFP_CHECKCAMPIBATC_CDS.ZZ1_VH_MFP_ID_CRITERICHEC {
  @sap.text : 'SAP_Description'
  @sap.label : 'ID Criterio'
  key ID_Criterio : String(10) not null;
  @sap.label : 'Description'
  SAP_Description : String(80);
  @sap.label : 'UUID'
  @sap.quickinfo : '16 Byte UUID in 16 Bytes (Raw Format)'
  sap_uuid : UUID;
};

@cds.external : true
@cds.persistence.skip : true
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'ZZ1_MFP_CheckCampiBatch'
entity ZZ1_ZZ1_MFP_CHECKCAMPIBATC_CDS.ZZ1_ZZ1_MFP_CHECKCAMPIBATC {
  @sap.label : 'UUID'
  @sap.quickinfo : '16 Byte UUID in 16 Bytes (Raw Format)'
  key SAP_UUID : UUID not null;
  @sap.text : 'ID_Criterio_Text'
  @sap.label : 'ID_Criterio'
  @sap.value.list : 'standard'
  ID_Criterio : String(10);
  @sap.label : 'Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ID_Criterio_Text : String(80);
  @sap.label : 'CheckCampo'
  CheckCampo : String(20);
  @sap.text : 'TipoCheck_Text'
  @sap.label : 'TipoCheck'
  @sap.value.list : 'standard'
  TipoCheck : String(2);
  @sap.label : 'Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  TipoCheck_Text : String(60);
  to_ID_Criterio : Association to ZZ1_ZZ1_MFP_CHECKCAMPIBATC_CDS.ZZ1_MFP_ID_CRITERICHEC {  };
  to_TipoCheck : Association to ZZ1_ZZ1_MFP_CHECKCAMPIBATC_CDS.ZZ1_TIPOCHECK {  };
  to__ID_Criterio : Association to ZZ1_ZZ1_MFP_CHECKCAMPIBATC_CDS.ZZ1_VH_MFP_ID_CRITERICHEC {  };
};

@cds.external : true
action ZZ1_ZZ1_MFP_CHECKCAMPIBATC_CDS.ZZ1_MFP_ID_CRITERICHECSap_upsert(
  @sap.label : 'Text of length 10'
  ID_Criterio : String(10),
  @sap.label : 'Text of length 80'
  SAP_Description : String(80)
) returns ZZ1_ZZ1_MFP_CHECKCAMPIBATC_CDS.ZZ1_MFP_ID_CRITERICHEC;

@cds.external : true
action ZZ1_ZZ1_MFP_CHECKCAMPIBATC_CDS.ZZ1_ZZ1_MFP_CHECKCAMPIBATCSap_upsert(
  @sap.label : 'Text of length 10'
  ID_Criterio : String(10),
  @sap.label : 'Text of length 20'
  CheckCampo : String(20),
  @sap.label : 'GENERATED: Value of code list ZZ1_TIPOCHECK'
  TipoCheck : String(2)
) returns ZZ1_ZZ1_MFP_CHECKCAMPIBATC_CDS.ZZ1_ZZ1_MFP_CHECKCAMPIBATC;

