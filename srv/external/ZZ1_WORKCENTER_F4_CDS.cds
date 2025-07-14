/* checksum : d33890c8bfa315180442adebe188be36 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZZ1_WORKCENTER_F4_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'WORK CENTER F4'
entity ZZ1_WORKCENTER_F4_CDS.ZZ1_WORKCENTER_F4 {
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Object ID'
  @sap.quickinfo : 'ID oggetto della risorsa'
  key WorkCenterInternalID : String(8) not null;
  @sap.required.in.filter : 'false'
  @sap.label : 'Language Key'
  @sap.quickinfo : 'Chiave lingua'
  key Language : String(2) not null;
  @sap.required.in.filter : 'false'
  @sap.label : 'Work Center Text'
  @sap.quickinfo : 'Testo centro di lavoro'
  WorkCenterText : String(40);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Plant'
  @sap.quickinfo : 'Divisione'
  Plant : String(4);
};

