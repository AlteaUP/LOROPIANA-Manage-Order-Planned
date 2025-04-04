sap.ui.define([
    'sap/fe/core/PageController',
    "sap/m/MessageToast",
    "sap/ui/model/json/JSONModel"
], function (PageController, MessageToast, JSONModel) {
    'use strict';

    return PageController.extend('manageplannedorder.manageplannedorder.ext.controller.Pezze', {

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
    })
});
