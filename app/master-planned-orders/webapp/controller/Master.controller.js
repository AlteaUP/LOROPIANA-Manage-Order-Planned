sap.ui.define([
    "sap/ui/core/mvc/Controller"
], (Controller) => {
    "use strict";

    return Controller.extend("master.planned.orders.fashion.masterplannedorders.controller.Master", {
        onInit() {
            var oRouter = this.getOwnerComponent().getRouter();
            oRouter.getRoute("master").attachMatched(this._onRouteMatched, this);
        },
        _onRouteMatched: function (oEvent) {
            var oArgs, oView;
            oArgs = oEvent.getParameter("arguments");
            oView = this.getView();
            oView.setModel(new sap.ui.model.json.JSONModel({
                orderId: oArgs.master
            }), 'detail');
        },
        onNavBack: function () {
            window.history.back();
        }
    });
});