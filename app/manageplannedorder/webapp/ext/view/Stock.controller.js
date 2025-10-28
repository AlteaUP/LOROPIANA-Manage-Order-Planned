sap.ui.define(
    [
        'sap/fe/core/PageController',
        'sap/ui/model/json/JSONModel',
        "sap/m/MessageToast",
        "sap/ui/core/BusyIndicator",
        "sap/m/MessageBox",
    ],
    function (PageController, JSONModel, MessageToast, BusyIndicator, MessageBox) {
        'use strict';

        return PageController.extend('manageplannedorder.manageplannedorder.ext.view.Stock', {
            /**
             * Called when a controller is instantiated and its View controls (if available) are already created.
             * Can be used to modify the View before it is displayed, to bind event handlers and do other one-time initialization.
             * @memberOf 
             */
            onInit: function () {
                debugger
                this.getOwnerComponent()
                    .getExtensionComponent()
                    .getRouter()
                    .getRoute("StockPage")
                    .attachPatternMatched(this._onRouteMatched, this);
                const oRouter = this.getOwnerComponent().getExtensionComponent().getRouter();
                oRouter.attachRouteMatched((oEvent) => {
                    this._sLastRoute = oEvent.getParameter("name");
                }, this);
                oRouter.attachBeforeRouteMatched(this._onBeforeRouteMatched, this);
            },
            _onBeforeRouteMatched: function (oEvent) {
                debugger
                let sNextRoute = oEvent.getParameter("name");
                if (this._sLastRoute === "StockPage" && sNextRoute !== "StockPage") {
                    console.log("Uscita da StockPage, faccio detach");
                    this._detachTableEvents();
                     window.onpopstate = null;
                }
            },
            _detachTableEvents: function () {
                debugger
                try {
                    const oMacroTable = this.byId("TableStock");
                    const oInnerTable = oMacroTable?.getMDCTable()?._oTable;
                    if (!oInnerTable) return;

                    oInnerTable.detachUpdateFinished(this._onUpdateFinished, this);
                    oInnerTable.detachSelectionChange(this._onSelectionChange, this);

                } catch (err) {
                    console.warn("Detach fallito:", err);
                }
            },
            _onRouteMatched(oEvent) {
                debugger
                const oRouter = this.getOwnerComponent().getExtensionComponent().getRouter();

                this._fnBackHandler = () => {
                    oRouter.navTo("ComponentsPage", {}, true);
                };

                window.onpopstate = this._fnBackHandler;
 
                const oStocksModel = new sap.ui.model.json.JSONModel({
                    tableCount: 0
                });
                this.getView().setModel(oStocksModel, "stocksModel");
                const oMacroTable = this.byId("TableStock");
                if (!oMacroTable) return;

                const oInnerTable = oMacroTable.getMDCTable()._oTable;
                if (!oInnerTable) return;

                oInnerTable.setGrowing(false);

                oInnerTable.detachUpdateFinished(this._onUpdateFinished, this);
                oInnerTable.detachSelectionChange(this._onSelectionChange, this);

                oInnerTable.attachUpdateFinished(this._onUpdateFinished, this);
                oInnerTable.attachSelectionChange(this._onSelectionChange, this);
            },
            _onUpdateFinished(oEvent) {
                debugger
                const oTable = oEvent.getSource();
                const aItems = oTable.getItems?.() || [];
                const oContextComponent = JSON.parse(sessionStorage.getItem("selectedContextComponent") || "[]");
                //gestione visibilità action assegna Auto
                const idBtnAssegnaAuto = "manageplannedorder.manageplannedorder::StockPage--TableStock-content::CustomAction::assegnaAuto"

                this.oButtonAssegnaAuto = sap.ui.getCore().byId(idBtnAssegnaAuto);
                if (oContextComponent.IconActive != "") {
                    this.oButtonAssegnaAuto.setEnabled(true);
                    this.initialButtonState = this.oButtonAssegnaAuto.getEnabled();
                } else {
                    this.oButtonAssegnaAuto.setEnabled(false);
                    this.initialButtonState = this.oButtonAssegnaAuto.getEnabled();
                }
                //setto tot item
                const oModelStock = this.getView().getModel("stocksModel");
                oModelStock.setProperty('/tableCount', aItems.length)

                aItems.forEach((oItem) => {
                    const oCtx = oItem.getBindingContext();
                    const oObj = oCtx?.getObject();
                    if (!oObj) return;

                    const { AvaibilityQty, CombPlanAllQty } = oObj;
                    let highlight = "Success";
                    let highlightText = "Stock available";

                    if (parseFloat(AvaibilityQty) === 0 && parseFloat(CombPlanAllQty) === 0) {
                        highlight = "Error";
                        highlightText = "No stock available";
                    } else if (parseFloat(AvaibilityQty) > 0 && parseFloat(CombPlanAllQty) === 0) {
                        highlight = "None";
                        highlightText = "";
                    }

                    oItem.setHighlight(highlight);
                    oItem.setHighlightText(highlightText);
                });
            },
            _onSelectionChange(oEvent) {
                debugger
                const oTable = oEvent.getSource();
                const aContexts = oEvent.getSource().getSelectedContexts();
                const aSelectedData = aContexts.map((ctx) => ctx.getObject());
                const selected = oEvent.getParameter('selected');
                const selectedItem = oTable.getSelectedItems();
                const oContext = oEvent.getParameter('listItem');
                const highlight = oContext.getHighlight();
                console.log("Righe selezionate:", aSelectedData);

                //se si seleziona record disabilito bottone Assegnazione Auto (se abilitato)
                if (selected || (!selected && selectedItem.length > 0)) {
                    // Se il bottone era abilitato, disabilitalo
                    if (this.oButtonAssegnaAuto.getEnabled()) {
                        this.oButtonAssegnaAuto.setEnabled(false);
                    }
                } else {
                    // Deselezione → ripristina lo stato iniziale del bottone
                    this.oButtonAssegnaAuto.setEnabled(this.initialButtonState);
                }
                if (highlight === 'Error') {
                    setTimeout(() => {
                        oTable.removeSelections(); // Rimuove selezione visiva
                        // Rimuove il context anche dalla lista effettiva
                        const oBinding = oTable.getBinding("items");
                        if (oBinding && oBinding.getContexts) {
                            oTable.setSelectedItem(null); // forza aggiornamento
                            this.oButtonAssegnaAuto.setEnabled(this.initialButtonState);
                        }
                        sap.m.MessageToast.show("Item not selectable");
                    }, 0);
                }
            },
            pressAssegna: function (oEvent) {
                debugger
                const oContextOrders = JSON.parse(sessionStorage.getItem("selectedContextsOrders") || "[]"); //ordine selezionato
                const oContextComponent = JSON.parse(sessionStorage.getItem("selectedContextComponent") || "[]"); //componente selezionato
                const oModel = this.getOwnerComponent().getModel()
                const model = new JSONModel()
                const oMacroTable = this.byId("TableStock");
                const oInnerTable = oMacroTable.getMDCTable()._oTable;
                const aSelectedItems = oInnerTable.getSelectedItems();
                let TotCombPlanAllQty = 0;
                let OpenQty = 0;
                if (aSelectedItems.length === 0) {
                    MessageToast.show("Select at least one item");
                    return;
                }
                const _selectedItems = [];
                this._bSaldoScorta = false;

                if (!aSelectedItems.length) {
                    sap.m.MessageToast.show("Seleziona almeno una riga!");
                    return;
                }
                aSelectedItems.forEach(oItem => {
                    const oContext = oItem.getBindingContext();
                    const oData = oContext.getObject();
                    TotCombPlanAllQty += parseInt(oData.CombPlanAllQty)
                    _selectedItems.push(oData)
                    console.log("Riga selezionata:", oData);
                });

                OpenQty = oContextComponent.RequiredQuantity - TotCombPlanAllQty;
                model.setData({
                    ...oContextOrders,
                    ...oContextComponent,
                    TotalPlanAllQty: TotCombPlanAllQty.toFixed(3).toString(),
                    OpenQty: OpenQty.toFixed(3).toString(),
                    selectedItems: _selectedItems
                })
                this.getView().setModel(model, 'selectedPezze');

                if (this._fragmentPezze) {
                    this._fragmentPezze.then(function (dialog) {
                        if (dialog) {
                            dialog.destroy();
                        }
                    });
                }

                // Ricrea sempre
                this._fragmentPezze = this.loadFragment({
                    id: "fragmentPezze1",
                    name: "manageplannedorder.manageplannedorder.ext.fragment.AssegnaPezzeAgg",
                    controller: this._controller
                });
                var that = this;
                this._fragmentPezze.then(function (dialog) {
                    this._oDialogPezze = dialog;
                    dialog.setModel(model, 'selected');
                    dialog.setModel(oModel);
                    //flag per verificare se è stato fatto il submit
                    dialog.getModel('selected').setProperty('/submitCompleted', false);
                    // Handler per quando il dialog viene chiuso
                    dialog.attachAfterClose(function () {
                        // Resetta tutti i cambiamenti non committati
                        const binding = table.getBinding('items');
                        const selectedModel = dialog.getModel('selected');
                        const submitCompleted = selectedModel?.getProperty('/submitCompleted');
                        const oStockTable = this.getView().byId("TableStock");
                        const oInnerTableStock = oStockTable.getMDCTable()._oTable;

                        if (binding) {
                            const contexts = binding.getContexts();

                            if (!submitCompleted) {
                                contexts.forEach(ctx => {
                                    if (ctx.isTransient && typeof ctx.delete === "function") {
                                        ctx.delete();
                                    }
                                });
                            }

                            binding.resetChanges();
                        }

                        // Gestione del modello highlight
                        const highlightModel = this.getOwnerComponent().getModel("highlight");
                        if (highlightModel) {
                            if (!submitCompleted) {
                                highlightModel.setProperty('/assignedRecords', []);
                                oInnerTableStock.removeSelections();
                            }
                        }
                    }.bind(this));
                    const table = dialog.getContent().at(-1);

                    var oCheckBox = new sap.m.CheckBox({
                        text: "Saldo/Scorta",
                        selected: this._bSaldoScorta,
                        select: function (oEvent) {
                            debugger;
                            var bChecked = oEvent.getSource().getSelected();
                            this._bSaldoScorta = bChecked;

                            // AGGIORNA TUTTI I CONTEXT NEL BINDING (OData V4)
                            const contexts = table.getBinding('items').getContexts();
                            contexts.forEach(context => {
                                context.setProperty("SaldoScorta", bChecked);
                            });

                            console.log("Flag set to:", this._bSaldoScorta, typeof this._bSaldoScorta);
                        }.bind(this)
                    });
                    var oCheckboxContainer = new sap.m.HBox({
                        justifyContent: "End",
                        items: [oCheckBox],
                    });
                    dialog.addContent(oCheckboxContainer);
                    /*         this._oCheckBox = oCheckBox;
                            this._oCheckBox.setSelected(this._bSaldoScorta) */


                    table.bindAggregation('items', {
                        path: '/ZZ1_MFP_ASSIGNMENT',
                        filters: [
                            new sap.ui.model.Filter({
                                filters: (oContextOrders || [])
                                    .filter(o => o.CplndOrd)
                                    .map(o =>
                                        new sap.ui.model.Filter(
                                            "FSH_MPLO_ORD",
                                            sap.ui.model.FilterOperator.Contains,
                                            o.CplndOrd
                                        )
                                    ),
                                and: false
                            }),
                            new sap.ui.model.Filter("MATNR", sap.ui.model.FilterOperator.EQ, oContextComponent.Material)
                        ],
                        template: new sap.m.ColumnListItem({
                            highlight: {
                                parts: [
                                    'CHARG',
                                    'LGORT',
                                    'highlight>/assignedRecords'  // Model del Component
                                ],
                                formatter: function (batch, storage, assignedRecords) {
                                    if (!batch || !storage) return "None";
                                    const recordKey = batch + '|' + storage;
                                    const isAssigned = assignedRecords && assignedRecords.includes(recordKey);
                                    return isAssigned ? "Success" : "None";
                                }
                            },
                            cells: [
                                new sap.m.ObjectIdentifier({ title: "{CHARG}" }),
                                new sap.m.Text({ text: "{FSH_MPLO_ORD}" }),
                                new sap.m.Text({ text: "{StockSegment}" }),
                                new sap.m.Text({ text: "{SpecialStock}" }),
                                new sap.m.Text({ text: "{BatchBySupplier}" }),
                                new sap.m.Text({ text: "{LGORT}" }),
                                new sap.m.Text({ text: "{FABB_TOT_V}" }),
                                new sap.m.Text({ text: "{COPERTURA}" }),
                                //new sap.m.Input({ value: "{COPERTURA_EDITABLE}" }),
                                new sap.m.Input({
                                    value: "{QTA_ASS_V}", change: function (oEvent) {
                                        var oInput = oEvent.getSource();
                                        var sNewValue = sap.ui.getCore().byId(oInput.getId()).getValue();
                                        sNewValue = sNewValue.toString().replace(",", ".")

                                        var requiredQty = sap.ui.getCore().byId("manageplannedorder.manageplannedorder::StockPage--fragmentPezze1--inputRequiredQuantityA").getText()

                                        sap.ui.getCore().byId("manageplannedorder.manageplannedorder::StockPage--fragmentPezze1--inputRemainingQtyA").setText(Number(requiredQty) - Number(sNewValue));
                                    }
                                }),
                                //new sap.m.Text({ text: "{BatchBySupplier}" })
                            ]
                        }),
                        templateShareable: false,
                        parameters: { $$updateGroupId: 'CreatePezzeBatch' },
                    });
                    const RemainingQty = sap.ui.getCore().byId("manageplannedorder.manageplannedorder::StockPage--fragmentPezze1--inputRemainingQtyA");
                    RemainingQty.setText(dialog.getModel("selected").oData.OpenQty);
                    const binding = table.getBinding('items');
                    binding.resetChanges();
                    const oODataModel = table.getModel();
                    binding.attachDataReceived(async function () {
                        //se il submit è stato completato chiudere
                        const submitCompleted = dialog.getModel('selected').getProperty('/submitCompleted');
                        if (submitCompleted) {
                            console.log("Submit già completato, non ricreo i record");
                            return;
                        }
                        await binding.requestContexts(0, 1); // forza la creazione del context

                        // 1. Identifica i record GIÀ PRESENTI nella tabella (quelli già assegnati)
                        const existingContexts = binding.getContexts();
                        const existingKeys = existingContexts.map(context => {
                            const obj = context.getObject();
                            if (obj) { // Aggiungi un controllo per sicurezza
                                return obj.CHARG + '|' + obj.LGORT;
                            }
                            return null;
                        }).filter(key => key !== null); // Rimuovi eventuali nulli
                        // 2. Prendi o crea il modello di highlight condiviso
                        const oComponent = this.getOwnerComponent();
                        let highlightModel = oComponent.getModel('highlight');
                        if (!highlightModel) {
                            highlightModel = new sap.ui.model.json.JSONModel({
                                assignedRecords: []
                            });
                            oComponent.setModel(highlightModel, 'highlight');
                        }
                        // 3. Imposta i record già assegnati nel modello condiviso
                        // Uso 'Set' per evitare duplicati se riapro il dialog più volte
                        const allAssignedRecords = [...new Set([...highlightModel.getProperty('/assignedRecords'), ...existingKeys])];
                        highlightModel.setProperty('/assignedRecords', allAssignedRecords);

                        // sommatoria AvaibilityQty 
                        const TotAvaibilityQty = _selectedItems.reduce((acc, item) => acc + parseInt(item.AvaibilityQty || 0), 0);
                        console.log("Total Availability Quantity: ", TotAvaibilityQty);

                        _selectedItems.forEach((_item) => {
                            const item = structuredClone(_item)
                            oContextOrders.forEach((order, index) => {
                                // Aggiungere in riga la colonna % Coverage rappresenta (Avaibility Quantity di riga / totale delle Avaibility Quantiy delle righe selezionate) * 100
                                const COPERTURA = Math.round(parseInt(item.AvaibilityQty) / TotAvaibilityQty * 100);
                                // Il campo Quantity to Assign deve essere modificabile a mano e deve seguire il seguente algoritmo: 
                                // total Avaibility qty * la percentuale di copertura del punto precedente, presentare il minore tra questa operazione e la Available Quantity di riga.
                                const QTA_ASS_V = Math.min(parseInt(oContextComponent.AvailableQuantity), (oContextComponent.AvailableQuantity * (COPERTURA / 100)));

                                //splitto quantità
                                let qtaArray = [];

                                // Se QTA_ASS_V è valido, dividilo in parti uguali
                                if (!isNaN(QTA_ASS_V) && QTA_ASS_V > 0 && Array.isArray(oContextOrders) && oContextOrders.length > 1) {
                                    const splitValue = QTA_ASS_V / oContextOrders.length;
                                    qtaArray = Array(oContextOrders.length).fill(splitValue);
                                } else {
                                    // Altrimenti un solo valore
                                    qtaArray = [QTA_ASS_V];
                                }

                                const SAP_UUID = crypto.randomUUID()
                                //controllo su InventorySpecialStockType - se ha l'identificativo riportarlo a stringa vuota altrimenti fallisce la chiamata
                                if (item.InventorySpecialStockType && item.InventorySpecialStockType.startsWith('_')) {
                                    item.InventorySpecialStockType = '';
                                }
                                //controllo su SpecialStock - se ha l'identificativo riportarlo a stringa vuota altrimenti fallisce la chiamata
                                if (item.SpecialStock && item.SpecialStock.startsWith('_')) {
                                    item.SpecialStock = '';
                                }

                                const newCreate = structuredClone({
                                    "SAP_UUID": SAP_UUID,
                                    "WERKS": item.Plant,
                                    "LGORT": item.StorageLocation || "X",
                                    "FSH_MPLO_ORD": order.CplndOrd,
                                    "BAGNI": item.dye_lot || "X",
                                    "MATNR": item.Material,
                                    "CHARG": item.Batch,
                                    "Bagno": item.dye_lot,
                                    //"BatchBySupplier": 12345,
                                    "QTA_ASS_V": (qtaArray[index] || 0).toFixed(3).toString(),
                                    //"QTA_ASS_V": QTA_ASS_V.toFixed(3).toString(),
                                    "QTA_ASS_U": "",
                                    "QTA_ASS_U_Text": "",
                                    "FABB_TOT_V": item.AvaibilityQty || 0,
                                    "FABB_TOT_U": "",
                                    "FABB_TOT_U_Text": "",
                                    "COPERTURA": COPERTURA,
                                    //"COPERTURA_EDITABLE": COPERTURA,
                                    "SORT": 0,
                                    "StockSegment": item.StockSegment,
                                    "SAP_CreatedDateTime": new Date(),
                                    "SAP_CreatedByUser": "LASPATAS",
                                    "SAP_CreatedByUser_Text": "",
                                    "SAP_LastChangedDateTime": new Date(),
                                    "SAP_LastChangedByUser": "LASPATAS",
                                    "SAP_LastChangedByUser_Text": "X",
                                    "BatchBySupplier": item.BatchBySupplier,
                                    "SpecialStock": item.InventorySpecialStockType,
                                    "SaldoScorta": !!this._bSaldoScorta
                                })

                                const isPresent = binding.getContexts().some(context =>
                                    context.getObject().CHARG === _item.Batch &&
                                    context.getObject().LGORT === _item.StorageLocation &&
                                    context.getObject().FSH_MPLO_ORD === order.CplndOrd
                                );
                                if (!isPresent) {
                                    console.warn("Combined planned order is not present in binding.");
                                    binding.create(newCreate, false, false, false);
                                } else {
                                }
                            });
                        });
                        // binding.refresh(true);
                        table.invalidate(); // Forza il rendering della tabella
                    }.bind(this));
                    dialog.open();
                }.bind(this));

            },
            pressAssegnaAuto: function (oEvent) {
                debugger
                this._bSaldoScorta = false;
                const oContextOrders = JSON.parse(sessionStorage.getItem("selectedContextsOrders") || "[]"); //ordine selezionato
                const oContextComponent = JSON.parse(sessionStorage.getItem("selectedContextComponent") || "[]"); //componente selezionato
                const model = new JSONModel();
                const oModel = this.getOwnerComponent().getModel()
                const oMacroTable = this.byId("TableStock");
                const oInnerTable = oMacroTable.getMDCTable()._oTable;
                const aRows = oInnerTable.getItems();
                const items = [];
                let _selectedItems = [];

                for (let i = 0; i < aRows.length; i++) {
                    const oObj = aRows[i].getBindingContext().getObject()
                    items.push(oObj)
                }

                let RequiredQty = Number(oContextComponent.RequiredQuantity);

                /*     if (/^\d+\.\d{2}$/.test(RequiredQty)) {
                      RequiredQty = RequiredQty + "0";
                    } */

                // 1. Raggruppo ma salvo anche gli indici degli items originali
                const grouped = Object.values(
                    items.reduce((acc, item, index) => {
                        const key = `${item.BatchBySupplier}_${item.StorageLocation}`;

                        if (!acc[key]) {
                            acc[key] = {
                                BatchBySupplier: item.BatchBySupplier,
                                StorageLocation: item.StorageLocation,
                                StorageLocationStock: 0,
                                indices: [] // salvo gli indici degli elementi originali
                            };
                        }

                        acc[key].StorageLocationStock += Number(item.StorageLocationStock) || 0;
                        acc[key].indices.push(index);

                        return acc;
                    }, {})
                );

                // 2. Trovo il record col valore più piccolo > RequiredQty
                const selected = grouped
                    .filter(g => Number(g.StorageLocationStock) > RequiredQty)
                    .sort((a, b) => Number(a.StorageLocationStock) - Number(b.StorageLocationStock))[0];


                if (selected) {
                    // 3. Se contiene più di un indice → era un aggregato
                    if (selected.indices.length > 1) {
                        // Ricostruisco gli item originali
                        let reconstructed = selected.indices.map(i => items[i]);

                        // Filtro quelli che hanno StorageLocationStock > RequiredQty
                        const filtered = reconstructed.filter(item => Number(item.StorageLocationStock) > RequiredQty);

                        // Se esiste almeno un record che rispetta la condizione, prendo solo quello
                        // altrimenti lascio la lista completa originale
                        _selectedItems = filtered.length > 0 ? filtered : reconstructed;
                    } else {
                        _selectedItems = [items[selected.indices[0]]]; // solo 1 record originale
                    }

                    //Aggiunta codice per assegnazione 
                    let TotCombPlanAllQty = 0;
                    let OpenQty = 0;
                    for (let i = 0; i < _selectedItems.length; i++) {
                        const oObj = _selectedItems[i]
                        TotCombPlanAllQty += parseInt(oObj.CombPlanAllQty)
                    }

                    OpenQty = oContextComponent.RequiredQuantity - TotCombPlanAllQty;

                    model.setData({
                        ...oContextComponent,
                        ...oContextOrders,
                        TotalPlanAllQty: TotCombPlanAllQty.toFixed(3).toString(),
                        OpenQty: OpenQty.toFixed(3).toString(),
                        selectedItems: _selectedItems
                    })

                    this.getView().setModel(model, 'selectedPezze');

                    if (this._fragmentPezze) {
                        this._fragmentPezze.then(function (dialog) {
                            if (dialog) {
                                dialog.destroy();
                            }
                        });
                    }

                    // Ricrea sempre
                    this._fragmentPezze = this.loadFragment({
                        id: "fragmentPezze1",
                        name: "manageplannedorder.manageplannedorder.ext.fragment.AssegnaPezze",
                        controller: this._controller
                    });
                    /* 
                            if (!this._fragmentPezze) {
                              this._fragmentPezze = this.loadFragment({
                                id: "fragmentPezze",
                                name: "manageplannedorder.manageplannedorder.ext.fragment.Pezze",
                                controller: this._controller
                              });
                            } */

                    this._fragmentPezze.then(function (dialog) {
                        dialog.setModel(model, 'selected');
                        dialog.setModel(oModel);
                        //flag per verificare se è stato fatto il submit
                        dialog.getModel('selected').setProperty('/submitCompleted', false);
                        // Handler per quando il dialog viene chiuso
                        dialog.attachAfterClose(function () {
                            // Resetta tutti i cambiamenti non committati
                            const binding = table.getBinding('items');
                            const selectedModel = dialog.getModel('selected');
                            const submitCompleted = selectedModel?.getProperty('/submitCompleted');
                            const oStockTable = this.getView().byId("TableStock");
                            const oInnerTableStock = oStockTable.getMDCTable()._oTable;

                            if (binding) {
                                const contexts = binding.getContexts();

                                if (!submitCompleted) {
                                    contexts.forEach(ctx => {
                                        if (ctx.isTransient && typeof ctx.delete === "function") {
                                            ctx.delete();
                                        }
                                    });
                                }

                                binding.resetChanges();
                            }

                            // Gestione del modello highlight
                            const highlightModel = this.getOwnerComponent().getModel("highlight");
                            if (highlightModel) {
                                if (!submitCompleted) {
                                    highlightModel.setProperty('/assignedRecords', []);
                                    oInnerTableStock.removeSelections();
                                }
                            }
                        }.bind(this));
                        const table = dialog.getContent().at(-1);

                        var oCheckBox = new sap.m.CheckBox({
                            text: "Saldo/Scorta",
                            selected: this._bSaldoScorta,
                            select: function (oEvent) {
                                debugger;
                                var bChecked = oEvent.getSource().getSelected();
                                this._bSaldoScorta = bChecked;

                                // AGGIORNA TUTTI I CONTEXT NEL BINDING (OData V4)
                                const contexts = table.getBinding('items').getContexts();
                                contexts.forEach(context => {
                                    context.setProperty("SaldoScorta", bChecked);
                                });

                                console.log("Flag set to:", this._bSaldoScorta, typeof this._bSaldoScorta);
                            }.bind(this)
                        });
                        var oCheckboxContainer = new sap.m.HBox({
                            justifyContent: "End",
                            items: [oCheckBox],
                        });
                        dialog.addContent(oCheckboxContainer);

                        table.bindAggregation('items', {
                            path: '/ZZ1_MFP_ASSIGNMENT',
                            filters: [
                                new sap.ui.model.Filter({
                                    filters: (oContextOrders || [])
                                        .filter(o => o.CplndOrd)
                                        .map(o =>
                                            new sap.ui.model.Filter(
                                                "FSH_MPLO_ORD",
                                                sap.ui.model.FilterOperator.Contains,
                                                o.CplndOrd
                                            )
                                        ),
                                    and: false
                                }),
                                new sap.ui.model.Filter("MATNR", sap.ui.model.FilterOperator.EQ, oContextComponent.Material)
                            ],
                            template: new sap.m.ColumnListItem({
                                highlight: {
                                    parts: [
                                        'CHARG',
                                        'LGORT',
                                        'highlight>/assignedRecords'  // Model del Component
                                    ],
                                    formatter: function (batch, storage, assignedRecords) {
                                        const recordKey = batch + '|' + storage;
                                        const isAssigned = assignedRecords && assignedRecords.includes(recordKey);
                                        return isAssigned ? "Success" : "None";
                                    }
                                },
                                cells: [
                                    new sap.m.ObjectIdentifier({ title: "{CHARG}" }),
                                    new sap.m.Text({ text: "{FSH_MPLO_ORD}" }),
                                    new sap.m.Text({ text: "{StockSegment}" }),
                                    new sap.m.Text({ text: "{SpecialStock}" }),
                                    new sap.m.Text({ text: "{BatchBySupplier}" }),
                                    new sap.m.Text({ text: "{LGORT}" }),
                                    new sap.m.Text({ text: "{FABB_TOT_V}" }),
                                    new sap.m.Text({ text: "{COPERTURA}" }),
                                    //new sap.m.Input({ value: "{COPERTURA_EDITABLE}" }),
                                    new sap.m.Input({
                                        value: "{QTA_ASS_V}", change: function (oEvent) {
                                            var oInput = oEvent.getSource();
                                            var sNewValue = sap.ui.getCore().byId(oInput.getId()).getValue();
                                            sNewValue = sNewValue.toString().replace(",", ".")

                                            var requiredQty = sap.ui.getCore().byId("manageplannedorder.manageplannedorder::StockPage--fragmentPezze1--inputRequiredQuantityA").getText()

                                            sap.ui.getCore().byId("manageplannedorder.manageplannedorder::StockPage--fragmentPezze1--inputRemainingQtyA").setText(Number(requiredQty) - Number(sNewValue));
                                        }
                                    }),
                                    //new sap.m.Text({ text: "{BatchBySupplier}" })
                                ]
                            }),
                            templateShareable: false,
                            parameters: { $$updateGroupId: 'CreatePezzeBatch' },
                        });
                        const RemainingQty = sap.ui.getCore().byId("manageplannedorder.manageplannedorder::StockPage--fragmentPezze1--inputRemainingQtyA");
                        RemainingQty.setText(dialog.getModel("selected").oData.OpenQty);
                        const binding = table.getBinding('items');
                        binding.resetChanges();
                        const oODataModel = table.getModel();
                        binding.attachDataReceived(async function () {
                            //se il submit è stato completato chiudere
                            const submitCompleted = dialog.getModel('selected').getProperty('/submitCompleted');
                            if (submitCompleted) {
                                console.log("Submit già completato, non ricreo i record");
                                return;
                            }
                            await binding.requestContexts(0, 1); // forza la creazione del context

                            // 1. Identifica i record GIÀ PRESENTI nella tabella (quelli già assegnati)
                            const existingContexts = binding.getContexts();
                            const existingKeys = existingContexts.map(context => {
                                const obj = context.getObject();
                                if (obj) { // Aggiungi un controllo per sicurezza
                                    return obj.CHARG + '|' + obj.LGORT;
                                }
                                return null;
                            }).filter(key => key !== null); // Rimuovi eventuali nulli
                            // 2. Prendi o crea il modello di highlight condiviso
                            const oComponent = this.getOwnerComponent();
                            let highlightModel = oComponent.getModel('highlight');
                            if (!highlightModel) {
                                highlightModel = new sap.ui.model.json.JSONModel({
                                    assignedRecords: []
                                });
                                oComponent.setModel(highlightModel, 'highlight');
                            }
                            // 3. Imposta i record già assegnati nel modello condiviso
                            // Uso 'Set' per evitare duplicati se riapro il dialog più volte
                            const allAssignedRecords = [...new Set([...highlightModel.getProperty('/assignedRecords'), ...existingKeys])];
                            highlightModel.setProperty('/assignedRecords', allAssignedRecords);

                            // sommatoria AvaibilityQty 
                            const TotAvaibilityQty = _selectedItems.reduce((acc, item) => acc + parseInt(item.AvaibilityQty || 0), 0);
                            console.log("Total Availability Quantity: ", TotAvaibilityQty);

                            _selectedItems.forEach((_item) => {
                                const item = structuredClone(_item)
                                oContextOrders.forEach((order, index) => {
                                    // Aggiungere in riga la colonna % Coverage rappresenta (Avaibility Quantity di riga / totale delle Avaibility Quantiy delle righe selezionate) * 100
                                    const COPERTURA = Math.round(parseInt(item.AvaibilityQty) / TotAvaibilityQty * 100);
                                    // Il campo Quantity to Assign deve essere modificabile a mano e deve seguire il seguente algoritmo: 
                                    // total Avaibility qty * la percentuale di copertura del punto precedente, presentare il minore tra questa operazione e la Available Quantity di riga.
                                    const QTA_ASS_V = Math.min(parseInt(oContextComponent.AvailableQuantity), (oContextComponent.AvailableQuantity * (COPERTURA / 100)));

                                    //splitto quantità
                                    let qtaArray = [];

                                    // Se QTA_ASS_V è valido, dividilo in parti uguali
                                    if (!isNaN(QTA_ASS_V) && QTA_ASS_V > 0 && Array.isArray(oContextOrders) && oContextOrders.length > 1) {
                                        const splitValue = QTA_ASS_V / oContextOrders.length;
                                        qtaArray = Array(oContextOrders.length).fill(splitValue);
                                    } else {
                                        // Altrimenti un solo valore
                                        qtaArray = [QTA_ASS_V];
                                    }

                                    const SAP_UUID = crypto.randomUUID()
                                    //controllo su InventorySpecialStockType - se ha l'identificativo riportarlo a stringa vuota altrimenti fallisce la chiamata
                                    if (item.InventorySpecialStockType && item.InventorySpecialStockType.startsWith('_')) {
                                        item.InventorySpecialStockType = '';
                                    }
                                    //controllo su SpecialStock - se ha l'identificativo riportarlo a stringa vuota altrimenti fallisce la chiamata
                                    if (item.SpecialStock && item.SpecialStock.startsWith('_')) {
                                        item.SpecialStock = '';
                                    }

                                    const newCreate = structuredClone({
                                        "SAP_UUID": SAP_UUID,
                                        "WERKS": item.Plant,
                                        "LGORT": item.StorageLocation || "X",
                                        "FSH_MPLO_ORD": order.CplndOrd,
                                        "BAGNI": item.dye_lot || "X",
                                        "MATNR": item.Material,
                                        "CHARG": item.Batch,
                                        "Bagno": item.dye_lot,
                                        //"BatchBySupplier": 12345,
                                        "QTA_ASS_V": (qtaArray[index] || 0).toFixed(3).toString(),
                                        "QTA_ASS_U": "",
                                        "QTA_ASS_U_Text": "",
                                        "FABB_TOT_V": item.AvaibilityQty || 0,
                                        "FABB_TOT_U": "",
                                        "FABB_TOT_U_Text": "",
                                        "COPERTURA": COPERTURA,
                                        //"COPERTURA_EDITABLE": COPERTURA,
                                        "SORT": 0,
                                        "StockSegment": item.StockSegment,
                                        "SAP_CreatedDateTime": new Date(),
                                        "SAP_CreatedByUser": "LASPATAS",
                                        "SAP_CreatedByUser_Text": "",
                                        "SAP_LastChangedDateTime": new Date(),
                                        "SAP_LastChangedByUser": "LASPATAS",
                                        "SAP_LastChangedByUser_Text": "X",
                                        "BatchBySupplier": item.BatchBySupplier,
                                        "SpecialStock": item.InventorySpecialStockType,
                                        "SaldoScorta": !!this._bSaldoScorta
                                    })

                                    const isPresent = binding.getContexts().some(context =>
                                        context.getObject().CHARG === _item.Batch &&
                                        context.getObject().LGORT === _item.StorageLocation &&
                                        context.getObject().FSH_MPLO_ORD === order.CplndOrd
                                    );

                                    if (!isPresent) {
                                        console.warn("Combined planned order is not present in binding.");
                                        binding.create(newCreate, false, false, false);
                                    } else {
                                        console.log("Combined planned order is present in binding.");
                                    }
                                });
                            });
                            // binding.refresh(true);
                            table.invalidate(); // Forza il rendering della tabella
                        }.bind(this));
                        dialog.open();
                    }.bind(this));


                } else {
                    MessageToast.show("Assegnazione automatica non consentita");
                }
            },
            onCloseDialog: function (oEvent) {
                const oDialog = oEvent.getSource().getParent();
                oDialog.close();
            },
            pressDisassegna: async function (oEvent) {
                debugger
                const oContextOrders = JSON.parse(sessionStorage.getItem("selectedContextsOrders") || "[]"); //ordine selezionato
                const oContextComponent = JSON.parse(sessionStorage.getItem("selectedContextComponent") || "[]"); //componente selezionato
                const oModel = this.getOwnerComponent().getModel();

                const oList = oModel.bindList("/ZZ1_MFP_ASSIGNMENT");
                const filterCombined = new sap.ui.model.Filter({
                    filters: (oContextOrders || [])
                        .filter(o => o.CplndOrd)
                        .map(o =>
                            new sap.ui.model.Filter(
                                "FSH_MPLO_ORD",
                                sap.ui.model.FilterOperator.Contains,
                                o.CplndOrd
                            )
                        ),
                    and: false
                });
                const filterMatnr = new sap.ui.model.Filter("MATNR", sap.ui.model.FilterOperator.EQ, oContextComponent.Material)
                oList.filter([filterCombined, filterMatnr]);

                //BusyIndicator.show(0);

                var pContexts = await oList.requestContexts(0, 20)
                var aContexts = pContexts.map(oContext => oContext)

                if (!aContexts.length) {
                    MessageToast.show("No items to disassemble.");
                    BusyIndicator.hide(0);
                    return;
                }

                // modifica DL - 29/07/2025 - disassegno solo record selezionati
                const oMacroTable = this.byId("TableStock");
                const oInnerTable = oMacroTable.getMDCTable()._oTable;
                const selectedItems = oInnerTable.getSelectedItems();
                if (selectedItems.length > 0) {
                    var batchSelected = []
                    // creo array partite selezionate
                    for (var i = 0; i < selectedItems.length; i++) {
                        batchSelected.push(selectedItems[i].getBindingContext().getObject().Batch)
                    }
                    // elimino da aContexts quello che non è stato selezionato
                    var aContextsToKeep = aContexts.filter(function (oContext) {
                        const oData = oContext.getObject(); console.log(oData);
                        return batchSelected.includes(oData.CHARG);
                    });
                    aContexts = aContextsToKeep
                }
                // modifica DL - 29/07/2025 - disassegno solo record selezionati - FINE

                try {
                    await this.showMessageConfirm(`disassemble (${aContexts.length})`)
                } catch (error) {
                    MessageToast.show("Disassemble cancelled.");
                    BusyIndicator.hide(0);
                    return;
                }

                const sGroupId = 'DisassemblePezzeBatch';
                aContexts.forEach(function (oContext) {
                    oContext.delete(sGroupId)
                });

                const oData = await oModel.submitBatch(sGroupId)
                BusyIndicator.hide(0);
                const oStockTable = oMacroTable.getMDCTable()._oTable;
                if (!oData) {
                    MessageToast.show("Disassemble completed successfully.");
                    oStockTable.refreshItems();
                    oStockTable.getBinding('items').refresh();
                    oStockTable.removeSelections();
                } else {
                    MessageToast.show("Disassemble failed.");
                }
            },
            pressDoAssign: function (oEvent) {
                debugger
                var that = this
                const oModel = this.getOwnerComponent().getModel();
                const oTable = that.getView().byId('fragmentPezze1--selectedItemsTable1');
                const binding = oTable.getBinding('items');
                const _oContext = [];
                const contexts = binding.getContexts();
                contexts.forEach(ctx => {
                    const obj = ctx.getObject();
                    if (!obj) return;
                    _oContext.push(obj);

                });
                this.showMessageConfirm("assign").then(function () {
                    //console.log("BusyIndicator:", BusyIndicator);
                    sap.ui.core.BusyIndicator.show(0);

                    oModel.submitBatch("CreatePezzeBatch").then(async (a, b, c) => {
                        // Recupera il model condiviso dal Component
                        const highlightModel = this.getOwnerComponent().getModel('highlight');

                        if (highlightModel) {
                            const oTable = that.getView().byId('fragmentPezze1--selectedItemsTable1');
                            const binding = oTable.getBinding('items');
                            const contexts = binding.getContexts();

                            const newAssignedKeys = contexts.map(context => {
                                const obj = context.getObject();
                                return obj.CHARG + '|' + obj.LGORT + '|' + obj.FSH_MPLO_ORD;
                            });

                            // Aggiorna il model condiviso
                            const existingRecords = highlightModel.getProperty('/assignedRecords') || [];
                            const allRecords = [...new Set([...existingRecords, ...newAssignedKeys])];
                            highlightModel.setProperty('/assignedRecords', allRecords);
                        }

                        const oDialog = this._oDialogPezze;
                        if (oDialog && oDialog.getModel('selected')) {
                            oDialog.getModel('selected').setProperty('/submitCompleted', true);
                        }
                        const oStockTable = this.getView().byId("TableStock");
                        const oInnerTableStock = oStockTable.getMDCTable()._oTable;
                        MessageToast.show("Do Assemble completed.");
                        this._oDialogPezze.close();
                        oInnerTableStock.refreshItems();
                        oInnerTableStock.getBinding('items').refresh();
                        oInnerTableStock.removeSelections();

                        sap.ui.core.BusyIndicator.hide();
                    }).catch((oError, err, err1) => {
                        const oDialog = this._oDialogPezze;
                        if (oDialog && oDialog.getModel('selected')) {
                            oDialog.getModel('selected').setProperty('/submitCompleted', true);
                        }
                        MessageToast.show("Do Assemble error.");
                        console.error("Error", oError);
                        sap.ui.core.BusyIndicator.hide();
                    });
                }.bind(this)).catch((e) => {
                    console.warn("showMessageConfirm rejected:", e);
                    MessageToast.show("Do Assemble cancelled. " + JSON.stringify(e));
                });
            },
            pressWhereUsed: function (oEvent) {
                debugger
                //const obj = this.getBindingContext().getObject()
                const oContextOrders = JSON.parse(sessionStorage.getItem("selectedContextsOrders") || "[]"); //ordine selezionato
                const oContextComponent = JSON.parse(sessionStorage.getItem("selectedContextComponent") || "[]"); //componente selezionato
                const oModel = this.getOwnerComponent().getModel()

                const aOrders = Object.keys(oContextOrders)
                    .filter(key => !isNaN(key))
                    .map(key => oContextOrders[key]);

                const model = new JSONModel({
                    orders: aOrders,
                    ...oContextComponent
                });

                this.getView().setModel(model, "selectedWhereUsed");
                /*                const model = new JSONModel()
                               model.setData({ ...oContextOrders, ...oContextComponent })
               
                               this.getView().setModel(model, 'selectedWhereUsed'); */

                if (!this._fragmentWhereUsed) {
                    this._fragmentWhereUsed = this.loadFragment({
                        id: "fragmentPezze2",
                        name: "manageplannedorder.manageplannedorder.ext.fragment.WhereUsedAgg",
                        controller: this._controller
                    });
                }

                this._fragmentWhereUsed.then(function (dialog) {
                    this._oDialogWhereUsedAgg = dialog
                    dialog.setModel(model, 'selected');
                    dialog.setModel(oModel)

                    // const fakeTabella = dialog.getContent().at(-2);
                    const tabella = dialog.getContent().at(-1);

                    tabella.bindAggregation('items', {
                        path: '/ZZ1_CombPlnOrdersStockAPI',
                        filters: [
                            new sap.ui.model.Filter({
                                filters: (oContextOrders || [])
                                    .filter(o => o.CplndOrd)
                                    .map(o =>
                                        new sap.ui.model.Filter(
                                            "CplndOrd",
                                            sap.ui.model.FilterOperator.Contains,
                                            o.CplndOrd
                                        )
                                    ),
                                and: false
                            }), ,
                            new sap.ui.model.Filter("Material", sap.ui.model.FilterOperator.EQ, oContextComponent.Material),
                            new sap.ui.model.Filter("Plant", sap.ui.model.FilterOperator.EQ, oContextComponent.Plant),
                        ],
                        template: new sap.m.ColumnListItem({
                            cells: [
                                new sap.m.ObjectIdentifier({
                                    title: "{CplndOrd}"
                                }),
                                new sap.m.Text({
                                    text: "{AvailableQuantity}"
                                }),
                            ]
                        }),
                        templateShareable: true
                    });

                    const binding = tabella.getBinding('items');
                    binding.resetChanges()

                    dialog.open();
                }.bind(this));
            },
            pressDesassembly: function (oEvent) {
                debugger
                const id = 'fragmentPezze2--selectedItemsTableWhereUsedA';
                const selectedItems = this.getView().byId(id).getSelectedItems();
                const oModel = this.getOwnerComponent().getModel();
                const oSelectedWhereUsed = this.getView().getModel('selectedWhereUsed');
                console.log(oSelectedWhereUsed.getData());
                const aOrders = oSelectedWhereUsed.getProperty("/orders");

                // Create array for atpplo items
                //const atpplo = [];

                // Add the main CplndOrd with flag=false
                const atpplo = aOrders.map((order, index) => ({
                    id: String(index + 1),
                    fsh_cplnd_ord: order.CplndOrd,
                    flag: false
                }));

                // Add selected items with flag=true
                selectedItems.forEach((item) => {
                    const itemContext = item.getBindingContext();
                    if (itemContext) {
                        atpplo.push({
                            id: "1",
                            fsh_cplnd_ord: itemContext.getProperty("CplndOrd"),
                            flag: true
                        });
                    }
                });

                const uniqueAtpplo = atpplo.filter(
                    (item, index, self) =>
                        index === self.findIndex(t => t.fsh_cplnd_ord === item.fsh_cplnd_ord)
                );
                /*   uniqueAtpplo.forEach((item, index) => {
                      item.id = String(index + 1);
                  }); */
                // Prepare payload for the action
                const payload = {
                    id: "1",
                    atpplo: uniqueAtpplo
                };

                // Call the atpPlo action using AJAX
                this.showMessageConfirm("process ATP").then(() => {
                    // Get service URL from the model
                    const serviceUrl = oModel.sServiceUrl;

                    // Now make the actual call to the action
                    debugger;
                    var that = this;
                    jQuery.ajax({
                        url: serviceUrl + "atpPlo",
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ Payload: payload }),
                        headers: {
                            // "X-CSRF-Token": csrfToken,
                            "Accept": "application/json",
                            "Content-Type": "application/json"
                        },
                        success: function () {
                            debugger;
                            MessageToast.show("ATP Process completed successfully");
                            //sap.ui.getCore().byId('fragmentPezze2--_IDGenDialogWhereUsedA').close();
                            that._oDialogWhereUsedAgg.close()

                            const oMacroTable = that.byId("TableStock");
                            const oStockTable = oMacroTable.getMDCTable()._oTable;
                            oStockTable.refreshItems();
                            oStockTable.getBinding('items').refresh();
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            debugger;
                            MessageToast.show("ATP Process failed");
                            console.error("Error in ATP Process:", textStatus, errorThrown);
                        }
                    });
                }).catch(() => {
                    MessageToast.show("ATP Process cancelled");
                });
            },
            showMessageConfirm: function (action) {
                // capitalize the first letter of the action
                action = action.charAt(0).toUpperCase() + action.slice(1);
                return new Promise((res, rej) => MessageBox.confirm(
                    "Are you sure you want to " + action + "?",
                    {
                        title: "Confirmation",
                        onClose: function (oAction) {
                            if (oAction === MessageBox.Action.OK) res();
                            else rej();
                        }
                    }
                ));
            },
        });
    }
);