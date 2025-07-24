/* checksum : b5423f1364f0e0c4544ecf002f256816 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZZ1_COMBPLNORDERSSTOCKAPI_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Combined Planned Orders Stock'
entity ZZ1_COMBPLNORDERSSTOCKAPI_CDS.ZZ1_CombPlnOrdersStock {
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Stock Material'
  @sap.quickinfo : 'Materiale in riferimento al quale viene gestito lo stock'
  key Material : String(40) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Plant'
  @sap.quickinfo : 'Divisione'
  key Plant : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Storage Location'
  @sap.quickinfo : 'Magazzino'
  key StorageLocation : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Batch SID'
  @sap.quickinfo : 'N. partita (identificatore stock)'
  key Batch : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Supplier SID'
  @sap.quickinfo : 'Fornitore per stock speciale'
  key Supplier : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Sales order'
  @sap.quickinfo : 'N. ordine cliente dello stock ordine cliente valorizzato'
  key SDDocument : String(10) not null;
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Sales order item'
  @sap.quickinfo : 'Pos. ordine cliente dello stock ordine cliente valorizzato'
  key SDDocumentItem : String(6) not null;
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'WBS Internal ID'
  @sap.quickinfo : 'Elemento WBS'
  key WBSElementInternalID : String(8) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Customer SID'
  @sap.quickinfo : 'Cliente per stock speciale'
  key Customer : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Add. Supplier for Special Stock'
  @sap.quickinfo : 'Altro fornitore per stock speciale'
  key SpecialStockIdfgStockOwner : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Stock Type'
  @sap.quickinfo : 'Tipo di stock del movimento merci (identificatore stock)'
  key InventoryStockType : String(2) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Special Stock Type'
  @sap.quickinfo : 'Tipo di stock speciale'
  key InventorySpecialStockType : String(1) not null;
  @sap.required.in.filter : 'false'
  @sap.label : 'Base Unit of Measure'
  @sap.quickinfo : 'Unità di misura di base'
  @sap.semantics : 'unit-of-measure'
  key MaterialBaseUnit : String(3) not null;
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'ProdCostEst.No.'
  @sap.quickinfo : 'Numero calcolo costi - calcolo costi del prodotto'
  key CostEstimate : String(12) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Resource Name'
  @sap.quickinfo : 'Nome della risorsa (identificatore stock)'
  key ResourceID : String(40) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Company Code'
  @sap.quickinfo : 'Società'
  CompanyCode : String(4);
  @sap.required.in.filter : 'false'
  @sap.unit : 'MaterialBaseUnit'
  @sap.label : 'MatlWrhsStkQtyInMatlBaseUnit'
  @sap.quickinfo : 'Quantità stock'
  MatlWrhsStkQtyInMatlBaseUnit : Decimal(31, 14);
  @sap.required.in.filter : 'false'
  @sap.unit : 'MaterialBaseUnit'
  @sap.label : 'MatlCnsmpnQtyInMatlBaseUnit'
  @sap.quickinfo : 'Quantità di consumo'
  MatlCnsmpnQtyInMatlBaseUnit : Decimal(31, 14);
  @sap.required.in.filter : 'false'
  @sap.unit : 'MaterialBaseUnit'
  @sap.label : 'MatlStkIncrQtyInMatlBaseUnit'
  @sap.quickinfo : 'Quantità aumento stock'
  MatlStkIncrQtyInMatlBaseUnit : Decimal(31, 14);
  @sap.required.in.filter : 'false'
  @sap.unit : 'MaterialBaseUnit'
  @sap.label : 'MatlStkDecrQtyInMatlBaseUnit'
  @sap.quickinfo : 'Quantità riduzione stock'
  MatlStkDecrQtyInMatlBaseUnit : Decimal(31, 14);
  @sap.required.in.filter : 'false'
  @sap.label : 'choice'
  choice : String(70);
  @sap.required.in.filter : 'false'
  @sap.label : 'dye_lot'
  dye_lot : String(70);
  @sap.required.in.filter : 'false'
  @sap.label : 'GROSS_LENGHT'
  GROSS_LENGHT : String(70);
  @sap.required.in.filter : 'false'
  @sap.label : 'NET_HEIGHT'
  NET_HEIGHT : String(70);
  @sap.required.in.filter : 'false'
  @sap.label : 'DEROGA'
  DEROGA : String(70);
  @sap.required.in.filter : 'false'
  @sap.label : 'PDF_RATING_ID'
  PDF_RATING_ID : String(70);
  @sap.required.in.filter : 'false'
  @sap.label : 'SERIALE_MATRICOLA'
  SERIALE_MATRICOLA : String(70);
  @sap.required.in.filter : 'false'
  @sap.label : 'ALTEZZA_STANDARD'
  ALTEZZA_STANDARD : String(70);
  @sap.required.in.filter : 'false'
  @sap.label : 'Product Description'
  @sap.quickinfo : 'Descrizione prodotto'
  ProductDescription : String(40);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Stock Segment'
  @sap.quickinfo : 'Segmento di stock'
  StockSegment : String(40);
  @sap.required.in.filter : 'false'
  @sap.label : 'CERTIFICATO'
  CERTIFICATO : String(70);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Supplier Batch'
  @sap.quickinfo : 'Numero partita fornitore'
  BatchBySupplier : String(15);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Combined Planned Orders Stock API'
entity ZZ1_COMBPLNORDERSSTOCKAPI_CDS.ZZ1_CombPlnOrdersStockAPI {
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Combined Plnd. Order'
  @sap.quickinfo : 'Ordine pianificato combinato principale'
  key CplndOrd : String(12) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Cross-plant CP'
  @sap.quickinfo : 'Prodotto configurabile valido per tutte le divisioni'
  key CrossPlantConfigurableProduct : String(40) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Material'
  @sap.quickinfo : 'Codice materiale'
  key Material : String(40) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Plant'
  @sap.quickinfo : 'Divisione'
  key Plant : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Storage Location'
  @sap.quickinfo : 'Magazzino'
  key StorageLocation : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Batch'
  @sap.quickinfo : 'Numero partita'
  key Batch : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Bill Of Material Item Number'
  @sap.quickinfo : 'Numero di posizione distinta base'
  key BillOfMaterialItemNumber_2 : String(4) not null;
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'MatlCompRequirementDate'
  MatlCompRequirementDate : Date;
  @sap.required.in.filter : 'false'
  @sap.label : 'Item Text'
  @sap.quickinfo : 'Testo posizione distinta base (riga 1)'
  BOMItemDescription : String(40);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'BOM Category'
  @sap.quickinfo : 'Codice categoria distinta base'
  BillOfMaterialCategory : String(1);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'MRP Controller'
  @sap.quickinfo : 'Responsabile MRP'
  MRPController : String(3);
  @sap.required.in.filter : 'false'
  @sap.label : 'Plant Name'
  @sap.quickinfo : 'Nome divisione'
  PlantName : String(30);
  @sap.required.in.filter : 'false'
  @sap.label : 'MRP Controller Name'
  @sap.quickinfo : 'Nome responsabile MRP'
  MRPControllerName : String(18);
  @sap.required.in.filter : 'false'
  @sap.label : 'Color'
  @sap.quickinfo : 'Valore caratteristica per colori in caso di varianti'
  ProductCharacteristic1 : String(18);
  @sap.required.in.filter : 'false'
  @sap.label : 'Main Size'
  @sap.quickinfo : 'Valore caratteristica per la dimens. princ. nelle varianti'
  ProductCharacteristic2 : String(18);
  @sap.required.in.filter : 'false'
  @sap.label : 'Second Size'
  @sap.quickinfo : 'Valore caratt. per la seconda dimensione nelle varianti'
  ProductCharacteristic3 : String(18);
  @sap.required.in.filter : 'false'
  @sap.label : 'Base Unit of Measure'
  @sap.quickinfo : 'Unità di misura di base'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'AvailableQuantity'
  AvailableQuantity : Decimal(16, 3);
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'WithdrawnQuantity'
  WithdrawnQuantity : Decimal(14, 3);
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'RequiredQuantity'
  RequiredQuantity : Decimal(14, 3);
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'TotalAllocQty'
  TotalAllocQty : Decimal(14, 3);
  @sap.required.in.filter : 'false'
  @sap.label : 'Product Description'
  @sap.quickinfo : 'Descrizione prodotto'
  ProductDescription : String(40);
  to_ZZ1_CombPlnOrdersStock : Association to many ZZ1_COMBPLNORDERSSTOCKAPI_CDS.ZZ1_CombPlnOrdersStock {  };
};

