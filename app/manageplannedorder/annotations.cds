using MainService as service from '../../srv/main-service';
annotate service.ZZ1_CombinedPlnOrdersAPI with @(
    UI.SelectionFields #filterBarMacro : [
        CplndOrd,
        ProductCollection,
        ProductionPlant,
    ],
    UI.DataPoint #radialChart : { 
        Value : committed_percent,
        Criticality: committed_criticality,
    },
    UI.Chart #radialChart : {
        Title : 'committed_percent',
        Description : 'committed_percent',
        ChartType : #Donut,
        
        Measures : [committed_percent],
        MeasureAttributes : [{
                $Type : 'UI.ChartMeasureAttributeType',
                Measure : committed_percent,
                Role : #Axis1,
                DataPoint : '@UI.DataPoint#radialChart',
        }]
    },
    UI.LineItem #tableMacro : [
        {
            $Type : 'UI.DataField',
            Value : ProductSeasonYear,
            Label : 'Season Year',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductSeason,
            Label : 'Season',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductTheme,
            Label : 'Product Theme',
        },
        {
            $Type : 'UI.DataField',
            Value : CplndOrd,
            Label : 'Combined Planned Order',
        },
        {
            $Type : 'UI.DataField',
            Value : CrossPlantConfigurableProduct,
            Label : 'Cross Plant Configurable Product',
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : '@UI.Chart#radialChart',
            Label   : 'Overall Conversion Status',
        },
        {
            $Type : 'UI.DataField',
            Value : PlannedTotalQtyInBaseUnit,
            Label : 'Planned Total Qty In Base Unit',
        },
        {
            $Type : 'UI.DataField',
            Value : PlndOrderCommittedQty,
            Label : 'Plnd Order Committed Qty',
        },
        {
            $Type : 'UI.DataField',
            Value : RequirementQuantityInBaseUnit,
            Label : 'Requirement Quantity In Base Unit',
        },
        {
            $Type : 'UI.DataField',
            Value : PlndOrderPlannedStartDate,
            Label : 'Plnd Order Planned Start Date',
        },
        {
            $Type : 'UI.DataField',
            Value : PlndOrderPlannedEndDate,
            Label : 'Plnd Order Planned End Date',
        },
        {
            $Type : 'UI.DataField',
            Value : PlndOrderTotalCmtmtDate,
            Label : 'Plnd Order Total Cmtmt Date',
            ![@UI.Hidden],
        },
        {
            $Type : 'UI.DataField',
            Value : PlannedOrderOpeningDate,
            Label : 'Planned Order Opening Date',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductCollection,
            Label : 'Product Collection',
            ![@UI.Hidden],
        },
    ],
    UI.DataPoint #ProductionPlant : {
        $Type : 'UI.DataPointType',
        Value : ProductionPlant,
        Title : 'ProductionPlant',
    },
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ProductionPlant',
            Target : '@UI.DataPoint#ProductionPlant',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'General Info',
            ID : 'GeneralInfo',
            Target : '@UI.FieldGroup#GeneralInfo',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Master Planned Order',
            ID : 'MasterPlannedOrder',
            Target : 'to_ZZ1_MasterPlannedOrders/@UI.SelectionPresentationVariant#MasterPlannedOrder',
        },
        
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Capacity',
            ID : 'Capacity',
            Target : 'to_ZZ1_PLOCAPACITYCORD/@UI.LineItem#Capacity',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Component',
            ID : 'componenti1',
            Target : 'to_CombinPlannedOrdersCom/@UI.LineItem#componenti',
            ![@UI.Hidden],
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Components',
            ID : 'Components',
            Target : 'to_CombinPlannedOrdersCom/@UI.LineItem#Components',
        },
       
    ],
    UI.FieldGroup #GeneralInfo : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : PlndOrderPlannedStartDate,
                Label : 'PlndOrderPlannedStartDate',
            },
            {
                $Type : 'UI.DataField',
                Value : PlndOrderPlannedEndDate,
                Label : 'PlndOrderPlannedEndDate',
            },
            {
                $Type : 'UI.DataField',
                Value : PlannedOrderOpeningDate,
                Label : 'PlannedOrderOpeningDate',
            },
            {
                $Type : 'UI.DataField',
                Value : PlndOrderCommittedQty,
                Label : 'PlndOrderCommittedQty',
            },
        ],
    },
    UI.DeleteHidden : true,
    UI.FieldGroup #o : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    },
    UI.DataPoint #PlndOrderCommittedQty : {
        Value : PlndOrderCommittedQty,
        Visualization : #Progress,
        TargetValue : 100,
    },
    UI.LineItem #tableMacro1 : [
    ],
);

