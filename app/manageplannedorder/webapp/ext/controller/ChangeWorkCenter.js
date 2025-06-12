sap.ui.define([
    "sap/m/MessageToast"
], function (MessageToast) {
    'use strict';

    return {
        doChangeWorkCenter: function (oEvent) {

            //apro fragment
            if (!this._fragmentWorkCenter) {
                this._fragmentWorkCenter = this.loadFragment({
                    id: "fragmentWorkCenter",
                    name: "manageplannedorder.manageplannedorder.ext.fragment.ChangeWorkCenter",
                    controller: this._controller,
                });
            }

            this._fragmentWorkCenter.then(function (dialog) {
                const table = dialog.getContent().at(-1);

                table.bindAggregation('items', {
                    path: '/ZZ1_PLOCAPACITYCORD_TEXT',
                    template: new sap.m.ColumnListItem({
                        cells: [
                            new sap.m.Text({ text: "{BOOWorkCenterInternalID}" }),
                            new sap.m.Text({ text: "{BOOWorkCenterText}" })
                        ]
                    }),
                    templateShareable: false,
                    //parameters: { $$updateGroupId: 'CreatePezzeBatch' },
                });

                const binding = table.getBinding('items');
                binding.resetChanges();
                dialog.open();
            }.bind(this));

        }
    };
});
