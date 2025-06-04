using MainService as service from '../../srv/main-service';

annotate service.ZZ1_CombinedPlnOrdersAPI with @(
    UI.SelectionFields #filterBarMacro         : [
        CplndOrd,
        ProductionPlant,
        MRPController,
        to_ZZ1_PLOCAPACITYCORD_TEXT.BOOWorkCenterInternalID,
        ProductSeasonYear,
        ProductSeason,
        PlannedOrderType,
    ],
    UI.DataPoint #radialChart                  : {
        Value      : committed_percent,
        Criticality: committed_criticality,
    },
    UI.Chart #radialChart                      : {
        Title            : 'committed_percent',
        Description      : 'committed_percent',
        ChartType        : #Donut,
        Measures         : [committed_percent],
        MeasureAttributes: [{
            $Type    : 'UI.ChartMeasureAttributeType',
            Measure  : committed_percent,
            Role     : #Axis1,
            DataPoint: '@UI.DataPoint#radialChart',
        }]
    },
    UI.LineItem #tableMacro                    : [
        {
            $Type                : 'UI.DataField',
            Value                : ProductSeasonYear,
            Label                : '{i18n>SeasonYear}',
            ![@HTML5.CssDefaults]: {width: '5rem',
            },
        },
        {
            $Type                : 'UI.DataField',
            Value                : ProductSeason,
            Label                : '{i18n>Season}',
            ![@HTML5.CssDefaults]: {width: '5rem',
            },
        },
        {
            $Type                : 'UI.DataField',
            Value                : ProductTheme,
            Label                : '{i18n>ProductTheme}',
            ![@HTML5.CssDefaults]: {width: '5rem',
            },
        },
        {
            $Type                : 'UI.DataField',
            Value                : ZZ1_MFI_CR_TYPE_PLA,
            Label                : '{i18n>OrderType}',
            ![@HTML5.CssDefaults]: {width: '8rem',
            },
        },
        {
            $Type                : 'UI.DataField',
            Value                : CplndOrd,
            Label                : '{i18n>CombinedPlannedOrder}',
            ![@HTML5.CssDefaults]: {width: '5rem',
            },
        },
        {
            $Type                : 'UI.DataField',
            Value                : CrossPlantConfigurableProduct,
            Label                : '{i18n>CrossPlantConfigurableProduct}',
            ![@HTML5.CssDefaults]: {width: '10rem',
            },
        },
        {
            $Type: 'UI.DataField',
            Value: ProductDescription,
            Label: 'Product Description',
        },
        {
            $Type                : 'UI.DataFieldForAnnotation',
            Target               : '@UI.Chart#radialChart',
            Label                : '{i18n>OverallConversionStatus}',
            ![@HTML5.CssDefaults]: {width: '5rem',
            },
        },
        {
            $Type                            : 'UI.DataField',
            Value                            : PlannedTotalQtyInBaseUnit,
            Label                            : '{i18n>PlannedTotalQtyIn}',
            @Semantics.quantity.unitOfMeasure: 'BaseUnit',
            @Semantics.unitOfMeasure         : true,
            ![@HTML5.CssDefaults]            : {width: '8rem',
            },
        },
        {
            $Type                : 'UI.DataField',
            Value                : PlndOrderCommittedQty,
            Label                : '{i18n>PlndOrderCommittedQty}',
            ![@HTML5.CssDefaults]: {width: '8rem',
            },
        },
        {
            $Type: 'UI.DataField',
            Value: RequirementQuantityInBaseUnit,
            Label: '{i18n>RequirementQuantityInBase}',
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: PlndOrderPlannedStartDate,
            Label: '{i18n>PlndOrderPlannedStart}',
        },
        {
            $Type: 'UI.DataField',
            Value: PlndOrderPlannedEndDate,
            Label: '{i18n>PlndOrderPlannedEnd}',
        },
        {
            $Type: 'UI.DataField',
            Value: PlannedOrderOpeningDate,
            Label: '{i18n>PlannedOrderOpeningDate}',
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: PlndOrderTotalCmtmtDate,
            Label: '{i18n>PlndOrderTotalCmtmt}',
            ![@UI.Hidden]
        },
        {
            $Type: 'UI.DataField',
            Value: ZZ1_MFI_CRORDER_PERSON_PLA,
            Label: '{i18n>PersonalizzationOrderNumber}',
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: to_ZZ1_PLOCAPACITYCORD_TEXT.BOOWorkCenterInternalID,
            Label: '{i18n>WorkCenterInternalId}',
        },
        {
            $Type: 'UI.DataField',
            Value: to_ZZ1_PLOCAPACITYCORD_TEXT.BOOWorkCenterText,
            Label: '{i18n>WorkCenterText}',
        },
        {
            $Type: 'UI.DataField',
            Value: BaseUnit,
            Label: '{i18n>BaseUnit}',
        },
        {
            $Type: 'UI.DataField',
            Value: to_ZZ1_MFI_CR_TYPE_PLA.Code_Text,
            Label: 'Code_Text',
        },
        {
            $Type: 'UI.DataField',
            Value: to_ZZ1_MFI_CR_TYPE_PLA.Code,
            Label: 'Code',
        },
        {
            $Type: 'UI.DataField',
            Value: StockSegment,
            Label: 'StockSegment',
        },
        {
            $Type: 'UI.DataField',
            Value: BillOfMaterialStatus,
            Label: 'BillOfMaterialStatus',
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: BillOfMaterialVariant,
            Label: 'BillOfMaterialVariant',
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: BillOfMaterialVariantUsage,
            Label: 'BillOfMaterialVariantUsage',
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: BillOfMaterialVersion,
            Label: 'BillOfMaterialVersion',
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: BillOfOperations,
            Label: 'BillOfOperations',
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: BillOfOperationsGroup,
            Label: 'BillOfOperationsGroup',
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: BillOfOperationsType,
            Label: 'BillOfOperationsType',
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: BillOfOperationsVariant,
            Label: 'BillOfOperationsVariant',
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: committed_criticality,
            Label: 'committed_criticality',
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: committed_percent,
            Label: 'committed_percent',
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: LastChangeDate,
            Label: 'LastChangeDate',
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: MaterialProcurementCategory,
            Label: 'MaterialProcurementCategory',
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: MaterialProcurementType,
            Label: 'MaterialProcurementType',
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: MRPArea,
            Label: 'MRPArea',
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: MRPController,
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: MRPPlant,
            Label: 'MRPPlant',
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: PlannedOrderCategory,
            Label: 'PlannedOrderCategory',
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: PlannedOrderType,
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: PlndOrderBaseToEntryQtyDnmntr,
            Label: 'PlndOrderBaseToEntryQtyDnmntr',
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: PlndOrderBaseToEntryQtyNmrtr,
            Label: 'PlndOrderBaseToEntryQtyNmrtr',
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: Product,
            Label: 'Product',
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: ProductCollection,
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: ProductionEndDate,
            Label: 'ProductionEndDate',
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: ProductionPlant,
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: ProductionStartDate,
            Label: 'ProductionStartDate',
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: ProductionSupervisor,
            Label: 'ProductionSupervisor',
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: ProductionVersion,
            Label: 'ProductionVersion',
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: QuantityWithdrawnInBaseUnit,
            Label: 'QuantityWithdrawnInBaseUnit',
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: StorageLocation,
            Label: 'StorageLocation',
            ![@UI.Hidden],
        },
    ],
    UI.DataPoint #ProductionPlant              : {
        $Type: 'UI.DataPointType',
        Value: ProductionPlant,
        Title: '{i18n>ProductionPlant}',
    },
    UI.HeaderFacets                            : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'CrossPlantConfigurableProduct',
            Target: '@UI.DataPoint#CrossPlantConfigurableProduct',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'ProductionPlant',
            Target: '@UI.DataPoint#ProductionPlant',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'Material',
            Target: '@UI.DataPoint#Material',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'ProductDescription',
            Target: '@UI.DataPoint#ProductDescription',
        },
    ],
    UI.Facets                                  : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>GeneralInfo}',
            ID    : 'GeneralInfo',
            Target: '@UI.FieldGroup#GeneralInfo',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Master Planned Order',
            ID    : 'MasterPlannedOrder',
            Target: 'to_ZZ1_MasterPlannedOrders/@UI.SelectionPresentationVariant#MasterPlannedOrder',
        },

        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Capacity',
            ID    : 'Capacity',
            Target: 'to_ZZ1_PLOCAPACITYCORD/@UI.LineItem#Capacity',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Component',
            ID    : 'componenti1',
            Target: 'to_CombinPlannedOrdersCom/@UI.LineItem#componenti',
            ![@UI.Hidden],
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Components',
            ID    : 'Components',
            Target: 'to_CombinPlannedOrdersCom/@UI.LineItem#Components',
        },

    ],
    UI.FieldGroup #GeneralInfo                 : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: PlndOrderPlannedStartDate,
                Label: '{i18n>PlannedStartDate}',
            },
            {
                $Type: 'UI.DataField',
                Value: PlndOrderPlannedEndDate,
                Label: '{i18n>PlannedEndDate}',
            },
            {
                $Type: 'UI.DataField',
                Value: PlannedOrderOpeningDate,
                Label: '{i18n>OpeningDate}',
            },
            {
                $Type: 'UI.DataField',
                Value: PlndOrderCommittedQty,
                Label: '{i18n>CommittedQty}',
            },
        ],
    },
    UI.DeleteHidden                            : true,
    UI.FieldGroup #o                           : {
        $Type: 'UI.FieldGroupType',
        Data : [],
    },
    UI.DataPoint #PlndOrderCommittedQty        : {
        Value        : PlndOrderCommittedQty,
        Visualization: #Progress,
        TargetValue  : 100,
    },
    UI.LineItem #tableMacro1                   : [],
    UI.HeaderInfo                              : {
        Title         : {
            $Type: 'UI.DataField',
            Value: CplndOrd,
        },
        TypeName      : '',
        TypeNamePlural: '',
        ImageUrl      : CplndOrd,
    },
    UI.DataPoint #ProductDescription           : {
        $Type: 'UI.DataPointType',
        Value: ProductDescription,
        Title: '{i18n>ProductDescription}',
    },
    UI.DataPoint #Material                     : {
        $Type: 'UI.DataPointType',
        Value: Product,
        Title: 'Product',
    },
    UI.DataPoint #CrossPlantConfigurableProduct: {
        $Type: 'UI.DataPointType',
        Value: CrossPlantConfigurableProduct,
        Title: 'CrossPlantConfigurableProduct',
    },
);