annotate service.ZZ1_CombinedPlnOrdersAPI with {
    CplndOrd @(
        Common.Label : 'CplndOrd',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'ZZ1_CombinedPlnOrdersAPI',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : CplndOrd,
                    ValueListProperty : 'CplndOrd',
                },
            ],
            Label : 'Combined Planned Order',
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.ZZ1_CombinedPlnOrdersAPI with {
    ProductCollection @(
        Common.Label : 'ProductCollection',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'ZZ1_CombinedPlnOrdersAPI',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : ProductCollection,
                    ValueListProperty : 'ProductCollection',
                },
            ],
            Label : 'Product Collection',
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.ZZ1_CombinedPlnOrdersAPI with {
    ProductionPlant @(
        Common.Label : 'ProductionPlant',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'ZZ1_CombinedPlnOrdersAPI',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : ProductionPlant,
                    ValueListProperty : 'ProductionPlant',
                },
            ],
            Label : 'Production Plan',
        },
        Common.ValueListWithFixedValues : true,
    )
};



annotate service.ZZ1_MasterPlannedOrders with @(
    UI.LineItem #MasterPlannedOrder : [
        {
            $Type : 'UI.DataField',
            Value : CplndOrd,
            Label : 'CplndOrd',
        },
        {
            $Type : 'UI.DataField',
            Value : BaseUnit,
            Label : 'BaseUnit',
        },
        {
            $Type : 'UI.DataField',
            Value : FshMplndOrd,
            Label : 'FshMplndOrd',
        },
        {
            $Type : 'UI.DataField',
            Value : PlannedTotalQtyInBaseUnit,
            Label : 'PlannedTotalQtyInBaseUnit',
        },
        {
            $Type : 'UI.DataField',
            Value : QuantityWithdrawnInBaseUnit,
            Label : 'QuantityWithdrawnInBaseUnit',
        },
        {
            $Type : 'UI.DataField',
            Value : RequirementQuantityInBaseUnit,
            Label : 'RequirementQuantityInBaseUnit',
        },
    ],
    UI.LineItem #blabla : [
        {
            $Type : 'UI.DataField',
            Value : CplndOrd,
            Label : 'CplndOrd',
        },
        {
            $Type : 'UI.DataField',
            Value : FshMplndOrd,
            Label : 'FshMplndOrd',
        },
        {
            $Type : 'UI.DataField',
            Value : QuantityWithdrawnInBaseUnit,
            Label : 'QuantityWithdrawnInBaseUnit',
        },
    ],
    UI.LineItem #asd : [
        {
            $Type : 'UI.DataField',
            Value : BaseUnit,
            Label : 'BaseUnit',
        },
        {
            $Type : 'UI.DataField',
            Value : CplndOrd,
            Label : 'CplndOrd',
        },
        {
            $Type : 'UI.DataField',
            Value : FshMplndOrd,
            Label : 'FshMplndOrd',
        },
    ],
    UI.SelectionPresentationVariant #MasterPlannedOrder : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem#MasterPlannedOrder',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
    },
);


