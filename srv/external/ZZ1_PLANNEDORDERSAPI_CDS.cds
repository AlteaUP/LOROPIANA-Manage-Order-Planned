/* checksum : 1a8b0d995d816c5e6d628ebbb6481cd0 */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZZ1_PLANNEDORDERSAPI_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Account Assignment Category'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_AccountAssignmentCategory {
  @sap.display.format : 'UpperCase'
  @sap.text : 'AccountAssignmentCategory_Text'
  @sap.label : 'Acct Assignment Cat.'
  @sap.quickinfo : 'Account Assignment Category'
  key AccountAssignmentCategory : String(1) not null;
  @sap.label : 'Acct Assgnt. Cat. Desc.'
  @sap.quickinfo : 'Account Assignment Category Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  AccountAssignmentCategory_Text : String(20);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Consumption posting'
  @sap.quickinfo : 'Indicator: Consumption posting (Purchasing)'
  ConsumptionPosting : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Special Stock'
  @sap.quickinfo : 'Special Stock Indicator'
  InventorySpecialStockType : String(1);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Assortment List Type'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_AssortmentListType {
  @sap.display.format : 'UpperCase'
  @sap.text : 'AssortmentListType_Text'
  @sap.label : 'Assortment List Type'
  key AssortmentListType : String(1) not null;
  @sap.label : 'Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  AssortmentListType_Text : String(20);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_BasicMaterial {
  @sap.label : 'Basic Material'
  key BasicMaterial : String(48) not null;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Batch information'
