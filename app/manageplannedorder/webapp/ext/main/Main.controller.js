sap.ui.define(
    [
        'sap/fe/core/PageController',
        'sap/ui/model/json/JSONModel',
        'sap/ui/model/Filter',
        'sap/ui/model/FilterOperator',
        "sap/m/MessageBox",
        "sap/m/MessageToast",
        "sap/ui/core/Fragment",
        "sap/ui/core/BusyIndicator",
        "sap/ui/mdc/condition/Condition"
    ],
    function (PageController, JSONModel, Filter, FilterOperator, MessageBox, MessageToast, BusyIndicator, Condition) {
        'use strict';

        return PageController.extend('manageplannedorder.manageplannedorder.ext.main.Main', {
            onInit: function () { },
            showMessageConfirm: function (action) {
                // capitalize the first letter of the action
                action = action.charAt(0).toUpperCase() + action.slice(1);
                return new Promise((res, rej) => MessageBox.confirm(
                    "Are you sure you want to " + action + "?",
                    {
                        title: "Confirmation",
                        onClose: function (oAction) {
                            if (oAction === MessageBox.Action.OK)
                                res();
                            else
                                rej();
                        }
                    }
                ));
            },
            pressFragment: function (e) {
                debugger;
                const idTable = e.getParameter('id').split('::').slice(0, -2).join("::")
                const oTable = sap.ui.getCore().byId(idTable)._oTable;
                // remove latest element

                const selectedItems = oTable.getSelectedItems()
                if (selectedItems.length === 0) {
                    MessageToast.show("Select at least one item");
                    return;
                }
                const oModel = this.getOwnerComponent().getModel()
                const _selectedItems = []
                for (let i = 0; i < selectedItems.length; i++) {
                    const oObj = selectedItems[i].getBindingContext().getObject()
                    _selectedItems.push(oObj)
                }
                const model = new JSONModel()
                model.setData({ TypeOrder: 'Z300', selectedItems: _selectedItems })

                if (!this._fragmentConvert) {
                    this._fragmentConvert = this.loadFragment({
                        id: "fragmentConverti",
                        name: "manageplannedorder.manageplannedorder.ext.fragment.Converti",
                        controller: this
                    });
                }

                this._fragmentConvert.then(function (dialog) {
                    dialog.setModel(model, 'selected');
                    dialog.setModel(oModel)
                    const tabella = dialog.getContent().at(-1);

                    const filters = []
                    _selectedItems.forEach((item) => {
                        if (!item) return;
                        const filter = new Filter("FSH_CPLND_ORD", FilterOperator.EQ, item.CplndOrd)
                        filters.push(filter)
                    })

                    tabella.bindAggregation('items', {
                        path: '/ConvertPLO',
                        filters,
                        template: new sap.m.ColumnListItem({
                            cells: [
                                new sap.m.ObjectIdentifier({
                                    title: "{FSH_CPLND_ORD}"
                                }),
                                new sap.m.ObjectIdentifier({
                                    title: "{CrossPlantConfigurableProduct}"
                                }),
                                new sap.m.Text({
                                    text: "{AUART}"
                                }),
                                new sap.m.Input({
                                    value: "{TOT_QTY}"
                                }),
                                new sap.m.ObjectIdentifier({
                                    title: "{PlannedTotalQtyInBaseUnit}"
                                }),
                                new sap.m.Text({
                                    text: "{UNIT}"
                                })
                            ]
                        }),
                        parameters: { $$updateGroupId: 'CreateConvertPLO' },
                    });

                    const binding = tabella.getBinding('items');
                    binding.resetChanges()

                    _selectedItems.forEach((item) => {
                        binding.create({
                            FSH_CPLND_ORD: item.CplndOrd,
                            AUART: "Z300",
                            TOT_QTY: item.PlndOrderCommittedQty.toString(), //  33,
                            UNIT: "EA",
                            PlannedTotalQtyInBaseUnit: item.PlannedTotalQtyInBaseUnit,
                            CrossPlantConfigurableProduct: item.CrossPlantConfigurableProduct,
                        });
                    });

                    dialog.attachEventOnce('afterOpen', function () {
                        const oInput = sap.ui.getCore().byId('manageplannedorder.manageplannedorder::ZZ1_CombinedPlnOrdersAPIMain--fragmentPezze--inputTypeOrder');
                        if (oInput) {
                            oInput.focus();
                            oInput.attachLiveChange(this.onTypeOrderLiveChange.bind(this));
                        }
                    }.bind(this));

                    dialog.open();
                }.bind(this));
            },
            pressComponenti: async function (e) {
                debugger
                try {
                    const aSelectedContexts = this.byId("TableCombined").getSelectedContexts();
                    if (aSelectedContexts.length <= 1) {
                        MessageToast.show("Select at least two item");
                        return;
                    }
                    const _oContext = [];
                    const aKeys = aSelectedContexts.map(ctx => {
                        const o = ctx.getObject();
                        _oContext.push(o);
                        return `CplndOrd=${o.CplndOrd},CrossPlantConfigurableProduct='${o.CrossPlantConfigurableProduct}'`;
                    });

                    sessionStorage.setItem("selectedOrders", JSON.stringify(aKeys));
                    sessionStorage.setItem("selectedContextsOrders", JSON.stringify(_oContext));
                    const oComponent = this.getOwnerComponent().getExtensionComponent();
                    const oRouter = oComponent.getRouter();
                    oRouter.navTo("ComponentsPage");

                } catch (err) {
                    console.error("Errore", err);
                }
            },
            pressFissazione: async function (oEvent) {
                debugger;
                const oMacroTable = this.byId("TableCombined");

                sap.ui.core.BusyIndicator.show(0);

                const oModel = this.getOwnerComponent().getModel();
                const aSelectedContexts = this.byId("TableCombined").getSelectedContexts();

                if (aSelectedContexts.length === 0) {
                    sap.ui.core.BusyIndicator.hide();
                    MessageToast.show("Select at least one item");
                    return;
                }

                let _oContext = [];
                for (let i = 0; i < aSelectedContexts.length; i++) {
                    const oObj = aSelectedContexts[i].getObject()
                    _oContext.push(oObj)
                }

                const payload = {
                    CplndOrd: _oContext.map(item => item.CplndOrd)
                };

                const oCtx = oModel.bindContext("/Fissazione(...)");
                oCtx.setParameter("Payload", payload);

                try {
                    await oCtx.execute();
                    const oBinding = oMacroTable.getRowBinding();

                    if (oBinding?.isA("sap.ui.model.odata.v4.ODataListBinding")) {
                        await oBinding.refresh();

                        const oInnerTable = oMacroTable.getAggregation("content")._oTable;
                        oInnerTable.removeSelections(true);
                    }
                } catch (err) {
                    console.error(err);
                } finally {
                    sap.ui.core.BusyIndicator.hide();
                }
            },
            doConvert: function (oEvent) {
                debugger
                const oModel = this.getOwnerComponent().getModel();
                const oDialogConvert = this.getView().byId('fragmentConverti--_IDGenDialogConversion');
                // const oTable = sap.ui.getCore().byId('manageplannedorder.manageplannedorder::ZZ1_CombinedPlnOrdersAPIMain--fragmentPezze--selectedItemsTableCombined');
                // const oTableBinding = oTable.getBinding("items");
                const oTable = this.getView().byId('fragmentConverti--selectedItemsTableCombined');
                const binding = oTable.getBinding('items');
                const contexts = binding.getContexts();

                const rows = contexts
                    .map(ctx => ({ ctx, obj: ctx.getObject() }));

                const oMainTable = sap.ui.getCore().byId('manageplannedorder.manageplannedorder::ZZ1_CombinedPlnOrdersAPIMain--TableCombined-content');
                const oMainTableBinding = oMainTable._oTable.getBinding('items')

                this.showMessageConfirm("convert").then(function () {
                    MessageToast.show("Do Convert invoked.");
                    sap.ui.core.BusyIndicator.show(0);
                    oModel.submitBatch("CreateConvertPLO").then(function (e) {
                        console.log("Convert response", e);
                        MessageToast.show("Do Convert completed.");
                        //sap.ui.getCore().byId('manageplannedorder.manageplannedorder::ZZ1_CombinedPlnOrdersAPIMain--fragmentPezze--_IDGenDialogConversion').close();
                        sap.ui.core.BusyIndicator.hide();
                        oDialogConvert.close();
                        oMainTableBinding.refresh();
                    }.bind(this)).catch((oError) => {
                        sap.ui.core.BusyIndicator.hide();
                        MessageToast.show("Do Convert error.");
                        console.error("Error", oError);
                    });
                }.bind(this)).catch((e) => {
                    sap.ui.core.BusyIndicator.hide();
                    MessageToast.show("Do Convert cancelled. " + JSON.stringify(e));
                });
            },
            formattaQty: function (value) {
                console.log(value)
                const _value = value.replace(',', '.')
                return _value
            },
            onCloseDialog: function (oEvent) {
                const oDialog = oEvent.getSource().getParent();
                oDialog.close();
                // oDialog.destroy();
            },
            onTypeOrderLiveChange: function (oEvent) {
                console.log("onTypeOrderLiveChange", oEvent);
                // change the type of order to for each selected item
                const oTable = sap.ui.getCore().byId('manageplannedorder.manageplannedorder::ZZ1_CombinedPlnOrdersAPIMain--fragmentPezze--selectedItemsTableCombined');
                const oBinding = oTable.getBinding('items');
                // set AWART property to the value of the input
                const value = oEvent.getParameter('value');
                oBinding.getContexts().forEach(function (oContext) {
                    if (oContext) {
                        oContext.setProperty('AUART', value);
                    }
                });

            },
            onRowPress: function (oEvn) {

            },
            _findMdcFilterBar: function () {
                const a = this.getView().findAggregatedObjects(true, (c) => c.isA && c.isA("sap.ui.mdc.FilterBar"));
                return a && a.length ? a[0] : null;
            },

            _getConditions: function (oFB) {
                if (oFB.getFilterConditions) return oFB.getFilterConditions();
                if (oFB.getConditions) return oFB.getConditions();
                return {};
            },

            _setConditions: function (oFB, mCond) {
                if (oFB.setFilterConditions) return oFB.setFilterConditions(mCond);
                if (oFB.setConditions) return oFB.setConditions(mCond);
            },
            //gestione filtro fullCycle
            onFullCycleSelect: function (oEvent) {
                debugger;
                const oClicked = oEvent.getSource();
                const bSelected = oEvent.getParameter("selected");
                const sText = oClicked.getText(); // "Sì" / "No"

                const aItems = oClicked.getParent().getItems();
                const oYes = aItems.find(i => i.getText && i.getText() === "Sì");
                const oNo = aItems.find(i => i.getText && i.getText() === "No");

                if (bSelected) {
                    if (sText === "Sì" && oNo) oNo.setSelected(false);
                    if (sText === "No" && oYes) oYes.setSelected(false);
                }

                const bYes = oYes ? oYes.getSelected() : false;
                const bNo = oNo ? oNo.getSelected() : false;

                let sVal = "";
                if (bYes) sVal = "Y";
                else if (bNo) sVal = "N";

                // FilterBar FE
                //const oView = this.getView();
                const oFB = this._findMdcFilterBar();
                if (!oFB) {
                    console.error("MDC FilterBar non trovata");
                    return;
                }

                const mCond = this._getConditions(oFB);

                if (!sVal) {
                    delete mCond.FullCycleFilter;
                } else {
                    mCond.FullCycleFilter = [{
                        operator: "EQ",
                        values: [sVal],
                        validated: "NotValidated"
                    }];
                }

                this._setConditions(oFB, mCond);

                console.log("COND KEYS:", Object.keys(this._getConditions(oFB)));
            }
        });
    }
);
