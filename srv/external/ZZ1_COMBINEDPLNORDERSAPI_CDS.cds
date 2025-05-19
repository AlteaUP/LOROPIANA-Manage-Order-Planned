/* checksum : cb8eb07c9128bb7b2da92c30c63c65c2 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZZ1_COMBINEDPLNORDERSAPI_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Plant'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.I_Plant {
  @sap.display.format : 'UpperCase'
  @sap.text : 'PlantName'
  @sap.label : 'Plant'
  key Plant : String(4) not null;
  @sap.label : 'Plant Name'
  PlantName : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Valuation Area'
  ValuationArea : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Customer No Plant'
  @sap.quickinfo : 'Customer Number of Plant'
  PlantCustomer : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sppl. No. Plnt'
  @sap.quickinfo : 'Supplier Number of Plant'
  PlantSupplier : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Factory Calendar'
  @sap.quickinfo : 'Factory calendar key'
  FactoryCalendar : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Purch. Organization'
  @sap.quickinfo : 'Purchasing Organization'
  DefaultPurchasingOrganization : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sls Organization ICB'
  @sap.quickinfo : 'Sales Organization for Intercompany Billing'
  SalesOrganization : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Address'
  AddressID : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant Cat.'
  @sap.quickinfo : 'Plant category'
  PlantCategory : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Distrib.Channel'
  @sap.quickinfo : 'Distribution Channel for Intercompany billing'
  DistributionChannel : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Interco. Billing Div'
  @sap.quickinfo : 'Division for Intercompany Billing'
  Division : String(2);
  @sap.label : 'Language Key'
  Language : String(2);
  @sap.label : 'Archiving Flag'
  @sap.quickinfo : 'Central archiving marker for master record'
  IsMarkedForArchiving : Boolean;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Storage Location'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.I_StorageLocation {
  @sap.display.format : 'UpperCase'
  @sap.text : 'to_Plant/PlantName'
  @sap.label : 'Plant'
  @sap.value.list : 'standard'
  key Plant : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.text : 'StorageLocationName'
  @sap.label : 'Storage Location'
  key StorageLocation : String(4) not null;
  @sap.label : 'Storage Loc. Name'
  @sap.quickinfo : 'Storage Location Name'
  StorageLocationName : String(16);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Organization'
  SalesOrganization : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Distribution Channel'
  DistributionChannel : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Division'
  Division : String(2);
  @sap.label : 'Authorization check'
  @sap.quickinfo : 'Storage location authorization for goods movements active'
  IsStorLocAuthznCheckActive : Boolean;
  @sap.label : 'HU reqmnt'
  @sap.quickinfo : 'Handling unit requirement'
  HandlingUnitIsRequired : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Validity'
  @sap.quickinfo : 'Deprecated Entries'
  ConfigDeprecationCode : String(1);
  to_Plant : Association to ZZ1_COMBINEDPLNORDERSAPI_CDS.I_Plant {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Combined Planned Orders API'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_CombinedPlnOrdersAPI {
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
  @sap.label : 'Planned Order Type'
  PlannedOrderType : String(4);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Planned Order Category'
  PlannedOrderCategory : String(1);
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'LastChangeDate'
  LastChangeDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Planning Plant'
  MRPPlant : String(4);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'MRP Area'
  MRPArea : String(10);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'MRP Controller'
  MRPController : String(3);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Procurement Category'
  @sap.quickinfo : 'Material Procurement Category'
  MaterialProcurementCategory : String(1);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Procurement Type'
  @sap.quickinfo : 'Material Procurement Type'
  MaterialProcurementType : String(1);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Storage Location'
  StorageLocation : String(4);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'BOO Type'
  @sap.quickinfo : 'Bill of Operations Type'
  BillOfOperationsType : String(1);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Bill of Operations'
  @sap.quickinfo : 'Bill of Operations ID'
  BillOfOperations : String(8);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'BOO Group'
  @sap.quickinfo : 'Bill of Operations Group'
  BillOfOperationsGroup : String(8);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'BOO Variant'
  @sap.quickinfo : 'Bill of Operations Variant'
  BillOfOperationsVariant : String(2);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Alternative BOM'
  BillOfMaterialVariant : String(2);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'BOM Usage'
  BillOfMaterialVariantUsage : String(1);
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'BOM Status'
  @sap.quickinfo : 'Bill of Material Status'
  BillOfMaterialStatus : String(2);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'BOM Version'
  BillOfMaterialVersion : String(4);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Production Plant'
  ProductionPlant : String(4);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Production Supervisor'
  ProductionSupervisor : String(3);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Production Version'
  ProductionVersion : String(4);
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'PlndOrderPlannedStartDate'
  PlndOrderPlannedStartDate : Date;
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'PlndOrderPlannedEndDate'
  PlndOrderPlannedEndDate : Date;
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'PlannedOrderOpeningDate'
  PlannedOrderOpeningDate : Date;
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'PlndOrderTotalCmtmtDate'
  PlndOrderTotalCmtmtDate : Date;
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'ProductionStartDate'
  ProductionStartDate : Date;
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'ProductionEndDate'
  ProductionEndDate : Date;
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'PlndOrderBaseToEntryQtyNmrtr'
  PlndOrderBaseToEntryQtyNmrtr : Decimal(5, 0);
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'PlndOrderBaseToEntryQtyDnmntr'
  PlndOrderBaseToEntryQtyDnmntr : Decimal(5, 0);
  @sap.required.in.filter : 'false'
  @sap.label : 'Base Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'PlannedTotalQtyInBaseUnit'
  PlannedTotalQtyInBaseUnit : Decimal(13, 3);
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'RequirementQuantityInBaseUnit'
  RequirementQuantityInBaseUnit : Decimal(13, 3);
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'QuantityWithdrawnInBaseUnit'
  QuantityWithdrawnInBaseUnit : Decimal(13, 3);
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'PlndOrderCommittedQty'
  PlndOrderCommittedQty : Decimal(13, 3);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Season'
  ProductSeason : String(10);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Collection'
  @sap.quickinfo : 'Fashion Collection'
  ProductCollection : String(10);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Season Year'
  ProductSeasonYear : String(4);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Theme'
  @sap.quickinfo : 'Fashion Theme'
  ProductTheme : String(10);
  @sap.required.in.filter : 'false'
  @sap.label : 'Product Description'
  ProductDescription : String(40);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Product'
  @sap.quickinfo : 'Product Number'
  Product : String(40);
  @sap.required.in.filter : 'false'
  @sap.label : 'Order type'
  ZZ1_MFI_CR_TYPE_PLA : String(3);
  @sap.required.in.filter : 'false'
  @sap.label : 'Order Personalization'
  ZZ1_MFI_CRORDER_PERSON_PLA : String(20);
  to_ZZ1_CombinPlannedOrdersCom : Association to many ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_CombinPlannedOrdersCom {  };
  to_ZZ1_MasterPlannedOrders : Association to many ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_MasterPlannedOrders {  };
  to_ZZ1_PlannedOrdersCompChar : Association to many ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_PlannedOrdersCompChar {  };
  to_ZZ1_PLOCAPACITYCORD : Association to many ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_PLOCAPACITYCORD {  };
  to_ZZ1_PLOCAPACITYCORD_TEXT : Association to ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_PLOCAPACITYCORD {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Combined Planned Orders Com'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_CombinPlannedOrdersCom {
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
  @sap.text : 'to_StorageLocation/StorageLocationName'
  @sap.label : 'Storage Location'
  @sap.value.list : 'standard'
  key StorageLocation : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Batch'
  @sap.quickinfo : 'Batch Number'
  key Batch : String(10) not null;
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'MatlCompRequirementDate'
  MatlCompRequirementDate : Date;
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'BOM Item'
  @sap.quickinfo : 'Bill of Material Item'
  BOMItem : String(8);
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
  to_StorageLocation : Association to ZZ1_COMBINEDPLNORDERSAPI_CDS.I_StorageLocation {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Master Planned Orders'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_MasterPlannedOrders {
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Master Plnd Ord.'
  @sap.quickinfo : 'Master Planned Order Number'
  key FshMplndOrd : String(12) not null;
  @sap.required.in.filter : 'false'
  @sap.label : 'Base Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'PlannedTotalQtyInBaseUnit'
  PlannedTotalQtyInBaseUnit : Decimal(13, 3);
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'RequirementQuantityInBaseUnit'
  RequirementQuantityInBaseUnit : Decimal(13, 3);
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'QuantityWithdrawnInBaseUnit'
  QuantityWithdrawnInBaseUnit : Decimal(13, 3);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Combined Plnd. Order'
  @sap.quickinfo : 'Combined Master Planned Order'
  CplndOrd : String(12);
  @sap.required.in.filter : 'false'
  @sap.label : 'Product Description'
  ProductDescription : String(40);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Planned Order Component Characteristic'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_PlannedOrdersCompChar {
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
  MatlWrhsStkQtyInMatlBaseUnit : Decimal(31, 14);
  @sap.required.in.filter : 'false'
  @sap.unit : 'MaterialBaseUnit'
  @sap.label : 'MatlCnsmpnQtyInMatlBaseUnit'
  MatlCnsmpnQtyInMatlBaseUnit : Decimal(31, 14);
  @sap.required.in.filter : 'false'
  @sap.unit : 'MaterialBaseUnit'
  @sap.label : 'MatlStkIncrQtyInMatlBaseUnit'
  MatlStkIncrQtyInMatlBaseUnit : Decimal(31, 14);
  @sap.required.in.filter : 'false'
  @sap.unit : 'MaterialBaseUnit'
  @sap.label : 'MatlStkDecrQtyInMatlBaseUnit'
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
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Capacity Aggregation by Combined PLO'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_PLOCAPACITYCORD {
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Combined Plnd. Order'
  @sap.quickinfo : 'Combined Master Planned Order'
  key CombinedMasterOrder : String(12) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Sequence'
  key Sequence : String(6) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Operation or Phase'
  @sap.quickinfo : 'Operation or Phase Number'
  key Operation : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Suboperation or Secondary Resource'
  @sap.quickinfo : 'Sub-Operation or Secondary Resource Number'
  key SubOperation : String(4) not null;
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Work Center ID'
  WorkCenterInternalID : String(8);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Work Center Type'
  WorkCenterType : String(2);
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Capacity ID'
  CapacityInternalID : String(8);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Capacity Category'
  CapacityCategory : String(3);
  @sap.required.in.filter : 'false'
  @sap.label : 'Operation Short Text'
  OperationText : String(40);
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'OperationLatestStartDate'
  OperationLatestStartDate : Date;
  @sap.required.in.filter : 'false'
  @sap.label : 'Capacity Unit'
  @sap.quickinfo : 'Unit of Measure for Capacity Requirements'
  @sap.semantics : 'unit-of-measure'
  CapacityRequirementUnit : String(3);
  @sap.required.in.filter : 'false'
  @sap.unit : 'CapacityRequirementUnit'
  @sap.label : 'ScheduledCapReqOpSegSetupDurn'
  ScheduledCapReqOpSegSetupDurn : Double;
  @sap.required.in.filter : 'false'
  @sap.unit : 'CapacityRequirementUnit'
  @sap.label : 'RemainingCapReqOpSegSetupDurn'
  RemainingCapReqOpSegSetupDurn : Double;
  @sap.required.in.filter : 'false'
  @sap.unit : 'CapacityRequirementUnit'
  @sap.label : 'ScheduledCapReqOpSegProcgDurn'
  ScheduledCapReqOpSegProcgDurn : Double;
  @sap.required.in.filter : 'false'
  @sap.unit : 'CapacityRequirementUnit'
  @sap.label : 'RemainingCapReqOpSegProcgDurn'
  RemainingCapReqOpSegProcgDurn : Double;
  @sap.required.in.filter : 'false'
  @sap.unit : 'CapacityRequirementUnit'
  @sap.label : 'ScheduledCapReqOpSegTrdwnDurn'
  ScheduledCapReqOpSegTrdwnDurn : Double;
  @sap.required.in.filter : 'false'
  @sap.unit : 'CapacityRequirementUnit'
  @sap.label : 'RemainingCapReqOpSegTrdwnDurn'
  RemainingCapReqOpSegTrdwnDurn : Double;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'BOO Group'
  @sap.quickinfo : 'Key for Task List Group'
  BillOfOperationsGroup : String(8);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'BOO Type'
  @sap.quickinfo : 'Task List Type'
  BillOfOperationsType : String(1);
  @sap.required.in.filter : 'false'
  @sap.label : 'User field indicator'
  @sap.quickinfo : 'User-defined field: Indicator for reports'
  FreeDefinedIndicator1 : Boolean;
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Object ID'
  BOOWorkCenterInternalID : String(8);
  @sap.required.in.filter : 'false'
  @sap.label : 'Work Center Text'
  BOOWorkCenterText : String(40);
};

