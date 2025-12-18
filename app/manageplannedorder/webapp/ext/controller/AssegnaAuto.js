sap.ui.define([
    "sap/m/MessageToast"
], function (MessageToast) {
    'use strict';

    return {
        /**
         * Generated event handler.
         *
         * @param oContext the context of the page on which the event was fired. `undefined` for list report page.
         * @param aSelectedContexts the selected contexts of the table rows.
         */
        doAssegnaAuto: async function (oEvent) {
            debugger
            sap.ui.core.BusyIndicator.show(0);
            await Promise.resolve();
            const idTableComponent = "manageplannedorder.manageplannedorder::ZZ1_CombinedPlnOrdersAPIObjectPage--fe::table::to_CombinPlannedOrdersCom::LineItem::Components"
            const oContext = this.getBindingContext().getObject();
            const tabComponents = this._view.byId(idTableComponent)._oTable;
            const itemsComponent = tabComponents.getItems();
            const oModel = this.getModel();

            //estraggo solo i record abilitati per l'assegnazione automatica
            const _items = [];
            for (let i = 0; i < itemsComponent.length; i++) {
                const item = itemsComponent[i].getBindingContext().getObject();
                if (item.IconActive) {
                    _items.push(item);
                }
            }

            const aPromises = _items.map(item => {

                const payload = {
                    "Material": item.Material,
                    "RequiredQuantity": item.RequiredQuantity,
                    "ProductionPlant": oContext.ProductionPlant,
                    "CplndOrd": oContext.CplndOrd,
                    "AvailableQuantity": item.AvailableQuantity,
                    "StorageLocation": item.StorageLocation,
                    "Batch": item.Batch,
                    "CrossPlantConfigurableProduct": oContext.CrossPlantConfigurableProduct,
                    "BillOfMaterialItemNumber_2": item.BillOfMaterialItemNumber_2
                }
                const oCtx = oModel.bindContext("/AssegnaAuto(...)");

                oCtx.setParameter("Payload", payload);

                return oCtx.execute().then(() => oCtx.getBoundContext().getObject());
            });
            // 2) Esegui TUTTE le Promises in parallelo
            try {
                await Promise.all(aPromises);
                sap.ui.core.BusyIndicator.hide();
                const results = await Promise.all(aPromises);
                const anyAssigned = results.some(r => r?.value === "ASSIGNED");

                if (anyAssigned) {
                    sap.m.MessageToast.show("Assegnazione automatica completata");
                } else {
                    sap.m.MessageBox.warning("Nessuna assegnazione effettuata");
                }

                // refresh pagina
                const oBinding = tabComponents.getBinding("items");
                if (oBinding) {
                    if (oBinding.resetChanges) { oBinding.resetChanges(); }
                    oBinding.refresh();
                }

            } catch (oError) {
                const message =
                    oError?.message ||
                    oError?.error?.message ||
                    "Errore durante l'assegnazione automatica";

                sap.m.MessageBox.error(message);
            }
        }
    };
});
