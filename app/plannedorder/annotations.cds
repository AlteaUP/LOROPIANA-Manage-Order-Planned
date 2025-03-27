using MainService as service from '../../srv/main-service';

annotate service.ZZ1_CombinedPlnOrdersAPI with @(
    UI.SelectionFields #filterBarMacro         : [
        BaseUnit,
        CplndOrd,
        PlannedTotalQtyInBaseUnit,
        QuantityWithdrawnInBaseUnit,
        RequirementQuantityInBaseUnit,
    ],
    UI.LineItem #tableMacro                    : [
        {
            $Type: 'UI.DataField',
            Value: CplndOrd,
        },
        {
            $Type: 'UI.DataField',
            Value: PlannedTotalQtyInBaseUnit,
        },
        {
            $Type: 'UI.DataField',
            Value: QuantityWithdrawnInBaseUnit,
        },
        {
            $Type: 'UI.DataField',
            Value: RequirementQuantityInBaseUnit,
        },
        {
            $Type: 'UI.DataField',
            Value: BaseUnit,
        }
    ],
    UI.Facets                                  : [{
        $Type : 'UI.ReferenceFacet',
        Label : 'General Info',
        ID    : 'GeneralInfo',
        Target: '@UI.Identification',
    },

    ],
    UI.FieldGroup #Formsections                : {
        $Type: 'UI.FieldGroupType',
        Data : [],
    },
    UI.Identification                          : [
        {
            $Type: 'UI.DataField',
            Value: BaseUnit,
        },
        {
            $Type: 'UI.DataField',
            Value: CplndOrd,
        },
        {
            $Type: 'UI.DataField',
            Value: PlannedTotalQtyInBaseUnit,
        },
        {
            $Type: 'UI.DataField',
            Value: QuantityWithdrawnInBaseUnit,
        },
        {
            $Type: 'UI.DataField',
            Value: RequirementQuantityInBaseUnit,
        },
    ],
    UI.HeaderFacets                            : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'Form',
            Target: '@UI.FieldGroup#Form',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'BaseUnit',
            Target: '@UI.DataPoint#BaseUnit',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'CplndOrd',
            Target: '@UI.DataPoint#CplndOrd',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'PlannedTotalQtyInBaseUnit',
            Target: '@UI.DataPoint#PlannedTotalQtyInBaseUnit',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'QuantityWithdrawnInBaseUnit',
            Target: '@UI.DataPoint#QuantityWithdrawnInBaseUnit',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'RequirementQuantityInBaseUnit',
            Target: '@UI.DataPoint#RequirementQuantityInBaseUnit',
        },
    ],
    UI.FieldGroup #Form                        : {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: BaseUnit,
            },
            {
                $Type: 'UI.DataField',
                Value: CplndOrd,
            },
            {
                $Type: 'UI.DataField',
                Value: PlannedTotalQtyInBaseUnit,
            },
            {
                $Type: 'UI.DataField',
                Value: QuantityWithdrawnInBaseUnit,
            },
            {
                $Type: 'UI.DataField',
                Value: RequirementQuantityInBaseUnit,
            },
        ],
    },
    UI.DataPoint #BaseUnit                     : {
        $Type: 'UI.DataPointType',
        Value: BaseUnit,
        Title: 'BaseUnit',
    },
    UI.DataPoint #CplndOrd                     : {
        $Type: 'UI.DataPointType',
        Value: CplndOrd,
        Title: 'CplndOrd',
    },
    UI.DataPoint #PlannedTotalQtyInBaseUnit    : {
        $Type: 'UI.DataPointType',
        Value: PlannedTotalQtyInBaseUnit,
        Title: 'PlannedTotalQtyInBaseUnit',
    },
    UI.DataPoint #QuantityWithdrawnInBaseUnit  : {
        $Type: 'UI.DataPointType',
        Value: QuantityWithdrawnInBaseUnit,
        Title: 'QuantityWithdrawnInBaseUnit',
    },
    UI.DataPoint #RequirementQuantityInBaseUnit: {
        $Type: 'UI.DataPointType',
        Value: RequirementQuantityInBaseUnit,
        Title: 'RequirementQuantityInBaseUnit',
    },
    Communication.Contact #contact             : {
        $Type: 'Communication.ContactType',
        fn   : CplndOrd,
    },
    Communication.Contact #contact1            : {
        $Type: 'Communication.ContactType',
        fn   : BaseUnit,
    },
    UI.FieldGroup #Form1                       : {
        $Type: 'UI.FieldGroupType',
        Data : [],
    },
);

annotate ZZ1_COMBINEDPLNORDERSAPI_CDS.ZZ1_MasterPlannedOrders with @(UI.LineItem #MasterPlannedOrder: [{
    $Type: 'UI.DataField',
    Value: CplndOrd,
}]);
