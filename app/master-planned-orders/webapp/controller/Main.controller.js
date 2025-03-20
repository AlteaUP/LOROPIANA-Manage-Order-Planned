sap.ui.define([
    "sap/ui/core/mvc/Controller"
], (Controller) => {
    "use strict";

    return Controller.extend("master.planned.orders.fashion.masterplannedorders.controller.Main", {
        onInit() {
            const smartFilter = this.getView().byId("idSmartFilter");
            smartFilter.setModel(this.getOwnerComponent().getModel());

            this.getView().setModel(new sap.ui.model.json.JSONModel({
                selectedTab: "master"
            }), 'view');
        },
        onIconTabSelect: function (oEvent) {
            debugger;
            const smartTable = this.getView().byId("idSmartTable");
            const key = oEvent.getParameter('key');
            // smartTable.setEntitySet(key);
            // smartTable.rebindTable();
        },
        onNavBack: function () { window.history.back(); },
        goToDetail: function () {
            const oRouter = this.getOwnerComponent().getRouter();
            const key = this.getView().getModel('view').getProperty('/selectedTab');
            oRouter.navTo(key, {
                [key]: Math.round(Math.random() * 100)
            });
        }
    });
});