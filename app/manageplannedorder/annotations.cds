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
            Value : ProductCollection,
        },
        {
            $Type : 'UI.DataField',
            Value : ProductTheme,
            Label : 'ProductTheme',
        },
        {
            $Type : 'UI.DataField',
            Value : PlndOrderCommittedQty,
            Label : 'PlndOrderCommittedQty',
        },
        {
            $Type : 'UI.DataField',
            Value : PlndOrderTotalCmtmtDate,
            Label : 'PlndOrderTotalCmtmtDate',
        },
        {
            $Type : 'UI.DataField',
            Value : RequirementQuantityInBaseUnit,
            Label : 'RequirementQuantityInBaseUnit',
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
);

annotate service.ZZ1_CombinedPlnOrdersAPI with {
    CplndOrd @Common.Label : 'CplndOrd'
};

annotate service.ZZ1_CombinedPlnOrdersAPI with {
    ProductCollection @Common.Label : 'ProductCollection'
};

annotate service.ZZ1_CombinedPlnOrdersAPI with {
    ProductionPlant @Common.Label : 'ProductionPlant'
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
            Value : CapacityCategory,
            Label : 'CapacityCategory',
        },
        {
            $Type : 'UI.DataField',
            Value : CapacityInternalID,
            Label : 'CapacityInternalID',
        },
        {
            $Type : 'UI.DataField',
            Value : CombinedMasterOrder,
            Label : 'CombinedMasterOrder',
        },
        {
            $Type : 'UI.DataField',
            Value : Operation,
            Label : 'Operation',
        },
        {
            $Type : 'UI.DataField',
            Value : OperationLatestStartDate,
            Label : 'OperationLatestStartDate',
        },
        {
            $Type : 'UI.DataField',
            Value : OperationText,
            Label : 'OperationText',
        },
        {
            $Type : 'UI.DataField',
            Value : RemainingCapReqOpSegProcgDurn,
            Label : 'RemainingCapReqOpSegProcgDurn',
        },
        {
            $Type : 'UI.DataField',
            Value : RemainingCapReqOpSegSetupDurn,
            Label : 'RemainingCapReqOpSegSetupDurn',
        },
        {
            $Type : 'UI.DataField',
            Value : RemainingCapReqOpSegTrdwnDurn,
            Label : 'RemainingCapReqOpSegTrdwnDurn',
        },
        {
            $Type : 'UI.DataField',
            Value : ScheduledCapReqOpSegProcgDurn,
            Label : 'ScheduledCapReqOpSegProcgDurn',
        },
        {
            $Type : 'UI.DataField',
            Value : ScheduledCapReqOpSegSetupDurn,
            Label : 'ScheduledCapReqOpSegSetupDurn',
        },
        {
            $Type : 'UI.DataField',
            Value : ScheduledCapReqOpSegTrdwnDurn,
            Label : 'ScheduledCapReqOpSegTrdwnDurn',
        },
        {
            $Type : 'UI.DataField',
            Value : Sequence,
            Label : 'Sequence',
        },
        {
            $Type : 'UI.DataField',
            Value : SubOperation,
            Label : 'SubOperation',
        },
        {
            $Type : 'UI.DataField',
            Value : WorkCenterInternalID,
            Label : 'WorkCenterInternalID',
        },
        {
            $Type : 'UI.DataField',
            Value : WorkCenterType,
            Label : 'WorkCenterType',
        },
        {
            $Type : 'UI.DataField',
            Value : WorkCenterText,
            Label : 'WorkCenterText',
        },
        {
            $Type : 'UI.DataField',
            Value : WorkCenter,
            Label : 'WorkCenter',
        },
        {
            $Type : 'UI.DataField',
            Value : Plant,
            Label : 'Plant',
        },
        {
            $Type : 'UI.DataField',
            Value : CapacityRequirementUnit,
            Label : 'CapacityRequirementUnit',
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
        Title : 'CplndOrd',
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
);


annotate ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_CombinPlannedOrdersCom with @(
    UI.LineItem #componenti : [
    ],
    UI.LineItem #Stocks : [
    ],
);

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
        },
                {
            $Type : 'UI.DataField',
            Value : Plant,
            Label : 'Plant',
        },
        {
            $Type : 'UI.DataField',
            Value : StorageLocation,
            Label : 'Storage Location',
        },
        {

            $Type : 'UI.DataField',
            Value : StorageLocationStock,
            Label : 'Storage Location Stock',
        },
        {

            $Type : 'UI.DataField',
            Value : MaterialBaseUnit,
            Label : 'Base Unit',
        },
        {

            $Type : 'UI.DataField',
            Value : dye_lot,
            Label : 'Dye Lot',
        },
        {

            $Type : 'UI.DataField',
            Value : choice,
            Label : 'Choise',
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
            Label: 'Total In Del Qty',
        },
    ]
);