annotate service.ZZ1_PLOCAPACITYCORD with @(
    UI.LineItem #Capacity : [
        {
            $Type : 'UI.DataField',
            Value : WorkCenter,
            Label : 'WorkCenter',
        },
        {
            $Type : 'UI.DataField',
            Value : WorkCenterText,
            Label : 'WorkCenterText',
        },
        {
            $Type : 'UI.DataField',
            Value : Operation,
            Label : 'Operation',
        },
        {
            $Type : 'UI.DataField',
            Value : OperationText,
            Label : 'OperationText',
        },
        {
            $Type : 'UI.DataField',
            Value : OperationLatestStartDate,
            Label : 'OperationLatestStartDate',
        },
        {
            $Type : 'UI.DataField',
            Value : ScheduledCapReqOpSegProcgDurn,
            Label : 'ScheduledCapReqOpSegProcgDurn',
        },
        {
            $Type : 'UI.DataField',
            Value : CapacityRequirementUnit,
            Label : 'CapacityRequirementUnit',
        },
        {
            $Type : 'UI.DataField',
            Value : CapacityCategory,
            Label : 'CapacityCategory',
            ![@UI.Hidden],
        },
        {
            $Type : 'UI.DataField',
            Value : CapacityInternalID,
            Label : 'CapacityInternalID',
            ![@UI.Hidden],
        },
        {
            $Type : 'UI.DataField',
            Value : CombinedMasterOrder,
            Label : 'CombinedMasterOrder',
            ![@UI.Hidden],
        },
        {
            $Type : 'UI.DataField',
            Value : RemainingCapReqOpSegProcgDurn,
            Label : 'RemainingCapReqOpSegProcgDurn',
            ![@UI.Hidden],
        },
        {
            $Type : 'UI.DataField',
            Value : RemainingCapReqOpSegSetupDurn,
            Label : 'RemainingCapReqOpSegSetupDurn',
            ![@UI.Hidden],
        },
        {
            $Type : 'UI.DataField',
            Value : RemainingCapReqOpSegTrdwnDurn,
            Label : 'RemainingCapReqOpSegTrdwnDurn',
            ![@UI.Hidden],
        },
        {
            $Type : 'UI.DataField',
            Value : ScheduledCapReqOpSegSetupDurn,
            Label : 'ScheduledCapReqOpSegSetupDurn',
            ![@UI.Hidden],
        },
        {
            $Type : 'UI.DataField',
            Value : ScheduledCapReqOpSegTrdwnDurn,
            Label : 'ScheduledCapReqOpSegTrdwnDurn',
            ![@UI.Hidden],
        },
        {
            $Type : 'UI.DataField',
            Value : Sequence,
            Label : 'Sequence',
            ![@UI.Hidden],
        },
        {
            $Type : 'UI.DataField',
            Value : SubOperation,
            Label : 'SubOperation',
            ![@UI.Hidden],
        },
        {
            $Type : 'UI.DataField',
            Value : WorkCenterInternalID,
            Label : 'WorkCenterInternalID',
            ![@UI.Hidden],
        },
        {
            $Type : 'UI.DataField',
            Value : WorkCenterType,
            Label : 'WorkCenterType',
            ![@UI.Hidden],
        },
        {
            $Type : 'UI.DataField',
            Value : Plant,
            Label : 'Plant',
            ![@UI.Hidden],
        },
    ]
);

annotate service.ZZ1_MFP_ASSIGNMENT with @(
    UI.LineItem #tableAssignment : [
        {
            $Type : 'UI.DataField',
            Value : MATNR,
            Label : 'Material',
        },
        {
            $Type : 'UI.DataField',
            Value : FSH_MPLO_ORD,
            Label : 'Master Planned Order',
        },
        {
            $Type : 'UI.DataField',
            Value : LGORT,
            Label : 'LGORT',
        }
    ]
);

