sap.ui.define([
    "sap/ui/model/json/JSONModel"
], function (JSONModel) {
    'use strict';

    return {
        doAssegnaPezze: function (oEvent) {
            const id = "manageplannedorder.manageplannedorder::ZZ1_CombinedPlnOrdersAPI_to_CombinPlannedOrdersComObjectPage--fe::table::to_ZZ1_CombPlnOrdersStock::LineItem::Stock-innerTable"
            const obj = this.getBindingContext().getObject()
            const path = this.getBindingContext().getPath()
            const selectedItems = this._view.byId(id).getSelectedItems()
            const _selectedItems = []
            for (let i = 0; i < selectedItems.length; i++) {
                const oObj = selectedItems[i].getBindingContext().getObject()
                _selectedItems.push(oObj)
            }
            const model = new JSONModel()
            console.log("Selected Items", obj)
            model.setData({ ...obj, selectedItems: _selectedItems })

            if (!this._fragmentPezze) {
                this._fragmentPezze = this.loadFragment({
                    id: "fragmentPezze",
                    name: "manageplannedorder.manageplannedorder.ext.fragment.Pezze",
                    controller: this._controller
                });
            }

            this._fragmentPezze.then(function (dialog) {
                // dialog.bindElement(path);
                dialog.setModel(model);
                dialog.open();
            });

        },
        doDisassignPezze: function (oEvent) {
            sap.m.MessageToast.show("Custom handler invoked. [DISASSIGN]");
        },
        doWhereUsed: function (oEvent) {
            sap.m.MessageToast.show("Custom handler invoked. [WHERE USED]");
        },
        onCloseDialog: function (oEvent) {
            const dialog = oEvent.getSource().getParent();
            dialog.close();
            // dialog.destroy();
        }
    };
});
