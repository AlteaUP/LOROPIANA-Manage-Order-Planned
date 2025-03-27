/* checksum : 35d6d2b2d8c45e7fb8252370bb6e728f */
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
@sap.content.version : '1'
@sap.label : 'Combined Planned Orders API'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_CombinedPlnOrdersAPI {
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Combined Plnd. Order'
  @sap.quickinfo : 'Combined Master Planned Order'
  key CplndOrd : String(12) not null;
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
  to_ZZ1_CombinPlannedOrdersCom : Association to many ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_CombinPlannedOrdersCom {  };
  to_ZZ1_MasterPlannedOrders : Association to many ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_MasterPlannedOrders {  };
  to_ZZ1_PLOCAPACITYCORD : Association to many ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_PLOCAPACITYCORD {  };
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
  @sap.required.in.filter : 'false'
  @sap.label : 'Base Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'AvailableQuantity'
  AvailableQuantity : Decimal(15, 3);
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'WithdrawnQuantity'
  WithdrawnQuantity : Decimal(13, 3);
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'RequiredQuantity'
  RequiredQuantity : Decimal(13, 3);
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'TotalAllocQty'
  TotalAllocQty : Decimal(13, 3);
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
};

