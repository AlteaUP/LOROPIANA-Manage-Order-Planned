sap.ui.define([
    // "sap/m/MessageToast",
    // "sap/ui/core/library"
], function (/*MessageToast, coreLibrary*/) {
    'use strict';

    return {
        doAssegnaPezze: function (oEvent) {
            // retrieve binding information
            const obj = oEvent.getObject()
            const path = oEvent.getPath()
            // retrieve the selected item icon
            if (!this._fragmentAssegnaPezze) {
                this._fragmentAssegnaPezze = this.loadFragment({
                    id: "fragmentAssegnaPezze",
                    name: "manageplannedorder.manageplannedorder.ext.fragment.AssegnaPezze",
                    controller: this
                });
            }

            this._fragmentAssegnaPezze.then(function (dialog) {
                dialog.bindElement(path);
                // dialog.setModel(new sap.ui.model.JSONModel, "jsonModel");
                dialog.open();
            });

            // MessageToast.show("Custom handler invoked.");
        }
    };
});
