using MainService as service from '../../srv/main-service';
annotate service.ZZ1_CombinedPlnOrdersAPI with @(
    UI.SelectionFields #filterBarMacro : [
        BaseUnit,
        CplndOrd,
        PlannedTotalQtyInBaseUnit,
        QuantityWithdrawnInBaseUnit,
        RequirementQuantityInBaseUnit,
    ],
    UI.LineItem #tableMacro : [
        {
            $Type : 'UI.DataField',
            Value : CplndOrd,
        },
        {
            $Type : 'UI.DataField',
            Value : PlannedTotalQtyInBaseUnit,
        },
        {
            $Type : 'UI.DataField',
            Value : QuantityWithdrawnInBaseUnit,
        },
        {
            $Type : 'UI.DataField',
            Value : RequirementQuantityInBaseUnit,
        },
        {
            $Type : 'UI.DataField',
            Value : BaseUnit,
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'General Info',
            ID : 'GeneralInfo',
            Target : '@UI.Identification',
        },
        {
            $Type : 'UI.CollectionFacet',
            Label : 'gruppone',
            ID : 'gruppone',
            Facets : [
            ],
        },
    ],
    UI.FieldGroup #Formsections : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    },
    UI.Identification : [
    ],
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'HeaderForm',
            ID : 'Form',
            Target : '@UI.FieldGroup#Form',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'BaseUnit',
            Target : '@UI.DataPoint#BaseUnit',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'CplndOrd',
            Target : '@UI.DataPoint#CplndOrd',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'PlannedTotalQtyInBaseUnit',
            Target : '@UI.DataPoint#PlannedTotalQtyInBaseUnit',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'QuantityWithdrawnInBaseUnit',
            Target : '@UI.DataPoint#QuantityWithdrawnInBaseUnit',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'RequirementQuantityInBaseUnit',
            Target : '@UI.DataPoint#RequirementQuantityInBaseUnit',
        },
    ],
    UI.FieldGroup #Form : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : BaseUnit,
            },
            {
                $Type : 'UI.DataField',
                Value : CplndOrd,
            },
            {
                $Type : 'UI.DataField',
                Value : PlannedTotalQtyInBaseUnit,
            },
            {
                $Type : 'UI.DataField',
                Value : QuantityWithdrawnInBaseUnit,
            },
            {
                $Type : 'UI.DataField',
                Value : RequirementQuantityInBaseUnit,
            },
        ],
    },
    UI.DataPoint #BaseUnit : {
        $Type : 'UI.DataPointType',
        Value : BaseUnit,
        Title : 'BaseUnit',
    },
    UI.DataPoint #CplndOrd : {
        $Type : 'UI.DataPointType',
        Value : CplndOrd,
        Title : 'CplndOrd',
    },
    UI.DataPoint #PlannedTotalQtyInBaseUnit : {
        $Type : 'UI.DataPointType',
        Value : PlannedTotalQtyInBaseUnit,
        Title : 'PlannedTotalQtyInBaseUnit',
    },
    UI.DataPoint #QuantityWithdrawnInBaseUnit : {
        $Type : 'UI.DataPointType',
        Value : QuantityWithdrawnInBaseUnit,
        Title : 'QuantityWithdrawnInBaseUnit',
    },
    UI.DataPoint #RequirementQuantityInBaseUnit : {
        $Type : 'UI.DataPointType',
        Value : RequirementQuantityInBaseUnit,
        Title : 'RequirementQuantityInBaseUnit',
    },
);

annotate service.ZZ1_CombinedPlnOrdersAPI with {
    BaseUnit @Common.Label : 'BaseUnit'
};

annotate service.ZZ1_CombinedPlnOrdersAPI with {
    CplndOrd @Common.Label : 'CplndOrd'
};

annotate service.ZZ1_CombinedPlnOrdersAPI with {
    PlannedTotalQtyInBaseUnit @Common.Label : 'PlannedTotalQtyInBaseUnit'
};

annotate service.ZZ1_CombinedPlnOrdersAPI with {
    QuantityWithdrawnInBaseUnit @Common.Label : 'QuantityWithdrawnInBaseUnit'
};

annotate service.ZZ1_CombinedPlnOrdersAPI with {
    RequirementQuantityInBaseUnit @Common.Label : 'RequirementQuantityInBaseUnit'
};