annotate service.ZZ1_CombinedPlnOrdersAPI with {
    CplndOrd @(
        Common.Label                   : '{i18n>CplndOrd}',
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'ZZ1_CombinedPlnOrdersAPI',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: CplndOrd,
                ValueListProperty: 'CplndOrd',
            }, ],
            Label         : 'Combined Planned Order',
        },
        Common.ValueListWithFixedValues: true,
    )
};

annotate service.ZZ1_CombinedPlnOrdersAPI with {
    ProductCollection @(
        Common.Label                   : '{i18n>ProductCollection}',
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'ZZ1_CombinedPlnOrdersAPI',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: ProductCollection,
                ValueListProperty: 'ProductCollection',
            }, ],
            Label         : 'Product Collection',
        },
        Common.ValueListWithFixedValues: true,
    )
};

annotate service.ZZ1_CombinedPlnOrdersAPI with {
    ProductionPlant @(
        Common.Label                   : '{i18n>ProductionPlant}',
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'ZZ1_Plant',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: ProductionPlant,
                ValueListProperty: 'Plant',
            }, ],
            Label         : 'Plant',
        },
        Common.ValueListWithFixedValues: true,
    )
};

annotate service.ZZ1_MasterPlannedOrders with @(
    UI.LineItem #MasterPlannedOrder                    : [
        {
            $Type: 'UI.DataField',
            Value: CplndOrd,
            Label: '{i18n>CplndOrd}',
        },
        {
            $Type: 'UI.DataField',
            Value: BaseUnit,
            Label: '{i18n>BaseUnit}',
        },
        {
            $Type: 'UI.DataField',
            Value: FshMplndOrd,
            Label: '{i18n>FshmplndOrd}',
        },
        {
            $Type: 'UI.DataField',
            Value: PlannedTotalQtyInBaseUnit,
            Label: '{i18n>PlannedTotalQtyIn}',
        },
        {
            $Type: 'UI.DataField',
            Value: QuantityWithdrawnInBaseUnit,
            Label: '{i18n>QuantityWithdrawnInBase}',
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: RequirementQuantityInBaseUnit,
            Label: '{i18n>RequirementQuantityInBase}',
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: ProductDescription,
            Label: '{i18n>Productdescription}',
            ![@UI.Hidden],
        },
    ],
    UI.SelectionPresentationVariant #MasterPlannedOrder: {
        $Type              : 'UI.SelectionPresentationVariantType',
        PresentationVariant: {
            $Type         : 'UI.PresentationVariantType',
            Visualizations: ['@UI.LineItem#MasterPlannedOrder',
            ],
        },
        SelectionVariant   : {
            $Type        : 'UI.SelectionVariantType',
            SelectOptions: [],
        },
    },
);


