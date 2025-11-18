/* checksum : 24dabaef873eab516acb8ec12ce6b0dc */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZZ1_PLO_OPERATIONS_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'ZZ1_PLO_OPERATIONS'
entity ZZ1_PLO_OPERATIONS_CDS.ZZ1_PLO_OPERATIONS {
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Task List Type'
  key Plnty : String(1) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Group'
  @sap.quickinfo : 'Key for Task List Group'
  key Plnnr : String(8) not null;
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Task List Node'
  @sap.quickinfo : 'Number of the Task List Node'
  key Plnkn : String(8) not null;
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Counter'
  @sap.quickinfo : 'Internal counter'
  key Zaehl : String(8) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Material Group'
  Matkl : String(9);
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Object ID'
  Arbid : String(8);
};

