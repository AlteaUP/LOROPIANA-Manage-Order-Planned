sap.ui.define([
    "sap/ui/model/json/JSONModel",
    "sap/m/MessageToast",
    "sap/m/MessageBox"
], function (JSONModel, MessageToast, MessageBox) {
    'use strict';

    return {
        showMessageConfirm: function (action) {
            // capitalize the first letter of the action
            action = action.charAt(0).toUpperCase() + action.slice(1);
            return new Promise((res, rej) => MessageBox.confirm(
                "Are you sure you want to " + action + "?",
                {
                    title: "Confirmation",
                    onClose: function (oAction) {
                        if (oAction === MessageBox.Action.OK)
                            res();
                        else
                            rej();
                    }
                }
            ));
        },
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
            const oOwnComponent = this._controller.getOwnerComponent();
            const oModel = oOwnComponent.getModel();
            this._controller.showMessageConfirm("disassemble").then(() => {
                MessageToast.show("Do Disassemble invoked.");
                debugger;
                oModel.delete("/ZZ1_CombinedPlnOrdersAPI_to_CombinPlannedOrdersComObjectPage('" + this.getBindingContext().getObject().ZZ1_CombPlnOrdersStock + "')", {
                    success: function (oData) {
                        MessageToast.show("Disassemble successful");
                        // oOwnComponent.getRouter().navTo("RoutePlannedOrder");
                    },
                    error: function (oError) {
                        MessageToast.show("Disassemble failed");
                    }
                });
            }
            ).catch(() => {
                MessageToast.show("Do Disassemble cancelled.");
            });
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