annotate service.ZZ1_PLOCAPACITYCORD with @(UI.LineItem #Capacity: [
    {
        $Type: 'UI.DataField',
        Value: WorkCenterInternalID,
        Label: '{i18n>WorkCenterInternalId}',
    },
    {
        $Type: 'UI.DataField',
        Value: BOOWorkCenterText,
        Label: '{i18n>OperationWorkCenterText}',
    },
    {
        $Type: 'UI.DataField',
        Value: Operation,
        Label: '{i18n>Operation}',
    },
    {
        $Type: 'UI.DataField',
        Value: OperationText,
        Label: '{i18n>OperationText}',
    },
    {
        $Type: 'UI.DataField',
        Value: OperationLatestStartDate,
        Label: '{i18n>OperationLatestStartDate}',
        ![@UI.Hidden],
    },
    {
        $Type: 'UI.DataField',
        Value: ScheduledCapReqOpSegProcgDurn,
        Label: '{i18n>ScheduledCapReqOp}',
        ![@UI.Hidden],
    },
    {
        $Type: 'UI.DataField',
        Value: CapacityRequirementUnit,
        Label: '{i18n>CapacityRequirementUnit}',
        ![@UI.Hidden],
    },
    {
        $Type: 'UI.DataField',
        Value: CapacityCategory,
        Label: '{i18n>CapacityCategory}',
        ![@UI.Hidden]
    },
    {
        $Type: 'UI.DataField',
        Value: CapacityInternalID,
        Label: '{i18n>CapacityInternalId}',
        ![@UI.Hidden]
    },
    {
        $Type: 'UI.DataField',
        Value: CombinedMasterOrder,
        Label: '{i18n>CombinedMasterOrder}',
        ![@UI.Hidden]
    },
    {
        $Type: 'UI.DataField',
        Value: RemainingCapReqOpSegProcgDurn,
        Label: '{i18n>RemainingCapReqOp}',
        ![@UI.Hidden]
    },
    {
        $Type: 'UI.DataField',
        Value: RemainingCapReqOpSegSetupDurn,
        Label: '{i18n>RemainingCapReqOp1}',
        ![@UI.Hidden]
    },
    {
        $Type: 'UI.DataField',
        Value: RemainingCapReqOpSegTrdwnDurn,
        Label: '{i18n>RemainingCapReqOp2}',
        ![@UI.Hidden]
    },
    {
        $Type: 'UI.DataField',
        Value: ScheduledCapReqOpSegSetupDurn,
        Label: '{i18n>ScheduledCapReqOp1}',
        ![@UI.Hidden]
    },
    {
        $Type: 'UI.DataField',
        Value: ScheduledCapReqOpSegTrdwnDurn,
        Label: '{i18n>ScheduledCapReqOp2}',
        ![@UI.Hidden]
    },
    {
        $Type: 'UI.DataField',
        Value: Sequence,
        Label: '{i18n>Sequence}',
        ![@UI.Hidden]
    },
    {
        $Type: 'UI.DataField',
        Value: SubOperation,
        Label: '{i18n>SubOperation}',
        ![@UI.Hidden]
    },
    {
        $Type: 'UI.DataField',
        Value: WorkCenterType,
        Label: '{i18n>WorkCenterType}',
        ![@UI.Hidden],
    },
    {
        $Type: 'UI.DataField',
        Value: FreeDefinedIndicator1,
        Label: 'Critical Operation',
    },
    {
        $Type: 'UI.DataField',
        Value: BOOWorkCenterInternalID,
        Label: '{i18n>OperationWorkCenterInternal}',
        ![@UI.Hidden],
    },
]);