annotate service.ZZ1_PlannedOrdersAPI with @(
    UI.LineItem #tableMacro : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : CplndOrd,
            Label : 'CplndOrd',
        },
        {
            $Type : 'UI.DataField',
            Value : PlannedOrder,
            Label : 'PlannedOrder',
        },
        {
            $Type : 'UI.DataField',
            Value : Product,
            Label : 'Product',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductionPlant,
            Label : 'ProductionPlant',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductSeason,
            Label : 'ProductSeason',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductSeasonYear,
            Label : 'ProductSeasonYear',
        },
        {
            $Type : 'UI.DataField',
            Value : ProductTheme,
            Label : 'ProductTheme',
        },
        {
            $Type : 'UI.DataField',
            Value : StorageLocation,
            Label : 'StorageLocation',
        },
    ]
);
annotate service.ZZ1_CombinPlannedOrdersCom with @(
    UI.LineItem #componenti : [
        {
            $Type : 'UI.DataField',
            Value : CplndOrd,
            Label : 'CplndOrd',
        },
        {
            $Type : 'UI.DataField',
            Value : Material,
            Label : 'Material',
        },
        {
            $Type : 'UI.DataField',
            Value : Plant,
            Label : 'Plant',
        },
        {
            $Type : 'UI.DataField',
            Value : StorageLocation,
            Label : 'StorageLocation',
        },
    ],
    UI.Facets: [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Stock',
            ID : 'Stock',
            Target : 'to_ZZ1_CombPlnOrdersStock/@UI.LineItem#Stock',
        }
    ],
    UI.LineItem #stock : [
        {
            $Type : 'UI.DataField',
            Value : Material,
            Label : 'Material',
        }
    ],
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'CplndOrd',
            Target : '@UI.DataPoint#CplndOrd',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'Material',
            Target : '@UI.DataPoint#Material',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'Plant',
            Target : '@UI.DataPoint#Plant',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneralInfo',
            Target : '@UI.FieldGroup#GeneralInfo',
            Label : 'Quantity',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'TotalProdAllQty',
            Target : '@UI.DataPoint#TotalProdAllQty',
        },
    ],
    UI.FieldGroup #GeneralInfo : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : AvailableQuantity,
                Label : 'Available Quantity',
            },
            {
                $Type : 'UI.DataField',
                Value : RequiredQuantity,
                Label : 'Required Quantity',
            },
            {
                $Type : 'UI.DataField',
                Value : WithdrawnQuantity,
                Label : 'Withdrawn Quantity',
            },
            {
                $Type : 'UI.DataField',
                Value : BaseUnit,
                Label : 'Base Unit',
            },
        ],
    },
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : Material,
        },
        TypeName : '',
        TypeNamePlural : '',
        Initials : Material,
    },
    UI.DataPoint #CplndOrd : {
        $Type : 'UI.DataPointType',
        Value : CplndOrd,
        Title : 'Cplnd Ord',
    },
    UI.DataPoint #Material : {
        $Type : 'UI.DataPointType',
        Value : Material,
        Title : 'Material',
    },
    UI.DataPoint #Plant : {
        $Type : 'UI.DataPointType',
        Value : Plant,
        Title : 'Plant',
    },
    UI.LineItem #Components : [
        {
            $Type : 'UI.DataField',
            Value : Material,
            Label : 'Material',
        },
        {
            $Type : 'UI.DataField',
            Value : RequiredQuantity,
            Label : 'Required Quantity',
        },
        {
            $Type : 'UI.DataField',
            Value : TotalAllocQty,
            Label : 'Total Alloc Qty',
        },
        {
            $Type : 'UI.DataField',
            Value : AvailableQuantity,
            Label : 'Available Quantity',
        },
        {
            $Type : 'UI.DataField',
            Value : WithdrawnQuantity,
            Label : 'Withdrawn Quantity',
        },
        {
            $Type : 'UI.DataField',
            Value : BaseUnit,
            Label : 'Base Unit',
        },
        {
            $Type : 'UI.DataField',
            Value : Batch,
            Label : 'Batch',
            ![@UI.Hidden],
        },
        {
            $Type : 'UI.DataField',
            Value : BillOfMaterialCategory,
            Label : 'Bill Of Material Category',
            ![@UI.Hidden],
        },
        {
            $Type : 'UI.DataField',
            Value : BOMItem,
            Label : 'BOM Item',
            ![@UI.Hidden],
        },
        {
            $Type : 'UI.DataField',
            Value : BOMItemDescription,
            Label : 'BOM Item Description',
            ![@UI.Hidden],
        },
        {
            $Type : 'UI.DataField',
            Value : CplndOrd,
            Label : 'Cplnd Ord',
            ![@UI.Hidden],
        },
        {
            $Type : 'UI.DataField',
            Value : CrossPlantConfigurableProduct,
            Label : 'Cross Plant Configurable Product',
            ![@UI.Hidden],
        },
        {
            $Type : 'UI.DataField',
            Value : MatlCompRequirementDate,
            Label : 'Matl Comp RequirementDate',
            ![@UI.Hidden],
        },
        {
            $Type : 'UI.DataField',
            Value : MRPController,
            Label : 'MRP Controller',
            ![@UI.Hidden],
        },
        {
            $Type : 'UI.DataField',
            Value : MRPControllerName,
            Label : 'MRP Controller Name',
            ![@UI.Hidden],
        },
        {
            $Type : 'UI.DataField',
            Value : Plant,
            Label : 'Plant',
            ![@UI.Hidden],
        },
        {
            $Type : 'UI.DataField',
            Value : PlantName,
            Label : 'Plant Name',
            ![@UI.Hidden],
        },
        {
            $Type : 'UI.DataField',
            Value : ProductCharacteristic1,
            Label : 'Product Characteristic 1',
            ![@UI.Hidden],
        },
        {
            $Type : 'UI.DataField',
            Value : ProductCharacteristic2,
            Label : 'Product Characteristic 2',
            ![@UI.Hidden],
        },
        {
            $Type : 'UI.DataField',
            Value : ProductCharacteristic3,
            Label : 'Product Characteristic 3',
            ![@UI.Hidden],
        },
        {
            $Type : 'UI.DataField',
            Value : StorageLocation,
            Label : 'Storage Location',
            ![@UI.Hidden],
        },
        {
            $Type : 'UI.DataField',
            Value : TotalProdAllQty,
            Label : 'Total Prod All Qty',
            ![@UI.Hidden],
        },
    ],
    UI.FieldGroup #QTY : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : AvailableQuantity,
                Label : 'Available Quantity',
            },
            {
                $Type : 'UI.DataField',
                Value : RequiredQuantity,
                Label : 'Required Quantity',
            },
            {
                $Type : 'UI.DataField',
                Value : WithdrawnQuantity,
                Label : 'Withdrawn Quantity',
            },
            {
                $Type : 'UI.DataField',
                Value : BaseUnit,
                Label : 'Base Unit',
            },
        ],
    },
    UI.DataPoint #Material1 : {
        $Type : 'UI.DataPointType',
        Value : Material,
        Title : 'Material',
    },
    UI.DataPoint #Plant1 : {
        $Type : 'UI.DataPointType',
        Value : Plant,
        Title : 'Plant',
    },
    UI.DataPoint #PlantName : {
        $Type : 'UI.DataPointType',
        Value : PlantName,
        Title : 'Plant Name',
    },
    UI.DataPoint #TotalProdAllQty : {
        $Type : 'UI.DataPointType',
        Value : TotalProdAllQty,
        Title : 'Total Prod All Qty',
    },
);


