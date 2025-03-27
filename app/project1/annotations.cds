using MainService as service from '../../srv/main-service';

annotate service.ZZ1_CombinedPlnOrdersAPI with @(
    UI.SelectionFields #filterBarMacro: [CplndOrd, ],
    UI.LineItem #tableMacro           : [{
        $Type: 'UI.DataField',
        Value: CplndOrd,
        Label: 'CplndOrd',
    }, ],
    UI.Facets                         : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'prororo',
            ID : 'prororo',
            Target : 'to_ZZ1_MasterPlannedOrders/@UI.LineItem#prororo',
        },
    ],
    UI.LineItem #MASTEEEERRRRR        : [
        {
            $Type: 'UI.DataField',
            Value: BaseUnit,
            Label: 'BaseUnit',
        },
        {
            $Type: 'UI.DataField',
            Value: BillOfMaterialStatus,
            Label: 'BillOfMaterialStatus',
        },
        {
            $Type: 'UI.DataField',
            Value: BillOfMaterialVariant,
            Label: 'BillOfMaterialVariant',
        },
        {
            $Type: 'UI.DataField',
            Value: BillOfMaterialVariantUsage,
            Label: 'BillOfMaterialVariantUsage',
        },
        {
            $Type: 'UI.DataField',
            Value: BillOfMaterialVersion,
            Label: 'BillOfMaterialVersion',
        },
        {
            $Type: 'UI.DataField',
            Value: BillOfOperations,
            Label: 'BillOfOperations',
        },
    ],
);

annotate service.ZZ1_CombinedPlnOrdersAPI with {
    CplndOrd @Common.Label: 'CplndOrd'
};
annotate service.ZZ1_MasterPlannedOrders with @(
    UI.LineItem #prororo : [
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

