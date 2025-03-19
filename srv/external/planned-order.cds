/* checksum : generated_checksum */
@cds.external          : true
@cds.persistence.skip  : true

@UI.SelectionFields    : ['ManufacturingOrder',
// 'MRPController',
// 'MRPPlant'
]
@UI.LineItem           : [{
  $Type: 'UI.DataField',
  Value: ManufacturingOrder
},
// {
//   $Type: 'UI.DataField',
//   Value: MRPController
// },
// {
//   $Type: 'UI.DataField',
//   Value: MRPPlant
// }
]
@UI.HeaderInfo         : {
  $Type         : 'UI.HeaderInfoType',
  TypeName      : 'Planned Order',
  TypeNamePlural: 'Planned Orders',
  Title         : {
    $Type: 'UI.DataField',
    Value: ManufacturingOrder
  },
  // Description   : {
  //   $Type: 'UI.DataField',
  //   Value: MRPControllerName
  // }
}
@UI.Facets             : [{
  $Type : 'UI.ReferenceFacet',
  Label : 'Details',
  Target: @UI.![FieldGroup#Details]
}]
@UI.FieldGroup #Details: {
  $Type: 'UI.FieldGroupType',
  Data : [{
    $Type: 'UI.DataField',
    Value: ManufacturingOrder
  },
  // {
  //   $Type: 'UI.DataField',
  //   Value: MRPController
  // },
  // {
  //   $Type: 'UI.DataField',
  //   Value: MRPPlant
  // },
  // {
  //   $Type: 'UI.DataField',
  //   Value: PlannedOrderOpeningDate
  // }
  ]
}
entity cds_ui_rfm_mng_mstrplndord.C_RFM_ManageMfgOrder {
  key ManufacturingOrder : String(7);
// MRPController           : String(3);
// MRPControllerName       : String(18);
// MRPPlant                : String(4);
// PlannedOrderOpeningDate : DateTime;
};

@cds.external        : true
@cds.persistence.skip: true
@UI.SelectionFields  : [
  'MasterPlannedOrder',
  'MRPController',
  'ProductionPlant'
]
@UI.LineItem         : [
  {
    $Type: 'UI.DataField',
    Value: MasterPlannedOrder
  },
  {
    $Type: 'UI.DataField',
    Value: MRPController
  },
  {
    $Type: 'UI.DataField',
    Value: ProductionPlant
  }
]
@UI.HeaderInfo       : {
  $Type         : 'UI.HeaderInfoType',
  TypeName      : 'Master Planned Order',
  TypeNamePlural: 'Master Planned Orders',
  Title         : {
    $Type: 'UI.DataField',
    Value: MasterPlannedOrder
  },
  Description   : {
    $Type: 'UI.DataField',
    Value: MRPControllerName
  }
}
entity cds_ui_rfm_mng_mstrplndord.C_RFM_ManageMasterPlndOrderType {
  key MasterPlannedOrder      : String(12);
      MRPController           : String(3);
      MRPControllerName       : String(18);
      ProductionPlant         : String(4);
      PlannedOrderOpeningDate : DateTime;
};


@cds.external: true
service cds_ui_rfm_mng_mstrplndord {};
