/* checksum : 92e2c53076e9529317bf22a096c1b33c */
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
@sap.label : 'Capacity Category'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.I_CapacityCategory {
  @sap.display.format : 'UpperCase'
  @sap.text : 'CapacityCategoryCode_Text'
  @sap.label : 'Capacity Category'
  key CapacityCategoryCode : String(3) not null;
  @sap.label : 'Capacity Cat. Name'
  @sap.quickinfo : 'Description of a Capacity Category'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CapacityCategoryCode_Text : String(20);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Capacity Requirement Header'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.I_CapacityRequirement {
  @sap.display.format : 'NonNegative'
  @sap.label : 'Capacity Requirement'
  @sap.quickinfo : 'ID of the Capacity Requirements Record'
  key CapacityRequirement : String(12) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Capacity Requirement Origin'
  CapacityRequirementOrigin : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Planned Order'
  PlannedOrder : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Order'
  @sap.quickinfo : 'Order Number'
  OrderID : String(12);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Order Internal ID'
  OrderInternalID : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'SOP Order'
  @sap.quickinfo : 'Sales Operations Planning Order'
  SalesOperationsPlanningOrder : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Task List Type'
  BillOfOperationsType : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Group'
  @sap.quickinfo : 'Key for Task List Group'
  BillOfOperationsGroup : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Group Counter'
  BillOfOperations : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Scheduling Type'
  SchedulingType : String(1);
  @sap.display.format : 'Date'
  @sap.label : 'Scheduled start'
  ScheduledBasicStartDate : Date;
  @sap.label : 'Earliest start time'
  @sap.quickinfo : 'Earliest scheduled start: Execution (time)'
  ScheduledBasicStartTime : Time;
  @sap.display.format : 'Date'
  @sap.label : 'Scheduled finish'
  ScheduledBasicEndDate : Date;
  @sap.label : 'Earliest finish'
  @sap.quickinfo : 'Earliest finish of operation (time)'
  ScheduledBasicEndTime : Time;
  @sap.display.format : 'Date'
  @sap.label : 'Scheduled on'
  @sap.quickinfo : 'Date of the Last Scheduling'
  LastScheduledDate : Date;
  @sap.display.format : 'Date'
  @sap.label : 'Explosion Date'
  @sap.quickinfo : 'Date for Routing Explosion'
  BOOExplosionDate : Date;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Capacity Requirement Item'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.I_CapacityRequirementItem {
  @sap.display.format : 'NonNegative'
  @sap.label : 'Capacity Requirement'
  @sap.quickinfo : 'ID of the Capacity Requirements Record'
  @sap.value.list : 'standard'
  key CapacityRequirement : String(12) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Counter'
  @sap.quickinfo : 'Internal counter'
  key CapacityRequirementItem : String(8) not null;
  to_CapacityRequirement : Association to ZZ1_COMBINEDPLNORDERSAPI_CDS.I_CapacityRequirement {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Capacity Requirement Header'
@sap.value.list : 'true'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.I_CapacityRequirementStdVH {
  @sap.display.format : 'NonNegative'
  @sap.label : 'Capacity Requirement'
  @sap.quickinfo : 'ID of the Capacity Requirements Record'
  key CapacityRequirement : String(12) not null;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Capacity Header'
@sap.value.list : 'true'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.I_CapacityStdVH {
  @sap.display.format : 'NonNegative'
  @sap.text : 'CapacityInternalID_Text'
  @sap.label : 'Capacity ID'
  key CapacityInternalID : String(8) not null;
  @sap.label : 'Capacity Text'
  @sap.quickinfo : 'Capacity Short Text'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CapacityInternalID_Text : String(40);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Customer'
@sap.value.list : 'true'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.I_Customer_VH {
  @sap.display.format : 'UpperCase'
  @sap.text : 'BPCustomerName'
  @sap.label : 'Customer'
  @sap.quickinfo : 'Customer Number'
  key Customer : String(10) not null;
  @sap.label : 'Customer Name 1'
  @sap.quickinfo : 'Name 1'
  OrganizationBPName1 : String(35);
  @sap.label : 'Business Partner Name 1'
  @sap.quickinfo : 'Name 1'
  BusinessPartnerName1 : String(40);
  @sap.label : 'Customer Name 2'
  @sap.quickinfo : 'Name 2'
  OrganizationBPName2 : String(35);
  @sap.label : 'Business Partner Name 2'
  @sap.quickinfo : 'Name 2'
  BusinessPartnerName2 : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Country/Region'
  @sap.quickinfo : 'Country/Region Key'
  Country : String(3);
  @sap.label : 'City'
  CityName : String(35);
  @sap.label : 'Business Partner Address City'
  @sap.quickinfo : 'City'
  BPAddrCityName : String(40);
  @sap.label : 'Street'
  @sap.quickinfo : 'Street and House Number'
  StreetName : String(35);
  @sap.label : 'Business Partner Address Street'
  @sap.quickinfo : 'Street'
  BPAddrStreetName : String(60);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Postal Code'
  PostalCode : String(10);
  @sap.label : 'Customer Name'
  @sap.quickinfo : 'Name of Customer'
  CustomerName : String(80);
  @sap.label : 'Business Partner Customer Name'
  @sap.quickinfo : 'Customer Name'
  BPCustomerName : String(81);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Account group'
  @sap.quickinfo : 'Customer Account Group'
  CustomerAccountGroup : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Authorization'
  @sap.quickinfo : 'Authorization Group'
  AuthorizationGroup : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Purpose Complete Flag'
  @sap.quickinfo : 'Business Purpose Completed Flag'
  IsBusinessPurposeCompleted : String(1);
  @sap.label : 'Competitors'
  @sap.quickinfo : 'Indicator: Competitor'
  IsCompetitor : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Business Partner'
  @sap.quickinfo : 'Business Partner Number'
  BusinessPartner : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Business Partner Type'
  BusinessPartnerType : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Data Ctrlr. Set'
  @sap.quickinfo : 'BP: Data Controller Set Flag'
  DataControllerSet : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Data Controller'
  @sap.quickinfo : 'BP: Data Controller (Internal Use Only)'
  DataController1 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Data Controller'
  @sap.quickinfo : 'BP: Data Controller (Internal Use Only)'
  DataController2 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Data Controller'
  @sap.quickinfo : 'BP: Data Controller (Internal Use Only)'
  DataController3 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Data Controller'
  @sap.quickinfo : 'BP: Data Controller (Internal Use Only)'
  DataController4 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Data Controller'
  @sap.quickinfo : 'BP: Data Controller (Internal Use Only)'
  DataController5 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Data Controller'
  @sap.quickinfo : 'BP: Data Controller (Internal Use Only)'
  DataController6 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Data Controller'
  @sap.quickinfo : 'BP: Data Controller (Internal Use Only)'
  DataController7 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Data Controller'
  @sap.quickinfo : 'BP: Data Controller (Internal Use Only)'
  DataController8 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Data Controller'
  @sap.quickinfo : 'BP: Data Controller (Internal Use Only)'
  DataController9 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Data Controller'
  @sap.quickinfo : 'BP: Data Controller (Internal Use Only)'
  DataController10 : String(30);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Planned Order'
@sap.value.list : 'true'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.I_PlannedOrderStdVH {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Planned Order'
  key PlannedOrder : String(10) not null;
};

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
  @sap.value.list : 'standard'
  PlantCustomer : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sppl. No. Plnt'
  @sap.quickinfo : 'Supplier Number of Plant'
  @sap.value.list : 'standard'
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
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Supplier'
@sap.value.list : 'true'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.I_Supplier_VH {
  @sap.display.format : 'UpperCase'
  @sap.text : 'BPSupplierName'
  @sap.label : 'Supplier'
  @sap.quickinfo : 'Account Number of Supplier'
  key Supplier : String(10) not null;
  @sap.label : 'Supplier Name1'
  @sap.quickinfo : 'Supplier Name'
  SupplierName : String(35);
  @sap.label : 'Business Partner Name1'
  BusinessPartnerName1 : String(40);
  @sap.label : 'Business Partner Supplier Name'
  @sap.quickinfo : 'Supplier Name'
  BPSupplierName : String(81);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Authorization'
  @sap.quickinfo : 'Authorization Group'
  AuthorizationGroup : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Account group'
  @sap.quickinfo : 'Vendor account group'
  SupplierAccountGroup : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Purpose Completed'
  @sap.quickinfo : 'Business Purpose Completed Flag'
  IsBusinessPurposeCompleted : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Business Partner'
  @sap.quickinfo : 'Business Partner Number'
  BusinessPartner : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Business Partner Type'
  BusinessPartnerType : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Data Ctrlr. Set'
  @sap.quickinfo : 'BP: Data Controller Set Flag'
  DataControllerSet : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Data Controller'
  @sap.quickinfo : 'BP: Data Controller (Internal Use Only)'
  DataController1 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Data Controller'
  @sap.quickinfo : 'BP: Data Controller (Internal Use Only)'
  DataController2 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Data Controller'
  @sap.quickinfo : 'BP: Data Controller (Internal Use Only)'
  DataController3 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Data Controller'
  @sap.quickinfo : 'BP: Data Controller (Internal Use Only)'
  DataController4 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Data Controller'
  @sap.quickinfo : 'BP: Data Controller (Internal Use Only)'
  DataController5 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Data Controller'
  @sap.quickinfo : 'BP: Data Controller (Internal Use Only)'
  DataController6 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Data Controller'
  @sap.quickinfo : 'BP: Data Controller (Internal Use Only)'
  DataController7 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Data Controller'
  @sap.quickinfo : 'BP: Data Controller (Internal Use Only)'
  DataController8 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Data Controller'
  @sap.quickinfo : 'BP: Data Controller (Internal Use Only)'
  DataController9 : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Data Controller'
  @sap.quickinfo : 'BP: Data Controller (Internal Use Only)'
  DataController10 : String(30);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Work Center'
@sap.value.list : 'true'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.I_WorkCenterStdVH {
  @sap.display.format : 'NonNegative'
  @sap.text : 'WorkCenterInternalID_Text'
  @sap.label : 'Object ID'
  @sap.quickinfo : 'Object ID of the resource'
  key WorkCenterInternalID : String(8) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Object Type'
  @sap.quickinfo : 'Object types of the CIM resource'
  key WorkCenterTypeCode : String(2) not null;
  @sap.label : 'Work Center Text'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  WorkCenterInternalID_Text : String(40);
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
  @sap.value.list : 'standard'
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
  PlndOrderBaseToEntryQtyNmrtr : Integer;
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'PlndOrderBaseToEntryQtyDnmntr'
  PlndOrderBaseToEntryQtyDnmntr : Integer;
  @sap.required.in.filter : 'false'
  @sap.label : 'Base Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'PlannedTotalQtyInBaseUnit'
  PlannedTotalQtyInBaseUnit : Integer;
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'RequirementQuantityInBaseUnit'
  RequirementQuantityInBaseUnit : Integer;
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'QuantityWithdrawnInBaseUnit'
  QuantityWithdrawnInBaseUnit : Integer;
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'PlndOrderCommittedQty'
  PlndOrderCommittedQty : Integer;
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
  @sap.value.list : 'standard'
  ZZ1_MFI_CR_TYPE_PLA : String(3);
  @sap.required.in.filter : 'false'
  @sap.label : 'Order Personalization'
  ZZ1_MFI_CRORDER_PERSON_PLA : String(20);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Stock Segment'
  StockSegment : String(40);
  @sap.required.in.filter : 'false'
  @sap.unit : 'ConfirmedQuantity_U'
  @sap.label : 'Confirmed Quantity Value'
  ConfirmedQuantity_V : Decimal(15, 3);
  @sap.required.in.filter : 'false'
  @sap.label : 'Confirmed Quantity UoM'
  @sap.semantics : 'unit-of-measure'
  ConfirmedQuantity_U : String(3);
  @sap.required.in.filter : 'false'
  @sap.label : 'Assign From Other Segments'
  @sap.quickinfo : 'Data element for domain BOOLE: TRUE (=''X'') and FALSE (='' '')'
  AssignFromOtherSegments : Boolean;
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'Latest Component Production Date'
  LatestCompProductionDate : Date;
  to_ZZ1_CombinPlannedOrdersCom : Association to many ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_CombinPlannedOrdersCom {  };
  to_ZZ1_I_PLANNEDORDER : Association to many ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_I_PLANNEDORDER {  };
  to_ZZ1_MasterPlannedOrders : Association to many ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_MasterPlannedOrders {  };
  to_ZZ1_MFI_CR_TYPE_PLA : Association to ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_MFI_CR_TYPE_V {  };
  to_ZZ1_PlannedOrdersCapacity : Association to many ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_PlannedOrdersCapacity {  };
  to_ZZ1_PlannedOrdersCompChar : Association to many ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_PlannedOrdersCompChar {  };
  to_ZZ1_Plant : Association to ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_Plant {  };
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
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Stock Segment'
  StockSegment : String(40);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Requirement Segment'
  RequirementSegment : String(40);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Seg. Strategy'
  @sap.quickinfo : 'Segmentation Strategy'
  SegmentationStrategy : String(8);
  @sap.required.in.filter : 'false'
  @sap.label : 'Operazione o fase'
  Operation_2 : String(4);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Gruppo di prodotti'
  @sap.quickinfo : 'Product Group'
  ProductGroup : String(9);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Theme'
  @sap.quickinfo : 'Fashion Theme'
  ProductTheme : String(10);
  to_StorageLocation : Association to ZZ1_COMBINEDPLNORDERSAPI_CDS.I_StorageLocation {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'ZZ1_I_PLANNEDORDER'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_I_PLANNEDORDER {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Planned Order'
  key PlannedOrder : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Master Plnd Ord.'
  @sap.quickinfo : 'Master Planned Order Number'
  FshMplndOrd : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Combined Plnd. Order'
  @sap.quickinfo : 'Combined Master Planned Order'
  CplndOrd : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Created by'
  @sap.quickinfo : 'User Who Created the Object'
  CreateUser : String(12);
  @sap.display.format : 'Date'
  @sap.label : 'Created On'
  @sap.quickinfo : 'Date on Which the Object Was Created'
  Createdate : Date;
  @sap.label : 'Created at'
  @sap.quickinfo : 'Time at Which the Object Was Created'
  Createtime : Time;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Changed by'
  @sap.quickinfo : 'Last User to Change the Object'
  Changeuser : String(12);
  @sap.display.format : 'Date'
  @sap.label : 'Changed on'
  @sap.quickinfo : 'Date on Which the Object Was Last Changed'
  Changedate : Date;
  @sap.label : 'Changed at'
  @sap.quickinfo : 'Time at Which the Object Was Last Changed'
  Changetime : Time;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Planned Order'
  POId : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Planned Order Type'
  PlannedOrderType : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Planned Order Category'
  PlannedOrderCategory : String(1);
  @sap.display.format : 'Date'
  @sap.label : 'Changed On'
  @sap.quickinfo : 'Last Changed On'
  LastChangeDate : Date;
  @odata.Type : 'Edm.DateTimeOffset'
  @sap.label : 'Change Time Stamp'
  @sap.quickinfo : 'Last Change to Planned Order: Time Stamp'
  LastChangeDateTime : DateTime;
  @sap.display.format : 'UpperCase'
  @sap.label : 'User'
  @sap.quickinfo : 'Last Change to Planned Order: User'
  LastChangedByUser : String(12);
  @sap.label : 'Planned Order Text'
  PlannedOrderLongText : String(255);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material'
  @sap.quickinfo : 'Planning material'
  Material : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product'
  @sap.quickinfo : 'Product Number'
  Product : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Planning Plant'
  MRPPlant : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'MRP Area'
  MRPArea : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'MRP Controller'
  MRPController : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Procurement Category'
  @sap.quickinfo : 'Material Procurement Category'
  MaterialProcurementCategory : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Procurement Type'
  @sap.quickinfo : 'Material Procurement Type'
  MaterialProcurementType : String(1);
  @sap.label : 'Material Goods Receipt Duration'
  @sap.quickinfo : 'Material Goods Receipt Duration in Days'
  MaterialGoodsReceiptDuration : Decimal(3, 0);
  @sap.label : 'Delivery Duration'
  @sap.quickinfo : 'Material Planned Delivery Duration in Days'
  MaterialPlannedDeliveryDurn : Decimal(3, 0);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Storage Location'
  StorageLocation : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Special Stock Type'
  @sap.quickinfo : 'Inventory Special Stock Type'
  InventorySpecialStockType : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Consumption Posting'
  ConsumptionPosting : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Maufacturer Material'
  @sap.quickinfo : 'Maufacturer Part Number Material'
  ManufacturerMaterial : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Issuing Storage Loc.'
  @sap.quickinfo : 'Issuing Storage Location for Stock Transport Order'
  IssuingStorageLocation : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'BOO Type'
  @sap.quickinfo : 'Bill of Operations Type'
  BillOfOperationsType : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Bill of Operations'
  @sap.quickinfo : 'Bill of Operations ID'
  BillOfOperations : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'BOO Group'
  @sap.quickinfo : 'Bill of Operations Group'
  BillOfOperationsGroup : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'BOO Variant'
  @sap.quickinfo : 'Bill of Operations Variant'
  BillOfOperationsVariant : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Alternative BOM'
  BillOfMaterialVariant : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'BOM Usage'
  BillOfMaterialVariantUsage : String(1);
  @sap.display.format : 'NonNegative'
  @sap.label : 'BOM Status'
  @sap.quickinfo : 'Bill of Material Status'
  BillOfMaterialStatus : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'BOM Version'
  BillOfMaterialVersion : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Explosion Date ID'
  @sap.quickinfo : 'Bill of Material Explosion Date ID'
  BOMExplosionDateID : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Production Plant'
  ProductionPlant : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Production Supervisor'
  ProductionSupervisor : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Production Version'
  ProductionVersion : String(4);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Planning Scenario'
  @sap.quickinfo : 'Planning Scenario in Long-Term Planning'
  MRPPlanningScenario : String(3);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Reservation'
  @sap.quickinfo : 'Number of reservation/dependent requirements'
  Reservation : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Settlement Reservation'
  SettlementReservation : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Settlement Reservation Item'
  SettlementReservationItem : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Purch. Organization'
  @sap.quickinfo : 'Purchasing Organization'
  PurchasingOrganization : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Purchase Agreement'
  @sap.quickinfo : 'Purchase Schedule/Outline Agreement'
  PurchasingDocument : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Agreement Item'
  @sap.quickinfo : 'Purchase Schedule/Outline Agreement Item'
  PurchasingDocumentItem : String(5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Quota Arrangement'
  QuotaArrangement : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Quota Arrangement Item'
  QuotaArrangementItem : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Fixed Vendor'
  FixedSupplier : String(10);
  @sap.label : 'SC Supplier'
  @sap.quickinfo : 'Subcontracting Supplier'
  SupplierIsSubcontractor : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Customer'
  @sap.quickinfo : 'Customer Number'
  Customer : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Order'
  SalesOrder : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Sales Order Item'
  SalesOrderItem : String(6);
  @sap.display.format : 'NonNegative'
  @sap.label : 'WBS Element Internal'
  @sap.quickinfo : 'Work Breakdown Structure Element Internal ID'
  WBSElementInternalID : String(24);
  @sap.display.format : 'NonNegative'
  @sap.label : 'WBS Internal ID'
  @sap.quickinfo : 'WBS Element'
  WBSElementInternalID_2 : String(8);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Capacity Requirement'
  @sap.quickinfo : 'ID of the Capacity Requirements Record'
  CapacityRequirement : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Scheduling Type'
  SchedulingType : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Scheduling Error'
  SchedulingError : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Change Number'
  ChangeNumber : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Revision Level'
  MaterialRevisionLevel : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Revision Level'
  MaterialRevisionLevel_2 : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Account Assignment Category'
  AccountAssignmentCategory : String(1);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Assembly Processing Type'
  AssemblyProcessingType : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Distribution Key'
  @sap.quickinfo : 'Distribution key for quantity produced'
  QuantityDistributionKey : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Standard Variant'
  @sap.quickinfo : 'Parameter Variant/Standard Variant'
  EffectivityParameterVariant : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Requirements Plan'
  RequirementPlan : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Availability Check Type'
  @sap.quickinfo : 'Type of Availability Check'
  ProductAvailabilityCheckType : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Central Contract'
  CentralContract : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Cent. Contract Item'
  @sap.quickinfo : 'Central Contract Item Number'
  CentralContractItem : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Action Control'
  @sap.quickinfo : 'Action Control: Planned Order Processing'
  PlannedOrderActionControl : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Planned Order Processing Action'
  @sap.quickinfo : 'Action in Planned Order Processing'
  PlannedOrderProcgAction : String(4);
  @sap.display.format : 'Date'
  @sap.label : 'Date of Action'
  @sap.quickinfo : 'Date of Action: Planned Order'
  PlannedOrderLastActionDate : Date;
  @sap.label : 'Action Time'
  @sap.quickinfo : 'Time of Action: Planned Order Processing'
  PlannedOrderLastActionTime : Time;
  @sap.label : 'Firming Indicator'
  @sap.quickinfo : 'Firming Indicator for Planned Order Data'
  PlannedOrderIsFirm : Boolean;
  @sap.label : 'BOM Fixing Indicator'
  @sap.quickinfo : 'Fixing Indicator for BOM Explosion'
  PlannedOrderBOMIsFixed : Boolean;
  @sap.label : 'Conversion Indicator'
  @sap.quickinfo : 'Planned Order Conversion Indicator'
  PlannedOrderIsConvertible : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Repet. Manufacturing'
  @sap.quickinfo : 'Repetitive Manufacturing indicator'
  PlndOrderIsCreatedForRptvMfg : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Kanban Indicator'
  PlndOrderReplnmtElmntType : String(1);
  @sap.label : 'Assembly Processing Indicator'
  @sap.quickinfo : 'Indicator: For Assembly Processing'
  PlndOrdIsCrtedForAssemblyProcg : Boolean;
  @sap.label : 'Capacity Dispatched'
  @sap.quickinfo : 'Indicator: Capacity for Planned Order is Dispatched'
  PlannedOrderCapacityIsDsptchd : Boolean;
  @sap.label : 'Scheduling'
  @sap.quickinfo : 'Scheduling indicator'
  OrderIsScheduled : Boolean;
  @sap.label : 'Planning Without Final Assembly'
  @sap.quickinfo : 'Indicator: Planning Without Final Assembly'
  IsPlannedWithoutFinalAssembly : Boolean;
  @sap.label : 'Collective Order'
  @sap.quickinfo : 'Order is Part of Collective Order'
  PlannedOrderIsPartOfCollvOrder : Boolean;
  @sap.display.format : 'Date'
  @sap.label : 'Order Start Date'
  @sap.quickinfo : 'Planned Order Start Date'
  PlndOrderPlannedStartDate : Date;
  @sap.label : 'Order Start Time'
  @sap.quickinfo : 'Planned Order Start Time'
  PlndOrderPlannedStartTime : Time;
  @sap.display.format : 'Date'
  @sap.label : 'Order End Date'
  @sap.quickinfo : 'Planned Order End Date'
  PlndOrderPlannedEndDate : Date;
  @sap.label : 'Order End Time'
  @sap.quickinfo : 'Planned Order End Time'
  PlndOrderPlannedEndTime : Time;
  @sap.display.format : 'Date'
  @sap.label : 'Order Opening Date'
  @sap.quickinfo : 'Planned Opening Date in Planned Order'
  PlannedOrderOpeningDate : Date;
  @sap.display.format : 'Date'
  @sap.label : 'Commitment Date'
  @sap.quickinfo : 'Planned Order Total Commitment Date According to ATP Check'
  PlndOrderTotalCmtmtDate : Date;
  @sap.display.format : 'Date'
  @sap.label : 'Production Start Dte'
  @sap.quickinfo : 'Start Date for Production'
  ProductionStartDate : Date;
  @sap.display.format : 'Date'
  @sap.label : 'Production End Date'
  @sap.quickinfo : 'End Date for Production'
  ProductionEndDate : Date;
  @sap.display.format : 'Date'
  @sap.label : 'Explosion Date'
  BOMExplosionDate : Date;
  @sap.label : 'Numerator'
  @sap.quickinfo : 'Numerator for Conversion to Base Units of Measure'
  PlndOrderBaseToEntryQtyNmrtr : Decimal(5, 0);
  @sap.label : 'Denominator'
  @sap.quickinfo : 'Denominator for conversion to base units of measure'
  PlndOrderBaseToEntryQtyDnmntr : Decimal(5, 0);
  @sap.label : 'Base Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);
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
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'ZZ1_MFI_CR_TYPE'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_MFI_CR_TYPE_V {
  @sap.text : 'Code_Text'
  @sap.label : 'Order type'
  key Code : String(3) not null;
  @sap.label : 'Order type (Desc.)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  Code_Text : String(60);
  @sap.label : 'Is Disabled'
  @sap.quickinfo : 'Custom Field: Code Disabled Indicator'
  IsDisabled : Boolean;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Planned Orders Capacity'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_PlannedOrdersCapacity {
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Capacity Requirement'
  @sap.quickinfo : 'ID of the Capacity Requirements Record'
  @sap.value.list : 'standard'
  key CapacityRequirement : String(12) not null;
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Capacity Requirement Item'
  @sap.value.list : 'standard'
  key CapacityRequirementItem : String(8) not null;
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Capacity Requirement Item Capacity'
  @sap.quickinfo : 'Individual Capacity of a Capacity Requirement Item'
  key CapacityRqmtItemCapacity : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Planned Order'
  @sap.value.list : 'standard'
  PlannedOrder : String(10);
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Work Center ID'
  @sap.value.list : 'standard'
  WorkCenterInternalID : String(8);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Work Center Type'
  WorkCenterType : String(2);
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Capacity ID'
  @sap.value.list : 'standard'
  CapacityInternalID : String(8);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'to_CapacityCategory/CapacityCategoryCode_Text'
  @sap.label : 'Capacity Category'
  @sap.value.list : 'standard'
  CapacityCategory : String(3);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Sequence'
  Sequence : String(6);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'OperationText'
  @sap.label : 'Operation or Phase'
  @sap.quickinfo : 'Operation or Phase Number'
  Operation : String(4);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'OperationText'
  @sap.label : 'Suboperation or Secondary Resource'
  @sap.quickinfo : 'Sub-Operation or Secondary Resource Number'
  SubOperation : String(4);
  @sap.required.in.filter : 'false'
  @sap.label : 'Operation Short Text'
  OperationText : String(40);
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'Latest Start Date'
  OperationLatestStartDate : Date;
  @sap.required.in.filter : 'false'
  @sap.label : 'Scheduled Setup'
  @sap.quickinfo : 'Scheduled Capacity Requirements for Setup'
  ScheduledCapReqOpSegSetupDurn : Double;
  @sap.required.in.filter : 'false'
  @sap.label : 'Capacity Unit'
  @sap.quickinfo : 'Unit of Measure for Capacity Requirements'
  @sap.semantics : 'unit-of-measure'
  CapacityRequirementUnit : String(3);
  @sap.required.in.filter : 'false'
  @sap.label : 'Remaining Setup'
  @sap.quickinfo : 'Remaining Capacity Requirements for Setup'
  RemainingCapReqOpSegSetupDurn : Double;
  @sap.required.in.filter : 'false'
  @sap.label : 'Scheduled Processing'
  @sap.quickinfo : 'Scheduled Capacity Requirements for Processing'
  ScheduledCapReqOpSegProcgDurn : Double;
  @sap.required.in.filter : 'false'
  @sap.label : 'Remaining Processing'
  @sap.quickinfo : 'Remaining Capacity Requirements for Processing'
  RemainingCapReqOpSegProcgDurn : Double;
  @sap.required.in.filter : 'false'
  @sap.label : 'Scheduled Teardown'
  @sap.quickinfo : 'Scheduled Capacity Requirements for the Teardown'
  ScheduledCapReqOpSegTrdwnDurn : Double;
  @sap.required.in.filter : 'false'
  @sap.label : 'Remaining Teardown'
  @sap.quickinfo : 'Remaining Capacity Requirements for Teardown'
  RemainingCapReqOpSegTrdwnDurn : Double;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Ord. pian. princ.'
  @sap.quickinfo : 'Master Planned Order Number'
  FshMplndOrd : String(12);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Ord. pian. combinato'
  @sap.quickinfo : 'Combined Master Planned Order'
  CplndOrd : String(12);
  to_CapacityCategory : Association to ZZ1_COMBINEDPLNORDERSAPI_CDS.I_CapacityCategory {  };
  to_CapacityRequirementItem : Association to ZZ1_COMBINEDPLNORDERSAPI_CDS.I_CapacityRequirementItem {  };
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
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Plant'
entity ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_Plant {
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'PlantName'
  @sap.label : 'Plant'
  key Plant : String(4) not null;
  @sap.required.in.filter : 'false'
  @sap.label : 'Plant Name'
  PlantName : String(30);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Valuation Area'
  ValuationArea : String(4);
  @sap.required.in.filter : 'false'
  @sap.label : 'Archiving Flag'
  @sap.quickinfo : 'Central archiving marker for master record'
  IsMarkedForArchiving : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Customer No Plant'
  @sap.quickinfo : 'Customer Number of Plant'
  @sap.value.list : 'standard'
  PlantCustomer : String(10);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Sppl. No. Plnt'
  @sap.quickinfo : 'Supplier Number of Plant'
  @sap.value.list : 'standard'
  PlantSupplier : String(10);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Factory Calendar'
  @sap.quickinfo : 'Factory calendar key'
  FactoryCalendar : String(2);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Purch. Organization'
  @sap.quickinfo : 'Purchasing Organization'
  DefaultPurchasingOrganization : String(4);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Sls Organization ICB'
  @sap.quickinfo : 'Sales Organization for Intercompany Billing'
  SalesOrganization : String(4);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Address'
  AddressID : String(10);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Plant Cat.'
  @sap.quickinfo : 'Plant category'
  PlantCategory : String(1);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Distrib.Channel'
  @sap.quickinfo : 'Distribution Channel for Intercompany billing'
  DistributionChannel : String(2);
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Interco. Billing Div'
  @sap.quickinfo : 'Division for Intercompany Billing'
  Division : String(2);
  @sap.required.in.filter : 'false'
  @sap.label : 'Language Key'
  Language : String(2);
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
  @sap.required.in.filter : 'false'
  @sap.label : 'fornitore'
  fornitore : String(70);
};