annotate service.ZZ1_MFP_ASSIGNMENT with @(UI.LineItem #tableAssignment: [
    {
        $Type: 'UI.DataField',
        Value: MATNR,
        Label: 'Material',
    },
    {
        $Type: 'UI.DataField',
        Value: FSH_MPLO_ORD,
        Label: 'Master Planned Order',
    },
    {
        $Type: 'UI.DataField',
        Value: LGORT,
        Label: 'LGORT',
    }
]);

annotate service.ZZ1_PlannedOrdersAPI with @(UI.LineItem #tableMacro: [
    {
        $Type: 'UI.DataField',
        Value: ID,
        Label: 'ID',
    },
    {
        $Type: 'UI.DataField',
        Value: CplndOrd,
        Label: 'CplndOrd',
    },
    {
        $Type: 'UI.DataField',
        Value: PlannedOrder,
        Label: 'PlannedOrder',
    },
    {
        $Type: 'UI.DataField',
        Value: Product,
        Label: 'Product',
    },
    {
        $Type: 'UI.DataField',
        Value: ProductionPlant,
        Label: 'ProductionPlant',
    },
    {
        $Type: 'UI.DataField',
        Value: ProductSeason,
        Label: 'ProductSeason',
    },
    {
        $Type: 'UI.DataField',
        Value: ProductSeasonYear,
        Label: 'ProductSeasonYear',
    },
    {
        $Type: 'UI.DataField',
        Value: ProductTheme,
        Label: 'ProductTheme',
    },
    {
        $Type: 'UI.DataField',
        Value: StorageLocation,
        Label: 'StorageLocation',
    },
]);

