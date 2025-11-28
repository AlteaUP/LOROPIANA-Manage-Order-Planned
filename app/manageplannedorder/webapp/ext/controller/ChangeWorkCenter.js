sap.ui.define([
    "sap/m/MessageToast",
    "sap/ui/model/json/JSONModel"
], function (MessageToast, JSONModel) {
    'use strict';

    return {
        doChangeWorkCenter: function (oEvent) {
            debugger
            const idTableCapacity = "manageplannedorder.manageplannedorder::ZZ1_CombinedPlnOrdersAPIObjectPage--fe::table::to_ZZ1_PLOCAPACITYCORD::LineItem::Capacity-innerTable";
            const selectedItems = this._view.byId(idTableCapacity).getSelectedItems();
            const oContext = this.getBindingContext().getObject();
            const objectItem = selectedItems[0].getBindingContext().getObject();
            const oModel = this.getModel();

            if (selectedItems.length > 1) {
                MessageToast.show(this._controller.getOwnerComponent().getModel("i18n").getResourceBundle().getText("SelectOnlyOneRecord"));
                return;
            }

            // payload
            const payload = {
                "Operation": objectItem.Operation,
                "WorkCenterInternalID": objectItem.BOOWorkCenterInternalID,
                "CombinedMasterOrder": objectItem.CombinedMasterOrder,
                "ProductionPlant": oContext.ProductionPlant,
                "Product": oContext.Product
            };

            if (!this._fragmentWorkCenter) {
                this._fragmentWorkCenter = this.loadFragment({
                    id: "fragmentWorkCenter",
                    name: "manageplannedorder.manageplannedorder.ext.fragment.ChangeWorkCenter",
                    controller: this._controller,
                });
            }

            this._fragmentWorkCenter.then(dialog => {

                const table = dialog.getContent().at(-1);

                dialog.open();
                table.setNoDataText("Caricamento...");

                if (!dialog._cleanupAttached) {
                    dialog.attachAfterClose(() => {
                        const t = dialog.getContent().at(-1);
                        t.setNoDataText("");
                    });
                    dialog._cleanupAttached = true;
                }

                table.unbindItems();

                const oCtx = oModel.bindContext("/AltLabAction(...)");
                oCtx.setParameter("Payload", payload);

                oCtx.execute()
                    .then(() => {
                        const oResult = oCtx.getBoundContext().getObject();
                        const records = oResult.value || [];

                        const lifnrList = records
                            .map(r => r.LIFNR)
                            .filter(Boolean)
                            .map(l => l.toString().padStart(10, "0"));

                        let finalFilter;
                        if (lifnrList.length === 0) {
                            finalFilter = new sap.ui.model.Filter("fornitore", sap.ui.model.FilterOperator.EQ, "__NO_MATCH__");
                        } else {
                            const filters = lifnrList.map(l =>
                                new sap.ui.model.Filter("fornitore", sap.ui.model.FilterOperator.EQ, l)
                            );
                            finalFilter = new sap.ui.model.Filter({ filters, and: false });
                        }

                        table.bindAggregation("items", {
                            path: "/ZZ1_RFM_WRKCHARVAL_F4",
                            filters: [finalFilter],
                            template: new sap.m.ColumnListItem({
                                cells: [
                                    new sap.m.Text({ text: "{WorkCenterInternalID}" }),
                                    new sap.m.Text({ text: "{workcentertext}" })
                                ]
                            }),
                            templateShareable: false
                        });

                        if (lifnrList.length === 0) {
                            table.setNoDataText("Nessun record trovato");
                        }
                        const binding = table.getBinding("items");
                        if (binding) binding.resetChanges();

                    })
                    .catch(err => {
                        console.error("AltLabAction failed:", err);
                        table.setNoDataText("Errore durante il caricamento");
                    });

            });
        }
    };
});
