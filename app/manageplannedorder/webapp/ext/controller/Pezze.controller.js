sap.ui.define([
    "sap/m/MessageToast",
    "sap/m/MessageBox",
    "sap/ui/model/Context"
], function (MessageToast, MessageBox, Context) {
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
            const oModel = this.getOwnerComponent().getModel();
            const oTable = sap.ui.getCore().byId('fragmentPezze--selectedItemsTable');
            const oTableBinding = oTable.getBinding("items");
            const groupId = oTableBinding.getUpdateGroupId()
            this.showMessageConfirm("assign").then(function () {
                MessageToast.show("Do Assemble invoked.");
                oModel.submitBatch(groupId).then(() => {
                    MessageToast.show("Do Assemble completed.");
                }).catch((oError) => {
                    MessageToast.show("Do Assemble error.");
                    console.error("Error", oError);
                });
            }.bind(this)).catch((e) => {
                MessageToast.show("Do Assemble cancelled. " + JSON.stringify(e));
            });
            // @ts-ignore
            // $.ajax({
            //     url: URL + "/assemble",
            //     type: "POST",
            //     data: JSON.stringify({}),
            //     contentType: "application/json; charset=utf-8",
            //     dataType: "json",
            //     success: function (data) {
            //         console.log("Success", data);
            //         MessageToast.show("Assemble invoked.");
            //     },
            //     error: function (error) {
            //         console.log("Error", error);
            //         MessageToast.show("Error Assemble.");
            //     }
            // });
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
