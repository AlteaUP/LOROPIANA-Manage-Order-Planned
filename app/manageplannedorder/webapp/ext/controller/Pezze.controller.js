sap.ui.define([
    "sap/m/MessageToast",
    "sap/ui/model/json/JSONModel"
], function (MessageToast, JSONModel) {
    'use strict';

    return {
        doAssign: function (oEvent) {
            MessageToast.show("Custom handler invoked.");
        },
        doDisassign: function (oEvent) {
            MessageToast.show("Custom handler invoked.");
            debugger;
        },
        doWhere: function (oEvent) {
            MessageToast.show("Custom handler invoked.");
            debugger;
        },
        onCloseDialog: function (oEvent) {
            const dialog = oEvent.getSource().getParent();
            dialog.close();
            // dialog.destroy();
        }
    }
});
