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
            const idTableMasterPlanned = 'manageplannedorder.manageplannedorder::ZZ1_CombinedPlnOrdersAPIObjectPage--fe::table::to_ZZ1_MasterPlannedOrders::LineItem::MasterPlannedOrder-innerTable';
            const oTableMasterPlanned = sap.ui.getCore().byId(idTableMasterPlanned);
            if (oTableMasterPlanned) {
                oTableMasterPlanned.attachUpdateFinished(function once(oEvent) {
                    // Aggancia una sola volta
                    oTableMasterPlanned.detachUpdateFinished(once);

                    const aRows = oTableMasterPlanned.isA("sap.m.Table")
                        ? oTableMasterPlanned.getItems()
                        : oTableMasterPlanned.getRows();

                    aRows.forEach(row => {
                        row.setType("Active");
                    });

                    oTableMasterPlanned.attachItemPress(function (oEvent) {
                        debugger;
                        // Item cliccato
                        const oItem = oEvent.getParameter("listItem");
                        const oContext = oItem.getBindingContext();
                        // Valore del campo MasterPlannedOrder
                        const FshMplndOrd = oContext.getObject().FshMplndOrd;

                        // URL dinamico
                        const url =
                            "https://lpapps20.lp.corp:8001/sap/bc/ui2/flp#MasterPlannedOrder-manage&/C_RFM_ManageMasterPlndOrder('" +
                            FshMplndOrd +
                            "')";

                        // Navigazione verso app standard
                        window.open(url, "_blank");

                        console.log("Item pressed:", FshMplndOrd);
                    });

                });
            }
            this._fnUpdateFinished = async function (oEvent) {
                const oTable = oEvent.getSource();
                const aRows = oTable.getItems();
                const oModel = that.getView().getModel();
                //const oGlobalObj = this.getBindingContext().getObject();
                // 1) Prepara le Promises: una per ciascuna riga
                /*                 const aPromises = aRows.map(oRow => {
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
                                }); */
                // 2) Esegui TUTTE le Promises in parallelo
                /*              const aResults = await Promise.all(aPromises);
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
             
                             }); */
                aRows.forEach((oRow) => {
                    const item = oRow.getBindingContext().getObject();
                    if (item.flagHighlights === "X") {
                        const match = parseFloat(item.CombPlanAllQty) >= parseFloat(item.RequiredQuantity);
                        oRow.setHighlight(match ? "Success" : "Error");
                        oRow.setHighlightText(
                            match
                                ? "Quantity matches"
                                : "Quantity does not match"
                        );
                    }
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
            debugger
            //recuper workCenter selezionato
            sap.ui.core.BusyIndicator.show(0);
            const idTabCapacity =
                "manageplannedorder.manageplannedorder::ZZ1_CombinedPlnOrdersAPIObjectPage--fe::table::to_ZZ1_PLOCAPACITYCORD::LineItem::Capacity-innerTable";
            const oTableCapacity = sap.ui.getCore().byId(idTabCapacity);
            const idWorkCenter = "fragmentWorkCenter--workCenterTable";
            const oDialog = sap.ui.getCore().byId('fragmentWorkCenter--_IDGenDialogChangeWorkCenter');
            const selectedItemWorkCenter = sap.ui.getCore().byId(idWorkCenter).getSelectedItems();
            var oResourceBundle = this.getOwnerComponent().getModel("i18n").getResourceBundle();
            var sMessage = oResourceBundle.getText("SelectOnlyOneRecord");
            if (selectedItemWorkCenter.length > 1 || selectedItemWorkCenter.length === 0) {
                sap.ui.core.BusyIndicator.hide();
                MessageToast.show(sMessage);
                return;
            }
            const oBjWorkCenter = selectedItemWorkCenter[0].getBindingContext().getObject();
            const lifnr = oBjWorkCenter.fornitore;             // "0000002040"
            const oAmountModel = sap.ui.getCore().getModel("lifnrAmounts");
            const amountData = oAmountModel
                ? oAmountModel.getProperty("/" + lifnr)
                : null;
            var workCenterSelected = oBjWorkCenter.WorkCenterInternalID;

            const amountValue = amountData ? amountData.value : null;
            const amountCurrency = amountData ? amountData.currency : null;

            //recupero record selezionato tabella Capacity
            const oBjRecordCapacity = sap.ui.getCore().byId(idTabCapacity).getSelectedItems();
            const selectedRecordCapacity = oBjRecordCapacity[0].getBindingContext().getObject();

            var combPlOrder = String(selectedRecordCapacity.CombinedMasterOrder).padStart(12, '0');
            var Sequence = String(selectedRecordCapacity.Sequence).padStart(6, '0');

            var payload = {
                "CombPlOrder": combPlOrder,
                "Operation": selectedRecordCapacity.Operation,
                "Sequence": Sequence,
                "WorkCenter": workCenterSelected,
                "PRICE_V": amountValue,
                "PRICE_C": amountCurrency
            }

            const oModel = this.getView().getModel();
            var oBindingContext = oModel.bindContext("/ChangeWorkCenter(...)");

            oBindingContext.setParameter("Payload",
                payload
            );

            oBindingContext.execute().then((oResult) => {
                MessageToast.show("Work Center aggiornato");
                sap.ui.core.BusyIndicator.hide();
                oDialog.close();
                let bindingInfo = oTableCapacity.getBindingInfo("items");
                oTableCapacity.unbindItems();
                oTableCapacity.bindItems(bindingInfo);
            }).catch((oError) => {
                MessageToast.show(oError.value);
                sap.ui.core.BusyIndicator.hide();
                oDialog.close();
            });
        }

    };
});