annotate ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_CombinPlannedOrdersCom with @(
    UI.LineItem #componenti : [
    ],
    UI.LineItem #Stocks : [
    ],
);
// #/ZZ1_CombinedPlnOrdersAPI(CplndOrd='<>',CrossPlantConfigurableProduct='<>')/to_CombinPlannedOrdersCom(Material='<>',Batch='<>',CplndOrd='<>',CrossPlantConfigurableProduct='<>',Plant='<>',StorageLocation='<>')
annotate service.ZZ1_CombPlnOrdersStock with @(
    UI.LineItem #Stock : [
        {
            $Type : 'UI.DataField',
            Value : Batch,
            Label : 'Batch',
        },
        {
            $Type : 'UI.DataField',
            Value : Material,
            Label : 'Material',
            ![@HTML5.CssDefaults] : {
                width : '10rem',
            },
        },
        {
            $Type : 'UI.DataField',
            Value : Plant,
            Label : 'Plant'
        },
        {
            $Type : 'UI.DataField',
            Value : StorageLocation,
            Label : 'Storage Location'
        },
        {
            $Type : 'UI.DataField',
            Value : StorageLocationStock,
            Label : 'Storage Location Stock'
        },
        {
            $Type : 'UI.DataField',
            Value : MaterialBaseUnit,
            Label : 'Base Unit',
            ![@HTML5.CssDefaults] : {
                width : '3rem',
            },
        },
        {
            $Type : 'UI.DataField',
            Value : dye_lot,
            Label : 'Dye Lot',
            ![@HTML5.CssDefaults] : {
                width : '3rem',
            },
        },
        {
            $Type : 'UI.DataField',
            Value : choice,
            Label : 'Choise',
            ![@HTML5.CssDefaults] : {
                width : '3rem',
            },
        },
        {
            $Type : 'UI.DataField',
            Value : TotalProdAllQty,
            Label: 'Total Product All Qty'
        },
        {
            $Type : 'UI.DataField',
            Value : TotalPlanAllQty,
            Label: 'Total Planned All Qty'
        },
        {
            $Type : 'UI.DataField',
            Value : CombPlanAllQty,
            Label: 'Comb Plan All Qty'
        },
        {
            $Type : 'UI.DataField',
            Value : AvaibilityQty,
            Label: 'Avaibility Qty'
        },
        {
            $Type : 'UI.DataField',
            Value : TotalInDelQty,
            Label: 'Total In Del Qty'
        },
        {$Type: 'UI.DataField', Value: GROSS_LENGHT,Label: 'GROSS_LENGHT',![@UI.Hidden],},
        {$Type: 'UI.DataField', Value: NET_HEIGHT,Label: 'NET_HEIGHT',![@UI.Hidden],},
        {$Type: 'UI.DataField', Value: DEROGA,Label: 'DEROGA',![@UI.Hidden],},
        {$Type: 'UI.DataField', Value: PDF_RATING_ID,Label: 'PDF_RATING_ID',![@UI.Hidden],},
        {$Type: 'UI.DataField', Value: SERIALE_MATRICOLA,Label: 'SERIALE_MATRICOLA',![@UI.Hidden],},
        {$Type: 'UI.DataField', Value: ALTEZZA_STANDARD,Label: 'ALTEZZA_STANDARD',![@UI.Hidden]},
        {$Type: 'UI.DataField', Value: Supplier, Label: 'Supplier', ![@UI.Hidden]},
        {$Type: 'UI.DataField', Value: SDDocument, Label: 'SDDocument', ![@UI.Hidden]},
        {$Type: 'UI.DataField', Value: SDDocumentItem, Label: 'SDDocumentItem', ![@UI.Hidden]},
        {$Type: 'UI.DataField', Value: WBSElementInternalID, Label: 'WBSElementInternalID', ![@UI.Hidden]},
        {$Type: 'UI.DataField', Value: Customer, Label: 'Customer', ![@UI.Hidden]},
        {$Type: 'UI.DataField', Value: SpecialStockIdfgStockOwner, Label: 'SpecialStockIdfgStockOwner', ![@UI.Hidden]},
        {$Type: 'UI.DataField', Value: InventoryStockType, Label: 'InventoryStockType', ![@UI.Hidden]},
        {$Type: 'UI.DataField', Value: InventorySpecialStockType, Label: 'InventorySpecialStockType', ![@UI.Hidden]},
        {$Type: 'UI.DataField', Value: CostEstimate, Label: 'CostEstimate', ![@UI.Hidden]},
        {$Type: 'UI.DataField', Value: ResourceID, Label: 'ResourceID', ![@UI.Hidden]},
        {$Type: 'UI.DataField', Value: CompanyCode, Label: 'CompanyCode', ![@UI.Hidden]},
        {$Type: 'UI.DataField', Value: MatlWrhsStkQtyInMatlBaseUnit, Label: 'MatlWrhsStkQtyInMatlBaseUnit', ![@UI.Hidden]},
        {$Type: 'UI.DataField', Value: MatlCnsmpnQtyInMatlBaseUnit, Label: 'MatlCnsmpnQtyInMatlBaseUnit', ![@UI.Hidden]},
        {$Type: 'UI.DataField', Value: MatlStkIncrQtyInMatlBaseUnit, Label: 'MatlStkIncrQtyInMatlBaseUnit', ![@UI.Hidden]},
        {$Type: 'UI.DataField', Value: MatlStkDecrQtyInMatlBaseUnit, Label: 'MatlStkDecrQtyInMatlBaseUnit', ![@UI.Hidden]},
        {$Type: 'UI.DataField', Value: CustomQty, Label: 'CustomQty', ![@UI.Hidden]},
    ]
);