annotate service.ZZ1_CombinPlannedOrdersCom with @(
    UI.LineItem #componenti         : [
        {
            $Type: 'UI.DataField',
            Value: CplndOrd,
            Label: 'CplndOrd',
        },
        {
            $Type: 'UI.DataField',
            Value: Material,
            Label: 'Material',
        },
        {
            $Type: 'UI.DataField',
            Value: Plant,
            Label: 'Plant',
        },
        {
            $Type: 'UI.DataField',
            Value: StorageLocation,
            Label: 'StorageLocation',
        },
    ],
    UI.Facets                       : [{
        $Type : 'UI.ReferenceFacet',
        Label : 'Stock',
        ID    : 'Stock',
        Target: 'to_ZZ1_CombPlnOrdersStock/@UI.LineItem#Stock',
    }],
    UI.LineItem #stock              : [{
        $Type: 'UI.DataField',
        Value: Material,
        Label: 'Material',
    }],
    UI.HeaderFacets                 : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'CplndOrd',
            Target: '@UI.DataPoint#CplndOrd',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'Material',
            Target: '@UI.DataPoint#Material',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'ProductDescription',
            Target: '@UI.DataPoint#ProductDescription',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'Plant',
            Target: '@UI.DataPoint#Plant',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'TotalProdAllQty',
            Target: '@UI.DataPoint#TotalProdAllQty',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'TotalAllocQty',
            Target: '@UI.DataPoint#TotalAllocQty',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'FinishedProductQty',
            Target: '@UI.DataPoint#FinishedProductQty',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'GeneralInfo',
            Target: '@UI.FieldGroup#GeneralInfo',
            Label : '{i18n>Quantity}',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'chart_percent',
            Target: '@UI.Chart#chart_percent',
        },
    ],
    UI.FieldGroup #GeneralInfo      : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: AvailableQuantity,
                Label: '{i18n>AvailableQuantity}',
            },
            {
                $Type: 'UI.DataField',
                Value: RequiredQuantity,
                Label: '{i18n>RequiredQuantity}',
            },
            {
                $Type: 'UI.DataField',
                Value: WithdrawnQuantity,
                Label: '{i18n>WithdrawnQuantity}',
                ![@UI.Hidden],
            },
            {
                $Type: 'UI.DataField',
                Value: BaseUnit,
                Label: '{i18n>BaseUnit}',
            },
        ],
    },
    UI.HeaderInfo                   : {
        Title         : {
            $Type: 'UI.DataField',
            Value: Material,
        },
        TypeName      : '',
        TypeNamePlural: '',
        Initials      : Material,
    },
    UI.DataPoint #CplndOrd          : {
        $Type: 'UI.DataPointType',
        Value: CplndOrd,
        Title: '{i18n>CplndOrd}',
    },
    UI.DataPoint #Material          : {
        $Type: 'UI.DataPointType',
        Value: Material,
        Title: '{i18n>Material}',
    },
    UI.DataPoint #Plant             : {
        $Type: 'UI.DataPointType',
        Value: Plant,
        Title: '{i18n>Plant}',
    },
    UI.LineItem #Components         : [
        {
            $Type: 'UI.DataField',
            Value: Material,
            Label: '{i18n>Material}',
        },
        {
            $Type: 'UI.DataField',
            Value: ProductDescription,
            Label: '{i18n>Productdescription}',
        },
        {
            $Type: 'UI.DataField',
            Value: RequiredQuantity,
            Label: '{i18n>RequiredQuantity}',
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target: '@UI.Chart#RequiredQuantity',
            Label : '{i18n>AvailableQuantityRequired}',
        },
        {
            $Type: 'UI.DataField',
            Value: TotalAllocQty,
            Label: '{i18n>TotalAllocQty}',
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: AvailableQuantity,
            Label: '{i18n>AvailableQuantity}',
        },
        {
            $Type: 'UI.DataField',
            Value: CombPlanAllQty,
            Label: '{i18n>TotAssignedComb}',
        },
        {
            $Type: 'UI.DataField',
            Value: WithdrawnQuantity,
            Label: '{i18n>WithdrawnQuantity}',
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: BaseUnit,
            Label: '{i18n>BaseUnit}',
        },
        {
            $Type: 'UI.DataField',
            Value: Batch,
            Label: '{i18n>Batch}',
            ![@UI.Hidden]
        },
        {
            $Type: 'UI.DataField',
            Value: BillOfMaterialCategory,
            Label: '{i18n>BillOfMaterialCategory}',
            ![@UI.Hidden]
        },

        {
            $Type: 'UI.DataField',
            Value: BOMItemDescription,
            Label: '{i18n>BomItemDescription}',
            ![@UI.Hidden]
        },
        {
            $Type: 'UI.DataField',
            Value: CplndOrd,
            Label: '{i18n>CplndOrd}',
            ![@UI.Hidden]
        },
        {
            $Type: 'UI.DataField',
            Value: CrossPlantConfigurableProduct,
            Label: '{i18n>CrossPlantConfigurableProduct}',
            ![@UI.Hidden]
        },
        {
            $Type: 'UI.DataField',
            Value: MatlCompRequirementDate,
            Label: '{i18n>MatlCompRequirementdate}',
            ![@UI.Hidden]
        },
        {
            $Type: 'UI.DataField',
            Value: MRPController,
            Label: '{i18n>MrpController}',
            ![@UI.Hidden]
        },
        {
            $Type: 'UI.DataField',
            Value: MRPControllerName,
            Label: '{i18n>MrpControllerName}',
            ![@UI.Hidden]
        },
        {
            $Type: 'UI.DataField',
            Value: Plant,
            Label: '{i18n>Plant}',
            ![@UI.Hidden]
        },
        {
            $Type: 'UI.DataField',
            Value: PlantName,
            Label: '{i18n>PlantName}',
            ![@UI.Hidden]
        },
        {
            $Type: 'UI.DataField',
            Value: ProductCharacteristic1,
            Label: '{i18n>ProductCharacteristic1}',
            ![@UI.Hidden]
        },
        {
            $Type: 'UI.DataField',
            Value: ProductCharacteristic2,
            Label: '{i18n>ProductCharacteristic2}',
            ![@UI.Hidden]
        },
        {
            $Type: 'UI.DataField',
            Value: ProductCharacteristic3,
            Label: '{i18n>ProductCharacteristic3}',
            ![@UI.Hidden]
        },
        {
            $Type: 'UI.DataField',
            Value: StorageLocation,
            Label: '{i18n>StorageLocation}',
            ![@UI.Hidden]
        },
        {
            $Type: 'UI.DataField',
            Value: TotalProdAllQty,
            Label: '{i18n>TotalProdAllQty}',
            ![@UI.Hidden]
        },
        {
            $Type: 'UI.DataField',
            Value: TotalPlanAllQty,
            Label: '{i18n>TotalPlanAllQty}',
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: FinishedProductQty,
            Label: '{i18n>FinishedProductQty}',
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: chart_criticality,
            Label: 'chart_criticality',
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: chart_percent,
            Label: 'chart_percent',
            ![@UI.Hidden],
        },
        {
            $Type: 'UI.DataField',
            Value: to_ZZ1_CombPlnOrdersStock.StockSegment,
            Label: 'StockSegment',
            ![@UI.Hidden],
        },
    ],
    UI.FieldGroup #QTY              : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: AvailableQuantity,
                Label: 'Available Quantity',
            },
            {
                $Type: 'UI.DataField',
                Value: RequiredQuantity,
                Label: 'Required Quantity',
            },
            {
                $Type: 'UI.DataField',
                Value: WithdrawnQuantity,
                Label: 'Withdrawn Quantity',
            },
            {
                $Type: 'UI.DataField',
                Value: BaseUnit,
                Label: 'Base Unit',
            },
        ],
    },
    UI.DataPoint #Material1         : {
        $Type: 'UI.DataPointType',
        Value: Material,
        Title: 'Material',
    },
    UI.DataPoint #Plant1            : {
        $Type: 'UI.DataPointType',
        Value: Plant,
        Title: 'Plant',
    },
    UI.DataPoint #PlantName         : {
        $Type: 'UI.DataPointType',
        Value: PlantName,
        Title: 'Plant Name',
    },
    UI.DataPoint #TotalProdAllQty   : {
        $Type: 'UI.DataPointType',
        Value: TotalPlanAllQty,
        Title: '{i18n>CombPlanAllQty}',
    },
    UI.DataPoint #TotalAllocQty     : {
        $Type: 'UI.DataPointType',
        Value: RequestFinished,
        Title: '{i18n>FinishedProductAtpQty}',
    },
    UI.DataPoint #FinishedProductQty: {
        $Type: 'UI.DataPointType',
        Value: FinishedProductQty,
        Title: '{i18n>FinishedFeasibleProductQty}',
    },
    UI.DataPoint #ProductDescription: {
        $Type: 'UI.DataPointType',
        Value: ProductDescription,
        Title: '{i18n>Productdescription}',
    },
    UI.DataPoint #RequiredQuantity  : {
        Value      : chart_percent,
        // TargetValue : AvailableQuantity,
        Criticality: chart_criticality
    },
    UI.Chart #RequiredQuantity      : {
        Title            : 'chart_percent',
        Description      : 'chart_percent',
        ChartType        : #Donut,
        Measures         : [chart_percent],
        MeasureAttributes: [{
            $Type    : 'UI.ChartMeasureAttributeType',
            Measure  : chart_percent,
            Role     : #Axis1,
            DataPoint: '@UI.DataPoint#RequiredQuantity',
        }],
    },
    UI.DataPoint #chart_percent     : {
        Value      : chart_percent,
        // TargetValue : chart_percent,
        Criticality: chart_criticality
    },
    UI.Chart #chart_percent         : {
        Title            : '{i18n>AvailableQuantityRequired}',
        Description      : '',
        ChartType        : #Donut,
        Measures         : [chart_percent],
        MeasureAttributes: [{
            $Type    : 'UI.ChartMeasureAttributeType',
            DataPoint: '@UI.DataPoint#chart_percent',
            Role     : #Axis1,
            Measure  : chart_percent,
        }, ],
    },
    UI.DataPoint #Material2         : {
        $Type: 'UI.DataPointType',
        Value: Material,
        Title: 'Material',
    },


);


