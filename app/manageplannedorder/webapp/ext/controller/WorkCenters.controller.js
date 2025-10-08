sap.ui.define(['sap/ui/core/mvc/ControllerExtension', "sap/m/MessageToast",], function (ControllerExtension, MessageToast) {
    'use strict';

    return {

        sTableId: "manageplannedorder.manageplannedorder::ZZ1_CombinedPlnOrdersAPIObjectPage--fe::table::to_CombinPlannedOrdersCom::LineItem::Components",
        _fnUpdateFinished: null,
        oStart: null,
        onInit: function () {
            debugger;
            const that = this;
            this.oStart = true;
            this._fnUpdateFinished = async function (oEvent) {
                const oTable = oEvent.getSource();
                const aRows = oTable.getItems();
                const oModel = that.getView().getModel();
                //const oGlobalObj = this.getBindingContext().getObject();
                // 1) Prepara le Promises: una per ciascuna riga
                const aPromises = aRows.map(oRow => {
                    const oContext = oRow.getBindingContext();
                    const item = oContext.getObject();
                    //const item = oRow.getBindingContext().getObject();
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
                        const match = parseFloat(itm.CombPlanAllQty) >= parseFloat(itm.RequiredQuantity);
                        oRow.setHighlight(match ? "Success" : "Error");
                        oRow.setHighlightText(
                            match
                                ? "Quantity matches"
                                : "Quantity does not match"
                        );
                    }

                });
                aRows.forEach((oRow) => {
                    const aControls = oRow.findAggregatedObjects(true, function (oControl) {
                        return true;
                    });
                    aControls.forEach((oControl) => {
                        const sType = oControl.getMetadata().getName();
                        if (sType.toLowerCase().includes('chart')) {
                            //forza aggiornamento chart (rimane sporco)
                            that._debugChartCriticality(oControl);
                        }
                    });
                });
                setTimeout(() => {
                    oTable.setBusy(false);
                }, 150);
            };
        },
        _debugChartCriticality: function (oChart) {
            if (oChart.getMetadata().getName().includes("Container")) {
                const aInternalCharts = oChart.findAggregatedObjects(true, function (oControl) {
                    return oControl.getMetadata().getName() === "sap.suite.ui.microchart.RadialMicroChart";
                });
                if (aInternalCharts.length === 0) return;
                oChart = aInternalCharts[0];
            }
            const sType = oChart.getMetadata().getName();
            if (sType !== "sap.suite.ui.microchart.RadialMicroChart" ||
                typeof oChart.getValueColor !== "function") {
                return;
            }
            const oCtx = oChart.getBindingContext();
            if (!oCtx) return;
            const criticalityValue = oCtx.getProperty("chart_criticality");
            if (criticalityValue === undefined) return;
            const newColor = this._mapCriticalityToColor(criticalityValue);
            const currentColor = oChart.getValueColor();
            if (currentColor !== newColor) {
                oChart.setValueColor(newColor);
                oChart.invalidate();
                if (typeof oChart.rerender === "function") {
                    oChart.rerender();
                }
            }
        },
        _mapCriticalityToColor: function (criticality) {
            switch (criticality) {
                case 3: return "Good";
                case 2: return "Critical";
                case 1: return "Error";
                default: return "Neutral";
            }
        },
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
        onPageReady: function (retryCount) {
            debugger;
            // 1. Inizializza il contatore
            retryCount = retryCount || 0;
            const MAX_RETRIES = 10;
            // 2. Prova a prendere la tabella
            var oTable = this._getInnerTable();
            // 3. Se non esiste ancora, riprova finché non superi MAX_RETRIES
            if (!oTable) {
                if (retryCount >= MAX_RETRIES) {
                    console.error(`Tabella non trovata dopo ${MAX_RETRIES} tentativi.`);
                    return;      // ← stop definitivo
                }
                // Richiama con retryCount incrementato
                setTimeout(() => {
                    this.onPageReady(retryCount + 1);
                }, 500);
                return;
            }
            // 4. Se la tabella c’è, continua normalmente
            const oBinding = oTable.getBinding("items");
            if (oBinding) {
                if (oBinding.resetChanges) { oBinding.resetChanges(); }
                oBinding.refresh();
                oTable.setBusy(true);
            }
            setTimeout(() => {
                this._setupUpdateFinishedHandler(oTable);
            }, 150);
        },
        /*  onItemPress: function (oEvent) {
             debugger;
             // Segna che stai navigando via
             sessionStorage.setItem("navigatedAway", "true");
 
             // Il tuo codice di navigazione normale...
         }, */
        _setupUpdateFinishedHandler: function (oTable) {
            debugger;
            if (oTable && this._fnUpdateFinished) {
                // 1) Rimuovo / ri‐aggancio per sicurezza
                oTable.detachUpdateFinished(this._fnUpdateFinished);
                oTable.attachUpdateFinished(this._fnUpdateFinished);
                // 2) ASPETTA un po' prima di forzare il primo updateFinished
                /*      setTimeout(() => {
                         this._fnUpdateFinished.call(
                             oTable,
                             { getSource: () => oTable }
                         );
                     }, 300); */ // piccolo delay per assicurare che i dati siano pronti
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
