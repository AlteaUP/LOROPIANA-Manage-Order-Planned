sap.ui.define([
    "sap/ui/core/mvc/Controller"
], (Controller) => {
    "use strict";

    return Controller.extend("master.planned.orders.fashion.masterplannedorders.controller.Main", {
        onInit() {
            this.getView().byId("idSmartFilter").setModel(this.getOwnerComponent().getModel());
        }
    });
});