annotate ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_CombinPlannedOrdersCom with @(
    UI.LineItem #componenti: [],
    UI.LineItem #Stocks    : [],
);

// #/ZZ1_CombinedPlnOrdersAPI(CplndOrd='<>',CrossPlantConfigurableProduct='<>')/to_CombinPlannedOrdersCom(Material='<>',Batch='<>',CplndOrd='<>',CrossPlantConfigurableProduct='<>',Plant='<>',StorageLocation='<>')
annotate service.ZZ1_CombPlnOrdersStock with @(UI.LineItem #Stock: [
    {
        $Type: 'UI.DataField',
        Value: Batch,
        Label: 'Batch',
    },
    {
        $Type                : 'UI.DataField',
        Value                : Material,
        Label                : 'Material',
        ![@UI.Hidden],
        ![@HTML5.CssDefaults]: {width: '10rem',
        },
    },
    {
        $Type: 'UI.DataField',
        Value: Plant,
        Label: 'Plant',
        ![@UI.Hidden]
    },
    {
        $Type                : 'UI.DataField',
        Value                : StorageLocation,
        Label                : 'Storage Location',
        ![@HTML5.CssDefaults]: {width: '5rem',
        },
    },
    {
        $Type: 'UI.DataField',
        Value: StorageLocationStock,
        Label: 'Storage Location Stock'
    },
    {
        $Type                : 'UI.DataField',
        Value                : MaterialBaseUnit,
        Label                : 'Base Unit',
        ![@HTML5.CssDefaults]: {width: '5rem',
        },
    },
    {
        $Type                : 'UI.DataField',
        Value                : dye_lot,
        Label                : 'Dye Lot',
        ![@HTML5.CssDefaults]: {width: '5rem',
        },
    },
    {
        $Type                : 'UI.DataField',
        Value                : choice,
        Label                : 'Leather grade',
        ![@HTML5.CssDefaults]: {width: '5rem',
        },
    },
    {
        $Type                : 'UI.DataField',
        Value                : CERTIFICATO,
        Label                : 'Certificato',
        ![@HTML5.CssDefaults]: {width: '9rem',
        }
    },

    {
        $Type: 'UI.DataField',
        Value: AvaibilityQty,
        Label: 'Avaibility Qty'
    },

    {
        $Type: 'UI.DataField',
        Value: TotalProdAllQty,
        Label: 'Tot Assigned PrO'
    },
    {
        $Type: 'UI.DataField',
        Value: TotalPlanAllQty,
        Label: 'Tot Assigned PlO'
    },
    {
        $Type: 'UI.DataField',
        Value: CombPlanAllQty,
        Label: 'Tot Assigned Comb'
    },
    {
        $Type: 'UI.DataField',
        Value: TotalInDelQty,
        Label: 'Tot Delivery Qty'
    },
    {
        $Type: 'UI.DataField',
        Value: StockSegment,
        Label: 'Stock Segment',
    },
    {
        $Type: 'UI.DataField',
        Value: GROSS_LENGHT,
        Label: 'GROSS_LENGHT',
        ![@UI.Hidden],
    },
    {
        $Type: 'UI.DataField',
        Value: NET_HEIGHT,
        Label: 'NET_HEIGHT',
        ![@UI.Hidden],
    },
    {
        $Type: 'UI.DataField',
        Value: DEROGA,
        Label: 'DEROGA',
        ![@UI.Hidden],
    },
    {
        $Type: 'UI.DataField',
        Value: PDF_RATING_ID,
        Label: 'PDF_RATING_ID',
        ![@UI.Hidden],
    },
    {
        $Type: 'UI.DataField',
        Value: SERIALE_MATRICOLA,
        Label: 'SERIALE_MATRICOLA',
        ![@UI.Hidden],
    },
    {
        $Type: 'UI.DataField',
        Value: ALTEZZA_STANDARD,
        Label: 'ALTEZZA_STANDARD',
        ![@UI.Hidden]
    },
    {
        $Type: 'UI.DataField',
        Value: Supplier,
        Label: 'Supplier',
        ![@UI.Hidden]
    },
    {
        $Type: 'UI.DataField',
        Value: SDDocument,
        Label: 'SDDocument',
        ![@UI.Hidden]
    },
    {
        $Type: 'UI.DataField',
        Value: SDDocumentItem,
        Label: 'SDDocumentItem',
        ![@UI.Hidden]
    },
    {
        $Type: 'UI.DataField',
        Value: WBSElementInternalID,
        Label: 'WBSElementInternalID',
        ![@UI.Hidden]
    },
    {
        $Type: 'UI.DataField',
        Value: Customer,
        Label: 'Customer',
        ![@UI.Hidden]
    },
    {
        $Type: 'UI.DataField',
        Value: SpecialStockIdfgStockOwner,
        Label: 'SpecialStockIdfgStockOwner',
        ![@UI.Hidden]
    },
    {
        $Type: 'UI.DataField',
        Value: InventoryStockType,
        Label: 'InventoryStockType',
        ![@UI.Hidden]
    },
    {
        $Type: 'UI.DataField',
        Value: InventorySpecialStockType,
        Label: 'InventorySpecialStockType',
        ![@UI.Hidden]
    },
    {
        $Type: 'UI.DataField',
        Value: CostEstimate,
        Label: 'CostEstimate',
        ![@UI.Hidden]
    },
    {
        $Type: 'UI.DataField',
        Value: ResourceID,
        Label: 'ResourceID',
        ![@UI.Hidden]
    },
    {
        $Type: 'UI.DataField',
        Value: CompanyCode,
        Label: 'CompanyCode',
        ![@UI.Hidden]
    },
    {
        $Type: 'UI.DataField',
        Value: MatlWrhsStkQtyInMatlBaseUnit,
        Label: 'MatlWrhsStkQtyInMatlBaseUnit',
        ![@UI.Hidden]
    },
    {
        $Type: 'UI.DataField',
        Value: MatlCnsmpnQtyInMatlBaseUnit,
        Label: 'MatlCnsmpnQtyInMatlBaseUnit',
        ![@UI.Hidden]
    },
    {
        $Type: 'UI.DataField',
        Value: MatlStkIncrQtyInMatlBaseUnit,
        Label: 'MatlStkIncrQtyInMatlBaseUnit',
        ![@UI.Hidden]
    },
    {
        $Type: 'UI.DataField',
        Value: MatlStkDecrQtyInMatlBaseUnit,
        Label: 'MatlStkDecrQtyInMatlBaseUnit',
        ![@UI.Hidden]
    },
    {
        $Type: 'UI.DataField',
        Value: CustomQty,
        Label: 'CustomQty',
        ![@UI.Hidden]
    },
]);


