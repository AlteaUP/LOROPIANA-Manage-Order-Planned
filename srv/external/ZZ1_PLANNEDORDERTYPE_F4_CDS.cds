/* checksum : d3005996d5cd5b1e9ca8abda999a3475 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZZ1_PLANNEDORDERTYPE_F4_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'PLANNED ORDER TYPE'
entity ZZ1_PLANNEDORDERTYPE_F4_CDS.ZZ1_PLANNEDORDERTYPE_F4 {
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Planned Order Type'
  @sap.quickinfo : 'Tipo di ordine pianificato'
  key PlannedOrderType : String(4) not null;
};

