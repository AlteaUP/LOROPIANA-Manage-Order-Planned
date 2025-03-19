sap.ui.define([
    "sap/ui/core/mvc/Controller"
], (Controller) => {
    "use strict";

    return Controller.extend("master.planned.orders.fashion.masterplannedorders.controller.Order", {
        onInit() {
            var oRouter = this.getOwnerComponent().getRouter();
            oRouter.getRoute("order").attachMatched(this._onRouteMatched, this);
        },
        _onRouteMatched: function (oEvent) {
            var oArgs, oView;
            oArgs = oEvent.getParameter("arguments");
            oView = this.getView();
            oView.setModel(new sap.ui.model.json.JSONModel({
                orderId: oArgs.order
            }), 'detail');
        },
        onNavBack: function () {
            window.history.back();
        }
    });
});