annotate service.ZZ1_MFP_ASSIGNMENT with @(UI.LineItem #tablePezze: [
    {
        $Type: 'UI.DataField',
        Value: CHARG,
        Label: '{i18n>CHARG}',
    },
    {
        $Type: 'UI.DataField',
        Value: MATNR,
        Label: '{i18n>MATNR}',
    },
    {
        $Type: 'UI.DataField',
        Value: WERKS,
        Label: '{i18n>WERKS}',
    },
    {
        $Type: 'UI.DataField',
        Value: AvaibilityQty,
        Label: '{i18n>AvaibilityQty}',
    },
    {
        $Type: 'UI.DataField',
        Value: COPERTURA,
        Label: '{i18n>COPERTURA}',
    },
    {
        $Type: 'UI.DataField',
        Value: QTA_ASS_U,
        Label: '{i18n>PlannedTotalQtyIn}',
    },
// {
//     $Type : 'UI.DataField',
//     Value : QTY_CALCOLATA,
//     Label : '{i18n>QTY_CALCOLATA}',
// }
]);

annotate service.ZZ1_PLOCAPACITYCORD with {
    BOOWorkCenterInternalID @Common.Label: '{i18n>BOOWorkCenterInternalID}'
};

annotate service.ZZ1_PLOCAPACITYCORD with {
    BOOWorkCenterText @Common.Label: '{i18n>BOOWorkCenterText}'
};

