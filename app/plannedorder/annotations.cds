using PlannedOrderService as service from '../../srv/planned-order';

annotate service.ZC_RFM_ManageCombinedPlndOrder with @(
    UI.SelectionFields #filterBarMacro: [
        MasterPlannedOrder,
        CombinedPlannedOrder,
        PlannedOrder,
        Product,
        to_Master.GenericProductIsFilled,
        MRPPlant,
        ProductionPlant,
        to_Order.ProductGroupName,
    ],
    UI.LineItem #tableMacro           : [
        {
            $Type: 'UI.DataField',
            Value: CombinedPlannedOrder,
        },
        {
            $Type: 'UI.DataField',
            Value: PlannedTotalQtyInBaseUnit,
            Label: 'PlannedTotalQtyInBaseUnit',
        },
        {
            $Type: 'UI.DataField',
            Value: PlndOrderPlannedStartDate,
            Label: 'PlndOrderPlannedStartDate',
        },
        {
            $Type: 'UI.DataField',
            Value: PlndOrderPlannedEndDate,
            Label: 'PlndOrderPlannedEndDate',
        },
        {
            $Type: 'UI.DataField',
            Value: PlannedOrderOpeningDate,
            Label: 'PlannedOrderOpeningDate',
        },
    // {
    //     $Type : 'UI.DataFieldForAnnotation',
    //     Target: '@UI.Chart#NumberOfMasterPlannedOrders',
    //     Label : 'NumberOfMasterPlannedOrders',
    // },
    // {
    //     $Type : 'UI.DataFieldForAnnotation',
    //     Target: '@UI.Chart#FirmingStatusPercent',
    //     Label : 'FirmingStatusPercent',
    // },
    ],
// UI.DataPoint #NumberOfMasterPlannedOrders : {
//     Value : NumberOfMasterPlannedOrders,
//     TargetValue : NumberOfPlannedOrders,
// },
// UI.Chart #NumberOfMasterPlannedOrders : {
//     ChartType : #Donut,
//     Measures : [
//         NumberOfMasterPlannedOrders,
//     ],
//     MeasureAttributes : [
//         {
//             DataPoint : '@UI.DataPoint#NumberOfMasterPlannedOrders',
//             Role : #Axis1,
//             Measure : NumberOfMasterPlannedOrders,
//         },
//     ],
// },
// UI.DataPoint #FirmingStatusPercent : {
//     Value : FirmingStatusPercent,
//     TargetValue : FirmingStatusPercent,
// },
// UI.Chart #FirmingStatusPercent : {
//     ChartType : #Donut,
//     Measures : [
//         FirmingStatusPercent,
//     ],
//     MeasureAttributes : [
//         {
//             DataPoint : '@UI.DataPoint#FirmingStatusPercent',
//             Role : #Axis1,
//             Measure : FirmingStatusPercent,
//         },
//     ],
// },
);

annotate service.ZC_RFM_ManageCombinedPlndOrder with {
    MasterPlannedOrder @Common.Label: 'MasterPlannedOrder'
};

annotate service.ZC_RFM_ManageCombinedPlndOrder with {
    CombinedPlannedOrder @Common.Label: 'CombinedPlannedOrder'
};

annotate service.ZC_RFM_ManageCombinedPlndOrder with {
    PlannedOrder @Common.Label: 'PlannedOrder'
};

annotate service.ZC_RFM_ManageCombinedPlndOrder with {
    Product @Common.Label: 'Product'
};

annotate service.ZC_RFM_ManageMasterPlndOrder with {
    GenericProductIsFilled @Common.Label: 'to_Master/GenericProductIsFilled'
};

annotate service.ZC_RFM_ManageCombinedPlndOrder with {
    MRPPlant @Common.Label: 'MRPPlant'
};

annotate service.ZC_RFM_ManageCombinedPlndOrder with {
    ProductionPlant @Common.Label: 'ProductionPlant'
};

annotate service.ZC_RFM_ManagePlndOrder with {
    ProductGroupName @Common.Label: 'to_Order/ProductGroupName'
};
