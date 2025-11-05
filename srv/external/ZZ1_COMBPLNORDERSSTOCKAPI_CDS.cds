/* checksum : c134f55c54972f452be2ab6a47c4a479 */
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
  @sap.quickinfo : 'Material in Respect of Which Stock is Managed'
  key Material : String(40) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Plant'
  key Plant : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Storage Location'
  key StorageLocation : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Batch SID'
  @sap.quickinfo : 'Batch Number (Stock Identifier)'
  key Batch : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Supplier SID'
  @sap.quickinfo : 'Supplier for Special Stock'
  key Supplier : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Sales order'
  @sap.quickinfo : 'Sales order number of valuated sales order stock'
  key SDDocument : String(10) not null;
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Sales order item'
  @sap.quickinfo : 'Sales Order Item of Valuated Sales Order Stock'
  key SDDocumentItem : String(6) not null;
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'WBS Internal ID'
  @sap.quickinfo : 'WBS Element'
  key WBSElementInternalID : String(8) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Customer SID'
  @sap.quickinfo : 'Customer for Special Stock'
  key Customer : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Add. Supplier for Special Stock'
  key SpecialStockIdfgStockOwner : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Stock Type'
  @sap.quickinfo : 'Stock Type of Goods Movement (Stock Identifier)'
  key InventoryStockType : String(2) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Special Stock Type'
  key InventorySpecialStockType : String(1) not null;
  @sap.required.in.filter : 'false'
  @sap.label : 'Base Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  key MaterialBaseUnit : String(3) not null;
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'ProdCostEst.No.'
  @sap.quickinfo : 'Cost Estimate Number - Product Costing'
  key CostEstimate : String(12) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Resource Name'
  @sap.quickinfo : 'Resource Name (Stock Identifier)'
  key ResourceID : String(40) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Company Code'
  CompanyCode : String(4);
  @sap.required.in.filter : 'false'
  @sap.unit : 'MaterialBaseUnit'
  @sap.label : 'MatlWrhsStkQtyInMatlBaseUnit'
  @sap.quickinfo : 'Stock Quantity'
  MatlWrhsStkQtyInMatlBaseUnit : Decimal(31, 14);
  @sap.required.in.filter : 'false'
  @sap.unit : 'MaterialBaseUnit'
  @sap.label : 'MatlCnsmpnQtyInMatlBaseUnit'
  @sap.quickinfo : 'Consumption Quantity'
  MatlCnsmpnQtyInMatlBaseUnit : Decimal(31, 14);
  @sap.required.in.filter : 'false'
  @sap.unit : 'MaterialBaseUnit'
  @sap.label : 'MatlStkIncrQtyInMatlBaseUnit'
  @sap.quickinfo : 'Stock Increase Quantity'
  MatlStkIncrQtyInMatlBaseUnit : Decimal(31, 14);
  @sap.required.in.filter : 'false'
  @sap.unit : 'MaterialBaseUnit'
  @sap.label : 'MatlStkDecrQtyInMatlBaseUnit'
  @sap.quickinfo : 'Stock Decrease Quantity'
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
  ProductDescription : String(40);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Stock Segment'
  StockSegment : String(40);
  @sap.required.in.filter : 'false'
  @sap.label : 'CERTIFICATO'
  CERTIFICATO : String(70);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Supplier Batch'
  @sap.quickinfo : 'Supplier Batch Number'
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
  @sap.quickinfo : 'Combined Master Planned Order'
  key CplndOrd : String(12) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Cross-plant CP'
  @sap.quickinfo : 'Cross-Plant Configurable Product'
  key CrossPlantConfigurableProduct : String(40) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Material'
  @sap.quickinfo : 'Material Number'
  key Material : String(40) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Plant'
  key Plant : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Storage Location'
  key StorageLocation : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Batch'
  @sap.quickinfo : 'Batch Number'
  key Batch : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Bill Of Material Item Number'
  key BillOfMaterialItemNumber_2 : String(4) not null;
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'MatlCompRequirementDate'
  MatlCompRequirementDate : Date;
  @sap.required.in.filter : 'false'
  @sap.label : 'Item Text'
  @sap.quickinfo : 'BOM Item Text (Line 1)'
  BOMItemDescription : String(40);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'BOM Category'
  @sap.quickinfo : 'Bill of Material Category Code'
  BillOfMaterialCategory : String(1);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'MRP Controller'
  MRPController : String(3);
  @sap.required.in.filter : 'false'
  @sap.label : 'Plant Name'
  PlantName : String(30);
  @sap.required.in.filter : 'false'
  @sap.label : 'MRP Controller Name'
  MRPControllerName : String(18);
  @sap.required.in.filter : 'false'
  @sap.label : 'Color'
  @sap.quickinfo : 'Characteristic Value for Colors of Variants'
  ProductCharacteristic1 : String(18);
  @sap.required.in.filter : 'false'
  @sap.label : 'Main Size'
  @sap.quickinfo : 'Characteristic Value for Main Sizes of Variants'
  ProductCharacteristic2 : String(18);
  @sap.required.in.filter : 'false'
  @sap.label : 'Second Size'
  @sap.quickinfo : 'Characteristic Value for Second Size for Variants'
  ProductCharacteristic3 : String(18);
  @sap.required.in.filter : 'false'
  @sap.label : 'Base Unit of Measure'
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
  ProductDescription : String(40);
  @sap.required.in.filter : 'false'
  @sap.label : 'Operazione o fase'
  Operation_2 : String(4);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Gruppo di prodotti'
  @sap.quickinfo : 'Product Group'
  ProductGroup : String(9);
  @sap.required.in.filter : 'false'
  @sap.label : 'Work Center Text'
  BOOWorkCenterText : String(40);
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Work Center ID'
  @sap.quickinfo : 'Object ID'
  BOOWorkCenterInternalID : String(8);
  @sap.required.in.filter : 'false'
  @sap.label : 'User field indicator'
  @sap.quickinfo : 'User-defined field: Indicator for reports'
  FreeDefinedIndicator1 : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Theme'
  @sap.quickinfo : 'Fashion Theme'
  ProductTheme : String(10);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Business'
  zzbusi : String(2);
  to_ZZ1_CombPlnOrdersStock : Association to many ZZ1_COMBPLNORDERSSTOCKAPI_CDS.ZZ1_CombPlnOrdersStock {  };
};

