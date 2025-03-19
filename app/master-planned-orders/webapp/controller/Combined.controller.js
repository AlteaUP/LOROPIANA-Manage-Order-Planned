sap.ui.define([
    "sap/ui/core/mvc/Controller"
], (Controller) => {
    "use strict";

    return Controller.extend("master.planned.orders.fashion.masterplannedorders.controller.Combined", {
        onInit() {
            var oRouter = this.getOwnerComponent().getRouter();
            oRouter.getRoute("combined").attachMatched(this._onRouteMatched, this);
        },
        _onRouteMatched: function (oEvent) {
            var oArgs, oView;
            oArgs = oEvent.getParameter("arguments");
            oView = this.getView();
            oView.setModel(new sap.ui.model.json.JSONModel({
                orderId: oArgs.combined
            }), 'detail');
            // oView.bindElement({
            //     path: "/Orders(" + oArgs.orderId + ")",
            //     events: {
            //         change: this._onBindingChange.bind(this),
            //         dataRequested: function (oEvent) {
            //             oView.setBusy(true);
            //         },
            //         dataReceived: function (oEvent) {
            //             oView.setBusy(false);
            //         }
            //     }
            // });
        },
        onNavBack: function () {
            window.history.back();
        }
    });
});