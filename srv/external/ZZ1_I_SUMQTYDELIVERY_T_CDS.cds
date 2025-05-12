/* checksum : bae608495234d39e804f154aa61381eb */
@cds.external : true
@m.IsDefaultEntityContainer : 'true'
@sap.message.scope.supported : 'true'
@sap.supported.formats : 'atom json xlsx'
service ZZ1_I_SUMQTYDELIVERY_T_CDS {};

@cds.external : true
@cds.persistence.skip : true
@sap.creatable : 'false'
@sap.updatable : 'false'
@sap.deletable : 'false'
@sap.content.version : '1'
@sap.semantics : 'aggregate'
entity ZZ1_I_SUMQTYDELIVERY_T_CDS.ZZ1_I_SUMQTYDELIVERY_T {
  @sap.sortable : 'false'
  @sap.filterable : 'false'
  key ID : LargeString not null;
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Customer Material'
  @sap.heading : ''
  DELIVERYDOCUMENTBYSUPPLIER : String(35);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Batch'
  @sap.heading : ''
  @sap.quickinfo : 'Batch Number'
  Batch : String(10);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Material'
  @sap.heading : ''
  @sap.quickinfo : 'Material Number'
  Material : String(40);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Storage Location'
  @sap.heading : ''
  StorLoc : String(4);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Goods Movement Sts'
  @sap.heading : ''
  @sap.quickinfo : 'Goods Movement Status (All Items)'
  OVERALLGOODSMOVEMENTSTATUS : String(1);
  @sap.aggregation.role : 'dimension'
  @sap.display.format : 'UpperCase'
  @sap.required.in.filter : 'false'
  @sap.label : 'Customer Material'
  @sap.heading : ''
  MaterialByCustomer : String(35);
  @sap.aggregation.role : 'dimension'
  @sap.required.in.filter : 'false'
  @sap.label : 'Sales Unit'
  @sap.heading : ''
  @sap.semantics : 'unit-of-measure'
  DeliveryQuantityUnit : String(3);
  @sap.aggregation.role : 'measure'
  @sap.required.in.filter : 'false'
  @sap.unit : 'DeliveryQuantityUnit'
  @sap.label : ''
  @sap.filterable : 'false'
  TotDeliveryQty : Decimal(13, 3);
};

