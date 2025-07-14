/* checksum : 0120cdf91a058fb6903b99ab543a65ba */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZZ1_COMBPLANNEDORDER_F4_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Combined Planned Orders F4'
entity ZZ1_COMBPLANNEDORDER_F4_CDS.ZZ1_CombPlannedOrder_F4 {
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Combined Plnd. Order'
  @sap.quickinfo : 'Ordine pianificato combinato principale'
  key CplndOrd : String(12) not null;
};