annotate service.ZZ1_CombinedPlnOrdersAPI with {
    MRPController @(
        Common.Label                   : 'MRPController',
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'ZZ1_CombinedPlnOrdersAPI',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: MRPController,
                ValueListProperty: 'MRPController',
            }, ],
        },
        Common.ValueListWithFixedValues: true,
    )
};


annotate service.ZZ1_CombinedPlnOrdersAPI with {};
annotate service.ZZ1_CombinedPlnOrdersAPI with {};
annotate service.ZZ1_CombinedPlnOrdersAPI with {};

annotate service.ZZ1_PLOCAPACITYCORD_TEXT with {
    BOOWorkCenterInternalID @(
        Common.Label                   : 'Work Center',
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'ZZ1_PLOCAPACITYCORD_TEXT',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: BOOWorkCenterInternalID,
                ValueListProperty: 'BOOWorkCenterInternalID',
            }, ],
        },
        Common.ValueListWithFixedValues: true,
    )
};


annotate service.ZZ1_PLOCAPACITYCORD_TEXT with {
    BOOWorkCenterText @Common.Label: 'BOOWorkCenterText'
};

annotate service.ZZ1_PLOCAPACITYCORD_TEXT with {
    BOOWorkCenterInternalID @Text: BOOWorkCenterText
};

// annotate service.I_Plant with {
//     Plant @Common.Text : PlantName
// };

// annotate service.ZZ1_Plant with {
//     Plant @(
//         Common.Text : PlantName,
//         Common.ValueList : {
//             $Type : 'Common.ValueListType',
//             CollectionPath : 'ZZ1_CombinedPlnOrdersAPI',
//             Parameters : [
//                 {
//                     $Type : 'Common.ValueListParameterInOut',
//                     LocalDataProperty : ProductSeasonYear,
//                     ValueListProperty : 'ProductSeasonYear',
//                 },
//             ],
//             Label : 'year',
//         },
//         Common.ValueListWithFixedValues : true,
//     )
// };

annotate service.ZZ1_CombinedPlnOrdersAPI with {
    ProductSeasonYear @(
        Common.Label                   : 'Product Season Year',
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'ZZ1_CombinedPlnOrdersAPI',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: ProductSeasonYear,
                ValueListProperty: 'ProductSeasonYear',
            }, ],
            Label         : 'season year',
        },
        Common.ValueListWithFixedValues: true,
    )
};


annotate service.ZZ1_CombinedPlnOrdersAPI with {
    ProductSeason @(
        Common.Label                   : 'Product Season',
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'ZZ1_CombinedPlnOrdersAPI',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: ProductSeason,
                ValueListProperty: 'ProductSeason',
            }, ],
            Label         : 'season',
        },
        Common.ValueListWithFixedValues: true,
    )
};

annotate service.ZZ1_CombinedPlnOrdersAPI with {
    PlannedOrderType @(
        Common.Label                   : 'Planned Order Type',
        Common.ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'ZZ1_MFI_CR_TYPE_V',
            Parameters    : [{
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: PlannedOrderType,
                ValueListProperty: 'Code'
            }, ],
            Label         : 'Planned Order Type',
        },
        Common.ValueListWithFixedValues: true,
    )
};

// annotate service.ZZ1_MFI_CR_TYPE_V with {
//     Code @Common.Text : Code_Text
// };
// annotate service.ZZ1_MFI_CR_TYPE_V with {
//     Code @Common.TextArrangement: #TextFirst
// };

annotate service.ZZ1_Plant with {
    Plant @Common.Text: PlantName
};

annotate service.ZZ1_CombinedPlnOrdersAPI with {
    ZZ1_MFI_CR_TYPE_PLA @(
        Common.Label          : 'ZZ1_MFI_CR_TYPE_PLA',
        Common.Text           : to_ZZ1_MFI_CR_TYPE_PLA.Code_Text,
        Common.TextArrangement: #TextFirst
    )
};

annotate service.ZZ1_MFI_CR_TYPE_V with {
    Code @Common.Text: Code_Text
};
