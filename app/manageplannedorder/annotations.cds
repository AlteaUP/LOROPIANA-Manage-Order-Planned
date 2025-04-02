using MainService as service from '../../srv/main-service';
annotate service.ZZ1_CombinedPlnOrdersAPI with @(
    UI.SelectionFields #filterBarMacro : [
        CplndOrd,
        ProductCollection,
        ProductionPlant,
    ],
    UI.LineItem #tableMacro : [
        {
            $Type : 'UI.DataField',
            Value : CplndOrd,
            Label : 'CplndOrd',
        },
        {
            $Type : 'UI.DataField',
            Value : PlannedTotalQtyInBaseUnit,
            Label : 'PlannedTotalQtyInBaseUnit',
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
            Target : 'to_ZZ1_MasterPlannedOrders/@UI.LineItem#MasterPlannedOrder',
        },
        
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Capacity',
            ID : 'Capacity',
            Target : 'to_ZZ1_PLOCAPACITYCORD/@UI.LineItem#Capacity',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'componenti',
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

annotate service.ZZ1_MasterPlannedOrderAPI with @(
    UI.LineItem #tableMacro : [
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
            Value : BaseUnit,
            Label : 'BaseUnit',
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
            Target : 'to_Stock/@UI.LineItem#Stock',
        },
    ],
    UI.LineItem #stock : [
        {
            $Type : 'UI.DataField',
            Value : Material,
            Label : 'Material',
        }
    ],
);


annotate ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_CombinPlannedOrdersCom with @(
    UI.LineItem #componenti : [
    ]
);

annotate service.ZZ1_CombPlnOrdersStock with @(
    UI.LineItem #Stock : [
    ]
);

