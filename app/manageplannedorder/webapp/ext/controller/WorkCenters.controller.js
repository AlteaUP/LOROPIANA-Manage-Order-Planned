sap.ui.define(['sap/ui/core/mvc/ControllerExtension', "sap/m/MessageToast",], function (ControllerExtension, MessageToast) {
    'use strict';

    return {

        sTableId: "manageplannedorder.manageplannedorder::ZZ1_CombinedPlnOrdersAPIObjectPage--fe::table::to_CombinPlannedOrdersCom::LineItem::Components",
        _fnUpdateFinished: null,
        onInit: function () {
            debugger;
            const that = this;
            this._fnUpdateFinished = async function (oEvent) {
                const oTable = oEvent.getSource();
                const aRows = oTable.getItems();
                const oModel = that.getView().getModel();      
                //const oGlobalObj = this.getBindingContext().getObject();
                // 1) Prepara le Promises: una per ciascuna riga
                const aPromises = aRows.map(oRow => {
                    const item = oRow.getBindingContext().getObject();
                    // Reset visuale
                    oRow.setHighlight("None");
                    oRow.setHighlightText("");
                    // Payload per l’action
                    const payload = {
                        'Material': item.Material,
                        'Gruppo_merce': item.ProductGroup,
                        'Plant': item.Plant
                    };
    
                    const oCtx = oModel.bindContext("/ReadBatchCust(...)");
                    oCtx.setParameter("Payload", payload);
                    return oCtx.execute()
                        .then(() => {
                            const oResult = oCtx.getBoundContext().getObject();
                            return { oRow, oResult };
                        })
                        .catch(err => {
                            return { oRow, err };
                        });
                });
                // 2) Esegui TUTTE le Promises in parallelo
                const aResults = await Promise.all(aPromises);
                // 3) Applica highlight in base ai risultati
                aResults.forEach(({ oRow, oResult, err }) => {
                    const itm = oRow.getBindingContext().getObject();
                    if (err) {
                        MessageToast.show(err.message || err.value);
                        return;
                    }
                    if (oResult.Mandassign === true) {
                        const match = parseFloat(itm.RequiredQuantity) === parseFloat(itm.CombPlanAllQty);
                        oRow.setHighlight(match ? "Success" : "Error");
                        oRow.setHighlightText(
                            match
                                ? "Quantity matches"
                                : "Quantity does not match"
                        );
                    }
            
         
                       // Modifica diretta dell'oggetto (non persistente)
                  /*     if (oResult.AssignRule === true) {
                          itm.IconActive = "sap-icon://settings";
                      } */

                });
            };
        },
        // Helper per ottenere la vera inner Table, preferendo API pubbliche
        _getInnerTable: function () {
            debugger;
            var oSmartTable = sap.ui.getCore().byId(this.sTableId);
            if (!oSmartTable) return null;
            // Prova prima con metodo pubblico
            if (typeof oSmartTable.getTable === "function") {
                return oSmartTable.getTable();
            }
            // Fallback su member privato
            if (oSmartTable._oTable) {
                return oSmartTable._oTable;
            }
            return null;
        },
        onPageReady: function () {
            debugger;
            var oTable = this._getInnerTable();
            if (oTable && this._fnUpdateFinished) {
                // 1) Rimuovo / ri‐aggancio per sicurezza
                oTable.detachUpdateFinished(this._fnUpdateFinished);
                oTable.attachUpdateFinished(this._fnUpdateFinished);
                // 2) Forzo il primo updateFinished “a mano”
                //    chiamo _fnUpdateFinished con 'this' = oTable
                this._fnUpdateFinished.call(
                    oTable,
                    { getSource: () => oTable }
                );
            }
        },
        onCloseDialog: function (oEvent) {
            const dialog = oEvent.getSource().getParent();
            dialog.close();
        },
        onSubmitChangeWorkCenter: function (oEvent) {
            //recuper workCenter selezionato
            const idWorkCenter = "fragmentWorkCenter--workCenterTable";
            const selectedItemWorkCenter = sap.ui.getCore().byId(idWorkCenter).getSelectedItems();
            var oResourceBundle = this.getOwnerComponent().getModel("i18n").getResourceBundle();
            var sMessage = oResourceBundle.getText("SelectOnlyOneRecord");
            if (selectedItemWorkCenter.length > 1 || selectedItemWorkCenter.length === 0) {
                MessageToast.show(sMessage);
                return;
            }
            const oBjWorkCenter = selectedItemWorkCenter[0].getBindingContext().getObject();
            var workCenterSelected = oBjWorkCenter.BOOWorkCenterInternalID;

            //recupero record selezionato tabella Capacity
            const idTabCapacity =
                "manageplannedorder.manageplannedorder::ZZ1_CombinedPlnOrdersAPIObjectPage--fe::table::to_ZZ1_PLOCAPACITYCORD::LineItem::Capacity-innerTable";
            const oBjRecordCapacity = sap.ui.getCore().byId(idTabCapacity).getSelectedItems();
            const selectedRecordCapacity = oBjRecordCapacity[0].getBindingContext().getObject();

            //recupero campo CombPLOrder 
            var combPlOrder = selectedRecordCapacity.CombinedMasterOrder;

            var payload = {
                "CombPlOrder": combPlOrder,
                "Operation": selectedRecordCapacity.Operation,
                "Sequence": selectedRecordCapacity.Sequence,
                "WorkCenter": workCenterSelected
            }

            const oModel = this.getView().getModel();
            var oBindingContext = oModel.bindContext("/ChangeWorkCenter(...)");

            oBindingContext.setParameter("Payload",
                payload
            );

            oBindingContext.execute().then((oResult) => {
                MessageToast.show("Successo")
            }).catch((oError) => {
                MessageToast.show(oError.value)
            });
        }

    };
});
