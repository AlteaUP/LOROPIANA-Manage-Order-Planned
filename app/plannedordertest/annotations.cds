using TestService as service from '../../srv/test';
annotate service.ZZTEST_COMBORDERCOMPLIST with @(
    UI.SelectionFields #filterBarMacro : [
        BaseUnit,
        Batch,
        ConfirmedAvailableQuantity,
        MasterPlannedOrder,
        Material,
        PlannedOrder,
        Plant,
    ],
    UI.LineItem #tableMacro : [
        {
            $Type : 'UI.DataField',
            Value : PlannedOrder,
        },
        {
            $Type : 'UI.DataField',
            Value : MasterPlannedOrder,
        },
        {
            $Type : 'UI.DataField',
            Value : Plant,
        },
        {
            $Type : 'UI.DataField',
            Value : Material,
        },
        {
            $Type : 'UI.DataField',
            Value : ConfirmedAvailableQuantity,
        },
        {
            $Type : 'UI.DataField',
            Value : Batch,
        },
        {
            $Type : 'UI.DataField',
            Value : BaseUnit,
        },
    ],
);

