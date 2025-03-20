/* checksum : 6580b61cfc2b5e809b5e902491e6b2d5 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx pdf'
service planned_order {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Manage Master Planned Order'
entity planned_order.C_RFM_ManageCombinedPlndOrder {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Combined Planned Order'
  @sap.value.list : 'standard'
  key CombinedPlannedOrder : String(12) not null;
  @sap.display.format : 'UpperCase'
  @sap.text : 'MRPControllerName'
  @sap.label : 'MRP Controller'
  @sap.value.list : 'standard'
  MRPController : String(3);
  @sap.display.format : 'UpperCase'
  @sap.text : 'MRPPlantName'
  @sap.label : 'Planning Plant'
  @sap.value.list : 'standard'
  MRPPlant : String(4);
  @sap.display.format : 'UpperCase'
  @sap.text : 'PlannedOrderTypeName'
  @sap.label : 'Order Type'
  PlannedOrderType : String(4);
  @sap.display.format : 'UpperCase'
  @sap.text : 'PlannedOrderCategoryName'
  @sap.label : 'Order Category'
  PlannedOrderCategory : String(1);
  @sap.display.format : 'UpperCase'
  @sap.text : 'ProductionPlantName'
  @sap.label : 'Production Plant'
  @sap.value.list : 'standard'
  ProductionPlant : String(4);
  @sap.label : 'Type Name'
  @sap.quickinfo : 'Planned Order Type Name'
  PlannedOrderTypeName : String(60);
  @sap.label : 'Category Name'
  @sap.quickinfo : 'Planned Order Category Name'
  PlannedOrderCategoryName : String(60);
  @sap.label : 'Plant Name'
  ProductionPlantName : String(30);
  @sap.label : 'Plant Name'
  MRPPlantName : String(30);
  @sap.label : 'MRP Controller Name'
  MRPControllerName : String(18);
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Order Start Date'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  PlndOrderPlannedStartDate : Date;
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Order End Date'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  PlndOrderPlannedEndDate : Date;
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Order Opening Date'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  PlannedOrderOpeningDate : Date;
  @sap.label : 'Base Unit of Measure'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);
  @sap.unit : 'BaseUnit'
  @sap.label : 'Total Order Quantity'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  PlannedTotalQtyInBaseUnit : Decimal(13, 3);
  @sap.label : 'Planned Order Count'
  @sap.quickinfo : 'Number Of Planned Orders'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  NumberOfPlannedOrders : Integer;
  @sap.label : 'Master Planned Order Count'
  @sap.quickinfo : 'Number Of Master Planned Orders'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  NumberOfMasterPlannedOrders : Integer;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product'
  @sap.value.list : 'standard'
  Product : String(18);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Generic Product'
  @sap.value.list : 'standard'
  CrossPlantConfigurableProduct : String(18);
  @sap.display.format : 'UpperCase'
  @sap.label : 'MasterPlannedOrder'
  @sap.value.list : 'standard'
  MasterPlannedOrder : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Planned Order'
  @sap.value.list : 'standard'
  PlannedOrder : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Order'
  @sap.quickinfo : 'Sales Order Number'
  @sap.value.list : 'standard'
  SalesOrder : String(10);
  @sap.label : 'Number Of Planned Orders'
  @sap.quickinfo : 'Overall Firming Status'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  FirmingStatusPercent : Integer;
  @sap.label : 'Number Of Planned Orders'
  @sap.quickinfo : 'Overall Conversion Status'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ConversionStatusPercent : Integer;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product Group'
  @sap.value.list : 'standard'
  MaterialGroup : String(9);
  to_Component : Association to many planned_order.C_RFM_MngCombinedPlndOrdComp {  };
  to_Master : Association to many planned_order.C_RFM_ManageMasterPlndOrder {  };
  to_Order : Association to many planned_order.C_RFM_ManagePlndOrder {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.updatable.path : 'Update_mc'
@sap.label : 'Manage Master Planned Order'
entity planned_order.C_RFM_ManageMasterPlndOrder {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Master Planned Order'
  @sap.updatable : 'false'
  @sap.value.list : 'standard'
  key MasterPlannedOrder : String(12) not null;
  @sap.label : 'Dyn. Action Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  AssignMstrtoCombinedPlndOrd_ac : Boolean;
  @sap.label : 'Dyn. Action Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ConvertCombinedPlannedOrder_ac : Boolean;
  @sap.label : 'Dyn. Action Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ConvertMasterPlannedOrder_ac : Boolean;
  @sap.label : 'Dyn. Action Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  CreateCombinedPlannedOrder_ac : Boolean;
  @sap.label : 'Dyn. Action Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ScheduleMasterPlannedOrder_ac : Boolean;
  @sap.label : 'Dyn. Action Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  UnassignFromCombinedPlndOrd_ac : Boolean;
  @sap.label : 'Dyn. Method Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Update_mc : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Combined Planned Order'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.value.list : 'standard'
  CombinedPlannedOrder : String(12);
  @sap.display.format : 'UpperCase'
  @sap.text : 'MRPControllerName'
  @sap.label : 'MRP Controller'
  @sap.value.list : 'standard'
  MRPController : String(3);
  @sap.display.format : 'UpperCase'
  @sap.text : 'MRPPlantName'
  @sap.label : 'Planning Plant'
  @sap.value.list : 'standard'
  MRPPlant : String(4);
  @sap.display.format : 'UpperCase'
  @sap.text : 'PlannedOrderTypeName'
  @sap.label : 'Order Type'
  PlannedOrderType : String(4);
  @sap.display.format : 'UpperCase'
  @sap.text : 'PlannedOrderCategoryName'
  @sap.label : 'Order Category'
  PlannedOrderCategory : String(1);
  @sap.display.format : 'UpperCase'
  @sap.text : 'ProductionPlantName'
  @sap.label : 'Production Plant'
  @sap.value.list : 'standard'
  ProductionPlant : String(4);
  @sap.label : 'Type Name'
  @sap.quickinfo : 'Planned Order Type Name'
  PlannedOrderTypeName : String(60);
  @sap.label : 'Category Name'
  @sap.quickinfo : 'Planned Order Category Name'
  PlannedOrderCategoryName : String(60);
  @sap.label : 'Plant Name'
  ProductionPlantName : String(30);
  @sap.label : 'Plant Name'
  MRPPlantName : String(30);
  @sap.label : 'MRP Controller Name'
  MRPControllerName : String(18);
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Order Opening Date'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  PlannedOrderOpeningDate : Date;
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Order Start Date'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  PlndOrderPlannedStartDate : Date;
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Order End Date'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  PlndOrderPlannedEndDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.text : 'ProductName'
  @sap.label : 'Product'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.value.list : 'standard'
  Product : String(18);
  @sap.label : 'Material Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ProductName : String(40);
  @sap.display.format : 'UpperCase'
  @sap.text : 'FashionGenericMaterialName'
  @sap.label : 'Generic Product'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.value.list : 'standard'
  CrossPlantConfigurableProduct : String(18);
  @sap.label : 'Material Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  FashionGenericMaterialName : String(40);
  @sap.unit : 'BaseUnit'
  @sap.label : 'Total Order Quantity'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  PlannedTotalQtyInBaseUnit : Decimal(13, 3);
  @sap.label : 'Base Unit of Measure'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Planned Order'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.value.list : 'standard'
  PlannedOrder : String(10);
  @sap.label : 'Planned Order Count'
  @sap.quickinfo : 'Number Of Planned Orders'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  NumberOfPlannedOrders : Integer;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Order'
  @sap.quickinfo : 'Sales Order Number'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.value.list : 'standard'
  SalesOrder : String(10);
  @sap.label : 'Overall Firming Status'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  FirmingStatusPercent : Integer;
  @sap.label : 'Overall Conversion Status'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ConversionStatusPercent : Integer;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  GenericProductIsFilled : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product Group'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.value.list : 'standard'
  MaterialGroup : String(9);
  to_Component : Association to many planned_order.C_RFM_MngMasterPlndOrdComp {  };
  to_Order : Composition of many planned_order.C_RFM_ManagePlndOrder {  };
} actions {
  action AssignMstrtoCombinedPlndOrd(
    @sap.label : 'RunID Description'
    JobName : String(255),
    @sap.label : 'Master Order'
    CombinedPlannedOrder : String(12)
  ) returns planned_order.C_RFM_ManageMasterPlndOrder;
  action ConvertCombinedPlannedOrder(
    @sap.label : 'Enter Order Type:'
    OrderType : String(4),
    @sap.label : 'Enter Job Name:'
    JobName : String(255),
    @sap.label : 'Master Order'
    CombinedPlannedOrder : String(12)
  ) returns planned_order.C_RFM_ManageMasterPlndOrder;
  action ConvertMasterPlannedOrder(
    @sap.label : 'Enter Order Type:'
    OrderType : String(4),
    @sap.label : 'Enter Job Name:'
    JobName : String(255)
  ) returns planned_order.C_RFM_ManageMasterPlndOrder;
  action CreateCombinedPlannedOrder(
    @sap.label : 'Enter Job Name:'
    JobName : String(255)
  ) returns planned_order.C_RFM_ManageMasterPlndOrder;
  action ScheduleMasterPlannedOrder(
    @sap.label : 'Enter Job Name:'
    JobName : String(255)
  ) returns planned_order.C_RFM_ManageMasterPlndOrder;
  action UnassignFromCombinedPlndOrd(
    @sap.label : 'RunID Description'
    JobName : String(255),
    @sap.label : 'Master Order'
    CombinedPlannedOrder : String(12)
  ) returns planned_order.C_RFM_ManageMasterPlndOrder;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.updatable.path : 'Update_mc'
@sap.label : 'Master Planned Order'
entity planned_order.C_RFM_ManagePlndOrder {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Planned Order'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.value.list : 'standard'
  key PlannedOrder : String(10) not null;
  @sap.label : 'Dyn. Action Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  AssignToMasterPlndOrd_ac : Boolean;
  @sap.label : 'Dyn. Action Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ConvertPartiallyMasterPlanned_ac : Boolean;
  @sap.label : 'Dyn. Action Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  CreateMasterPlannedOrder_ac : Boolean;
  @sap.label : 'Dyn. Action Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  UnassignFromMasterPlndOrd_ac : Boolean;
  @sap.label : 'Dyn. Method Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Update_mc : Boolean;
  @sap.label : 'Type Name'
  @sap.quickinfo : 'Planned Order Type Name'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PlannedOrderTypeName : String(60);
  @sap.label : 'Base Unit of Measure'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);
  @sap.display.format : 'UpperCase'
  @sap.text : 'MaterialName'
  @sap.label : 'Product'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.value.list : 'standard'
  Product : String(18);
  @sap.label : 'Material Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MaterialName : String(40);
  @sap.display.format : 'UpperCase'
  @sap.text : 'PlannedOrderTypeName'
  @sap.label : 'Planned Order Type'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PlannedOrderType : String(4);
  @sap.unit : 'BaseUnit'
  @sap.label : 'Total Order Quantity'
  @sap.quickinfo : 'Planned Total Order Quantity'
  PlannedTotalQtyInBaseUnit : Decimal(13, 3);
  @sap.display.format : 'UpperCase'
  @sap.text : 'PlannedOrderCategoryName'
  @sap.label : 'Planned Order Category'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PlannedOrderCategory : String(1);
  @sap.display.format : 'NonNegative'
  @sap.label : 'BOM Status'
  @sap.quickinfo : 'Bill of Material Status'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  BillOfMaterialStatus : String(2);
  @sap.label : 'Conversion Indicator'
  @sap.quickinfo : 'Planned Order Conversion Indicator'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PlannedOrderIsConvertible : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.text : 'MRPPlantName'
  @sap.label : 'Planning Plant'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.value.list : 'standard'
  MRPPlant : String(4);
  @sap.display.format : 'UpperCase'
  @sap.text : 'MRPAreaText'
  @sap.label : 'MRP Area'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MRPArea : String(10);
  @sap.display.format : 'UpperCase'
  @sap.text : 'ProductionPlantName'
  @sap.label : 'Production Plant'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.value.list : 'standard'
  ProductionPlant : String(4);
  @sap.display.format : 'UpperCase'
  @sap.text : 'MRPControllerName'
  @sap.label : 'MRP Controller'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.value.list : 'standard'
  MRPController : String(3);
  @sap.display.format : 'UpperCase'
  @sap.text : 'MaterialProcurementCatName'
  @sap.label : 'Procurement Category'
  @sap.quickinfo : 'Material Procurement Category'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MaterialProcurementCategory : String(1);
  @sap.label : 'Firmed'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PlannedOrderIsFirm : Boolean;
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Order Opening Date'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PlannedOrderOpeningDate : Date;
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Order Start Date'
  PlndOrderPlannedStartDate : Date;
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Order End Date'
  PlndOrderPlannedEndDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Production Supervisor'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductionSupervisor : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Production Version'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductionVersion : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Master Planned Order'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.value.list : 'standard'
  MasterPlannedOrder : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Combined Planned Order'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.value.list : 'standard'
  CombinedPlannedOrder : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Stock Segment'
  StockSegment : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Season Year'
  ProductSeasonYear : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Season'
  ProductSeason : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Collection'
  @sap.quickinfo : 'Fashion Collection'
  ProductCollection : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Theme'
  @sap.quickinfo : 'Fashion Theme'
  ProductTheme : String(10);
  @sap.display.format : 'UpperCase'
  @sap.text : 'FashionGenericMaterialName'
  @sap.label : 'Generic Product'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.value.list : 'standard'
  CrossPlantConfigurableProduct : String(18);
  @sap.label : 'Product Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  FashionGenericMaterialName : String(40);
  @sap.label : 'Product Characteristic 1'
  @sap.quickinfo : 'Characteristic Value for Colors of Variants'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductCharacteristic1 : String(18);
  @sap.label : 'Product Characteristic 2'
  @sap.quickinfo : 'Characteristic Value for Main Sizes of Variants'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductCharacteristic2 : String(18);
  @sap.label : 'Product Characteristic 3'
  @sap.quickinfo : 'Characteristic Value for Second Size for Variants'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductCharacteristic3 : String(18);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Order'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.value.list : 'standard'
  SalesOrder : String(10);
  @sap.display.format : 'UpperCase'
  @sap.text : 'ProductCategoryName'
  @sap.label : 'Product Category'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductCategory : String(2);
  @sap.display.format : 'UpperCase'
  @sap.text : 'ProductGroupName'
  @sap.label : 'Product Group'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.value.list : 'standard'
  MaterialGroup : String(9);
  @sap.display.format : 'UpperCase'
  @sap.text : 'ProductTypeName'
  @sap.label : 'Product Type'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductType : String(4);
  @sap.label : 'Product Category Text'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductCategoryName : String(60);
  @sap.label : 'Prod Grp Desc.'
  @sap.quickinfo : 'Product Group Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductGroupName : String(20);
  @sap.label : 'Product Type Description'
  @sap.quickinfo : 'Description of product type'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductTypeName : String(25);
  @sap.label : 'Category Name'
  @sap.quickinfo : 'Planned Order Category Name'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PlannedOrderCategoryName : String(60);
  @sap.label : 'Plant Name'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductionPlantName : String(30);
  @sap.label : 'Category Name'
  @sap.quickinfo : 'Material Procurement Category Name'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MaterialProcurementCatName : String(60);
  @sap.label : 'Plant Name'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MRPPlantName : String(30);
  @sap.label : 'MRP Area Text'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MRPAreaText : String(40);
  @sap.label : 'MRP Controller Name'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MRPControllerName : String(18);
  @sap.display.format : 'Date'
  @sap.label : 'Scheduled Start'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ScheduledBasicStartDate : Date;
  @sap.display.format : 'Date'
  @sap.label : 'Scheduled Finish'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ScheduledBasicEndDate : Date;
  @sap.display.format : 'Date'
  @sap.label : 'Scheduled On'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  LastScheduledDate : Date;
  to_Master : Association to planned_order.C_RFM_ManageMasterPlndOrder {  };
} actions {
  action AssignToMasterPlndOrd(
    @sap.label : 'RunID Description'
    JobName : String(255),
    @sap.label : 'Master Order'
    MasterPlannedOrder : String(12)
  ) returns planned_order.C_RFM_ManagePlndOrder;
  action ConvertPartiallyMasterPlanned(
    @sap.label : 'Master Order'
    MasterPlannedOrder : String(12),
    @sap.label : 'Enter Order Type:'
    OrderType : String(4),
    @sap.label : 'Enter Job Name:'
    JobName : String(255),
    @sap.label : 'Total Order Quantity'
    PlannedTotalQty : Decimal(13, 3),
    @sap.label : 'Base Unit of Measure'
    BaseUnit : String(3)
  ) returns planned_order.C_RFM_ManagePlndOrder;
  action CreateMasterPlannedOrder(
    @sap.label : 'Enter Job Name:'
    JobName : String(255)
  ) returns planned_order.C_RFM_ManagePlndOrder;
  action UnassignFromMasterPlndOrd(
    @sap.label : 'RunID Description'
    JobName : String(255),
    @sap.label : 'Master Order'
    MasterPlannedOrder : String(12)
  ) returns planned_order.C_RFM_ManagePlndOrder;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Manage Master Planned Order'
entity planned_order.C_RFM_MngCombinedPlndOrdComp {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Combined Plnd. Order'
  @sap.quickinfo : 'Combined Master Planned Order'
  key CombinedPlannedOrder : String(12) not null;
  @sap.display.format : 'UpperCase'
  @sap.text : 'MaterialName'
  @sap.label : 'Product'
  key Material : String(18) not null;
  @sap.label : 'Material Description'
  MaterialName : String(40);
  @sap.display.format : 'Date'
  @sap.label : 'Requirement Date'
  MatlCompRequirementDate : Date;
  @sap.unit : 'BaseUnit'
  @sap.label : 'Total Quantity'
  RequiredQuantity : Decimal(13, 3);
  @sap.label : 'Base Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Storage Location'
  StorageLocation : String(4);
  @sap.unit : 'BaseUnit'
  @sap.label : 'Consumed'
  WithdrawnQuantity : Decimal(13, 3);
  @sap.display.format : 'UpperCase'
  @sap.text : 'PlantName'
  @sap.label : 'Plant'
  Plant : String(4);
  @sap.display.format : 'UpperCase'
  @sap.text : 'MRPControllerName'
  @sap.label : 'MRP Controller'
  MRPController : String(3);
  @sap.label : 'Product Characteristic 1'
  @sap.quickinfo : 'Characteristic Value for Colors of Variants'
  ProductCharacteristic1 : String(18);
  @sap.label : 'Product Characteristic 2'
  @sap.quickinfo : 'Characteristic Value for Main Sizes of Variants'
  ProductCharacteristic2 : String(18);
  @sap.label : 'Product Characteristic 3'
  @sap.quickinfo : 'Characteristic Value for Second Size for Variants'
  ProductCharacteristic3 : String(18);
  @sap.label : 'Plant Name'
  PlantName : String(30);
  @sap.label : 'MRP Controller Name'
  MRPControllerName : String(18);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Master Planned Order Components'
entity planned_order.C_RFM_MngMasterPlndOrdComp {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Master Plnd Ord.'
  @sap.quickinfo : 'Master Planned Order Number'
  key MasterPlannedOrder : String(12) not null;
  @sap.display.format : 'UpperCase'
  @sap.text : 'MaterialName'
  @sap.label : 'Product'
  key Material : String(18) not null;
  @sap.label : 'Material Description'
  MaterialName : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Combined Plnd. Order'
  @sap.quickinfo : 'Combined Master Planned Order'
  CombinedPlannedOrder : String(12);
  @sap.display.format : 'Date'
  @sap.label : 'Requirement Date'
  MatlCompRequirementDate : Date;
  @sap.unit : 'BaseUnit'
  @sap.label : 'Total Quantity'
  RequiredQuantity : Decimal(13, 3);
  @sap.label : 'Base Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Storage Location'
  StorageLocation : String(4);
  @sap.unit : 'BaseUnit'
  @sap.label : 'Consumed'
  WithdrawnQuantity : Decimal(13, 3);
  @sap.display.format : 'UpperCase'
  @sap.text : 'PlantName'
  @sap.label : 'Plant'
  Plant : String(4);
  @sap.display.format : 'UpperCase'
  @sap.text : 'MRPControllerName'
  @sap.label : 'MRP Controller'
  MRPController : String(3);
  @sap.label : 'Product Characteristic 1'
  @sap.quickinfo : 'Characteristic Value for Colors of Variants'
  ProductCharacteristic1 : String(18);
  @sap.label : 'Product Characteristic 2'
  @sap.quickinfo : 'Characteristic Value for Main Sizes of Variants'
  ProductCharacteristic2 : String(18);
  @sap.label : 'Product Characteristic 3'
  @sap.quickinfo : 'Characteristic Value for Second Size for Variants'
  ProductCharacteristic3 : String(18);
  @sap.label : 'Plant Name'
  PlantName : String(30);
  @sap.label : 'MRP Controller Name'
  MRPControllerName : String(18);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Manufacturing Order Type Value Help'
entity planned_order.I_MfgOrderTypeVH {
  @sap.display.format : 'UpperCase'
  @sap.text : 'ManufacturingOrderTypeName'
  @sap.label : 'Order Type'
  @sap.quickinfo : 'Manufacturing Order Type'
  key ManufacturingOrderType : String(4) not null;
  @sap.label : 'Order Type Name'
  @sap.quickinfo : 'Manufacturing Order Type Name'
  ManufacturingOrderTypeName : String(40);
};

@cds.external : true
@cds.persistence.skip : true
@sap.content.version : '1'
entity planned_order.SAP__Currencies {
  @sap.label : 'Currency'
  @sap.semantics : 'currency-code'
  key CurrencyCode : String(5) not null;
  @sap.label : 'ISO code'
  ISOCode : String(3) not null;
  @sap.label : 'Short text'
  Text : String(15) not null;
  @odata.Type : 'Edm.Byte'
  @sap.label : 'Decimals'
  DecimalPlaces : Integer not null;
};

@cds.external : true
@cds.persistence.skip : true
@sap.content.version : '1'
entity planned_order.SAP__UnitsOfMeasure {
  @sap.label : 'Internal UoM'
  @sap.semantics : 'unit-of-measure'
  key UnitCode : String(3) not null;
  @sap.label : 'ISO Code'
  ISOCode : String(3) not null;
  @sap.label : 'Commercial'
  ExternalCode : String(3) not null;
  @sap.label : 'Meas. Unit Text'
  Text : String(30) not null;
  @sap.label : 'Decimal Places'
  DecimalPlaces : Integer;
};

@cds.external : true
@cds.persistence.skip : true
@sap.content.version : '1'
entity planned_order.SAP__MyDocumentDescriptions {
  @sap.label : 'UUID'
  key Id : UUID not null;
  CreatedBy : String(12) not null;
  @odata.Type : 'Edm.DateTime'
  @sap.label : 'Time Stamp'
  CreatedAt : DateTime not null;
  FileName : String(256) not null;
  Title : String(256) not null;
  Format : Association to planned_order.SAP__FormatSet {  };
  TableColumns : Association to many planned_order.SAP__TableColumnsSet {  };
  CoverPage : Association to many planned_order.SAP__CoverPageSet {  };
  Signature : Association to planned_order.SAP__SignatureSet {  };
  PDFStandard : Association to planned_order.SAP__PDFStandardSet {  };
  Hierarchy : Association to planned_order.SAP__HierarchySet {  };
  Header : Association to planned_order.SAP__PDFHeaderSet {  };
  Footer : Association to planned_order.SAP__PDFFooterSet {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.pageable : 'false'
@sap.addressable : 'false'
@sap.content.version : '1'
entity planned_order.SAP__FormatSet {
  @sap.label : 'UUID'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Id : UUID not null;
  FitToPage : planned_order.SAP__FitToPage not null;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  FontSize : Integer not null;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Orientation : String(10) not null;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  PaperSize : String(10) not null;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  BorderSize : Integer not null;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  MarginSize : Integer not null;
  @sap.label : 'Font Name'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  FontName : String(255) not null;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Padding : Integer not null;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.pageable : 'false'
@sap.addressable : 'false'
@sap.content.version : '1'
entity planned_order.SAP__PDFStandardSet {
  @sap.label : 'UUID'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Id : UUID not null;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  UsePDFAConformance : Boolean not null;
  @sap.label : 'Indicator'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  DoEnableAccessibility : Boolean not null;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.pageable : 'false'
@sap.addressable : 'false'
@sap.content.version : '1'
entity planned_order.SAP__TableColumnsSet {
  @sap.label : 'UUID'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Id : UUID not null;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Name : String(256) not null;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Header : String(256) not null;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  HorizontalAlignment : String(10) not null;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.pageable : 'false'
@sap.addressable : 'false'
@sap.content.version : '1'
entity planned_order.SAP__CoverPageSet {
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Title : String(256) not null;
  @sap.label : 'UUID'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Id : UUID not null;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Name : String(256) not null;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Value : String(256) not null;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.pageable : 'false'
@sap.addressable : 'false'
@sap.content.version : '1'
entity planned_order.SAP__SignatureSet {
  @sap.label : 'UUID'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Id : UUID not null;
  @sap.label : 'Indicator'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  DoSign : Boolean not null;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Reason : String(256) not null;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.pageable : 'false'
@sap.addressable : 'false'
@sap.content.version : '1'
entity planned_order.SAP__HierarchySet {
  @sap.label : 'UUID'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Id : UUID not null;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  DistanceFromRootElement : String(256) not null;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  DrillStateElement : String(256) not null;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.pageable : 'false'
@sap.addressable : 'false'
@sap.content.version : '1'
entity planned_order.SAP__PDFHeaderSet {
  @sap.label : 'UUID'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Id : UUID not null;
  Right : planned_order.SAP__HeaderFooterField not null;
  Left : planned_order.SAP__HeaderFooterField not null;
  Center : planned_order.SAP__HeaderFooterField not null;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.pageable : 'false'
@sap.addressable : 'false'
@sap.content.version : '1'
entity planned_order.SAP__PDFFooterSet {
  @sap.label : 'UUID'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key Id : UUID not null;
  Right : planned_order.SAP__HeaderFooterField not null;
  Left : planned_order.SAP__HeaderFooterField not null;
  Center : planned_order.SAP__HeaderFooterField not null;
};

@cds.external : true
@cds.persistence.skip : true
@sap.content.version : '1'
entity planned_order.SAP__ValueHelpSet {
  key VALUEHELP : LargeString not null;
  FIELD_VALUE : String(10) not null;
  DESCRIPTION : LargeString;
};

@cds.external : true
type planned_order.SAP__FitToPage {
  @sap.label : 'Error behavior'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ErrorRecoveryBehavior : String(8) not null;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  IsEnabled : Boolean not null;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  MinimumFontSize : Integer not null;
};

@cds.external : true
type planned_order.SAP__HeaderFooterField {
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Type : String(256) not null;
};