@sap.value.list : 'true'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_BatchStdVH {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant'
  key Plant : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material'
  @sap.quickinfo : 'Material Number'
  key Material : String(40) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Batch'
  @sap.quickinfo : 'Batch Number'
  key Batch : String(10) not null;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'BOM Explosion Date'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_BOMExplosionDate {
  @sap.display.format : 'UpperCase'
  @sap.text : 'BOMExplosionDateText'
  @sap.label : 'Explosion Date ID'
  @sap.quickinfo : 'Bill of Material Explosion Date ID'
  key BOMExplosionDateID : String(8) not null;
  @sap.display.format : 'Date'
  @sap.label : 'Fixed Key Date'
  BOMExplosionFixedKeyDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material'
  @sap.quickinfo : 'Material Number'
  @sap.value.list : 'standard'
  Material : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant'
  @sap.value.list : 'standard'
  Plant : String(4);
  @sap.label : 'Explosion Date Text'
  @sap.quickinfo : 'Text for BOM Explosion Date ID'
  BOMExplosionDateText : String(40);
  @sap.label : 'Item Deleted'
  @sap.quickinfo : 'Item is Deleted'
  IsDeleted : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Standard Variant'
  @sap.quickinfo : 'Parameter Variant/Standard Variant'
  EffectivityParameterVariant : String(12);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Brand'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_Brand {
  @sap.display.format : 'UpperCase'
  @sap.text : 'Brand_Text'
  @sap.label : 'Brand'
  key Brand : String(4) not null;
  @sap.label : 'Brand Name'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  Brand_Text : String(30);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Brazil ANP Code'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_BR_ANPCode {
  @sap.display.format : 'NonNegative'
  @sap.text : 'BR_ANPCode_Text'
  @sap.label : 'ANP Code'
  key BR_ANPCode : String(9) not null;
  @sap.label : 'ANP Code Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  BR_ANPCode_Text : String(95);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Business Area'
@sap.value.list : 'true'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_BusinessAreaStdVH {
  @sap.display.format : 'UpperCase'
  @sap.text : 'BusinessArea_Text'
  @sap.label : 'Business Area'
  key BusinessArea : String(4) not null;
  @sap.label : 'Business Area Name'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  BusinessArea_Text : String(30);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Capacity Category'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_CapacityCategory {
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
entity ZZ1_PLANNEDORDERSAPI_CDS.I_CapacityRequirement {
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
entity ZZ1_PLANNEDORDERSAPI_CDS.I_CapacityRequirementItem {
  @sap.display.format : 'NonNegative'
  @sap.label : 'Capacity Requirement'
  @sap.quickinfo : 'ID of the Capacity Requirements Record'
  @sap.value.list : 'standard'
  key CapacityRequirement : String(12) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'Counter'
  @sap.quickinfo : 'Internal counter'
  key CapacityRequirementItem : String(8) not null;
  to_CapacityRequirement : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_CapacityRequirement {  };
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
entity ZZ1_PLANNEDORDERSAPI_CDS.I_CapacityRequirementStdVH {
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
entity ZZ1_PLANNEDORDERSAPI_CDS.I_CapacityStdVH {
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
@sap.label : 'Change Number'
@sap.value.list : 'true'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_ChangeMasterStdVH {
  @sap.display.format : 'UpperCase'
  @sap.text : 'ChangeNumberDescription'
  @sap.label : 'Change Number'
  key ChangeNumber : String(12) not null;
  @sap.label : 'Description'
  @sap.quickinfo : 'Change number description'
  ChangeNumberDescription : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Authorization Group'
  @sap.quickinfo : 'Authorization group for change master record'
  AuthorizationGroup : String(4);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Release Key'
  @sap.quickinfo : 'Release Key for Change Master Record'
  ChangeNumberReleaseKey : String(2);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Status'
  @sap.quickinfo : 'Status of Change Number'
  ChangeNumberStatus : String(2);
  @sap.label : 'Deletion Flag'
  @sap.quickinfo : 'Deletion Flag for Change Number (Reorganization)'
  ChangeNumberIsMrkdForDeletion : Boolean;
  @sap.display.format : 'Date'
  @sap.label : 'Valid From'
  @sap.quickinfo : 'Valid-From Date'
  ChangeNumberValidFromDate : Date;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Chemical Compliance Relevant Indicator'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_ChemicalComplianceRelevant {
  @sap.display.format : 'UpperCase'
  @sap.text : 'IsChemicalComplianceRelevant_Text'
  @sap.label : 'Chemical Compliance Relevance Indicator'
  key IsChemicalComplianceRelevant : String(1) not null;
  @sap.label : 'Short Description'
  @sap.quickinfo : 'Short Text for Fixed Values'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  IsChemicalComplianceRelevant_Text : String(60);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Controlling Area'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_ControllingArea {
  @sap.display.format : 'UpperCase'
  @sap.text : 'ControllingAreaName'
  @sap.label : 'Controlling Area'
  key ControllingArea : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Fiscal Year Variant'
  FiscalYearVariant : String(2);
  @sap.label : 'Controlling Area Name'
  ControllingAreaName : String(25);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Controlling Area Currency'
  @sap.semantics : 'currency-code'
  ControllingAreaCurrency : String(5);
  @sap.display.format : 'UpperCase'
  @sap.text : 'ChartOfAccounts_Text'
  @sap.label : 'Chart of Accounts'
  ChartOfAccounts : String(4);
  @sap.label : 'Chart of Accounts Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ChartOfAccounts_Text : String(50);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cost Center Standard Hierarchy'
  CostCenterStandardHierarchy : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Operating concern'
  OperatingConcern : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Profit Center Standard Hierarchy'
  ProfitCenterStandardHierarchy : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Business Process Standard Hierarchy Area'
  BusinessProcessStandardHier : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'G/L Account for Supplier Down Payments'
  @sap.quickinfo : 'Default General Ledger Account for Supplier Down Payments'
  CreditDownPaymentDefaultGLAcct : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'G/L Account for Customer Down Payments'
  @sap.quickinfo : 'Default General Ledger Account for Customer Down Payments'
  DebitDownPaymentDefaultGLAcct : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Currency Type for Controlling Area'
  ControllingAreaCurrencyRole : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'FM Area'
  @sap.quickinfo : 'Financial Management Area'
  FinancialManagementArea : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Responsible User of Controlling Area'
  ControllingAreaResponsibleUser : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Default Profit Center'
  @sap.quickinfo : 'Default Profit Center for Nonassigned Processes'
  DefaultProfitCenter : String(10);
  @sap.display.format : 'UpperCase'
  @sap.text : 'CtrlgStdFinStatementVersion_Text'
  @sap.label : 'Leading Ctrlg Financial Stmnt Version'
  @sap.quickinfo : 'Leading Controlling Financial Statement Version'
  CtrlgStdFinStatementVersion : String(42);
  @sap.label : 'Financial Statement Description'
  @sap.quickinfo : 'Hierarchy description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CtrlgStdFinStatementVersion_Text : String(50);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Profit Center Local Currency'
  @sap.quickinfo : 'Local Currency for Profit Center Accounting'
  @sap.semantics : 'currency-code'
  ProfitCenterAccountingCurrency : String(5);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Cost Center'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_CostCenter {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Controlling Area'
  key ControllingArea : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.text : 'CostCenter_Text'
  @sap.label : 'Cost Center'
  key CostCenter : String(10) not null;
  @sap.label : 'Cost Center Name'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CostCenter_Text : String(20);
  @sap.display.format : 'Date'
  @sap.label : 'Valid To'
  @sap.quickinfo : 'Valid To Date'
  ValidityEndDate : Date;
  @sap.display.format : 'Date'
  @sap.label : 'Valid From'
  @sap.quickinfo : 'Valid-From Date'
  ValidityStartDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Actual primary costs'
  @sap.quickinfo : 'Lock Indicator for Actual Primary Postings'
  IsBlkdForPrimaryCostsPosting : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plan primary costs'
  @sap.quickinfo : 'Lock Indicator for Plan Primary Costs'
  IsBlockedForPlanPrimaryCosts : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Company Code'
  CompanyCode : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Business Area'
  BusinessArea : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cost Center Category'
  CostCenterCategory : String(1);
  @sap.label : 'Person Responsible'
  CostCtrResponsiblePersonName : String(20);
  @sap.display.format : 'UpperCase'
  @sap.label : 'User Responsible'
  CostCtrResponsibleUser : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Currency'
  @sap.quickinfo : 'Currency Key'
  @sap.semantics : 'currency-code'
  CostCenterCurrency : String(5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Costing Sheet'
  CostingSheet : String(6);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Jurisdiction'
  TaxJurisdiction : String(15);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Profit Center'
  ProfitCenter : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant'
  Plant : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Logical System'
  LogicalSystem : String(10);
  @sap.display.format : 'Date'
  @sap.label : 'Entered On'
  CostCenterCreationDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Created By'
  @sap.quickinfo : 'Entered By'
  CostCenterCreatedByUser : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Actl Sec. Costs'
  @sap.quickinfo : 'Lock Indicator for Actual Secondary Costs'
  IsBlkdForSecondaryCostsPosting : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Actual Revenues'
  @sap.quickinfo : 'Lock Indicator for Actual Revenue Postings'
  IsBlockedForRevenuePosting : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Commitment Update'
  @sap.quickinfo : 'Lock Indicator for Commitment Update'
  IsBlockedForCommitmentPosting : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Lock Plan Sec Costs'
  @sap.quickinfo : 'Lock Indicator for Plan Secondary Costs'
  IsBlockedForPlanSecondaryCosts : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Lock Planning Revn'
  @sap.quickinfo : 'Lock Indicator for Planning Revenues'
  IsBlockedForPlanRevenues : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Allocation Methods'
  @sap.quickinfo : 'Indicator for Allowed Allocation Methods'
  CostCenterAllocationMethod : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Record Quantity'
  @sap.quickinfo : 'Indicator for Recording Consumption Quantities'
  ConsumptionQtyIsRecorded : String(1);
  @sap.label : 'Department'
  Department : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Subsequent Cost Ctr.'
  @sap.quickinfo : 'Subsequent Cost Center'
  SubsequentCostCenter : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Usage'
  @sap.quickinfo : 'Usage of the condition table'
  ConditionUsage : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Application'
  ConditionApplication : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Overhead Key'
  @sap.quickinfo : 'CO-CCA Overhead Key'
  CostCenterAccountingOverhead : String(6);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Country/Region Key'
  Country : String(3);
  @sap.label : 'Title'
  FormOfAddress : String(15);
  @sap.label : 'Name'
  @sap.quickinfo : 'Name 1'
  AddressName : String(35);
  @sap.label : 'Name 2'
  AddressAdditionalName : String(35);
  @sap.label : 'Name 3'
  CostCenterAddrName3 : String(35);
  @sap.label : 'Name 4'
  CostCenterAddrName4 : String(35);
  @sap.label : 'City'
  CityName : String(35);
  @sap.label : 'District'
  District : String(35);
  @sap.label : 'Street'
  @sap.quickinfo : 'Street and House Number'
  StreetAddressName : String(35);
  @sap.display.format : 'UpperCase'
  @sap.label : 'PO Box'
  POBox : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Postal Code'
  PostalCode : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'P.O. Box Postal Code'
  POBoxPostalCode : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Region'
  @sap.quickinfo : 'Region (State, Province, County)'
  Region : String(3);
  @sap.label : 'Language Key'
  Language : String(2);
  @sap.label : 'Telebox Number'
  TeleboxNumber : String(15);
  @sap.label : 'Telephone 1'
  @sap.quickinfo : 'First telephone number'
  PhoneNumber1 : String(16);
  @sap.label : 'Telephone 2'
  @sap.quickinfo : 'Second telephone number'
  PhoneNumber2 : String(16);
  @sap.label : 'Fax Number'
  FaxNumber : String(31);
  @sap.label : 'Teletex Number'
  TeletexNumber : String(30);
  @sap.label : 'Telex Number'
  TelexNumber : String(30);
  @sap.label : 'Data line'
  @sap.quickinfo : 'Data communication line no.'
  DataCommunicationPhoneNumber : String(14);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Printer Destination'
  @sap.quickinfo : 'Printer Destination for CCtr Report'
  CostCenterPrinterDestination : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Hierarchy Area'
  @sap.quickinfo : 'Standard Hierarchy Area'
  CostCenterStandardHierArea : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cost Collector Key'
  CostCollector : String(23);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Complete'
  @sap.quickinfo : 'Completion Flag for the Cost Center Master Record'
  CostCenterIsComplete : String(1);
  @sap.label : 'Cost Center Is Stat.'
  @sap.quickinfo : 'Indicator: Cost Center is Statistical Account Assignment'
  IsStatisticalCostCenter : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Object number'
  ObjectInternalID : String(22);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Function'
  @sap.quickinfo : 'Function of Cost Center'
  CostCenterFunction : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Altern. Function'
  @sap.quickinfo : 'Alternative Function of Cost Center'
  CostCenterAlternativeFunction : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Functional Area'
  FunctionalArea : String(16);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Activity-Indep.Temp.'
  @sap.quickinfo : 'Template for Activity-Independent Formula Planning'
  ActyIndepFormulaPlanningTmpl : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Activity-Dep.Tmp'
  @sap.quickinfo : 'Template for Activity-Dependent Formula Planning'
  ActyDepdntFormulaPlanningTmpl : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Acty-IndepTemplAlloc'
  @sap.quickinfo : 'Template: Activity-Independent Allocation to Cost Center'
  ActyIndependentAllocationTmpl : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Acty-Dep Templ.Alloc'
  @sap.quickinfo : 'Template: Activity-Dependent Allocation to Cost Center'
  ActyDependentAllocationTmpl : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Templ.: Stat. KF'
  @sap.quickinfo : 'CCA_TEMPL_SKI'
  ActlIndepStatisticalKeyFigures : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Templ.: Stat. KF'
  @sap.quickinfo : 'Template: Act. Stat. Key Figure - Cost Center/Activity Type'
  ActlDepStatisticalKeyFigures : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Joint venture'
  JointVenture : String(6);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Recovery Indicator'
  JointVentureRecoveryCode : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Equity Type'
  JointVentureEquityType : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'JV Object Type'
  @sap.quickinfo : 'Joint Venture Object Type'
  JointVentureObjectType : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'JIB/JIBE Class'
  JointVentureClass : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'JIB/JIBE Subclass A'
  JointVentureSubClass : String(5);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Budget Cost Center'
  @sap.quickinfo : 'Budget-Carrying Cost Center'
  BudgetCarryingCostCenter : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Availy Ctrl Prfl'
  @sap.quickinfo : 'Budget Availability Control: Profile'
  AvailabilityControlProfile : String(6);
  @sap.label : 'AVC is Active'
  @sap.quickinfo : 'Budget Availability Control for Cost Centers is Active'
  AvailabilityControlIsActive : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Fund'
  Fund : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Grant'
  GrantID : String(20);
  @sap.label : 'Fund Fixed Assignment'
  @sap.quickinfo : 'Indicator for Fund with Fixed Assignment'
  FundIsFixAssigned : Boolean;
  @sap.label : 'Grant Fixed Assignment'
  @sap.quickinfo : 'Indicator for Grant with Fixed Assignment'
  GrantIDIsFixAssigned : Boolean;
  @sap.label : 'Functional Area Fixed Assignment'
  @sap.quickinfo : 'Indicator for Functional Area with Fixed Assignment'
  FunctionalAreaIsFixAssigned : Boolean;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Customer'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_Customer {
  @sap.display.format : 'UpperCase'
  @sap.text : 'CustomerName'
  @sap.label : 'Customer'
  @sap.quickinfo : 'Customer Number'
  key Customer : String(10) not null;
  @sap.label : 'Name of Customer'
  CustomerName : String(80);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Customer Name'
  @sap.quickinfo : 'Customer Full Name'
  CustomerFullName : String(220);
  @sap.label : 'Name of Customer'
  @sap.quickinfo : 'Customer Name'
  BPCustomerName : String(81);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Customer Name'
  @sap.quickinfo : 'Customer Full Name'
  BPCustomerFullName : String(220);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Created by'
  @sap.quickinfo : 'Name of Person who Created the Object'
  CreatedByUser : String(12);
  @sap.display.format : 'Date'
  @sap.label : 'Created On'
  @sap.quickinfo : 'Record Created On'
  CreationDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Address'
  AddressID : String(10);
  @sap.display.format : 'UpperCase'
  @sap.text : 'CustomerClassification_Text'
  @sap.label : 'Customer Classific.'
  @sap.quickinfo : 'Customer Classification'
  CustomerClassification : String(2);
  @sap.label : 'Customer Classification Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CustomerClassification_Text : String(20);
  @sap.display.format : 'UpperCase'
  @sap.label : 'VAT Registration No.'
  @sap.quickinfo : 'VAT Registration Number'
  VATRegistration : String(20);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Account group'
  @sap.quickinfo : 'Customer Account Group'
  CustomerAccountGroup : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Authorization'
  @sap.quickinfo : 'Authorization Group'
  AuthorizationGroup : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Delivery block'
  @sap.quickinfo : 'Central delivery block for the customer'
  DeliveryIsBlocked : String(2);
  @sap.label : 'Posting Block'
  @sap.quickinfo : 'Central posting block'
  PostingIsBlocked : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Billing block'
  @sap.quickinfo : 'Central billing block for customer'
  BillingIsBlockedForCustomer : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Order block'
  @sap.quickinfo : 'Central order block for customer'
  OrderIsBlockedForCustomer : String(2);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Int. location no. 1'
  @sap.quickinfo : 'International Location Number (Part 1)'
  InternationalLocationNumber1 : String(7);
  @sap.label : 'One-time account'
  @sap.quickinfo : 'Indicator: Is the account a one-time account?'
  IsOneTimeAccount : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Jurisdiction'
  TaxJurisdiction : String(15);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Industry'
  @sap.quickinfo : 'Industry Key'
  Industry : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax number type'
  @sap.quickinfo : 'Tax Number Type'
  TaxNumberType : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Number 1'
  TaxNumber1 : String(16);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Number 2'
  TaxNumber2 : String(11);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Number 3'
  TaxNumber3 : String(18);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Number 4'
  TaxNumber4 : String(18);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Number 5'
  TaxNumber5 : String(60);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Number 6'
  TaxNumber6 : String(20);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Group Key'
  CustomerCorporateGroup : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Supplier'
  @sap.quickinfo : 'Account Number of Supplier'
  Supplier : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Nielsen indicator'
  @sap.quickinfo : 'Nielsen ID'
  NielsenRegion : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Industry code 1'
  IndustryCode1 : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Industry code 2'
  IndustryCode2 : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Industry code 3'
  IndustryCode3 : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Industry code 4'
  IndustryCode4 : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Industry code 5'
  IndustryCode5 : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Country/Region Key'
  Country : String(3);
  @sap.label : 'Name'
  @sap.quickinfo : 'Name 1'
  OrganizationBPName1 : String(35);
  @sap.label : 'Name 2'
  OrganizationBPName2 : String(35);
  @sap.label : 'City'
  CityName : String(35);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Postal Code'
  PostalCode : String(10);
  @sap.label : 'Street'
  @sap.quickinfo : 'Street and House Number'
  StreetName : String(35);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Search term'
  @sap.quickinfo : 'Sort field'
  SortField : String(10);
  @sap.label : 'Fax Number'
  FaxNumber : String(31);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Suframa Code'
  BR_SUFRAMACode : String(9);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Region'
  @sap.quickinfo : 'Region (State, Province, County)'
  Region : String(3);
  @sap.label : 'Telephone 1'
  @sap.quickinfo : 'First telephone number'
  TelephoneNumber1 : String(16);
  @sap.label : 'Telephone 2'
  @sap.quickinfo : 'Second telephone number'
  TelephoneNumber2 : String(16);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Alternative Payer'
  @sap.quickinfo : 'Account Number of an Alternative Payer'
  AlternativePayerAccount : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'DME Recipient Code'
  @sap.quickinfo : 'Recipient Code for Data Medium Exchange'
  DataMediumExchangeIndicator : String(1);
  @sap.label : 'Liable for VAT'
  VATLiability : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Purpose Completed'
  @sap.quickinfo : 'Business Purpose Completed Flag'
  IsBusinessPurposeCompleted : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Type'
  ResponsibleType : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Fiscal address'
  @sap.quickinfo : 'Account number of the master record with the fiscal address'
  FiscalAddress : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Natural Person'
  NFPartnerIsNaturalPerson : String(1);
  @sap.label : 'Deletion Flag'
  @sap.quickinfo : 'Central Deletion Flag for Master Record'
  DeletionIndicator : Boolean;
  @sap.label : 'Language Key'
  Language : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Trading Partner No.'
  @sap.quickinfo : 'Company ID of Trading Partner'
  TradingPartner : String(6);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Deliv Date Rule'
  @sap.quickinfo : 'Delivery Date Rule'
  DeliveryDateTypeRule : String(1);
  @sap.label : 'Express station'
  @sap.quickinfo : 'Express train station'
  ExpressTrainStationName : String(25);
  @sap.label : 'Train station'
  TrainStationName : String(25);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Int. location no. 2'
  @sap.quickinfo : 'International Location Number (Part 2)'
  InternationalLocationNumber2 : String(5);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Check digit'
  @sap.quickinfo : 'Check digit for the international location number'
  InternationalLocationNumber3 : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'City Code'
  CityCode : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'County Code'
  County : String(3);
  @sap.label : 'Unloading points'
  @sap.quickinfo : 'Indicator: Unloading points exist'
  CustomerHasUnloadingPoint : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Working times'
  @sap.quickinfo : 'Working Time Calendar'
  CustomerWorkingTimeCalendar : String(2);
  @sap.label : 'Competitors'
  @sap.quickinfo : 'Indicator: Competitor'
  IsCompetitor : Boolean;
  @sap.label : 'Rep''s Name'
  @sap.quickinfo : 'Name of Representative'
  TaxInvoiceRepresentativeName : String(10);
  @sap.label : 'Type of Business'
  BusinessType : String(30);
  @sap.label : 'Type of Industry'
  IndustryType : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Consolidated Invoic.'
  @sap.quickinfo : 'Consolidated Invoicing for Taiwan'
  TW_CollvBillingIsSupported : String(1);
  @sap.label : 'Alt.payer in doc?'
  @sap.quickinfo : 'Indicator: Is an alternative payer allowed in document?'
  AlternativePayeeIsAllowed : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Attribute 1'
  FreeDefinedAttribute01 : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Commercial Category'
  FreeDefinedAttribute02 : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Main BusinessType'
  @sap.quickinfo : 'Attribute 3 - Main BusType'
  FreeDefinedAttribute03 : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'SubChannel'
  FreeDefinedAttribute04 : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Attribute 5'
  FreeDefinedAttribute05 : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Attribute 6'
  FreeDefinedAttribute06 : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Attribute 7'
  FreeDefinedAttribute07 : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Commercial Area'
  FreeDefinedAttribute08 : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Like For Like Flag'
  @sap.quickinfo : 'L4L Flag'
  FreeDefinedAttribute09 : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sell-Out Currency'
  FreeDefinedAttribute10 : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Payment Reason'
  PaymentReason : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'RTW category'
  @sap.quickinfo : 'Customer condition group 1 - RTW category'
  CustomerConditionGroup1 : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'MTM Category'
  @sap.quickinfo : 'Customer condition group 2 - MTM Category'
  CustomerConditionGroup2 : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Condition group 3'
  @sap.quickinfo : 'Customer condition group 3'
  CustomerConditionGroup3 : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Condition group 4'
  @sap.quickinfo : 'Customer condition group 4'
  CustomerConditionGroup4 : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Condition group 5'
  @sap.quickinfo : 'Customer condition group 5'
  CustomerConditionGroup5 : String(2);
  @sap.label : 'Prospect'
  @sap.quickinfo : 'Indicator: Sales prospect'
  IsSalesProspect : Boolean;
  @sap.label : 'Payment block'
  @sap.quickinfo : 'Payment Block'
  PaymentIsBlockedForCustomer : Boolean;
  @sap.label : 'Consumer'
  @sap.quickinfo : 'Indicator: Consumer'
  IsConsumer : Boolean;
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
  @sap.label : 'Name'
  @sap.quickinfo : 'Name 1'
  BusinessPartnerName1 : String(40);
  @sap.label : 'Name 2'
  BusinessPartnerName2 : String(40);
  @sap.label : 'Name 3'
  BusinessPartnerName3 : String(40);
  @sap.label : 'Name 4'
  BusinessPartnerName4 : String(40);
  @sap.label : 'City'
  BPAddrCityName : String(40);
  @sap.label : 'Street'
  BPAddrStreetName : String(60);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Search Term 1'
  AddressSearchTerm1 : String(20);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Search Term 2'
  AddressSearchTerm2 : String(20);
  @sap.label : 'District'
  DistrictName : String(40);
  @sap.label : 'PO Box City'
  @sap.quickinfo : 'PO Box city'
  POBoxDeviatingCityName : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Title Key'
  @sap.quickinfo : 'Form-of-Address Key'
  BusinessPartnerFormOfAddress : String(4);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Debit Credit Code'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_DebitCreditCode {
  @sap.display.format : 'UpperCase'
  @sap.text : 'DebitCreditCode_Text'
  @sap.label : 'Debit/Credit Code'
  key DebitCreditCode : String(1) not null;
  @sap.label : 'D/C Code Name'
  @sap.quickinfo : 'Debit/Credit Code Name'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  DebitCreditCode_Text : String(60);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Division'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_Division {
  @sap.display.format : 'UpperCase'
  @sap.text : 'Division_Text'
  @sap.label : 'Division'
  key Division : String(2) not null;
  @sap.label : 'Division Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  Division_Text : String(20);
  @sap.label : 'Division OID'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  DivisionOID : String(128);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Handling Unit Type'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_EWM_HandlingUnitType {
  @sap.display.format : 'UpperCase'
  @sap.text : 'HandlingUnitType_Text'
  @sap.label : 'Handling Unit Type'
  key HandlingUnitType : String(4) not null;
  @sap.label : 'Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  HandlingUnitType_Text : String(40);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Material Handling'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_EWM_MaterialHandling {
  @sap.display.format : 'UpperCase'
  @sap.text : 'MaterialHandling_Text'
  @sap.label : 'Handling Indicator'
  key MaterialHandling : String(4) not null;
  @sap.label : 'Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MaterialHandling_Text : String(40);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Quality Inspection Group'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_EWM_QualityInspectionGroup {
  @sap.display.format : 'UpperCase'
  @sap.text : 'QualityInspectionGroup_Text'
  @sap.label : 'Quality Inspec. Grp'
  @sap.quickinfo : 'Quality Inspection Group'
  key QualityInspectionGroup : String(4) not null;
  @sap.label : 'Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  QualityInspectionGroup_Text : String(40);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Serial Number Profile'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_EWM_SerialNumberProfile {
  @sap.display.format : 'UpperCase'
  @sap.text : 'SerialNumberProfile_Text'
  @sap.label : 'Serial No. Profile'
  @sap.quickinfo : 'Serial Number Profile'
  key SerialNumberProfile : String(4) not null;
  @sap.label : 'Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SerialNumberProfile_Text : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Ser. No. Requirement'
  @sap.quickinfo : 'Serial Number Requirement'
  SerialNumberRequiredLevel : String(1);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Warehouse Product Group'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_EWM_WarehouseMaterialGroup {
  @sap.display.format : 'UpperCase'
  @sap.text : 'WarehouseProductGroup_Text'
  @sap.label : 'Whse Product Group'
  @sap.quickinfo : 'Warehouse Product Group'
  key WarehouseProductGroup : String(4) not null;
  @sap.label : 'Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  WarehouseProductGroup_Text : String(40);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Warehouse Storage Condition'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_EWM_WhseStorageCondition {
  @sap.display.format : 'UpperCase'
  @sap.text : 'WarehouseStorageCondition_Text'
  @sap.label : 'Whse Stor. Condition'
  @sap.quickinfo : 'Warehouse Storage Condition'
  key WarehouseStorageCondition : String(2) not null;
  @sap.label : 'Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  WarehouseStorageCondition_Text : String(40);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'External Product Group'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_ExtProdGrp {
  @sap.display.format : 'UpperCase'
  @sap.text : 'ExternalProductGroup_Text'
  @sap.label : 'Ext. Product Group'
  @sap.quickinfo : 'External Product Group'
  key ExternalProductGroup : String(18) not null;
  @sap.label : 'Ext. Prod Grp Descr'
  @sap.quickinfo : 'Description for external product group'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ExternalProductGroup_Text : String(20);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'General Ledger Account'
@sap.value.list : 'true'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_GLAccountStdVH {
  @sap.display.format : 'UpperCase'
  @sap.text : 'GLAccount_Text'
  @sap.label : 'G/L Account'
  @sap.quickinfo : 'G/L Account Number'
  key GLAccount : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Company Code'
  key CompanyCode : String(4) not null;
  @sap.label : 'G/L Account Name'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  GLAccount_Text : String(20);
  @sap.display.format : 'UpperCase'
  @sap.label : 'G/L Acct External ID'
  @sap.quickinfo : 'G/L Account Number'
  GLAccountExternal : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Alternative G/L Account'
  @sap.quickinfo : 'Alternative G/L Account Number In Company Code'
  AlternativeGLAccount : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Chart of Accounts'
  ChartOfAccounts : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Account Group'
  @sap.quickinfo : 'G/L Account Group'
  GLAccountGroup : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'G/L Account Type'
  @sap.quickinfo : 'Type of a General Ledger Account'
  GLAccountType : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Reconcil. ID'
  @sap.quickinfo : 'Account Is Reconciliation Account'
  ReconciliationAccountType : String(1);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Goods Movement Type'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_GoodsMovementType {
  @sap.display.format : 'UpperCase'
  @sap.text : 'GoodsMovementType_Text'
  @sap.label : 'Movement Type'
  @sap.quickinfo : 'Movement Type (Inventory Management)'
  key GoodsMovementType : String(3) not null;
  @sap.label : 'Movement Type Text'
  @sap.quickinfo : 'Movement Type Text (Inventory Management)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  GoodsMovementType_Text : String(20);
  @sap.label : 'Rev. mvmnt type ind.'
  @sap.quickinfo : 'Reversal movement type'
  IsReversalMovementType : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.text : 'to_DebitCreditCode/DebitCreditCode_Text'
  @sap.label : 'Debit/Credit Ind.'
  @sap.quickinfo : 'Debit/Credit Indicator'
  @sap.value.list : 'fixed-values'
  DebitCreditCode : String(1);
  @sap.display.format : 'UpperCase'
  @sap.text : 'to_ResvnAcctAssgmtCategory/ResvnAcctAssgmtCategory_Text'
  @sap.label : 'Reserv. cat.'
  @sap.quickinfo : 'Account assignment of reservation'
  @sap.value.list : 'fixed-values'
  ResvnAcctAssgmtCategory : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Posting string ref.'
  @sap.quickinfo : 'Posting string reference (Inventory Management)'
  BasicMovementTypeReference : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Goods Movement Type'
  @sap.quickinfo : 'Goods Movement Type (Inventory Management) copied'
  SourceGoodsMovementType : String(3);
  to_DebitCreditCode : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_DebitCreditCode {  };
  to_ResvnAcctAssgmtCategory : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_ResvnAcctAssgmtCategory {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'International Article Number Category'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_Intntnlartnmbcat {
  @sap.display.format : 'UpperCase'
  @sap.text : 'InternationalArticleNumberCat_Text'
  @sap.label : 'GTIN Category'
  @sap.quickinfo : 'Category of Global Trade Item Number (GTIN)'
  key InternationalArticleNumberCat : String(2) not null;
  @sap.label : 'Number category text'
  @sap.quickinfo : 'Description of number category'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InternationalArticleNumberCat_Text : String(40);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Inventory Special Stock Type'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_InventorySpecialStockType {
  @sap.display.format : 'UpperCase'
  @sap.text : 'InventorySpecialStockType_Text'
  @sap.label : 'Special Stock'
  @sap.quickinfo : 'Special Stock Indicator'
  key InventorySpecialStockType : String(1) not null;
  @sap.label : 'Special stock descr.'
  @sap.quickinfo : 'Description of special stock'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InventorySpecialStockType_Text : String(20);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Valuation Type of Special Stock'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_InvtrySpecialStockValnType {
  @sap.display.format : 'UpperCase'
  @sap.text : 'InventorySpecialStockValnType_Text'
  @sap.label : 'Inventory Special Stock Valuation Type'
  key InventorySpecialStockValnType : String(1) not null;
  @sap.label : 'Special Stock Valuation Type Name'
  @sap.quickinfo : 'Name for Valuation Type of Inventory Special Stock'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InventorySpecialStockValnType_Text : String(60);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Item Category Group'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_ItemCategoryGroup {
  @sap.display.format : 'UpperCase'
  @sap.text : 'ItemCategoryGroup_Text'
  @sap.label : 'Item Category Group'
  @sap.quickinfo : 'Item Category Group from Material Master'
  key ItemCategoryGroup : String(4) not null;
  @sap.label : 'Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ItemCategoryGroup_Text : String(20);
  @sap.label : 'Item Cat. Group OID'
  @sap.quickinfo : 'Item Category Group OID'
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  ItemCategoryGroupOID : String(128);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.semantics : 'aggregate'
@sap.label : 'Logistics Order'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_LogisticsOrder {
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key ID : LargeString not null;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Order'
  @sap.quickinfo : 'Order Number'
  OrderID : String(12);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.label : 'Order Category'
  OrderCategory : String(2);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Order Type'
  OrderType : String(4);
  @sap.label : 'Order Description'
  OrderDescription : String(40);
  @sap.aggregation.role : 'dimension'
  @sap.label : 'Order Has Long Text'
  OrderHasLongText : Boolean;
  @sap.aggregation.role : 'dimension'
  @sap.label : 'Long Text Language'
  LongTextLanguage : String(2);
  @sap.aggregation.role : 'dimension'
  @sap.label : 'Deletion Flag'
  IsMarkedForDeletion : Boolean;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Multiple Items'
  @sap.quickinfo : 'Order Has Multiple Items'
  MfgOrderHasMultipleItems : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Collective Order'
  @sap.quickinfo : 'Order is Part of Collective Order'
  MfgOrderIsPartOfCollvOrder : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Superior Order'
  @sap.quickinfo : 'Number of Superior Order'
  MfgOrderSuperiorMfgOrder : String(12);
  @sap.aggregation.role : 'dimension'
  @sap.label : 'Refurbishment order'
  @sap.quickinfo : 'Refurbishment order indicator (PM)'
  OrderIsRefurbishmentOrder : Boolean;
  @sap.aggregation.role : 'dimension'
  @sap.label : 'Statistical'
  @sap.quickinfo : 'Identifier for Statistical Order'
  IsStatisticalOrder : Boolean;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Priority'
  @sap.quickinfo : 'Order priority'
  PriorityCode : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.label : 'Level'
  @sap.quickinfo : 'Level (in multi-level BOM explosions)'
  MfgOrderHierarchyLevel : Decimal(2, 0);
  @sap.aggregation.role : 'dimension'
  @sap.label : 'Flexible Processing'
  ProdnProcgIsFlexible : Boolean;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Event-Based Posting'
  OrderIsEventBasedPosting : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Event-Based Posting'
  EventBasedPostingMethod : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.label : 'Created On'
  CreationDate : Date;
  @sap.aggregation.role : 'dimension'
  @sap.label : 'Time created'
  CreationTime : Time;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Entered By'
  CreatedByUser : String(12);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.label : 'Changed On'
  @sap.quickinfo : 'Change Date for Order Master'
  LastChangeDate : Date;
  @sap.aggregation.role : 'dimension'
  @sap.label : 'Changed At'
  LastChangeTime : Time;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Last Changed By'
  LastChangedByUser : String(12);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.label : 'Opertn Task List No.'
  @sap.quickinfo : 'Routing Number of Operations in the Order'
  OrderInternalBillOfOperations : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Reference Order'
  @sap.quickinfo : 'Reference Order Number'
  ReferenceOrder : String(12);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Leading Order'
  @sap.quickinfo : 'Leading Order in Current Processing'
  LeadingOrder : String(12);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant'
  @sap.value.list : 'standard'
  Plant : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Main Work Center'
  @sap.quickinfo : 'Main work center for maintenance tasks'
  MainWorkCenter : String(8);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant for WorkCenter'
  @sap.quickinfo : 'Plant associated with main work center'
  @sap.value.list : 'standard'
  MainWorkCenterPlant : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Location/Plant'
  @sap.quickinfo : 'Location'
  MaintenanceObjectLocation : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Location Plant'
  LocationPlant : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'MRP controller'
  @sap.quickinfo : 'MRP controller for the order'
  MRPController : String(3);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Prodn Supervisor'
  @sap.quickinfo : 'Production Supervisor'
  ProductionSupervisor : String(3);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Prod. Sched. Profile'
  @sap.quickinfo : 'Production Scheduling Profile'
  ProductionSchedulingProfile : String(6);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Planner Group'
  @sap.quickinfo : 'Responsible Planner Group or Department'
  ResponsiblePlannerGroup : String(3);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Order'
  @sap.quickinfo : 'Sales Order Number'
  @sap.value.list : 'standard'
  SalesOrder : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.label : 'Sales Order Item'
  @sap.quickinfo : 'Item Number in Sales Order'
  @sap.value.list : 'standard'
  SalesOrderItem : String(6);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.label : 'WBS Element'
  @sap.quickinfo : 'Work Breakdown Structure Element (WBS Element)'
  WBSElementInternalID : String(24);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.label : 'WBS Internal ID'
  @sap.quickinfo : 'WBS Element'
  @sap.value.list : 'standard'
  WBSElementInternalID_2 : String(8);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.label : 'Project def.'
  @sap.quickinfo : 'Project definition'
  ProjectInternalID : String(24);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.label : 'Project Def.'
  @sap.quickinfo : 'Project (internal)'
  ProjectInternalID_2 : String(8);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Subnetwork of'
  @sap.quickinfo : 'Number of superior network'
  SuperiorProjectNetwork : String(12);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.label : 'Reservation'
  @sap.quickinfo : 'Number of reservation/dependent requirements'
  Reservation : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.label : 'Reservation'
  @sap.quickinfo : 'Number of reservation/dependent requirements'
  SettlementReservation : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.label : 'Confirmation'
  @sap.quickinfo : 'Completion confirmation number for the operation'
  MfgOrderConfirmation : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.label : 'Counter'
  @sap.quickinfo : 'Internal counter'
  MfgOrderConfirmationCount : String(8);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.label : 'Capacity Requirement'
  @sap.quickinfo : 'ID of the Capacity Requirements Record'
  @sap.value.list : 'standard'
  CapacityRequirement : String(12);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.label : 'Inspection Lot'
  @sap.quickinfo : 'Inspection Lot Number'
  InspectionLot : String(12);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Change Number'
  @sap.value.list : 'standard'
  ChangeNumber : String(12);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Change Number'
  EngineeringChangeOrder : String(12);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Scheduling type'
  BasicSchedulingType : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sched. type forecast'
  @sap.quickinfo : 'Scheduling type (forecast)'
  ForecastSchedulingType : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Scheduling basis'
  @sap.quickinfo : 'Basis for scheduling'
  ProdAvailyCheckPlanningType : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Interest Profile'
  @sap.quickinfo : 'Interest Profile for Project/Order Interest Calculation'
  ProjInterestCalcProfile : String(7);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Account assignment'
  @sap.quickinfo : 'Indicator for the account assignment of a network(hdr/act.)'
  NtwkAccountAssignmentCode : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Network Profile'
  NetworkProfile : String(7);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Object number'
  ObjectInternalID : String(22);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.label : 'Internal object no.'
  @sap.quickinfo : 'Configuration (internal object number)'
  ProductConfiguration : String(18);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Application'
  ConditionApplication : String(2);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'External order no.'
  @sap.quickinfo : 'External order number'
  ExternalOrder : String(20);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Overhead key'
  OverheadCode : String(6);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'No automatic costing'
  @sap.quickinfo : 'Indicator: Do not cost automatically'
  OrderIsNotCostedAutomatically : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'No auto. scheduling'
  @sap.quickinfo : 'Indicator: Do not schedule automatically'
  OrdIsNotSchedldAutomatically : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.label : 'Version'
  @sap.quickinfo : 'Version of Available Capacity'
  CapacityActiveVersion : String(2);
  @sap.aggregation.role : 'dimension'
  @sap.label : 'No Cap. Requirements'
  @sap.quickinfo : 'Indicator: Do not Create Capacity Requirements'
  CapacityRqmtHasNotToBeCreated : Boolean;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.label : 'Sequence Number'
  @sap.quickinfo : 'Sequence Number Order'
  OrderSequenceNumber : String(14);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Revision Level'
  MaterialRevisionLevel : String(2);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Revision Level'
  MaterialRevisionLevel_2 : String(2);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Split Status'
  @sap.quickinfo : 'Status of an Order in a Split Hierarchy'
  MfgOrderSplitStatus : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.label : 'EQC Relevant Order'
  @sap.quickinfo : 'Shop Floor Order is Relevant for Extended Quality Checks'
  ExtdQualityCheckIsRequired : Boolean;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Master Prod. Ord.'
  @sap.quickinfo : 'Master Production Order Number'
  MasterProductionOrder : String(12);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Business Area'
  @sap.value.list : 'standard'
  BusinessArea : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Company Code'
  CompanyCode : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Requesting co. code'
  @sap.quickinfo : 'Requesting company code'
  RequestingCompanyCode : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Controlling Area'
  ControllingArea : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Profit Center'
  ProfitCenter : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cost Center'
  @sap.quickinfo : 'Cost Center for Basic Settlement'
  CostCenter : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Request. cost center'
  @sap.quickinfo : 'Requesting cost center'
  RequestingCostCenter : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Respons. Cost Center'
  @sap.quickinfo : 'Responsible Cost Center'
  ResponsibleCostCenter : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cost Element'
  @sap.quickinfo : 'Settlement Cost Element'
  CostElement : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'G/L Account'
  @sap.quickinfo : 'G/L Account for Basic Settlement'
  GLAccount : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cost Collector'
  @sap.quickinfo : 'Cost Collector for Production Process'
  ProductCostCollector : String(12);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Costing Sheet'
  CostingSheet : String(6);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Controlling Object Class'
  ControllingObjectClass : String(2);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Functional Area'
  FunctionalArea : String(16);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Joint venture'
  JointVenture : String(6);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'JIB/JIBE Class'
  JointVentureClass : String(3);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'JIB/JIBE Subclass A'
  JointVentureSubClass : String(5);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Orig. Cost Object'
  @sap.quickinfo : 'JV original cost object'
  JointVentureOriginalCostObject : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'JV Object Type'
  @sap.quickinfo : 'Joint Venture Object Type'
  JointVentureObjectType : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tax Jurisdiction'
  TaxJurisdiction : String(15);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Investment Reason'
  @sap.quickinfo : 'Reason for Investment'
  InvestmentReason : String(2);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Envir. Investment'
  @sap.quickinfo : 'Reason for Environmental Investment'
  EnvironmentalInvestmentReason : String(5);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Act. Costing Variant'
  @sap.quickinfo : 'Costing Variant For Actual Costs'
  ActualCostsCostingVariant : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plnd Costing Variant'
  @sap.quickinfo : 'Costing Variant for Planned Costs'
  PlannedCostsCostingVariant : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.label : 'Processing group'
  OrderProcessingGroup : String(2);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'BOO Material'
  @sap.quickinfo : 'Bill of Operations Material'
  Material : String(40);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'BOO Type'
  @sap.quickinfo : 'Bill of Operations Type'
  BillOfOperationsType : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Bill of Operations'
  @sap.quickinfo : 'Bill of Operations ID'
  BillOfOperations : String(8);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'BOO Group'
  @sap.quickinfo : 'Bill of Operations Group'
  BillOfOperationsGroup : String(8);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'BOO Variant'
  @sap.quickinfo : 'Bill of Operations Variant'
  BillOfOperationsVariant : String(2);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.label : 'Counter'
  @sap.quickinfo : 'Internal counter'
  BOOInternalVersionCounter : String(8);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'BOO Application'
  @sap.quickinfo : 'Bill of Operations Application'
  BillOfOperationsApplication : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'BOO Usage'
  @sap.quickinfo : 'Bill of Operations Usage'
  BillOfOperationsUsage : String(3);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Routing Version'
  BillOfOperationsVersion : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.label : 'Explosion Date'
  @sap.quickinfo : 'Date for Routing Explosion'
  BOOExplosionDate : Date;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.label : 'Valid From'
  @sap.quickinfo : 'Valid-From Date'
  BOOValidityStartDate : Date;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'BOM Category'
  @sap.quickinfo : 'Bill of Material Category Code'
  BillOfMaterialCategory : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Bill of Material'
  BillOfMaterial : String(8);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Bill Of Material'
  BillOfMaterialInternalID : String(8);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Alternative BOM'
  BillOfMaterialVariant : String(2);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'BOM Usage'
  BillOfMaterialVariantUsage : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'BOM Version'
  BillOfMaterialVersion : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.label : 'BOM Explosion Date'
  @sap.quickinfo : 'Date of BOM Explosion/Routing Transfer'
  BOMExplosionDate : Date;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.label : 'Valid From'
  @sap.quickinfo : 'Valid-From Date'
  BOMValidityStartDate : Date;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Scheduling Float Profile'
  @sap.quickinfo : 'Scheduling Profile for Floats'
  SchedulingFloatProfile : String(3);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.label : 'Float Before Production'
  @sap.quickinfo : 'Float Before Production in Workdays'
  FloatBeforeProductionInWrkDays : String(3);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.label : 'Float After Production'
  @sap.quickinfo : 'Float After Production in Workdays'
  FloatAfterProductionInWorkDays : String(3);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.label : 'Release period'
  @sap.quickinfo : 'Release period (in days)'
  ReleasePeriodInWorkDays : String(3);
  @sap.aggregation.role : 'dimension'
  @sap.label : 'Scheduled Dates Changed'
  @sap.quickinfo : 'Indicator: Change to Scheduled Dates'
  ChangeToScheduledDatesIsMade : Boolean;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.label : 'Basic Start Date'
  PlannedStartDate : Date;
  @sap.aggregation.role : 'dimension'
  @sap.label : 'Basic start time'
  @sap.quickinfo : 'Basic Start (Time)'
  PlannedStartTime : Time;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.label : 'Basic finish date'
  PlannedEndDate : Date;
  @sap.aggregation.role : 'dimension'
  @sap.label : 'Basic Finish Time'
  @sap.quickinfo : 'Basic Finish (Time)'
  PlannedEndTime : Time;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.label : 'Scheduled start'
  ScheduledBasicStartDate : Date;
  @sap.aggregation.role : 'dimension'
  @sap.label : 'Scheduled start time'
  @sap.quickinfo : 'Scheduled Start (Time)'
  ScheduledBasicStartTime : Time;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.label : 'Scheduled finish'
  ScheduledBasicEndDate : Date;
  @sap.aggregation.role : 'dimension'
  @sap.label : 'Scheduled fin. time'
  @sap.quickinfo : 'Scheduled finish time'
  ScheduledBasicEndTime : Time;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.label : 'Sched. release date'
  @sap.quickinfo : 'Scheduled release date'
  ScheduledReleaseDate : Date;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.label : 'Actual start date'
  ActualStartDate : Date;
  @sap.aggregation.role : 'dimension'
  @sap.label : 'ActualStartTime'
  @sap.quickinfo : 'Actual start time'
  ActualStartTime : Time;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.label : 'Actual finish date'
  ActualEndDate : Date;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.label : 'Actual release date'
  ActualReleasedDate : Date;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.label : 'Actual Finish Date'
  @sap.quickinfo : 'Confirmed Order Finish Date'
  ConfirmedEndDate : Date;
  @sap.aggregation.role : 'dimension'
  @sap.label : 'Actual Finish Time'
  @sap.quickinfo : 'Confirmed Order Finish (Time)'
  ConfirmedEndTime : Time;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.label : 'Scheduled start'
  @sap.quickinfo : 'Scheduled forecast start'
  ScheduledForecastedStartDate : Date;
  @sap.aggregation.role : 'dimension'
  @sap.label : 'Sched. start time'
  @sap.quickinfo : 'Scheduled start time (Forecast)'
  ScheduledForecastedStartTime : Time;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.label : 'Scheduled finish'
  @sap.quickinfo : 'Scheduled forecast finish'
  ScheduledForecastedEndDate : Date;
  @sap.aggregation.role : 'dimension'
  @sap.label : 'Sched. finish time'
  @sap.quickinfo : 'Scheduled forecast finish time'
  ScheduledForecastedEndTime : Time;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.label : 'Sched. release date'
  @sap.quickinfo : 'Scheduled release date (forecast)'
  ScheduledFcstdReleaseDate : Date;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.label : 'Start date'
  @sap.quickinfo : 'Forecast start date'
  ForecastedStartDate : Date;
  @sap.aggregation.role : 'dimension'
  @sap.label : 'Start time'
  @sap.quickinfo : 'Forecast start (time)'
  ForecastedStartTime : Time;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.label : 'Finish date'
  @sap.quickinfo : 'Finish date (forecast)'
  ForecastedEndDate : Date;
  @sap.aggregation.role : 'dimension'
  @sap.label : 'Finish time'
  @sap.quickinfo : 'Forecast finish (time)'
  ForecastedEndTime : Time;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.label : 'Commitment Date'
  @sap.quickinfo : 'Total Commitment Date'
  TotalCommitmentDate : Date;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.label : 'Scheduled on'
  @sap.quickinfo : 'Date of the Last Scheduling'
  LastScheduledDate : Date;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.label : 'Planned release'
  @sap.quickinfo : 'Planned release date'
  PlannedReleaseDate : Date;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.label : 'Planned completion'
  @sap.quickinfo : 'Planned completion date'
  PlannedCompletionDate : Date;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.label : 'Technical Completion'
  @sap.quickinfo : 'Technical Completion Date'
  TechnicalCompletionDate : Date;
  @sap.aggregation.role : 'dimension'
  @sap.label : 'Base Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);
  @sap.aggregation.role : 'measure'
  @sap.unit : 'BaseUnit'
  @sap.label : 'Total Order Quantity'
  @sap.filterable : 'false'
  OrderPlannedTotalQty : Decimal(13, 3);
  @sap.aggregation.role : 'measure'
  @sap.unit : 'BaseUnit'
  @sap.label : 'Total Scrap Quantity'
  @sap.quickinfo : 'Total Scrap Quantity in the Order'
  @sap.filterable : 'false'
  OrderPlannedScrapQty : Decimal(13, 3);
  @sap.aggregation.role : 'measure'
  @sap.unit : 'BaseUnit'
  @sap.label : 'Confirmed Yield'
  @sap.quickinfo : 'Confirmed Yield Quantity From Order Confirmation'
  @sap.filterable : 'false'
  OrderConfirmedYieldQty : Decimal(13, 3);
  @sap.aggregation.role : 'measure'
  @sap.unit : 'BaseUnit'
  @sap.label : 'Confirmed Scrap'
  @sap.quickinfo : 'Confirmed Scrap Quantity From Order Confirmation'
  @sap.filterable : 'false'
  OrderConfirmedScrapQty : Decimal(13, 3);
  @sap.aggregation.role : 'measure'
  @sap.unit : 'BaseUnit'
  @sap.label : 'Confirmed Rework'
  @sap.quickinfo : 'Total Confirmed Rework Quantity'
  @sap.filterable : 'false'
  MfgOrderConfirmedReworkQty : Decimal(13, 3);
  @sap.aggregation.role : 'measure'
  @sap.unit : 'BaseUnit'
  @sap.label : 'From Lot Size'
  @sap.filterable : 'false'
  MaterialFromLotSizeQuantity : Decimal(13, 3);
  @sap.aggregation.role : 'measure'
  @sap.unit : 'BaseUnit'
  @sap.label : 'To Lot Size'
  @sap.filterable : 'false'
  MaterialToLotSizeQuantity : Decimal(13, 3);
  @sap.aggregation.role : 'dimension'
  @sap.label : 'Base Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  MaterialBaseUnit : String(3);
  @sap.aggregation.role : 'measure'
  @sap.unit : 'MaterialBaseUnit'
  @sap.label : 'Base quantity'
  @sap.filterable : 'false'
  PlannedTotalQtyInBaseUnit : Decimal(13, 3);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.label : 'Currency'
  @sap.quickinfo : 'Order Currency'
  @sap.semantics : 'currency-code'
  Currency : String(5);
  @sap.aggregation.role : 'measure'
  @sap.unit : 'Currency'
  @sap.label : 'Estimated costs'
  @sap.quickinfo : 'Estimated total costs of order'
  @sap.filterable : 'false'
  EstimatedTotalOrderCost : Decimal(12, 3);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Material Discontinuation Type'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_MatlCompDiscontinuationType {
  @sap.display.format : 'UpperCase'
  @sap.text : 'MatlCompDiscontinuationType_Text'
  @sap.label : 'Discontinuation Type'
  key MatlCompDiscontinuationType : String(1) not null;
  @sap.label : 'Discontinuation Type Name'
  @sap.quickinfo : 'Name of a Discontinuation Type for a Material Component'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  MatlCompDiscontinuationType_Text : String(60);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'MRP Area'
@sap.value.list : 'true'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_MRPAreaVH {
  @sap.display.format : 'UpperCase'
  @sap.text : 'MRPAreaText'
  @sap.label : 'MRP Area'
  key MRPArea : String(10) not null;
  @sap.display.format : 'NonNegative'
  @sap.label : 'MRP Area Category'
  MRPAreaCategory : String(2);
  @sap.label : 'MRP Area Text'
  MRPAreaText : String(40);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'MRP Controller'
@sap.value.list : 'true'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_MRPControllerVH {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant'
  key Plant : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.text : 'MRPControllerName'
  @sap.label : 'MRP Controller'
  key MRPController : String(3) not null;
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
@sap.label : 'Planned Order'
@sap.value.list : 'true'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_PlannedOrderStdVH {
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
@sap.label : 'Planned Order Type'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_PlannedOrderType {
  @sap.display.format : 'UpperCase'
  @sap.text : 'PlannedOrderType_Text'
  @sap.label : 'Planned Order Type'
  key PlannedOrderType : String(4) not null;
  @sap.label : 'Type Name'
  @sap.quickinfo : 'Planned Order Type Name'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  PlannedOrderType_Text : String(60);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Plant'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_Plant {
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
@sap.label : 'Plant'
@sap.value.list : 'true'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_PlantStdVH {
  @sap.display.format : 'UpperCase'
  @sap.text : 'PlantName'
  @sap.label : 'Plant'
  key Plant : String(4) not null;
  @sap.label : 'Plant Name'
  PlantName : String(30);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Basic View - Adjustment Profile'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_ProdEWMAdjmtProfile {
  @sap.display.format : 'UpperCase'
  @sap.text : 'AdjustmentProfile_Text'
  @sap.label : 'Adjustment Profile'
  @sap.quickinfo : 'Merchandise Distribution - Adjustment Profile'
  key AdjustmentProfile : String(3) not null;
  @sap.label : 'Desc. Adjust.Profile'
  @sap.quickinfo : 'Description - Merchandise Distribution - Adjustment Profile'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  AdjustmentProfile_Text : String(40);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Product'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_Product {
  @sap.display.format : 'UpperCase'
  @sap.text : 'Product_Text'
  @sap.label : 'Product'
  @sap.quickinfo : 'Product Number'
  key Product : String(40) not null;
  @sap.label : 'Product Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  Product_Text : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Material'
  @sap.quickinfo : 'External Representation of Material Number'
  ProductExternalID : String(40);
  @sap.label : 'Product OID'
  @sap.quickinfo : 'Data element for OID of product'
  ProductOID : String(128);
  @sap.display.format : 'UpperCase'
  @sap.text : 'ProductType_Text'
  @sap.label : 'Product Type'
  @sap.value.list : 'standard'
  ProductType : String(4);
  @sap.label : 'Product Type Description'
  @sap.quickinfo : 'Description of product type'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductType_Text : String(25);
  @sap.display.format : 'Date'
  @sap.label : 'Created On'
  CreationDate : Date;
  @sap.label : 'Created At Time'
  @sap.quickinfo : 'Time of Creation'
  CreationTime : Time;
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.label : 'Created On'
  @sap.quickinfo : 'Product Created On'
  CreationDateTime : Timestamp;
  @sap.display.format : 'UpperCase'
  @sap.text : 'to_CreatedByUserContactCard/UserDescription'
  @sap.label : 'Created By'
  @sap.quickinfo : 'Name of Person Responsible for Creating the Object'
  CreatedByUser : String(12);
  @sap.display.format : 'Date'
  @sap.label : 'Last Change'
  @sap.quickinfo : 'Date of Last Change'
  LastChangeDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.text : 'to_LastChangedByUserContactCard/UserDescription'
  @sap.label : 'Changed By'
  @sap.quickinfo : 'Name of Person Who Changed Object'
  LastChangedByUser : String(12);
  @sap.label : 'Marked for Deletion'
  @sap.quickinfo : 'Deletion Indicator'
  IsMarkedForDeletion : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.text : 'CrossPlantStatus_Text'
  @sap.label : 'CrossPlantProdStatus'
  @sap.quickinfo : 'Cross-Plant Product Status'
  @sap.value.list : 'standard'
  CrossPlantStatus : String(2);
  @sap.label : 'Cross Plant Status Text'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CrossPlantStatus_Text : String(25);
  @sap.display.format : 'Date'
  @sap.label : 'Valid from'
  @sap.quickinfo : 'Date from which the cross-plant material status is valid'
  CrossPlantStatusValidityDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Old Product Number'
  ProductOldID : String(40);
  @sap.unit : 'WeightUnit'
  @sap.label : 'Gross Weight'
  GrossWeight : Decimal(13, 3);
  @sap.label : 'Order Unit'
  @sap.quickinfo : 'Purchase Order Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  PurchaseOrderQuantityUnit : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Source of supply'
  @sap.quickinfo : 'Source of Supply'
  SourceOfSupply : String(1);
  @sap.text : 'WeightUnit_Text'
  @sap.label : 'Unit of Weight'
  @sap.value.list : 'standard'
  @sap.semantics : 'unit-of-measure'
  WeightUnit : String(3);
  @sap.label : 'Meas. Unit Text'
  @sap.quickinfo : 'Unit of Measurement Text (Maximum 30 Characters)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  WeightUnit_Text : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Cntry/Reg of Origin'
  @sap.quickinfo : 'Country/Region of Origin of Material (Non-Preferential Ori.)'
  CountryOfOrigin : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Competitor'
  CompetitorID : String(10);
  @sap.display.format : 'UpperCase'
  @sap.text : 'ProductGroup_Text'
  @sap.label : 'Product Group'
  @sap.value.list : 'standard'
  ProductGroup : String(9);
  @sap.label : 'Product Group Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductGroup_Text : String(20);
  @sap.text : 'BaseUnit_Text'
  @sap.label : 'Base Unit of Measure'
  @sap.value.list : 'standard'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);
  @sap.label : 'Meas. Unit Text'
  @sap.quickinfo : 'Unit of Measurement Text (Maximum 30 Characters)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  BaseUnit_Text : String(30);
  @sap.display.format : 'UpperCase'
  @sap.text : 'ItemCategoryGroup_Text'
  @sap.label : 'Gen. item cat. grp'
  @sap.quickinfo : 'General item category group'
  @sap.value.list : 'standard'
  ItemCategoryGroup : String(4);
  @sap.label : 'Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ItemCategoryGroup_Text : String(20);
  @sap.unit : 'WeightUnit'
  @sap.label : 'Net Weight'
  NetWeight : Decimal(13, 3);
  @sap.display.format : 'UpperCase'
  @sap.text : 'ProductHierarchy_Text'
  @sap.label : 'Product Hierarchy'
  @sap.value.list : 'standard'
  ProductHierarchy : String(18);
  @sap.label : 'Product Hierarchy Text'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductHierarchy_Text : String(40);
  @sap.display.format : 'UpperCase'
  @sap.text : 'Division_Text'
  @sap.label : 'Division'
  @sap.value.list : 'standard'
  Division : String(2);
  @sap.label : 'Division Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  Division_Text : String(20);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Var. Order Unit'
  @sap.quickinfo : 'Variable Purchase Order Unit Active'
  VarblPurOrdUnitIsActive : String(1);
  @sap.text : 'VolumeUnit_Text'
  @sap.label : 'Volume Unit'
  @sap.value.list : 'standard'
  @sap.semantics : 'unit-of-measure'
  VolumeUnit : String(3);
  @sap.label : 'Meas. Unit Text'
  @sap.quickinfo : 'Unit of Measurement Text (Maximum 30 Characters)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  VolumeUnit_Text : String(30);
  @sap.unit : 'VolumeUnit'
  @sap.label : 'Volume'
  MaterialVolume : Decimal(13, 3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'X-distr.chain status'
  @sap.quickinfo : 'Cross-Distribution-Chain Material Status'
  SalesStatus : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Transportation Group'
  TransportationGroup : String(4);
  @sap.display.format : 'Date'
  @sap.label : 'Valid from'
  @sap.quickinfo : 'Date from which the X-distr.-chain material status is valid'
  SalesStatusValidityDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Authorization Group'
  AuthorizationGroup : String(4);
  @sap.display.format : 'NonNegative'
  @sap.text : 'ANPCode_Text'
  @sap.label : 'ANP Code'
  @sap.value.list : 'standard'
  ANPCode : String(9);
  @sap.label : 'ANP Code Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ANPCode_Text : String(95);
  @sap.display.format : 'UpperCase'
  @sap.text : 'ProductCategory_Text'
  @sap.label : 'Product Category'
  @sap.value.list : 'standard'
  ProductCategory : String(2);
  @sap.label : 'Product Category Text'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductCategory_Text : String(60);
  @sap.display.format : 'UpperCase'
  @sap.text : 'Brand_Text'
  @sap.label : 'Brand'
  @sap.value.list : 'standard'
  Brand : String(4);
  @sap.label : 'Brand Name'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  Brand_Text : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Procurement rule'
  ProcurementRule : String(1);
  @sap.display.format : 'Date'
  @sap.label : 'Valid From'
  @sap.quickinfo : 'Valid-From Date'
  ValidityStartDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Low-Level Code'
  LowLevelCode : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Generic Material'
  @sap.quickinfo : 'Material Number of the Generic Material in Prepack Materials'
  ProdNoInGenProdInPrepackProd : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Serial No. Profile'
  @sap.quickinfo : 'Serial Number Profile'
  SerialIdentifierAssgmtProfile : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Size/dimensions'
  SizeOrDimensionText : String(32);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Industry Std Desc.'
  @sap.quickinfo : 'Industry Standard Description (such as ANSI or ISO)'
  IndustryStandardName : String(18);
  @sap.display.format : 'UpperCase'
  @sap.label : 'GTIN'
  @sap.quickinfo : 'Global Trade Item Number (EAN/UPC/GTIN)'
  ProductStandardID : String(18);
  @sap.display.format : 'UpperCase'
  @sap.text : 'InternationalArticleNumberCat_Text'
  @sap.label : 'EAN Category'
  @sap.quickinfo : 'Category of International Article Number (EAN)'
  @sap.value.list : 'standard'
  InternationalArticleNumberCat : String(2);
  @sap.label : 'Number category text'
  @sap.quickinfo : 'Description of number category'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  InternationalArticleNumberCat_Text : String(40);
  @sap.label : 'Configurable'
  @sap.quickinfo : 'Product is Configurable'
  ProductIsConfigurable : Boolean;
  @sap.label : 'Batch Management'
  @sap.quickinfo : 'Batch Management Requirement Indicator'
  IsBatchManagementRequired : Boolean;
  @sap.label : 'With Empties BOM'
  @sap.quickinfo : 'Empties Bill of Material'
  HasEmptiesBOM : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.text : 'ExternalProductGroup_Text'
  @sap.label : 'Ext. Product Group'
  @sap.quickinfo : 'External Product Group'
  @sap.value.list : 'standard'
  ExternalProductGroup : String(18);
  @sap.label : 'Ext. Prod Grp Descr'
  @sap.quickinfo : 'Description for external product group'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ExternalProductGroup_Text : String(20);
  @sap.display.format : 'UpperCase'
  @sap.text : 'CrossPlantConfigurableProduct_Text'
  @sap.label : 'Cross-plant CP'
  @sap.quickinfo : 'Cross-Plant Configurable Product'
  @sap.value.list : 'standard'
  CrossPlantConfigurableProduct : String(40);
  @sap.label : 'Product Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  CrossPlantConfigurableProduct_Text : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Serialization level'
  @sap.quickinfo : 'Level of Explicitness for Serial Number'
  SerialNoExplicitnessLevel : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Mfr Part Number'
  @sap.quickinfo : 'Manufacturer Part Number'
  ProductManufacturerNumber : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Manufacturer'
  @sap.quickinfo : 'Number of a Manufacturer'
  ManufacturerNumber : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Mfr Part Profile'
  ManufacturerPartProfile : String(4);
  @sap.label : 'QM in Procur. Active'
  @sap.quickinfo : 'QM in Procurement Is Active'
  QltyMgmtInProcmtIsActive : Boolean;
  @sap.label : 'Appr.Batch Recd Req.'
  @sap.quickinfo : 'Approved Batch Record Required'
  IsApprovedBatchRecordReqd : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.text : 'HandlingIndicator_Text'
  @sap.label : 'Handling Indicator'
  @sap.value.list : 'standard'
  HandlingIndicator : String(4);
  @sap.label : 'Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  HandlingIndicator_Text : String(40);
  @sap.display.format : 'UpperCase'
  @sap.text : 'WarehouseProductGroup_Text'
  @sap.label : 'WH Material Group'
  @sap.quickinfo : 'Warehouse Material Group'
  @sap.value.list : 'standard'
  WarehouseProductGroup : String(4);
  @sap.label : 'Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  WarehouseProductGroup_Text : String(40);
  @sap.display.format : 'UpperCase'
  @sap.text : 'WarehouseStorageCondition_Text'
  @sap.label : 'Whse Stor. Condition'
  @sap.quickinfo : 'Warehouse Storage Condition'
  @sap.value.list : 'standard'
  WarehouseStorageCondition : String(2);
  @sap.label : 'Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  WarehouseStorageCondition_Text : String(40);
  @sap.display.format : 'UpperCase'
  @sap.text : 'StandardHandlingUnitType_Text'
  @sap.label : 'Standard HU Type'
  @sap.value.list : 'standard'
  StandardHandlingUnitType : String(4);
  @sap.label : 'Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  StandardHandlingUnitType_Text : String(40);
  @sap.display.format : 'UpperCase'
  @sap.text : 'SerialNumberProfile_Text'
  @sap.label : 'Serial No. Profile'
  @sap.quickinfo : 'Serial Number Profile'
  @sap.value.list : 'standard'
  SerialNumberProfile : String(4);
  @sap.label : 'Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  SerialNumberProfile_Text : String(40);
  @sap.display.format : 'UpperCase'
  @sap.text : 'AdjustmentProfile_Text'
  @sap.label : 'Adjust. Profile'
  @sap.quickinfo : 'Adjustment Profile'
  @sap.value.list : 'standard'
  AdjustmentProfile : String(3);
  @sap.label : 'Desc. Adjust.Profile'
  @sap.quickinfo : 'Description - Merchandise Distribution - Adjustment Profile'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  AdjustmentProfile_Text : String(40);
  @sap.label : 'Preferred UoM'
  @sap.quickinfo : 'Preferred Alternative UoM for Warehouse Operations'
  @sap.semantics : 'unit-of-measure'
  PreferredUnitOfMeasure : String(3);
  @sap.label : 'Pilferable'
  IsPilferable : Boolean;
  @sap.label : 'Relevant for HS'
  @sap.quickinfo : 'Relevant for Hazardous Substances'
  IsRelevantForHzdsSubstances : Boolean;
  @sap.unit : 'TimeUnitForQuarantinePeriod'
  @sap.label : 'Quarant. Per.'
  @sap.quickinfo : 'Quarantine Period'
  QuarantinePeriod : Decimal(3, 0);
  @sap.text : 'TimeUnitForQuarantinePeriod_Text'
  @sap.label : 'Time Unit'
  @sap.quickinfo : 'Time Unit for Quarantine Period'
  @sap.value.list : 'standard'
  @sap.semantics : 'unit-of-measure'
  TimeUnitForQuarantinePeriod : String(3);
  @sap.label : 'Meas. Unit Text'
  @sap.quickinfo : 'Unit of Measurement Text (Maximum 30 Characters)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  TimeUnitForQuarantinePeriod_Text : String(30);
  @sap.display.format : 'UpperCase'
  @sap.text : 'QualityInspectionGroup_Text'
  @sap.label : 'Quality Inspec. Grp'
  @sap.quickinfo : 'Quality Inspection Group'
  @sap.value.list : 'standard'
  QualityInspectionGroup : String(4);
  @sap.label : 'Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  QualityInspectionGroup_Text : String(40);
  @sap.display.format : 'UpperCase'
  @sap.text : 'HandlingUnitType_Text'
  @sap.label : 'Handling Unit Type'
  @sap.value.list : 'standard'
  HandlingUnitType : String(4);
  @sap.label : 'Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  HandlingUnitType_Text : String(40);
  @sap.label : 'Varb. Tare Weight'
  @sap.quickinfo : 'Variable Tare Weight'
  HasVariableTareWeight : Boolean;
  @sap.unit : 'UnitForMaxPackagingDimensions'
  @sap.label : 'Max. Pack. Length'
  @sap.quickinfo : 'Maximum Packing Length of Packaging Material'
  MaximumPackagingLength : Decimal(15, 3);
  @sap.unit : 'UnitForMaxPackagingDimensions'
  @sap.label : 'Max. Pack. Width'
  @sap.quickinfo : 'Maximum Packing Width of Packaging Material'
  MaximumPackagingWidth : Decimal(15, 3);
  @sap.unit : 'UnitForMaxPackagingDimensions'
  @sap.label : 'Max. Pack. Height'
  @sap.quickinfo : 'Maximum Packing Height of Packaging Material'
  MaximumPackagingHeight : Decimal(15, 3);
  @sap.label : 'Maximum Capacity'
  @sap.quickinfo : 'Maximum Allowed Capacity of Packaging Material'
  MaximumCapacity : Decimal(15, 3);
  @sap.label : 'Overcapacity Toler.'
  @sap.quickinfo : 'Overcapacity Tolerance of the Handling Unit'
  OvercapacityTolerance : Decimal(3, 1);
  @sap.text : 'UnitForMaxPackagingDimensions_Text'
  @sap.label : 'Unit of Measurement'
  @sap.quickinfo : 'Unit of Measure for Maximum Packing Length/Width/Height'
  @sap.value.list : 'standard'
  @sap.semantics : 'unit-of-measure'
  UnitForMaxPackagingDimensions : String(3);
  @sap.label : 'Meas. Unit Text'
  @sap.quickinfo : 'Unit of Measurement Text (Maximum 30 Characters)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  UnitForMaxPackagingDimensions_Text : String(30);
  @sap.unit : 'ProductMeasurementUnit'
  @sap.label : 'Length'
  BaseUnitSpecificProductLength : Decimal(13, 3);
  @sap.unit : 'ProductMeasurementUnit'
  @sap.label : 'Width'
  BaseUnitSpecificProductWidth : Decimal(13, 3);
  @sap.unit : 'ProductMeasurementUnit'
  @sap.label : 'Height'
  BaseUnitSpecificProductHeight : Decimal(13, 3);
  @sap.text : 'ProductMeasurementUnit_Text'
  @sap.label : 'Unit of Dimension'
  @sap.quickinfo : 'Unit of Dimension for Length/Width/Height'
  @sap.value.list : 'standard'
  @sap.semantics : 'unit-of-measure'
  ProductMeasurementUnit : String(3);
  @sap.label : 'Meas. Unit Text'
  @sap.quickinfo : 'Unit of Measurement Text (Maximum 30 Characters)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductMeasurementUnit_Text : String(30);
  @sap.display.format : 'Date'
  @sap.label : 'Valid From'
  @sap.quickinfo : 'Valid-From Date'
  ProductValidStartDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product Category'
  ArticleCategory : String(2);
  @sap.text : 'ContentUnit_Text'
  @sap.label : 'Content Unit'
  @sap.quickinfo : 'Content unit'
  @sap.value.list : 'standard'
  @sap.semantics : 'unit-of-measure'
  ContentUnit : String(3);
  @sap.label : 'Meas. Unit Text'
  @sap.quickinfo : 'Unit of Measurement Text (Maximum 30 Characters)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ContentUnit_Text : String(30);
  @sap.unit : 'ContentUnit'
  @sap.label : 'Net Contents'
  NetContent : Decimal(13, 3);
  @sap.unit : 'ContentUnit'
  @sap.label : 'Comparison Price Unit'
  @sap.quickinfo : 'Comparison price unit'
  ComparisonPriceQuantity : Decimal(5, 0);
  @sap.unit : 'ContentUnit'
  @sap.label : 'Gross Contents'
  @sap.quickinfo : 'Gross contents'
  GrossContent : Decimal(13, 3);
  @sap.display.format : 'Date'
  @sap.label : 'Valid To'
  @sap.quickinfo : 'Deletion date'
  ProductValidEndDate : Date;
  @sap.display.format : 'UpperCase'
  @sap.text : 'AssortmentListType_Text'
  @sap.label : 'Assortment List Type'
  @sap.value.list : 'standard'
  AssortmentListType : String(1);
  @sap.label : 'Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  AssortmentListType_Text : String(20);
  @sap.label : 'Animal Origin'
  @sap.quickinfo : 'Indicator: Contains Non-Textile Parts of Animal Origin'
  HasTextilePartsWthAnimalOrigin : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Season Usage'
  @sap.quickinfo : 'Indicator: Use of Season'
  ProductSeasonUsageCategory : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Industry'
  IndustrySector : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Change Number'
  ChangeNumber : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Revision Level'
  MaterialRevisionLevel : String(2);
  @sap.label : 'Is active'
  @sap.quickinfo : 'Draft - Indicator - Is active document'
  IsActiveEntity : Boolean;
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.label : 'Last Changed'
  @sap.quickinfo : 'Change Time Stamp'
  LastChangeDateTime : Timestamp;
  @sap.label : 'Last Changed Time'
  @sap.quickinfo : 'Time of Last Change'
  LastChangeTime : Time;
  @sap.display.format : 'UpperCase'
  @sap.label : 'DG indicator profile'
  @sap.quickinfo : 'Dangerous Goods Indicator Profile'
  DangerousGoodsIndProfile : String(3);
  @sap.label : 'Product'
  @sap.quickinfo : 'Internal Key for Product'
  ProductUUID : UUID;
  @sap.label : 'Product ID'
  @sap.quickinfo : 'Internal Number (UID) for Product'
  ProdSupChnMgmtUUID22 : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Document Change No.'
  @sap.quickinfo : 'Document change number (without document management system)'
  ProductDocumentChangeNumber : String(6);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Number Of Sheets'
  @sap.quickinfo : 'Number Of Sheets (without Document Management system)'
  ProductDocumentPageCount : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Page Number'
  @sap.quickinfo : 'Page Number of document (without Document Management system)'
  ProductDocumentPageNumber : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Int. material number'
  @sap.quickinfo : 'Number of firm''s own (internal) inventory-managed material'
  OwnInventoryManagedProduct : String(40);
  @sap.label : 'CAD Indicator'
  DocumentIsCreatedByCAD : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Prod./insp. memo'
  @sap.quickinfo : 'Production/inspection memo'
  ProductionOrInspectionMemoTxt : String(18);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Page format'
  @sap.quickinfo : 'Page Format of Production Memo'
  ProductionMemoPageFormat : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'EAN Variant'
  @sap.quickinfo : 'Global Trade Item Number Variant'
  GlobalTradeItemNumberVariant : String(2);
  @sap.label : 'Highly viscous'
  @sap.quickinfo : 'Indicator: Highly Viscous'
  ProductIsHighlyViscous : Boolean;
  @sap.label : 'In bulk/liquid'
  @sap.quickinfo : 'Indicator: In Bulk/Liquid'
  TransportIsInBulk : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product allocation'
  @sap.quickinfo : 'Product allocation determination procedure'
  ProdAllocDetnProcedure : String(18);
  @sap.label : 'Assign effect. vals'
  @sap.quickinfo : 'Assign effectivity parameter values/ override change numbers'
  ProdEffctyParamValsAreAssigned : Boolean;
  @sap.label : 'Environmentally rlvt'
  @sap.quickinfo : 'Environmentally Relevant'
  ProdIsEnvironmentallyRelevant : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Lab/Office'
  @sap.quickinfo : 'Laboratory/Design Office'
  LaboratoryOrDesignOffice : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Matl Grp Pack.Matls'
  @sap.quickinfo : 'Material Group: Packaging Materials'
  PackagingMaterialGroup : String(4);
  @sap.label : 'Material locked'
  @sap.quickinfo : 'Material Is Locked'
  ProductIsLocked : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Qual.f.FreeGoodsDis.'
  @sap.quickinfo : 'Material qualifies for discount in kind'
  DiscountInKindEligibility : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Form Name'
  SmartFormName : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Ref. mat. for pckg'
  @sap.quickinfo : 'Reference material for materials packed in same way'
  PackingReferenceProduct : String(40);
  @sap.label : 'Basic Material'
  @sap.value.list : 'standard'
  BasicMaterial : String(48);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Document'
  @sap.quickinfo : 'Document number (without document management system)'
  ProductDocumentNumber : String(22);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Document Version'
  @sap.quickinfo : 'Document version (without Document Management system)'
  ProductDocumentVersion : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Document Type'
  @sap.quickinfo : 'Document type (without Document Management system)'
  ProductDocumentType : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Page Format'
  @sap.quickinfo : 'Page Format of Document (without Document Management system)'
  ProductDocumentPageFormat : String(4);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Internal object no.'
  @sap.quickinfo : 'Internal object number'
  ProductConfiguration : String(18);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Seg. Strategy'
  @sap.quickinfo : 'Segmentation Strategy'
  SegmentationStrategy : String(8);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Seg. Relevant'
  @sap.quickinfo : 'Segmentation Relevant'
  SegmentationIsRelevant : String(1);
  @sap.label : 'Product Composition'
  @sap.quickinfo : 'Indicator: Product composition printed on packaging'
  ProductCompositionIsRelevant : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.text : 'IsChemicalComplianceRelevant_Text'
  @sap.label : 'Chemical Compliance Relevance Indicator'
  @sap.value.list : 'fixed-values'
  IsChemicalComplianceRelevant : String(1);
  @sap.label : 'Short Description'
  @sap.quickinfo : 'Short Text for Fixed Values'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  IsChemicalComplianceRelevant_Text : String(60);
  @sap.display.format : 'UpperCase'
  @sap.label : 'MS Book Part No'
  @sap.quickinfo : 'Manufacturer Book Part Number'
  ManufacturerBookPartNumber : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Logl Material Cat.'
  @sap.quickinfo : 'Category of a Logistical Material'
  LogisticalProductCategory : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Material No.'
  @sap.quickinfo : 'Material Number of a Sales Material'
  SalesProduct : String(40);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Int. Char. Number'
  @sap.quickinfo : 'Internal Charactieristic Number for Color Characteristics'
  ProdCharc1InternalNumber : String(30);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Int. Char. Number'
  @sap.quickinfo : 'Internal Char. Number for Characteristics for Main Sizes'
  ProdCharc2InternalNumber : String(30);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Int. Char. Number'
  @sap.quickinfo : 'Internal Char. Number for Characteristics for Second Sizes'
  ProdCharc3InternalNumber : String(30);
  @sap.label : 'Color'
  @sap.quickinfo : 'Characteristic Value for Colors of Variants'
  ProductCharacteristic1 : String(18);
  @sap.label : 'Main Size'
  @sap.quickinfo : 'Characteristic Value for Main Sizes of Variants'
  ProductCharacteristic2 : String(18);
  @sap.label : 'Second Size'
  @sap.quickinfo : 'Characteristic Value for Second Size for Variants'
  ProductCharacteristic3 : String(18);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Maintenance Status'
  MaintenanceStatus : String(15);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Fsh. Attribute1'
  @sap.quickinfo : 'Fashion Information Field: 1'
  FashionProdInformationField1 : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Fsh. Attribute2'
  @sap.quickinfo : 'Fashion Information Field: 2'
  FashionProdInformationField2 : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Fsh. Attribute3'
  @sap.quickinfo : 'Fashion Information Field: 3'
  FashionProdInformationField3 : String(6);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Ammunition Code'
  @sap.quickinfo : 'Interchangeability Code for Ammunition'
  DfsAmmunitionGroupCode : String(8);
  @sap.label : 'RIC ID'
  @sap.quickinfo : 'Reportable Item Code - Numerical ID'
  DfsRICIdentifier : Integer64;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sensitivity for Char'
  @sap.quickinfo : 'Sensitivity for Characteristics'
  DfsProductSensitivity : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Long Mfr Part No.'
  @sap.quickinfo : 'Long Manufacturer Part Number'
  DfsManufacturerPartLongNumber : String(60);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Condition Mgmt'
  @sap.quickinfo : 'Material Condition Management'
  DfsMatlConditionMgmt : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Return Code'
  DfsReturnDelivery : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Return to Log.Level'
  @sap.quickinfo : 'Return to Logistics Level'
  DfsLogisticsLevel : String(1);
  @sap.display.format : 'UpperCase'
  @sap.label : 'NATO Stock Number'
  DfsNationalItemIdnNumber : String(9);
  to_AdjustmentProfile_2 : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_ProdEWMAdjmtProfile {  };
  to_AssortmentListType : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_AssortmentListType {  };
  to_BaseUnitOfMeasure : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_UnitOfMeasure {  };
  to_BasicMaterial : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_BasicMaterial {  };
  to_Brand : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_Brand {  };
  to_BR_ANPCode : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_BR_ANPCode {  };
  to_ChemicalComplianceRelevant : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_ChemicalComplianceRelevant {  };
  to_ContentUnit : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_UnitOfMeasure {  };
  to_CreatedByUserContactCard : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_UserContactCard {  };
  to_Division : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_Division {  };
  to_ExternalProductGroup : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_ExtProdGrp {  };
  to_HandlingIndicator : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_EWM_MaterialHandling {  };
  to_HandlingUnitType : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_EWM_HandlingUnitType {  };
  to_InternationalArticleNumberCat : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_Intntnlartnmbcat {  };
  to_ItemCategoryGroup : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_ItemCategoryGroup {  };
  to_LastChangedByUserContactCard : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_UserContactCard {  };
  to_ProductCategory : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_ProductCategory {  };
  to_ProductGroup_2 : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_ProductGroup_2 {  };
  to_ProductHierarchy : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_ProductHierarchy {  };
  to_ProductMeasurementUnit : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_UnitOfMeasure {  };
  to_ProductStatus : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_ProductStatus {  };
  to_ProductType : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_Producttype {  };
  to_QualityInspectionGroup : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_EWM_QualityInspectionGroup {  };
  to_QuantityUnitValueHelp : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_UnitOfMeasure {  };
  to_SerialNumberProfile : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_EWM_SerialNumberProfile {  };
  to_StandardHandlingUnitType : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_EWM_HandlingUnitType {  };
  to_TimeUnitForQuarantinePeriod : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_UnitOfMeasure {  };
  to_UnitForMaxPackaging : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_UnitOfMeasure {  };
  to_WarehouseProductGroup : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_EWM_WarehouseMaterialGroup {  };
  to_WarehouseStorageCondition : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_EWM_WhseStorageCondition {  };
  to_WeightUnitValueHelp : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_UnitOfMeasure {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Product Category Type'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_ProductCategory {
  @sap.display.format : 'UpperCase'
  @sap.text : 'ProductCategory_Text'
  @sap.label : 'Product Category'
  key ProductCategory : String(2) not null;
  @sap.label : 'Product Category Text'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductCategory_Text : String(60);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Product Group'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_ProductGroup_2 {
  @sap.display.format : 'UpperCase'
  @sap.text : 'ProductGroup_Text'
  @sap.label : 'Product Group'
  key ProductGroup : String(9) not null;
  @sap.label : 'Product Group Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductGroup_Text : String(20);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Valuation Class'
  ValuationClass : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Purchasing value key'
  @sap.quickinfo : 'Purchasing Value Key'
  PurchasingAcknProfile : String(4);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Product Hierarchy'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_ProductHierarchy {
  @sap.display.format : 'UpperCase'
  @sap.text : 'ProductHierarchy_Text'
  @sap.label : 'Product Hierarchy'
  key ProductHierarchy : String(18) not null;
  @sap.label : 'Product Hierarchy Text'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductHierarchy_Text : String(40);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Level Number'
  @sap.quickinfo : 'Number of the level in the product hierarchy'
  ProductHierarchyLevel : String(1);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Production Scheduling Profile'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_ProductionSchedulingProfile {
  @sap.display.format : 'UpperCase'
  @sap.text : 'ProductionSchedulingProfile_Text'
  @sap.label : 'Production Scheduling Profile'
  key ProductionSchedulingProfile : String(6) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant'
  key Plant : String(4) not null;
  @sap.label : 'Sched. Profile Name'
  @sap.quickinfo : 'Description of Production Scheduling Profile'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductionSchedulingProfile_Text : String(40);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Order Category'
  OrderCategory : String(2);
  @sap.label : 'Aut. Goods Receipt'
  @sap.quickinfo : 'Indicator: Post Goods Receipt Automatically'
  GRIsPostedAutomatically : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Post Sync. to Bin'
  @sap.quickinfo : 'Synchronous posting of goods movement for EWM'
  MfgOrderEWMSynchronousPosting : String(1);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.addressable : 'false'
@sap.content.version : '1'
@sap.label : 'Production Supervisor'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_ProductionSupervisor {
  @sap.display.format : 'UpperCase'
  @sap.text : 'to_Plant/PlantName'
  @sap.label : 'Plant'
  @sap.value.list : 'standard'
  key Plant : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.text : 'ProductionSupervisorName'
  @sap.label : 'Production Supervisor'
  key ProductionSupervisor : String(3) not null;
  @sap.label : 'Prod. Superv. Name'
  @sap.quickinfo : 'Production Supervisor Name'
  ProductionSupervisorName : String(30);
  @sap.display.format : 'UpperCase'
  @sap.text : 'to_ProductionSchedulingProfile/ProductionSchedulingProfile_Text'
  @sap.label : 'Production Scheduling Profile'
  @sap.value.list : 'standard'
  ProductionSchedulingProfile : String(6);
  to_Plant : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_Plant {  };
  to_ProductionSchedulingProfile : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_ProductionSchedulingProfile {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Production Supply Area'
@sap.value.list : 'true'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_ProductionSupplyAreaStdVH {
  @sap.display.format : 'UpperCase'
  @sap.text : 'ProductionSupplyArea_Text'
  @sap.label : 'Production Supply Area'
  key ProductionSupplyArea : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant'
  key Plant : String(4) not null;
  @sap.label : 'Production Supply Area Name'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductionSupplyArea_Text : String(40);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Production Version Basic'
@sap.value.list : 'true'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_ProductionVersionBasicStdVH {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product'
  @sap.quickinfo : 'Product Number'
  @sap.value.list : 'standard'
  key Product : String(40) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Plant'
  key Plant : String(4) not null;
  @sap.display.format : 'UpperCase'
  @sap.text : 'ProductionVersionText'
  @sap.label : 'Production Version'
  key ProductionVersion : String(4) not null;
  @sap.label : 'Prodn Version Text'
  @sap.quickinfo : 'Short Text for Production Version'
  ProductionVersionText : String(40);
  @sap.display.format : 'Date'
  @sap.label : 'Validity End Date'
  ValidityEndDate : Date;
  @sap.display.format : 'Date'
  @sap.label : 'Validity Start Date'
  ValidityStartDate : Date;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Cross-Plant Product Status'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_ProductStatus {
  @sap.display.format : 'UpperCase'
  @sap.text : 'Status_Text'
  @sap.label : 'Product Status'
  @sap.quickinfo : 'Plant-Specific Product Status'
  key Status : String(2) not null;
  @sap.label : 'Cross Plant Status Text'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  Status_Text : String(25);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Product Value Help'
@sap.value.list : 'true'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_ProductStdVH {
  @sap.display.format : 'UpperCase'
  @sap.text : 'Product_Text'
  @sap.label : 'Product'
  @sap.quickinfo : 'Product Number'
  key Product : String(40) not null;
  @sap.label : 'Product Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  Product_Text : String(40);
  @sap.display.format : 'UpperCase'
  @sap.label : 'External Product ID'
  @sap.quickinfo : 'External Representation of Material Number'
  ProductExternalID : String(40);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Product Type'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_Producttype {
  @sap.display.format : 'UpperCase'
  @sap.text : 'ProductType_Text'
  @sap.label : 'Product Type'
  key ProductType : String(4) not null;
  @sap.label : 'Product Type Description'
  @sap.quickinfo : 'Description of product type'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ProductType_Text : String(25);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Product Type Group'
  ProductTypeCode : String(2);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Authorization group'
  @sap.quickinfo : 'Authorization group in the material master'
  AuthorizationGroup : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Maintenance Status'
  MaintenanceStatus : String(15);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Ref. material type'
  @sap.quickinfo : 'Reference material type'
  ReferenceProductType : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Acct cat. reference'
  @sap.quickinfo : 'Account category reference'
  AcctCategoryRef : String(4);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Purchasing Group'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_PurchasingGroup {
  @sap.display.format : 'UpperCase'
  @sap.text : 'PurchasingGroupName'
  @sap.label : 'Purchasing Group'
  key PurchasingGroup : String(3) not null;
  @sap.label : 'Purchasing Grp. Name'
  @sap.quickinfo : 'Purchasing Group Name'
  PurchasingGroupName : String(18);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Tel.No. Purch. Group'
  @sap.quickinfo : 'Telephone number of purchasing group (buyer group)'
  PurchasingGroupPhoneNumber : String(12);
  @sap.label : 'Fax Number'
  @sap.quickinfo : 'Fax number of purchasing (buyer) group'
  FaxNumber : String(31);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Telephone'
  @sap.quickinfo : 'Telephone No.: Dialing Code and Number'
  PhoneNumber : String(30);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Extension'
  @sap.quickinfo : 'Telephone no.: Extension'
  PhoneNumberExtension : String(10);
  @sap.label : 'E-Mail Address'
  EmailAddress : String(241);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Reservation Document Record Type'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_ReservationDocRecordType {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Record type'
  key RecordType : String(1) not null;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Reservation Document Header'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_ReservationDocumentHeader {
  @sap.display.format : 'NonNegative'
  @sap.label : 'Reservation'
  @sap.quickinfo : 'Number of reservation/dependent requirements'
  key Reservation : String(10) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Resv. Creation Code'
  @sap.quickinfo : 'Reservation Creation Code'
  ReservationCreationCode : String(4);
  @sap.label : 'Origin'
  ReservationOrigin : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Order'
  @sap.quickinfo : 'Order Number'
  @sap.value.list : 'standard'
  OrderID : String(12);
  @sap.display.format : 'UpperCase'
  @sap.text : 'to_GoodsMovementType/GoodsMovementType_Text'
  @sap.label : 'Movement Type'
  @sap.quickinfo : 'Movement Type (Inventory Management)'
  @sap.value.list : 'standard'
  GoodsMovementType : String(3);
  @sap.display.format : 'UpperCase'
  @sap.text : 'to_CostCenter/CostCenter_Text'
  @sap.label : 'Cost Center'
  @sap.value.list : 'standard'
  CostCenter : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Profit Center'
  ProfitCenter : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Profitability Segment (Deprecated)'
  @sap.quickinfo : 'Deprecated: Profitability Segment'
  ProfitabilitySegment : String(10);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Profitability Segment'
  ProfitabilitySegment_2 : String(10);
  @sap.display.format : 'UpperCase'
  @sap.text : 'to_ControllingArea/ControllingAreaName'
  @sap.label : 'Controlling Area'
  @sap.value.list : 'standard'
  ControllingArea : String(4);
  @sap.label : 'Goods Recipient'
  GoodsRecipientName : String(12);
  @sap.display.format : 'Date'
  @sap.label : 'Base date'
  @sap.quickinfo : 'Base date for reservation'
  ReservationDate : Date;
  @sap.label : 'Check against cal.'
  @sap.quickinfo : 'Check date against factory calendar'
  IsCheckedAgainstFactoryCal : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.text : 'to_Customer/CustomerName'
  @sap.label : 'Customer'
  @sap.quickinfo : 'Account number of customer'
  @sap.value.list : 'standard'
  Customer : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'WBS Element'
  @sap.quickinfo : 'Work Breakdown Structure Element (WBS Element)'
  WBSElementInternalID : String(24);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Order'
  @sap.quickinfo : 'Sales Order Number'
  SalesOrder : String(10);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Sales Order Item'
  @sap.quickinfo : 'Item Number in Sales Order'
  SalesOrderItem : String(6);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Sales order schedule'
  @sap.quickinfo : 'Delivery schedule for sales order'
  SalesOrderScheduleLine : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Asset'
  @sap.quickinfo : 'Main Asset Number'
  AssetNumber : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sub-number'
  @sap.quickinfo : 'Asset Subnumber'
  AssetSubNumber : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Network'
  @sap.quickinfo : 'Network Number for Account Assignment'
  NetworkNumberForAcctAssgmt : String(12);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Receiving plant'
  @sap.quickinfo : 'Receiving plant/issuing plant'
  IssuingOrReceivingPlant : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Receiving stor. loc.'
  @sap.quickinfo : 'Receiving/issuing storage location'
  IssuingOrReceivingStorageLoc : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Clearing CoCode'
  @sap.quickinfo : 'Clearing company code'
  ResvnVerificationCompanyCode : String(4);
  @sap.display.format : 'UpperCase'
  @sap.label : 'User Name'
  UserID : String(12);
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.label : 'Created On'
  @sap.quickinfo : 'Creation Date'
  CreationDateTime : Timestamp;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Changed By'
  @sap.quickinfo : 'Last Changed By User'
  LastChangedByUser : String(12);
  @odata.Type : 'Edm.DateTimeOffset'
  @odata.Precision : 7
  @sap.label : 'Last Changed On'
  LastChangeDateTime : Timestamp;
  to_ControllingArea : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_ControllingArea {  };
  to_CostCenter : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_CostCenter {  };
  to_Customer : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_Customer {  };
  to_GoodsMovementType : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_GoodsMovementType {  };
  to_Order : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_LogisticsOrder {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Account Assignment Category'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_ResvnAcctAssgmtCategory {
  @sap.display.format : 'UpperCase'
  @sap.text : 'ResvnAcctAssgmtCategory_Text'
  @sap.label : 'Reserv. cat.'
  @sap.quickinfo : 'Account assignment of reservation'
  key ResvnAcctAssgmtCategory : String(1) not null;
  @sap.label : 'Category Name'
  @sap.quickinfo : 'Account Assignment Category Name for Reservation Doc.'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  ResvnAcctAssgmtCategory_Text : String(60);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Sales Order Item'
@sap.value.list : 'true'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_SalesOrderItemStdVH {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Order'
  key SalesOrder : String(10) not null;
  @sap.display.format : 'NonNegative'
  @sap.text : 'SalesOrderItemText'
  @sap.label : 'Item'
  @sap.quickinfo : 'Sales Order Item'
  key SalesOrderItem : String(6) not null;
  @sap.label : 'Item Description'
  @sap.quickinfo : 'Short text for sales order item'
  SalesOrderItemText : String(40);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Sales Order'
@sap.value.list : 'true'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_SalesOrderStdVH {
  @sap.display.format : 'UpperCase'
  @sap.label : 'Sales Order'
  key SalesOrder : String(10) not null;
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Storage Location'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_StorageLocation {
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
  to_Plant : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_Plant {  };
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
entity ZZ1_PLANNEDORDERSAPI_CDS.I_Supplier_VH {
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
@sap.label : 'Unit of Measure'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_UnitOfMeasure {
  @sap.text : 'UnitOfMeasure_Text'
  @sap.label : 'Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  key UnitOfMeasure : String(3) not null;
  @sap.label : 'Meas. Unit Text'
  @sap.quickinfo : 'Unit of Measurement Text (Maximum 30 Characters)'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  UnitOfMeasure_Text : String(30);
  @sap.label : 'Internal SAP Code'
  @sap.quickinfo : 'Unit of Measurement, Internal SAP Code (No Conversion)'
  UnitOfMeasureSAPCode : String(3);
  @sap.display.format : 'UpperCase'
  @sap.label : 'ISO Code'
  @sap.quickinfo : 'ISO Code for Unit of Measurement'
  UnitOfMeasureISOCode : String(3);
  @sap.label : 'Primary code'
  @sap.quickinfo : 'Selection field for conversion from ISO code to int. code'
  IsPrimaryUnitForISOCode : Boolean;
  @sap.label : 'Decimal Rounding'
  @sap.quickinfo : 'No. of decimal places for rounding'
  UnitOfMeasureNumberOfDecimals : Integer;
  @sap.label : 'Commercial Unit'
  @sap.quickinfo : 'Commercial measurement unit ID'
  UnitOfMeasureIsCommercial : Boolean;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Dimension'
  @sap.quickinfo : 'Dimension key'
  UnitOfMeasureDimension : String(6);
  @sap.label : 'Numerator'
  @sap.quickinfo : 'Numerator for conversion to SI unit'
  SIUnitCnvrsnRateNumerator : Integer;
  @sap.label : 'Denominator'
  @sap.quickinfo : 'Denominator for conversion into SI unit'
  SIUnitCnvrsnRateDenominator : Integer;
  @sap.label : 'Exponent'
  @sap.quickinfo : 'base ten exponent for conversion to SI unit'
  SIUnitCnvrsnRateExponent : Integer;
  @sap.label : 'Additive constant'
  @sap.quickinfo : 'Additive constant for conversion to SI unit'
  SIUnitCnvrsnAdditiveValue : Decimal(9, 6);
  @sap.label : 'Exp. 10 Floating Pt'
  @sap.quickinfo : 'Exponent of 10 for Floating Point Format'
  UnitOfMeasureDspExponent : Integer;
  @sap.label : 'Decimal Places'
  @sap.quickinfo : 'Number of Decimal Places for Number Display'
  UnitOfMeasureDspNmbrOfDcmls : Integer;
  @sap.unit : 'UnitOfMeasureTemperatureUnit'
  @sap.label : 'Temperature'
  UnitOfMeasureTemperature : Double;
  @sap.label : 'Temperature unit'
  @sap.semantics : 'unit-of-measure'
  UnitOfMeasureTemperatureUnit : String(3);
  @sap.unit : 'UnitOfMeasurePressureUnit'
  @sap.label : 'Pressure Value'
  UnitOfMeasurePressure : Double;
  @sap.label : 'Unit of Pressure'
  @sap.semantics : 'unit-of-measure'
  UnitOfMeasurePressureUnit : String(3);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.addressable : 'false'
@sap.content.version : '1'
@sap.label : 'User Contact Card'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_UserContactCard {
  @sap.display.format : 'UpperCase'
  @sap.text : 'UserDescription'
  @sap.label : 'User'
  @sap.quickinfo : 'User Name in User Master Record'
  key ContactCardID : String(12) not null;
  @sap.display.format : 'UpperCase'
  @sap.label : 'Person Number'
  Person : String(10);
  @sap.label : 'BP GUID'
  @sap.quickinfo : 'Business Partner GUID'
  BusinessPartnerUUID : UUID;
  @sap.label : 'First Name'
  FirstName : String(40);
  @sap.label : 'Last Name'
  LastName : String(40);
  @sap.label : 'Full Name'
  @sap.quickinfo : 'Full Name of Person'
  FullName : String(80);
  @sap.label : 'Description'
  @sap.quickinfo : 'User Description'
  UserDescription : String(80);
  @sap.display.format : 'UpperCase'
  @sap.label : 'Address Number'
  AddressID : String(10);
  @sap.label : 'Phone'
  @sap.quickinfo : 'Contact Card Phone Number'
  @sap.semantics : 'tel'
  PhoneNumber : String(30);
  @sap.label : 'Mobile'
  @sap.quickinfo : 'Contact Card Mobile Phone Number'
  @sap.semantics : 'tel'
  MobilePhoneNumber : String(30);
  @sap.label : 'Fax'
  @sap.quickinfo : 'Contact Card Fax Number'
  @sap.semantics : 'tel'
  FaxNumber : String(30);
  @sap.label : 'E-Mail'
  @sap.quickinfo : 'Contact Card E-Mail Address'
  @sap.semantics : 'email'
  EmailAddress : String(241);
  @sap.label : 'Department'
  Department : String(40);
  @sap.label : 'Function'
  FunctionalTitleName : String(40);
  ContactCardRole : String(7);
  ContactCardType : String(4);
  ContactCardNavLinkSemanticObj : String(4);
  ContactCardNavLinkQueryPart : String(17);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Warehouse Number'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_Warehouse {
  @sap.display.format : 'UpperCase'
  @sap.text : 'Warehouse_Text'
  @sap.label : 'Warehouse Number'
  @sap.quickinfo : 'Warehouse Number / Warehouse Complex'
  key Warehouse : String(3) not null;
  @sap.label : 'Description'
  @sap.quickinfo : 'Warehouse Number Description'
  @sap.creatable : 'false'
  @sap.updatable : 'false'
  Warehouse_Text : String(25);
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.searchable : 'true'
@sap.content.version : '1'
@sap.label : 'Basic data for WBS Element'
@sap.value.list : 'true'
entity ZZ1_PLANNEDORDERSAPI_CDS.I_WBSElementBasicDataStdVH {
  @sap.display.format : 'NonNegative'
  @sap.label : 'WBS Internal ID'
  @sap.quickinfo : 'WBS Element'
  key WBSElementInternalID : String(8) not null;
  @sap.display.format : 'UpperCase'
  @sap.text : 'WBSDescription'
  @sap.label : 'WBS Element'
  @sap.quickinfo : 'Work Breakdown Structure Element (WBS Element) Edited'
  WBSElementExternalID : String(24);
  @sap.label : 'WBS Element Name'
  @sap.quickinfo : 'Work Breakdown Structure Element Name'
  WBSDescription : String(40);
  @sap.display.format : 'NonNegative'
  @sap.label : 'Project Def.'
  @sap.quickinfo : 'Project (internal)'
  ProjectInternalID : String(8);
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
entity ZZ1_PLANNEDORDERSAPI_CDS.I_WorkCenterStdVH {
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
@sap.semantics : 'aggregate'
@sap.label : 'PlannedOrderComponent'
entity ZZ1_PLANNEDORDERSAPI_CDS.ZZ1_PlannedOrderComponent {
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key ID : LargeString not null;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Reservation'
  @sap.quickinfo : 'Number of reservation/dependent requirements'
  @sap.value.list : 'standard'
  Reservation : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.text : 'BOMItemDescription'
  @sap.label : 'Reservation Item'
  ReservationItem : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Reservation Record Type'
  @sap.value.list : 'standard'
  RecordType : String(1);
  @sap.required.in.filter : 'false'
  @sap.label : 'Item Text'
  @sap.quickinfo : 'BOM Item Text (Line 1)'
  BOMItemDescription : String(40);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Planned Order'
  @sap.value.list : 'standard'
  PlannedOrder : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'to_PlannedOrderType/PlannedOrderType_Text'
  @sap.label : 'Planned Order Type'
  @sap.value.list : 'fixed-values'
  PlannedOrderType : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'Requirement Date'
  @sap.quickinfo : 'Material Component Requirement Date'
  MatlCompRequirementDate : Date;
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Requirement Time'
  @sap.quickinfo : 'Material Component Requirement Time'
  MatlCompRequirementTime : Time;
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Final Issue'
  @sap.quickinfo : 'Final Issue for Reservation'
  ReservationIsFinallyIssued : Boolean;
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Item is Deleted'
  MatlCompIsMarkedForDeletion : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Missing Part'
  MaterialComponentIsMissing : Boolean;
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Bulk material'
  @sap.quickinfo : 'Indicator: bulk material'
  IsBulkMaterialComponent : Boolean;
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Backflush'
  @sap.quickinfo : 'Indicator: Backflush'
  MatlCompIsMarkedForBackflush : Boolean;
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Text Item'
  @sap.quickinfo : 'Item is Text indicator'
  MatlCompIsTextItem : Boolean;
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Configurable Item'
  @sap.quickinfo : 'Indicator: Configurable Item'
  MatlCompIsConfigurable : Boolean;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Requirement Type'
  RequirementType : String(2);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Material Group'
  MaterialGroup : String(9);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Material'
  @sap.quickinfo : 'Material Number'
  @sap.value.list : 'standard'
  Material : String(40);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Plant'
  @sap.value.list : 'standard'
  Plant : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'MRP Area'
  @sap.value.list : 'standard'
  MRPArea : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'MRP Controller'
  @sap.value.list : 'standard'
  MRPController : String(3);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'to_ProductionSupervisor/ProductionSupervisorName'
  @sap.label : 'Production Supervisor'
  ProductionSupervisor : String(3);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Production Version'
  @sap.value.list : 'standard'
  ProductionVersion : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Requirements Plan'
  RequirementPlan : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Sales Order'
  @sap.value.list : 'standard'
  SalesOrder : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Sales Order Item'
  @sap.value.list : 'standard'
  SalesOrderItem : String(6);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'WBS Internal ID'
  @sap.quickinfo : 'WBS Element'
  @sap.value.list : 'standard'
  WBSElementInternalID_2 : String(8);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Internal object no.'
  @sap.quickinfo : 'Configuration (internal object number)'
  ProductConfiguration : String(18);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Change Number'
  @sap.value.list : 'standard'
  ChangeNumber : String(12);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Sort String'
  MatlCompFreeDefinedAttribute : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Revision Level'
  MaterialRevisionLevel : String(2);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Relevant for Materials Planning'
  @sap.quickinfo : 'Code: Relevant for Materials Planning'
  MaterialPlanningRelevance : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'BOM Category'
  @sap.quickinfo : 'Bill of Material Category Code'
  BillOfMaterialCategory : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Bill Of Material'
  BillOfMaterialInternalID_2 : String(8);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Alternative BOM'
  BillOfMaterialVariant : String(2);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'BOM Item'
  @sap.quickinfo : 'Bill of Material Item'
  BOMItem : String(8);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Counter'
  @sap.quickinfo : 'Internal counter'
  BOMItemInternalChangeCount : String(8);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'BOM Item Category'
  @sap.quickinfo : 'Bill of Material Item Category'
  BOMItemCategory : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'BOMItemDescription'
  @sap.label : 'Bill Of Material Item Number'
  BillOfMaterialItemNumber_2 : String(4);
  @sap.required.in.filter : 'false'
  @sap.label : 'Item Text 2'
  @sap.quickinfo : 'BOM Item Text (Line 2)'
  BOMItemText2 : String(40);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'to_BOMExplosion/BOMExplosionDateText'
  @sap.label : 'Explosion Date ID'
  @sap.quickinfo : 'Bill of Material Explosion Date ID'
  @sap.value.list : 'standard'
  BOMExplosion : String(8);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Purchasing Info Record'
  PurchasingInfoRecord : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'to_PurchasingGroup/PurchasingGroupName'
  @sap.label : 'Purchasing Group'
  @sap.value.list : 'standard'
  PurchasingGroup : String(3);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Purchase Requisition'
  @sap.quickinfo : 'Purchase Requisition Number'
  PurchaseRequisition : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Requisition Item'
  @sap.quickinfo : 'Item Number of Purchase Requisition in Order'
  PurchaseRequisitionItem : String(5);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Purchase Order'
  @sap.quickinfo : 'Purchase Order Number'
  PurchaseOrder : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Purchase Order Item'
  @sap.quickinfo : 'Item Number of Purchase Order'
  PurchaseOrderItem : String(5);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Delivery Duration'
  @sap.quickinfo : 'Delivery Duration In Days'
  DeliveryDurationInDays : Decimal(3, 0);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Movement Allowed'
  @sap.quickinfo : 'Goods Movement for Reservation Allowed'
  GoodsMovementIsAllowed : Boolean;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Supplier'
  @sap.quickinfo : 'Account Number of Supplier'
  @sap.value.list : 'standard'
  Supplier : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Batch'
  @sap.quickinfo : 'Batch Number'
  @sap.value.list : 'standard'
  Batch : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'to_DebitCreditCode/DebitCreditCode_Text'
  @sap.label : 'Debit Credit Code'
  @sap.quickinfo : 'Debit/Credit Code'
  @sap.value.list : 'fixed-values'
  DebitCreditCode : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'to_StorageLocation/StorageLocationName'
  @sap.label : 'Storage Location'
  @sap.value.list : 'standard'
  StorageLocation : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'to_InventorySpecialStockValnType/InventorySpecialStockValnType_Text'
  @sap.label : 'Special Stock Valuation Type'
  @sap.quickinfo : 'Inventory Special Stock Valuation Type'
  @sap.value.list : 'fixed-values'
  InventorySpecialStockValnType : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'to_GoodsMovementType/GoodsMovementType_Text'
  @sap.label : 'Movement Type'
  @sap.quickinfo : 'Movement Type (Inventory Management)'
  @sap.value.list : 'standard'
  GoodsMovementType : String(3);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'to_InventorySpecialStockType/InventorySpecialStockType_Text'
  @sap.label : 'Special Stock Type'
  @sap.quickinfo : 'Inventory Special Stock Type'
  @sap.value.list : 'standard'
  InventorySpecialStockType : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Consumption Posting'
  ConsumptionPosting : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Production Supply Area'
  @sap.value.list : 'standard'
  SupplyArea : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Mat.Staging Indicat.'
  @sap.quickinfo : 'Material Staging Indicator for Production Supply'
  MaterialStaging : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'to_Warehouse/Warehouse_Text'
  @sap.label : 'Warehouse Number'
  @sap.quickinfo : 'Warehouse Number / Warehouse Complex'
  @sap.value.list : 'standard'
  Warehouse : String(3);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Storage Type'
  StorageType : String(3);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Storage Bin'
  StorageBin : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Business Area'
  @sap.value.list : 'standard'
  BusinessArea : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'G/L Account'
  @sap.quickinfo : 'G/L Account Number'
  @sap.value.list : 'standard'
  GLAccount : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Commitment Item Short ID'
  CommitmentItemShortID : String(14);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Funds Center'
  FundsCenter : String(16);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'to_AccountAssignmentCategory/AccountAssignmentCategory_Text'
  @sap.label : 'Account Assignment Category'
  @sap.value.list : 'standard'
  AccountAssignmentCategory : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Variable-Sized Item'
  @sap.quickinfo : 'Variable-Sized Item Indicator'
  MaterialCompIsVariableSized : Boolean;
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Number of Variable-Size Items'
  NumberOfVariableSizeComponents : Integer;
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Variable-Size Component Unit'
  @sap.quickinfo : 'Unit of Measure for Variable-Size Components'
  @sap.semantics : 'unit-of-measure'
  VariableSizeComponentUnit : String(3);
  @sap.aggregation.role : 'measure'
  @sap.required.in.filter : 'false'
  @sap.unit : 'VariableSizeComponentUnit'
  @sap.label : 'VSI Quantity'
  @sap.quickinfo : 'Variable-Size Item Quantity per PC'
  @sap.filterable : 'false'
  VariableSizeComponentQuantity : Decimal(13, 3);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Size unit'
  @sap.quickinfo : 'Unit of measure for sizes 1 to 3'
  @sap.semantics : 'unit-of-measure'
  VariableSizeDimensionUnit : String(3);
  @sap.aggregation.role : 'measure'
  @sap.required.in.filter : 'false'
  @sap.unit : 'VariableSizeDimensionUnit'
  @sap.label : 'Size 1'
  @sap.filterable : 'false'
  VariableSizeDimension1 : Decimal(13, 3);
  @sap.aggregation.role : 'measure'
  @sap.required.in.filter : 'false'
  @sap.unit : 'VariableSizeDimensionUnit'
  @sap.label : 'Size 2'
  @sap.filterable : 'false'
  VariableSizeDimension2 : Decimal(13, 3);
  @sap.aggregation.role : 'measure'
  @sap.required.in.filter : 'false'
  @sap.unit : 'VariableSizeDimensionUnit'
  @sap.label : 'Size 3'
  @sap.filterable : 'false'
  VariableSizeDimension3 : Decimal(13, 3);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'VSI Formula'
  @sap.quickinfo : 'Formula Key for Variable-Size Items'
  FormulaKey : String(2);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Alternative Item'
  @sap.quickinfo : 'Alternative Item Indicator'
  MaterialCompIsAlternativeItem : Boolean;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Alternative Item Group'
  AlternativeItemGroup : String(2);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Alternative Item Strategy'
  AlternativeItemStrategy : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Alternative Item Priority'
  AlternativeItemPriority : String(2);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Usage Probability'
  @sap.quickinfo : 'Usage Probability in % (Alternative Item)'
  UsageProbabilityPercent : Decimal(3, 0);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Alternative Master Reservation Item'
  @sap.quickinfo : 'Reservation Item of Alternative Master Record'
  AlternativeMstrReservationItem : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Phantom Item'
  @sap.quickinfo : 'Phantom Item Indicator'
  MaterialComponentIsPhantomItem : Boolean;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Order path'
  OrderPathValue : String(2);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Order level'
  OrderLevelValue : String(2);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'to_Assembly/Product_Text'
  @sap.label : 'Pegged Requirement'
  @sap.quickinfo : 'Higher-Level Assembly Material'
  @sap.value.list : 'standard'
  Assembly : String(40);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Assembly Order Path'
  AssemblyOrderPathValue : String(2);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Assembly Order Level'
  AssemblyOrderLevelValue : String(2);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Discontinuation Group'
  DiscontinuationGroup : String(2);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'to_MatlCompDiscontinuationType/MatlCompDiscontinuationType_Text'
  @sap.label : 'Discontinuation Type'
  @sap.value.list : 'fixed-values'
  MatlCompDiscontinuationType : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Component is Follow-Up Material'
  @sap.quickinfo : 'Indicator: Component is Follow-Up Material'
  MatlCompIsFollowUpMaterial : Boolean;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Follow-up Group'
  FollowUpGroup : String(2);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.text : 'to_FollowUpMaterial/Product_Text'
  @sap.label : 'Follow-Up / Original Material'
  @sap.value.list : 'standard'
  FollowUpMaterial : String(40);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Follow-Up Material is Active'
  @sap.quickinfo : 'Indicator: Follow-Up Material is Active'
  FollowUpMaterialIsActive : Boolean;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Discontinuation Master Reservation Item'
  @sap.quickinfo : 'Reservation Item of Discontinuation Master Record'
  DiscontinuationMasterResvnItem : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Material Provision Type'
  MaterialProvisionType : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Spare Part Type'
  MatlComponentSparePartType : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Lead-Time Offset'
  LeadTimeOffset : Decimal(3, 0);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Operation Lead-Time Offset Unit'
  @sap.quickinfo : 'Unit of Measure for Lead-Time Offset for Operations'
  @sap.semantics : 'unit-of-measure'
  OperationLeadTimeOffsetUnit : String(3);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Operation Lead-Time Offset'
  @sap.quickinfo : 'Lead-Time Offset for Operations'
  OperationLeadTimeOffset : Decimal(3, 0);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Quantity is fixed'
  QuantityIsFixed : Boolean;
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Component Scrap (%)'
  @sap.quickinfo : 'Component Scrap in Percent'
  ComponentScrapInPercent : Decimal(5, 2);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Base Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);
  @sap.aggregation.role : 'measure'
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'Requirement Quantity'
  @sap.filterable : 'false'
  RequiredQuantity : Decimal(13, 3);
  @sap.aggregation.role : 'measure'
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'Withdrawn Quantity'
  @sap.filterable : 'false'
  WithdrawnQuantity : Decimal(13, 3);
  @sap.aggregation.role : 'measure'
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'Available Quantity'
  @sap.filterable : 'false'
  ConfirmedAvailableQuantity : Decimal(15, 3);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Unit of Entry'
  @sap.quickinfo : 'Unit of entry'
  @sap.semantics : 'unit-of-measure'
  EntryUnit : String(3);
  @sap.aggregation.role : 'measure'
  @sap.required.in.filter : 'false'
  @sap.unit : 'EntryUnit'
  @sap.label : 'Quantity in Unit of Entry'
  @sap.filterable : 'false'
  GoodsMovementEntryQty : Decimal(13, 3);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Currency'
  @sap.quickinfo : 'Currency Key'
  @sap.semantics : 'currency-code'
  Currency : String(5);
  @sap.aggregation.role : 'measure'
  @sap.required.in.filter : 'false'
  @sap.unit : 'Currency'
  @sap.label : 'Value Withdrawn'
  @sap.filterable : 'false'
  WithdrawnQuantityAmount : Decimal(14, 3);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Stock Segment'
  StockSegment : String(40);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Requirement Segment'
  RequirementSegment : String(40);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Critical Component'
  @sap.quickinfo : 'Critical Component Indicator'
  CriticalComponentType : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Critical Level'
  @sap.quickinfo : 'Crtical Level of a Component in BoM'
  CriticalComponentLevel : Decimal(2, 0);
  @sap.aggregation.role : 'measure'
  @sap.required.in.filter : 'false'
  @sap.unit : 'MaterialBaseunit'
  @sap.label : 'TotalAllocQty'
  @sap.filterable : 'false'
  TotalAllocQty : Decimal(13, 3);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Base Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  MaterialBaseunit : String(3);
  to_AccountAssignmentCategory : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_AccountAssignmentCategory {  };
  to_Assembly : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_Product {  };
  to_BOMExplosion : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_BOMExplosionDate {  };
  to_DebitCreditCode : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_DebitCreditCode {  };
  to_FollowUpMaterial : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_Product {  };
  to_GoodsMovementType : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_GoodsMovementType {  };
  to_InventorySpecialStockType : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_InventorySpecialStockType {  };
  to_InventorySpecialStockValnType : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_InvtrySpecialStockValnType {  };
  to_MatlCompDiscontinuationType : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_MatlCompDiscontinuationType {  };
  to_PlannedOrderType : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_PlannedOrderType {  };
  to_ProductionSupervisor : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_ProductionSupervisor {  };
  to_PurchasingGroup : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_PurchasingGroup {  };
  to_Reservation : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_ReservationDocumentHeader {  };
  to_ReservationDocRecordType : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_ReservationDocRecordType {  };
  to_StorageLocation : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_StorageLocation {  };
  to_Warehouse : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_Warehouse {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.semantics : 'aggregate'
@sap.label : 'PlannedOrdersAPI'
entity ZZ1_PLANNEDORDERSAPI_CDS.ZZ1_PlannedOrdersAPI {
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key ID : LargeString not null;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Planned Order'
  PlannedOrder : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Combined Plnd. Order'
  @sap.quickinfo : 'Combined Master Planned Order'
  CplndOrd : String(12);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Master Plnd Ord.'
  @sap.quickinfo : 'Master Planned Order Number'
  MasterPlannedOrder : String(12);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Material'
  @sap.quickinfo : 'Planning material'
  Material : String(40);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Product'
  @sap.quickinfo : 'Product Number'
  Product : String(40);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Planning Plant'
  MRPPlant : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'MRP Controller'
  MRPController : String(3);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'MRP Area'
  MRPArea : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Storage Location'
  StorageLocation : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Reservation'
  @sap.quickinfo : 'Number of reservation/dependent requirements'
  Reservation : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Production Plant'
  ProductionPlant : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Production Version'
  ProductionVersion : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'Order End Date'
  @sap.quickinfo : 'Planned Order End Date'
  PlndOrderPlannedEndDate : Date;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'Order Start Date'
  @sap.quickinfo : 'Planned Order Start Date'
  PlndOrderPlannedStartDate : Date;
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Base Unit of Measure'
  @sap.semantics : 'unit-of-measure'
  BaseUnit : String(3);
  @sap.aggregation.role : 'measure'
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'Requirement Quantity'
  @sap.filterable : 'false'
  RequirementQuantityInBaseUnit : Decimal(13, 3);
  @sap.aggregation.role : 'measure'
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'Total Order Quantity'
  @sap.quickinfo : 'Planned Total Order Quantity'
  @sap.filterable : 'false'
  PlannedTotalQtyInBaseUnit : Decimal(13, 3);
  @sap.aggregation.role : 'measure'
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'Committed Quantity'
  @sap.quickinfo : 'Planned Order: Committed Quantity'
  @sap.filterable : 'false'
  PlndOrderCommittedQty : Decimal(13, 3);
  @sap.aggregation.role : 'measure'
  @sap.required.in.filter : 'false'
  @sap.unit : 'BaseUnit'
  @sap.label : 'Issued Quantity'
  @sap.filterable : 'false'
  QuantityWithdrawnInBaseUnit : Decimal(13, 3);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Season Year'
  ProductSeasonYear : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Season'
  ProductSeason : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Collection'
  @sap.quickinfo : 'Fashion Collection'
  ProductCollection : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Capacity Requirement'
  @sap.quickinfo : 'ID of the Capacity Requirements Record'
  CapacityRequirement_1 : String(12);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Theme'
  @sap.quickinfo : 'Fashion Theme'
  ProductTheme : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Capacity Requirement'
  @sap.quickinfo : 'ID of the Capacity Requirements Record'
  CapacityRequirement : String(12);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Capacity Requirement Origin'
  CapacityRequirementOrigin : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Planned Order'
  PlannedOrder_1 : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Order'
  @sap.quickinfo : 'Order Number'
  OrderID : String(12);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'NonNegative'
  @sap.required.in.filter : 'false'
  @sap.label : 'Order Internal ID'
  OrderInternalID : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'SOP Order'
  @sap.quickinfo : 'Sales Operations Planning Order'
  SalesOperationsPlanningOrder : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Task List Type'
  BillOfOperationsType : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Group'
  @sap.quickinfo : 'Key for Task List Group'
  BillOfOperationsGroup : String(8);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Group Counter'
  BillOfOperations : String(2);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Scheduling Type'
  SchedulingType : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'Scheduled start'
  ScheduledBasicStartDate : Date;
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Earliest start time'
  @sap.quickinfo : 'Earliest scheduled start: Execution (time)'
  ScheduledBasicStartTime : Time;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'Scheduled finish'
  ScheduledBasicEndDate : Date;
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Earliest finish'
  @sap.quickinfo : 'Earliest finish of operation (time)'
  ScheduledBasicEndTime : Time;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'Scheduled on'
  @sap.quickinfo : 'Date of the Last Scheduling'
  LastScheduledDate : Date;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'Date'
  @sap.required.in.filter : 'false'
  @sap.label : 'Explosion Date'
  @sap.quickinfo : 'Date for Routing Explosion'
  BOOExplosionDate : Date;
  to_ZZ1_PlannedOrderComponent : Association to many ZZ1_PLANNEDORDERSAPI_CDS.ZZ1_PlannedOrderComponent {  };
  to_ZZ1_PlannedOrdersCapacity : Association to many ZZ1_PLANNEDORDERSAPI_CDS.ZZ1_PlannedOrdersCapacity {  };
  to_ZZ1_PlannedOrdersCompChar : Association to many ZZ1_PLANNEDORDERSAPI_CDS.ZZ1_PlannedOrdersCompChar {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Planned Orders Capacity'
entity ZZ1_PLANNEDORDERSAPI_CDS.ZZ1_PlannedOrdersCapacity {
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
  to_CapacityCategory : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_CapacityCategory {  };
  to_CapacityRequirementItem : Association to ZZ1_PLANNEDORDERSAPI_CDS.I_CapacityRequirementItem {  };
};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.label : 'Planned Order Component Characteristic'
entity ZZ1_PLANNEDORDERSAPI_CDS.ZZ1_PlannedOrdersCompChar {
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

