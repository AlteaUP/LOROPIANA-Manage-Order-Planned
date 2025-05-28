sap.ui.define(
    [
        'sap/fe/core/PageController',
        'sap/ui/model/json/JSONModel',
        'sap/ui/model/Filter',
        'sap/ui/model/FilterOperator',
        "sap/m/MessageBox",
        "sap/m/MessageToast",
        "sap/ui/core/BusyIndicator"
    ],
    function (PageController, JSONModel, Filter, FilterOperator, MessageBox, MessageToast, BusyIndicator) {
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
                        id: "fragmentPezze",
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
            onCloseDialog: function (oEvent) {
                const oDialog = oEvent.getSource().getParent();
                oDialog.close();
                // oDialog.destroy();
            },
            doConvert: function (oEvent) {
                const oModel = this.getOwnerComponent().getModel();
                // const oTable = sap.ui.getCore().byId('manageplannedorder.manageplannedorder::ZZ1_CombinedPlnOrdersAPIMain--fragmentPezze--selectedItemsTableCombined');
                // const oTableBinding = oTable.getBinding("items");

                const oMainTable = sap.ui.getCore().byId('manageplannedorder.manageplannedorder::ZZ1_CombinedPlnOrdersAPIMain--TableCombined-content');
                const oMainTableBinding = oMainTable._oTable.getBinding('items')

                this.showMessageConfirm("convert").then(function () {
                    MessageToast.show("Do Convert invoked.");

                    BusyIndicator.show(0);
                    debugger;
                    oModel.submitBatch("CreateConvertPLO").then(function (e) {
                        console.log("Convert response", e);
                        MessageToast.show("Do Convert completed.");
                        sap.ui.getCore().byId('manageplannedorder.manageplannedorder::ZZ1_CombinedPlnOrdersAPIMain--fragmentPezze--_IDGenDialogConversion').close();
                        BusyIndicator.hide();
                        oMainTableBinding.refresh();
                    }.bind(this)).catch((oError) => {
                        MessageToast.show("Do Convert error.");
                        console.error("Error", oError);
                        BusyIndicator.hide();
                    });
                }.bind(this)).catch((e) => {
                    MessageToast.show("Do Convert cancelled. " + JSON.stringify(e));
                });
            },
            formattaQty: function (value) {
                console.log(value)
                const _value = value.replace(',', '.')
                return _value
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

            }
        });
    }
);
