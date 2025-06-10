/* checksum : 9f0dd660548dcd36fc6b9f93e26d0514 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZI_RFM_ATP_RULES_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'CDS for ATP Rules'
entity ZI_RFM_ATP_RULES_CDS.ZI_RFM_ATP_RULES {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Ord. pian. combinato'
  @sap.quickinfo : 'Ordine pianificato combinato principale'
  key CplndOrd : String(12) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'PC val.per tt.div.'
  @sap.quickinfo : 'Prodotto configurabile valido per tutte le divisioni'
  key CrossPlantConfigurableProduct : String(40) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Materiale'
  @sap.quickinfo : 'Codice materiale'
  key Material : String(40) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Divisione'
  key Plant : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Magazzino'
  key StorageLocation : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Partita'
  @sap.quickinfo : 'Numero partita'
  key Batch : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Numero di posizione distinta base'
  key BillOfMaterialItemNumber_2 : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Segmento di stock'
  StockSegment : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Segmento fabbisogno'
  RequirementSegment : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Strategia segm.'
  @sap.quickinfo : 'Strategia di segmentazione'
  SegmentationStrategy : String(8);
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  atp : String(40);
};

