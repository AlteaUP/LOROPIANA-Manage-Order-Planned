/* checksum : 94afee6017e5827f9537e48c8077da32 */
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
@sap.content.version : '1'
@sap.label : 'Combined Order Operation Component'
entity planned_order.C_RFM_CmbndMfgOrdOpComponents {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Combined Prod. Order'
  @sap.quickinfo : 'Combined Master Production Order'
  key CombinedProductionOrder : String(12) not null;
  @sap.display.format : 'UpperCase'
  @sap.text : 'MaterialName'
  @sap.label : 'Product'
  key Material : String(18) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Production Plant'
  ProductionPlant : String(4);
  @sap.display.format : 'UpperCase'
  @sap.text : 'Plant_Text'
  @sap.label : 'Plant'
  Plant : String(4);
  @sap.label : 'Plant Name'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  Plant_Text : String(30);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Order Category'
  @sap.quickinfo : 'Manufacturing Order Category'
  ManufacturingOrderCategory : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Order Type'
  @sap.quickinfo : 'Manufacturing Order Type'
  ManufacturingOrderType : String(4);
  @sap.label : 'Base Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);
  @sap.label : 'Unit of Entry'
  @sap.quickinfo : 'Unit of entry'
  @sap.semantics : 'unit-of-measure'
  EntryUnit : String(3);
  @sap.unit : 'BaseUnit'
  @sap.label : 'Total Quantity'
  RequiredQuantity : Decimal(13, 3);
  @sap.unit : 'BaseUnit'
  @sap.label : 'Consumed'
  WithdrawnQuantity : Decimal(13, 3);
  @sap.unit : 'BaseUnit'
  @sap.label : 'Uncovered'
  UncoveredQuantity : Decimal(14, 3);
  @sap.unit : 'BaseUnit'
  @sap.label : 'Committed'
  ConfirmedAvailableQuantity : Decimal(16, 3);
  @sap.unit : 'BaseUnit'
  @sap.label : 'Open Quantity'
  OpenQuantity : Decimal(14, 3);
  @sap.label : 'Missing Component'
  MaterialComponentIsMissing : Boolean;
  @sap.display.format : 'Date'
  @sap.label : 'Requirement Date'
  MatlCompRequirementDate : Date;
  @sap.unit : 'EntryUnit'
  @sap.label : 'Quantity in Unit of Entry'
  GoodsMovementEntryQty : Decimal(13, 3);
  @sap.unit : 'BaseUnit'
  @sap.label : 'Missing Quantity'
  MissingQuantity : Decimal(16, 3);
  @sap.label : 'Product Name'
  MaterialName : String(40);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Manage Combined Manufacturing Order'
entity planned_order.C_RFM_ManageCombinedMfgOrder {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Combined Production Order'
  key CombinedProductionOrder : String(12) not null;
  @sap.display.format : 'NonNegative'
  ManufacturingOrderCategory : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Order Type'
  ManufacturingOrderType : String(4);
  @sap.display.format : 'UpperCase'
  @sap.text : 'PlantName'
  @sap.label : 'Production Plant'
  ProductionPlant : String(4);
  @sap.label : 'Production Plant Name'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  PlantName : String(30);
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Scheduled Start'
  @sap.quickinfo : 'Scheduled Start Date'
  @sap.sortable : 'false'
  MfgOrderScheduledStartDate : Date;
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Scheduled End'
  @sap.quickinfo : 'Scheduled End Date'
  @sap.sortable : 'false'
  MfgOrderScheduledEndDate : Date;
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Actual Start'
  @sap.quickinfo : 'Actual Start Date'
  @sap.sortable : 'false'
  MfgOrderActualStartDate : Date;
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Actual End'
  @sap.quickinfo : 'Actual End Date'
  @sap.sortable : 'false'
  MfgOrderActualEndDate : Date;
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Confirmed End'
  @sap.quickinfo : 'Confirmed End Date'
  @sap.sortable : 'false'
  MfgOrderConfirmedEndDate : Date;
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Planned Start'
  @sap.quickinfo : 'Planned Start Date'
  @sap.sortable : 'false'
  MfgOrderPlannedStartDate : Date;
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Planned End'
  @sap.quickinfo : 'Planned End Date'
  @sap.sortable : 'false'
  MfgOrderPlannedEndDate : Date;
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Planned Release Date'
  @sap.sortable : 'false'
  MfgOrderPlannedReleaseDate : Date;
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Scheduled Release Date'
  @sap.sortable : 'false'
  MfgOrderScheduledReleaseDate : Date;
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Actual Release Date'
  @sap.sortable : 'false'
  MfgOrderActualReleaseDate : Date;
  @sap.label : 'Production Unit'
  @sap.quickinfo : 'Production Unit of Measure'
  @sap.sortable : 'false'
  @sap.semantics : 'unit-of-measure'
  ProductionUnit : String(3);
  @sap.unit : 'ProductionUnit'
  @sap.label : 'Total Quantity'
  @sap.quickinfo : 'Planned Total Quantity'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  MfgOrderPlannedTotalQty : Decimal(13, 3);
  @sap.unit : 'ProductionUnit'
  @sap.label : 'Scrap Quantity'
  @sap.quickinfo : 'Planned Scrap Quantity'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  MfgOrderPlannedScrapQty : Decimal(13, 3);
  @sap.unit : 'ProductionUnit'
  @sap.label : 'Planned Yield'
  @sap.quickinfo : 'Planned Yield Quantity'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  MfgOrderPlannedYieldQty : Decimal(13, 3);
  @sap.unit : 'ProductionUnit'
  @sap.label : 'Confirmed Yield'
  @sap.quickinfo : 'Confirmed Yield Quantity From Order Confirmation'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  MfgOrderConfirmedYieldQty : Decimal(13, 3);
  @sap.unit : 'ProductionUnit'
  @sap.label : 'Confirmed Scrap'
  @sap.quickinfo : 'Confirmed Scrap Quantity From Order Confirmation'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  MfgOrderConfirmedScrapQty : Decimal(13, 3);
  @sap.unit : 'ProductionUnit'
  @sap.label : 'Confirmed Rework'
  @sap.quickinfo : 'Total Confirmed Rework Quantity'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  MfgOrderConfirmedReworkQty : Decimal(13, 3);
  @sap.unit : 'ProductionUnit'
  @sap.label : 'Goods Receipt Quantity'
  @sap.quickinfo : 'Quantity of Goods Received for the Order Item'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ActualDeliveredQuantity : Decimal(13, 3);
  @sap.unit : 'ProductionUnit'
  @sap.label : 'Open Quantity'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  OrderOpenQuantity : Decimal(13, 3);
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  OrderIsCreated : String(1);
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  OrderIsReleased : String(1);
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  OrderIsPartiallyReleased : String(1);
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  OrderIsConfirmed : String(1);
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  OrderIsPartiallyConfirmed : String(1);
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  OrderIsDelivered : String(1);
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  OrderIsDeleted : String(1);
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  OrderIsTechnicallyCompleted : String(1);
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  OrderIsClosed : String(1);
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  OrderIsPartiallyDelivered : String(1);
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  MfgOrderIsToBeDeleted : String(1);
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  CreatedStatusQtyInPercent : Integer;
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ReleasedStatusQtyInPercent : Integer;
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ConfirmedStatusQtyInPercent : Integer;
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  DeliveredStatusQtyInPercent : Integer;
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  DeletedStatusQtyInPercent : Integer;
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  TechlyCmpltdStatusQtyInPercent : Integer;
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ClosedStatusQtyInPercent : Integer;
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  OrderHasQualityIssue : String(1);
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  OrderHasMissingComponents : String(1);
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  OrderHasProductionHold : String(1);
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  OrderHasExecutionDelay : String(1);
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  OrderHasDeviation : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material'
  @sap.quickinfo : 'Material Number'
  Material : String(18);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cross-plant CM'
  @sap.quickinfo : 'Cross-Plant Configurable Material'
  CrossPlantConfigurableProduct : String(18);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Master Prod. Ord.'
  @sap.quickinfo : 'Master Production Order Number'
  MasterProductionOrder : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Order'
  @sap.quickinfo : 'Order Number'
  ManufacturingOrder : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Planning Plant'
  @sap.quickinfo : 'Planning Plant for an Order'
  MRPPlant : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material Group'
  MaterialGroup : String(9);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Order Status'
  @sap.quickinfo : 'Manufacturing Order Internal Status'
  OrderStatusInternalID : String(2);
  @sap.label : 'Master Production Order Count'
  @sap.quickinfo : 'Number of Master Production Orders'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  NumberOfMasterProductionOrders : Integer;
  @sap.label : 'Production Order Count'
  @sap.quickinfo : 'Number Of Production Orders'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  NumberOfProductionOrders : Integer;
  to_Comp : Association to many planned_order.C_RFM_CmbndMfgOrdOpComponents {  };
  to_Master : Association to many planned_order.C_RFM_ManageMasterMfgOrder {  };
  to_Order : Association to many planned_order.C_RFM_ManageMfgOrder {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.updatable.path : 'Update_mc'
@sap.label : 'Manage Master Manufacturing Order'
entity planned_order.C_RFM_ManageMasterMfgOrder {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Master Production Order'
  @sap.updatable : 'false'
  @sap.value.list : 'standard'
  key MasterProductionOrder : String(12) not null;
  @sap.label : 'Dyn. Action Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  AssignToCombinedProductionOrd_ac : Boolean;
  @sap.label : 'Dyn. Action Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  AvailabilityCheckMstrProdnOrd_ac : Boolean;
  @sap.label : 'Dyn. Action Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  CloseMasterProductionOrder_ac : Boolean;
  @sap.label : 'Dyn. Action Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  CreateCombinedProductionOrder_ac : Boolean;
  @sap.label : 'Dyn. Action Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  PerformTechlyCmpltMstrProdnOrd_ac : Boolean;
  @sap.label : 'Dyn. Action Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ReleaseMasterProductionOrder_ac : Boolean;
  @sap.label : 'Dyn. Action Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  RereadProductionMasterData_ac : Boolean;
  @sap.label : 'Dyn. Action Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  RunCostingForMasterProdnOrd_ac : Boolean;
  @sap.label : 'Dyn. Action Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ScheduleMasterProductionOrder_ac : Boolean;
  @sap.label : 'Dyn. Action Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  UnassignFromCombinedProdnOrd_ac : Boolean;
  @sap.label : 'Dyn. Method Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Update_mc : Boolean;
  @sap.display.format : 'NonNegative'
  ManufacturingOrderCategory : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Order Type'
  ManufacturingOrderType : String(4);
  @sap.display.format : 'UpperCase'
  @sap.text : 'PlantName'
  @sap.label : 'Production Plant'
  @sap.value.list : 'standard'
  ProductionPlant : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Combined Production Order'
  @sap.updatable : 'false'
  @sap.value.list : 'standard'
  CombinedProductionOrder : String(12);
  @sap.label : 'Production Plant Name'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  PlantName : String(30);
  @sap.display.format : 'UpperCase'
  @sap.text : 'FashionGenericMaterialName'
  @sap.label : 'Generic Product'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.value.list : 'standard'
  CrossPlantConfigurableProduct : String(18);
  @sap.label : 'Generic Product Name'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  FashionGenericMaterialName : String(40);
  @sap.display.format : 'UpperCase'
  @sap.text : 'MaterialName'
  @sap.label : 'Product'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.value.list : 'standard'
  Material : String(18);
  @sap.label : 'Product Name'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  MaterialName : String(40);
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Scheduled Start'
  @sap.quickinfo : 'Scheduled Start Date'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  MfgOrderScheduledStartDate : Date;
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Scheduled End'
  @sap.quickinfo : 'Scheduled End Date'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  MfgOrderScheduledEndDate : Date;
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Actual Start'
  @sap.quickinfo : 'Actual Start Date'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  MfgOrderActualStartDate : Date;
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Actual End'
  @sap.quickinfo : 'Actual End Date'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  MfgOrderActualEndDate : Date;
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Confirmed End'
  @sap.quickinfo : 'Confirmed End Date'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  MfgOrderConfirmedEndDate : Date;
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Planned Start'
  @sap.quickinfo : 'Planned Start Date'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  MfgOrderPlannedStartDate : Date;
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Planned End'
  @sap.quickinfo : 'Planned End Date'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  MfgOrderPlannedEndDate : Date;
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Planned Release Date'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  MfgOrderPlannedReleaseDate : Date;
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Scheduled Release Date'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  MfgOrderScheduledReleaseDate : Date;
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Actual Release Date'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  MfgOrderActualReleaseDate : Date;
  @sap.label : 'Production Unit'
  @sap.quickinfo : 'Production Unit of Measure'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  @sap.semantics : 'unit-of-measure'
  ProductionUnit : String(3);
  @sap.unit : 'ProductionUnit'
  @sap.label : 'Total Quantity'
  @sap.quickinfo : 'Planned Total Quantity'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  MfgOrderPlannedTotalQty : Decimal(13, 3);
  @sap.unit : 'ProductionUnit'
  @sap.label : 'Scrap Quantity'
  @sap.quickinfo : 'Planned Scrap Quantity'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  MfgOrderPlannedScrapQty : Decimal(13, 3);
  @sap.unit : 'ProductionUnit'
  @sap.label : 'Planned Yield'
  @sap.quickinfo : 'Planned Yield Quantity'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  MfgOrderPlannedYieldQty : Decimal(13, 3);
  @sap.unit : 'ProductionUnit'
  @sap.label : 'Confirmed Yield'
  @sap.quickinfo : 'Confirmed Yield Quantity From Order Confirmation'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  MfgOrderConfirmedYieldQty : Decimal(13, 3);
  @sap.unit : 'ProductionUnit'
  @sap.label : 'Confirmed Scrap'
  @sap.quickinfo : 'Confirmed Scrap Quantity From Order Confirmation'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  MfgOrderConfirmedScrapQty : Decimal(13, 3);
  @sap.unit : 'ProductionUnit'
  @sap.label : 'Confirmed Rework'
  @sap.quickinfo : 'Total Confirmed Rework Quantity'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  MfgOrderConfirmedReworkQty : Decimal(13, 3);
  @sap.unit : 'ProductionUnit'
  @sap.label : 'Goods Receipt Quantity'
  @sap.quickinfo : 'Quantity of Goods Received for the Order Item'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ActualDeliveredQuantity : Decimal(13, 3);
  @sap.unit : 'ProductionUnit'
  @sap.label : 'Open Quantity'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  OrderOpenQuantity : Decimal(13, 3);
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  OrderIsCreated : String(1);
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  OrderIsReleased : String(1);
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  OrderIsPartiallyReleased : String(1);
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  OrderIsConfirmed : String(1);
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  OrderIsPartiallyConfirmed : String(1);
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  OrderIsDelivered : String(1);
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  OrderIsDeleted : String(1);
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  OrderIsTechnicallyCompleted : String(1);
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  OrderIsClosed : String(1);
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  OrderIsPartiallyDelivered : String(1);
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  MfgOrderIsToBeDeleted : String(1);
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  CreatedStatusQtyInPercent : Integer;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ReleasedStatusQtyInPercent : Integer;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ConfirmedStatusQtyInPercent : Integer;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  DeliveredStatusQtyInPercent : Integer;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  DeletedStatusQtyInPercent : Integer;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  TechlyCmpltdStatusQtyInPercent : Integer;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ClosedStatusQtyInPercent : Integer;
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  OrderHasProductionHold : String(1);
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  OrderHasExecutionDelay : String(1);
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  OrderHasMissingComponents : String(1);
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  OrderHasDeviation : String(1);
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  OrderHasQualityIssue : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Order'
  @sap.quickinfo : 'Manufacturing Order'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.value.list : 'standard'
  ManufacturingOrder : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Planning Plant'
  @sap.quickinfo : 'Planning Plant for an Order'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.value.list : 'standard'
  MRPPlant : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product Group'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.value.list : 'standard'
  MaterialGroup : String(9);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Order Status'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.value.list : 'standard'
  OrderStatusInternalID : String(2);
  @sap.label : 'Production Order Count'
  @sap.quickinfo : 'Number Of Production Orders'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  NumberOfProductionOrders : Integer;
  @sap.label : 'Boolean Variable (X = True, - = False, Space = Unknown)'
  @sap.heading : ''
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  GenericProductIsFilled : Boolean;
  to_Comp : Association to many planned_order.C_RFM_MasterMfgOrdOpComponents {  };
  to_Oper : Association to many planned_order.C_RFM_MasterMfgOrdOpSchedule {  };
  to_Order : Composition of many planned_order.C_RFM_ManageMfgOrder {  };
} actions {
  action AssignToCombinedProductionOrd(
    @sap.label : 'RunID Description'
    JobName : String(255),
    @sap.label : 'Master Order'
    CombinedProductionOrder : String(12)
  ) returns planned_order.C_RFM_ManageMasterMfgOrder;
  action AvailabilityCheckMstrProdnOrd(
    @sap.label : 'RunID Description'
    JobName : String(255)
  ) returns planned_order.C_RFM_ManageMasterMfgOrder;
  action CloseMasterProductionOrder(
    @sap.label : 'RunID Description'
    JobName : String(255)
  ) returns planned_order.C_RFM_ManageMasterMfgOrder;
  action CreateCombinedProductionOrder(
    @sap.label : 'RunID Description'
    JobName : String(255)
  ) returns planned_order.C_RFM_ManageMasterMfgOrder;
  action PerformTechlyCmpltMstrProdnOrd(
    @sap.label : 'RunID Description'
    JobName : String(255)
  ) returns planned_order.C_RFM_ManageMasterMfgOrder;
  action ReleaseMasterProductionOrder(
    @sap.label : 'RunID Description'
    JobName : String(255)
  ) returns planned_order.C_RFM_ManageMasterMfgOrder;
  action RereadProductionMasterData(
    @sap.label : 'RunID Description'
    JobName : String(255)
  ) returns planned_order.C_RFM_ManageMasterMfgOrder;
  action RunCostingForMasterProdnOrd(
    @sap.label : 'RunID Description'
    JobName : String(255)
  ) returns planned_order.C_RFM_ManageMasterMfgOrder;
  action ScheduleMasterProductionOrder(
    @sap.label : 'Enter Scheduling Type:'
    SchedulingType : String(1),
    @sap.label : 'Enter Job Name:'
    JobName : String(255)
  ) returns planned_order.C_RFM_ManageMasterMfgOrder;
  action UnassignFromCombinedProdnOrd(
    @sap.label : 'RunID Description'
    JobName : String(255),
    @sap.label : 'Master Order'
    CombinedProductionOrder : String(12)
  ) returns planned_order.C_RFM_ManageMasterMfgOrder;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.updatable.path : 'Update_mc'
@sap.label : 'Manage Production Orders'
entity planned_order.C_RFM_ManageMfgOrder {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Order'
  @sap.quickinfo : 'Manufacturing Order'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  key ManufacturingOrder : String(12) not null;
  @sap.label : 'Dyn. Action Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  AssignToMasterProductionOrder_ac : Boolean;
  @sap.label : 'Dyn. Action Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  CreateMasterProductionOrder_ac : Boolean;
  @sap.label : 'Dyn. Action Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  UnassignFromMasterProdnOrd_ac : Boolean;
  @odata.Type : 'Edm.Byte'
  @sap.label : 'Dyn. Field Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  MfgOrderPlannedEndDate_fc : Integer;
  @odata.Type : 'Edm.Byte'
  @sap.label : 'Dyn. Field Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  MfgOrderPlannedStartDate_fc : Integer;
  @odata.Type : 'Edm.Byte'
  @sap.label : 'Dyn. Field Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  MfgOrderPlannedTotalQty_fc : Integer;
  @odata.Type : 'Edm.Byte'
  @sap.label : 'Dyn. Field Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ProductCollection_fc : Integer;
  @odata.Type : 'Edm.Byte'
  @sap.label : 'Dyn. Field Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ProductSeason_fc : Integer;
  @odata.Type : 'Edm.Byte'
  @sap.label : 'Dyn. Field Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ProductSeasonYear_fc : Integer;
  @odata.Type : 'Edm.Byte'
  @sap.label : 'Dyn. Field Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ProductTheme_fc : Integer;
  @odata.Type : 'Edm.Byte'
  @sap.label : 'Dyn. Field Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  StockSegment_fc : Integer;
  @sap.label : 'Dyn. Method Control'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  Update_mc : Boolean;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Order Category'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ManufacturingOrderCategory : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Order Type'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ManufacturingOrderType : String(4);
  @sap.label : 'Order Text'
  @sap.quickinfo : 'Manufacturing Order Text'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ManufacturingOrderText : String(40);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Order Internal ID'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  OrderInternalBillOfOperations : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Reference Order'
  @sap.quickinfo : 'Reference Order Number'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.value.list : 'standard'
  ReferenceOrder : String(12);
  @sap.display.format : 'UpperCase'
  @sap.text : 'MRPPlantName'
  @sap.label : 'Planning Plant'
  @sap.quickinfo : 'Planning Plant for an Order'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MRPPlant : String(4);
  @sap.label : 'Plant Name'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MRPPlantName : String(30);
  @sap.display.format : 'UpperCase'
  @sap.text : 'MRPAreaText'
  @sap.label : 'MRP Area'
  @sap.quickinfo : 'Manufacturing Order MRP Area'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MRPArea : String(10);
  @sap.label : 'MRP Area Text'
  @sap.quickinfo : 'Manufacturing Order MRP Area Text'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MRPAreaText : String(40);
  @sap.display.format : 'UpperCase'
  @sap.text : 'MRPControllerName'
  @sap.label : 'MRP Controller'
  @sap.quickinfo : 'Manufacturing Order MRP Controller'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MRPController : String(3);
  @sap.label : 'MRP Controller Name'
  @sap.quickinfo : 'Manufacturing Order MRP Controller Name'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MRPControllerName : String(18);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Planner Group'
  @sap.quickinfo : 'Responsible Planner Group or Department'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ResponsiblePlannerGroup : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Controlling Area'
  @sap.quickinfo : 'Manufacturing Order Controlling Area'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ControllingArea : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Profit Center'
  @sap.quickinfo : 'Manufacturing Order Profit Center'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.value.list : 'standard'
  ProfitCenter : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cost Center'
  @sap.quickinfo : 'Cost Center for Basic Settlement'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.value.list : 'standard'
  CostCenter : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'G/L Account'
  @sap.quickinfo : 'G/L Account for Basic Settlement'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.value.list : 'standard'
  GLAccount : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Functional Area'
  @sap.quickinfo : 'Manufacturing Order Functional Area'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  FunctionalArea : String(16);
  @sap.display.format : 'UpperCase'
  @sap.text : 'ProductionPlantName'
  @sap.label : 'Production Plant'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductionPlant : String(4);
  @sap.label : 'Plant Name'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductionPlantName : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Production Supervisor'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductionSupervisor : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Order'
  @sap.quickinfo : 'Manufacturing Order Sales Order'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.value.list : 'standard'
  SalesDocument : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Sales Order Item'
  @sap.quickinfo : 'Manufacturing Order Sales Order Item'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.value.list : 'standard'
  SalesDocumentItem : String(6);
  @sap.label : 'WBS Element Name'
  @sap.quickinfo : 'Work Breakdown Structure Element Name'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  WBSDescription : String(40);
  @sap.display.format : 'UpperCase'
  @sap.text : 'ProductionVersionText'
  @sap.label : 'Production Version'
  @sap.quickinfo : 'Manufacturing Order Production Version'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.value.list : 'standard'
  ProductionVersion : String(4);
  @sap.label : 'Prodn Version Text'
  @sap.quickinfo : 'Short Text for Production Version'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductionVersionText : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Production Line'
  @sap.quickinfo : 'Production Line for Repetitive Manufacturing'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.value.list : 'standard'
  ProductionLine : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Order Importance'
  @sap.quickinfo : 'Order Importance Code'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ManufacturingOrderImportance : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Superior Order'
  @sap.quickinfo : 'Number of Superior Order'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.value.list : 'standard'
  MfgOrderSuperiorMfgOrder : String(12);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Inspection'
  @sap.quickinfo : 'Inspection Lot Number'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InspectionLot : String(12);
  @sap.display.format : 'UpperCase'
  @sap.text : 'SchedulingTypeName'
  @sap.label : 'Basic Scheduling Type'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  BasicSchedulingType : String(1);
  @sap.label : 'Scheduling Type Name'
  @sap.quickinfo : 'Scheduling Type Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SchedulingTypeName : String(30);
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Scheduled Start'
  @sap.quickinfo : 'Scheduled Start Date'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MfgOrderScheduledStartDate : Date;
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Scheduled End'
  @sap.quickinfo : 'Scheduled End Date'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MfgOrderScheduledEndDate : Date;
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Actual Start'
  @sap.quickinfo : 'Actual Start Date of Manufacturing Order'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MfgOrderActualStartDate : Date;
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Actual End'
  @sap.quickinfo : 'Actual End Date'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MfgOrderActualEndDate : Date;
  @sap.display.format : 'Date'
  @sap.label : 'Confirmed End Date'
  @sap.quickinfo : 'Manufacturing Order Confirmed End Date'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MfgOrderConfirmedEndDate : Date;
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Created On'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MfgOrderCreationDate : Date;
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Changed On'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  LastChangeDate : Date;
  @sap.display.format : 'Date'
  @sap.field.control : 'MfgOrderPlannedStartDate_fc'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Planned Start'
  @sap.quickinfo : 'Planned Start Date'
  MfgOrderPlannedStartDate : Date;
  @sap.display.format : 'Date'
  @sap.field.control : 'MfgOrderPlannedEndDate_fc'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Planned End'
  @sap.quickinfo : 'Planned End Date'
  MfgOrderPlannedEndDate : Date;
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Planned Release Date'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MfgOrderPlannedReleaseDate : Date;
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Scheduled Release Date'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MfgOrderScheduledReleaseDate : Date;
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Actual Release Date'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MfgOrderActualReleaseDate : Date;
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'Start'
  @sap.quickinfo : 'Order Start Date'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  OrderStartDate : Date;
  @sap.display.format : 'Date'
  @sap.filter.restriction : 'interval'
  @sap.label : 'End'
  @sap.quickinfo : 'Order End Date'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MfgOrderEndDate : Date;
  @sap.text : 'UnitOfMeasureName'
  @sap.label : 'Production Unit'
  @sap.quickinfo : 'Production Unit of Measure'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.semantics : 'unit-of-measure'
  ProductionUnit : String(3);
  @sap.label : 'Production Unit Name'
  @sap.quickinfo : 'Unit of Measurement Text (Maximum 10 Characters)'
  UnitOfMeasureName : String(10);
  @sap.field.control : 'MfgOrderPlannedTotalQty_fc'
  @sap.unit : 'ProductionUnit'
  @sap.label : 'Total Quantity'
  @sap.quickinfo : 'Manufacturing Order Planned Total Quantity'
  MfgOrderPlannedTotalQty : Decimal(13, 3);
  @sap.unit : 'ProductionUnit'
  @sap.label : 'Scrap Quantity'
  @sap.quickinfo : 'Manufacturing Order Planned Scrap Quantity'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MfgOrderPlannedScrapQty : Decimal(13, 3);
  @sap.unit : 'ProductionUnit'
  @sap.label : 'Planned Yield'
  @sap.quickinfo : 'Planned Yield Quantity'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MfgOrderPlannedYieldQty : Decimal(13, 3);
  @sap.unit : 'ProductionUnit'
  @sap.label : 'Confirmed Yield'
  @sap.quickinfo : 'Confirmed Yield Quantity From Order Confirmation'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MfgOrderConfirmedYieldQty : Decimal(13, 3);
  @sap.unit : 'ProductionUnit'
  @sap.label : 'Confirmed Scrap'
  @sap.quickinfo : 'Confirmed Scrap Quantity From Order Confirmation'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MfgOrderConfirmedScrapQty : Decimal(13, 3);
  @sap.unit : 'ProductionUnit'
  @sap.label : 'Confirmed Rework'
  @sap.quickinfo : 'Total Confirmed Rework Quantity'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MfgOrderConfirmedReworkQty : Decimal(13, 3);
  @sap.unit : 'ProductionUnit'
  @sap.label : 'Expected Deviation'
  @sap.quickinfo : 'Expected Yield Deviation'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ExpectedDeviationQuantity : Decimal(13, 3);
  @sap.unit : 'ProductionUnit'
  @sap.label : 'Goods Receipt Quantity'
  @sap.quickinfo : 'Quantity of Goods Received for the Order Item'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ActualDeliveredQuantity : Decimal(13, 3);
  @sap.unit : 'ProductionUnit'
  @sap.label : 'Open Quantity'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  OrderOpenQuantity : Decimal(13, 3);
  @sap.display.format : 'UpperCase'
  @sap.text : 'MaterialName'
  @sap.label : 'Product'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.value.list : 'standard'
  Material : String(18);
  @sap.label : 'Material Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MaterialName : String(40);
  @sap.unit : 'ProductionUnit'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  OrderYieldDeviationQty : Decimal(15, 3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Effectivity Parameter Variant'
  EffectivityParameterVariant : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Batch'
  @sap.quickinfo : 'Manufacturing Order Material Batch'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.value.list : 'standard'
  Batch : String(10);
  @sap.label : 'Long Text'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  OrderLongText : LargeString;
  @sap.label : 'Order Type Name'
  @sap.quickinfo : 'Manufacturing Order Type Name'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ManufacturingOrderTypeName : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Storage Location'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  StorageLocation : String(4);
  @sap.display.format : 'UpperCase'
  @sap.field.control : 'StockSegment_fc'
  @sap.label : 'Stock Segment'
  StockSegment : String(40);
  @sap.display.format : 'UpperCase'
  @sap.field.control : 'ProductSeasonYear_fc'
  @sap.label : 'Season Year'
  ProductSeasonYear : String(4);
  @sap.display.format : 'UpperCase'
  @sap.field.control : 'ProductSeason_fc'
  @sap.label : 'Season'
  ProductSeason : String(10);
  @sap.display.format : 'UpperCase'
  @sap.field.control : 'ProductCollection_fc'
  @sap.label : 'Collection'
  @sap.quickinfo : 'Fashion Collection'
  ProductCollection : String(10);
  @sap.display.format : 'UpperCase'
  @sap.field.control : 'ProductTheme_fc'
  @sap.label : 'Theme'
  @sap.quickinfo : 'Fashion Theme'
  ProductTheme : String(10);
  @sap.display.format : 'UpperCase'
  @sap.text : 'FashionGenericMaterialName'
  @sap.label : 'Generic Product'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CrossPlantConfigurableProduct : String(18);
  @sap.label : 'Material Description'
  FashionGenericMaterialName : String(40);
  @sap.display.format : 'UpperCase'
  @sap.text : 'MaterialTypeName'
  @sap.label : 'Product Type'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MaterialType : String(4);
  @sap.label : 'Product Type Name'
  @sap.quickinfo : 'Description of Material Type'
  MaterialTypeName : String(25);
  @sap.display.format : 'UpperCase'
  @sap.text : 'MaterialGroupName'
  @sap.label : 'Product Group'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MaterialGroup : String(9);
  @sap.label : 'Product Group Name'
  @sap.quickinfo : 'Product Group Description'
  MaterialGroupName : String(20);
  @sap.display.format : 'UpperCase'
  @sap.text : 'ProductCategoryName'
  @sap.label : 'Product Category'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductCategory : String(2);
  @sap.label : 'Product Category Name'
  @sap.quickinfo : 'Product Category Text'
  ProductCategoryName : String(60);
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
  @sap.label : 'Master Production Order'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MasterProductionOrder : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Combined Production Order'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CombinedProductionOrder : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Object Number'
  @sap.quickinfo : 'Object Internal ID'
  ObjectInternalID : String(22);
  OrderHasDeviation : String(1);
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  OrderHasQualityIssue : String(1);
  OrderHasExecutionDelay : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Effectivity'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  EffectivityParameterDesc : String(256);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Execution Status'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ImpactedActyExecSts : String(2);
  @sap.label : 'Order Status'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  OrderStatusText : String(30);
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  OrderHasProductionHold : String(1);
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  OrderHasMissingComponents : String(1);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Order Status Internal ID'
  OrderStatusInternalID : String(2);
  to_Master : Association to planned_order.C_RFM_ManageMasterMfgOrder {  };
} actions {
  action AssignToMasterProductionOrder(
    @sap.label : 'RunID Description'
    JobName : String(255),
    @sap.label : 'Master Order'
    MasterProductionOrder : String(12)
  ) returns planned_order.C_RFM_ManageMfgOrder;
  action CreateMasterProductionOrder(
    @sap.label : 'RunID Description'
    JobName : String(255)
  ) returns planned_order.C_RFM_ManageMfgOrder;
  action UnassignFromMasterProdnOrd(
    @sap.label : 'RunID Description'
    JobName : String(255),
    @sap.label : 'Master Order'
    MasterProductionOrder : String(12)
  ) returns planned_order.C_RFM_ManageMfgOrder;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Master Order Operation Component'
entity planned_order.C_RFM_MasterMfgOrdOpComponents {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Master Prod. Ord.'
  @sap.quickinfo : 'Master Production Order Number'
  key MasterProductionOrder : String(12) not null;
  @sap.display.format : 'UpperCase'
  @sap.text : 'MaterialName'
  @sap.label : 'Product'
  key Material : String(18) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Production Plant'
  ProductionPlant : String(4);
  @sap.display.format : 'UpperCase'
  @sap.text : 'Plant_Text'
  @sap.label : 'Plant'
  Plant : String(4);
  @sap.label : 'Plant Name'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  Plant_Text : String(30);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Order Category'
  @sap.quickinfo : 'Manufacturing Order Category'
  ManufacturingOrderCategory : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Order Type'
  @sap.quickinfo : 'Manufacturing Order Type'
  ManufacturingOrderType : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Combined Prod. Order'
  @sap.quickinfo : 'Combined Master Production Order'
  CombinedProductionOrder : String(12);
  @sap.label : 'Base Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);
  @sap.label : 'Unit of Entry'
  @sap.quickinfo : 'Unit of entry'
  @sap.semantics : 'unit-of-measure'
  EntryUnit : String(3);
  @sap.unit : 'BaseUnit'
  @sap.label : 'Total Quantity'
  RequiredQuantity : Decimal(13, 3);
  @sap.unit : 'BaseUnit'
  @sap.label : 'Consumed'
  WithdrawnQuantity : Decimal(13, 3);
  @sap.unit : 'BaseUnit'
  @sap.label : 'Uncovered'
  UncoveredQuantity : Decimal(14, 3);
  @sap.unit : 'BaseUnit'
  @sap.label : 'Committed'
  ConfirmedAvailableQuantity : Decimal(16, 3);
  @sap.unit : 'BaseUnit'
  @sap.label : 'Open Quantity'
  OpenQuantity : Decimal(14, 3);
  @sap.label : 'Missing Component'
  MaterialComponentIsMissing : Boolean;
  @sap.display.format : 'Date'
  @sap.label : 'Requirement Date'
  MatlCompRequirementDate : Date;
  @sap.unit : 'EntryUnit'
  @sap.label : 'Quantity in Unit of Entry'
  GoodsMovementEntryQty : Decimal(13, 3);
  @sap.unit : 'BaseUnit'
  @sap.label : 'Missing Quantity'
  MissingQuantity : Decimal(16, 3);
  @sap.label : 'Product Name'
  MaterialName : String(40);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Master Order Operation Schedules'
entity planned_order.C_RFM_MasterMfgOrdOpSchedule {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Master Prod. Ord.'
  @sap.quickinfo : 'Master Production Order Number'
  key MasterProductionOrder : String(12) not null;
  @sap.display.format : 'UpperCase'
  @sap.text : 'MfgOrderOperationText'
  @sap.label : 'Operation or Phase'
  @sap.quickinfo : 'Operation or Phase Number'
  key ManufacturingOrderOperation : String(4) not null;
  @sap.label : 'Operation Text'
  MfgOrderOperationText : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Production Plant'
  ProductionPlant : String(4);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Order Category'
  @sap.quickinfo : 'Manufacturing Order Category'
  ManufacturingOrderCategory : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Order Type'
  @sap.quickinfo : 'Manufacturing Order Type'
  ManufacturingOrderType : String(4);
  @sap.unit : 'OperationUnit'
  @sap.label : 'Base Quantity'
  @sap.quickinfo : 'Manufacturing Operation Base Quantity'
  OpPlannedTotalQuantity : Decimal(13, 3);
  @sap.unit : 'OperationUnit'
  @sap.label : 'Confirmed Yield'
  @sap.quickinfo : 'Confirmed Yield of Total Quantity'
  OpTotalConfirmedYieldQty : Decimal(13, 3);
  @sap.unit : 'OperationUnit'
  @sap.label : 'Planned Scrap'
  @sap.quickinfo : 'Operation Planned Scrap Quantity'
  OpPlannedScrapQuantity : Decimal(13, 3);
  @sap.unit : 'OperationUnit'
  @sap.label : 'Confirmed Rework'
  @sap.quickinfo : 'Total Confirmed Rework Quantity'
  OperationConfirmedReworkQty : Decimal(13, 3);
  @sap.unit : 'OperationUnit'
  @sap.label : 'Confirmed Scrap'
  @sap.quickinfo : 'Total Scrap Quantity Confirmed'
  OpTotalConfirmedScrapQty : Decimal(13, 3);
  @sap.label : 'Operation Unit'
  @sap.quickinfo : 'Operation Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  OperationUnit : String(3);
  @sap.display.format : 'Date'
  @sap.label : 'Scheduled Start'
  OpLtstSchedldExecStrtDte : Date;
  @sap.display.format : 'Date'
  @sap.label : 'Scheduled End'
  OpLtstSchedldExecEndDte : Date;
  @sap.display.format : 'Date'
  @sap.label : 'Actual Start'
  OpActualExecutionStartDate : Date;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Scheduling Type Value Help'
entity planned_order.C_RSHSchedulingTypeVH {
  @sap.display.format : 'UpperCase'
  @sap.text : 'SchedulingTypeName'
  @sap.label : 'Scheduling Type'
  key SchedulingType : String(1) not null;
  @sap.label : 'Scheduling Type Text'
  @sap.quickinfo : 'Scheduling Type Description'
  SchedulingTypeName : String(30);
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

