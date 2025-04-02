sap.ui.define([], function () {
    'use strict';
    return {
        doAssegnaPezze: function (oEvent) {
            const id = 'manageplannedorder.manageplannedorder::ZZ1_CombinedPlnOrdersAPIObjectPage--fe::table::to_CombinPlannedOrdersCom::LineItem::componenti-innerTable'
            const path = this._view.byId(id).getSelectedItem().getBindingContext().getPath()
            if (!this._fragmentAssegnaPezze) {
                this._fragmentAssegnaPezze = this.loadFragment({
                    id: "fragmentAssegnaPezze",
                    name: "manageplannedorder.manageplannedorder.ext.fragment.AssegnaPezze",
                    controller: this
                });
            }

            this._fragmentAssegnaPezze.then(function (dialog) {
                dialog.bindElement(path);
                dialog.open();
            });
        }
    };
});
