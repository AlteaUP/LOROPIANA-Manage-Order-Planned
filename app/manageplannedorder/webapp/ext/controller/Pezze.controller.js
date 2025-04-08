sap.ui.define([
    "sap/m/MessageToast",
    "sap/m/MessageBox"
], function (MessageToast, MessageBox) {
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
                        if (oAction === MessageBox.Action.OK) res();
                        else rej();
                    }
                }
            ));
        },
        doAssign: function (oEvent) {
            this.showMessageConfirm("assign").then(() => {
                MessageToast.show("Do Assign invoked.");

            }
            ).catch(() => {
                MessageToast.show("Do Assign cancelled.");
            });
        },
        onCloseDialog: function (oEvent) {
            const dialog = oEvent.getSource().getParent();
            dialog.close();
            // dialog.destroy();
        },
        formatAvailableQty: function (sValue) {
            if (!sValue) {
                return 0
            }
            return parseInt(sValue)
        },
        formatCustomQty: function (sValue) {
            return parseInt(sValue)
        }
    }
});
