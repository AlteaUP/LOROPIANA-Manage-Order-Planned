sap.ui.define(
    [
        'sap/fe/core/PageController',
        'sap/ui/model/json/JSONModel',
        'sap/ui/model/Filter',
        'sap/ui/model/FilterOperator'
    ],
    function (PageController, JSONModel, Filter, FilterOperator) {
        'use strict';

        return PageController.extend('manageplannedorder.manageplannedorder.ext.main.Main', {
            /**
             * Called when a controller is instantiated and its View controls (if available) are already created.
             * Can be used to modify the View before it is displayed, to bind event handlers and do other one-time initialization.
             * @memberOf manageplannedorder.manageplannedorder.ext.main.Main
             */
            //  onInit: function () {
            //      PageController.prototype.onInit.apply(this, arguments); // needs to be called to properly initialize the page controller
            //  },

            /**
             * Similar to onAfterRendering, but this hook is invoked before the controller's View is re-rendered
             * (NOT before the first rendering! onInit() is used for that one!).
             * @memberOf manageplannedorder.manageplannedorder.ext.main.Main
             */
            //  onBeforeRendering: function() {
            //
            //  },

            /**
             * Called when the View has been rendered (so its HTML is part of the document). Post-rendering manipulations of the HTML could be done here.
             * This hook is the same one that SAPUI5 controls get after being rendered.
             * @memberOf manageplannedorder.manageplannedorder.ext.main.Main
             */
            //  onAfterRendering: function() {
            //
            //  },

            /**
             * Called when the Controller is destroyed. Use this one to free resources and finalize activities.
             * @memberOf manageplannedorder.manageplannedorder.ext.main.Main
             */
            //  onExit: function() {
            //
            //  }
            pressFragment: function (e) {
                debugger;
                const oTable = e.getSource().getParent().getParent().getParent()
                const selectedItems = oTable.getSelectedItems()
                const oModel = this.getOwnerComponent().getModel()
                const _selectedItems = []
                for (let i = 0; i < selectedItems.length; i++) {
                    const oObj = selectedItems[i].getBindingContext().getObject()
                    _selectedItems.push(oObj)
                }
                const model = new JSONModel()
                model.setData({ TypeOrder: 'antani', selectedItems: _selectedItems })

                if (!this._fragmentPezze) {
                    this._fragmentPezze = this.loadFragment({
                        id: "fragmentPezze",
                        name: "manageplannedorder.manageplannedorder.ext.fragment.Converti",
                        controller: this
                    });
                }

                this._fragmentPezze.then(function (dialog) {
                    // dialog.bindElement(`/ZZ1_MFP_ASSIGNMENT/(SAP_UUID='${obj.SAP_UUID}')`);
                    dialog.setModel(model, 'selected');
                    dialog.setModel(oModel)
                    const tabella = dialog.getContent().at(-1);
                    // { 
                    //     path: '/ZZ1_MFP_ASSIGNMENT',
                    //     parameters : { $$updateGroupId : 'CreatePezzeBatch' }
                    // }
                    // compose filter from selected items
                    const filters = []
                    _selectedItems.forEach((item) => {
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
                                new sap.m.Text({
                                    text: "{AUART}"
                                }),
                                new sap.m.Text({
                                    text: "{TOT_QTY}"
                                }),
                                new sap.m.Text({
                                    text: "{UNIT}"
                                })
                            ]
                        }),
                        templateShareable: true,
                        parameters: { $$updateGroupId: 'CreateConvertPLO' },
                    });

                    const binding = tabella.getBinding('items');
                    binding.resetChanges()

                    _selectedItems.forEach((item) => {

                        binding.create({
                            FSH_CPLND_ORD: item.CplndOrd,
                            AUART: item.AUART,
                            TOT_QTY: parseFloat(item.TotQty),
                            UNIT: item.Unit,
                        });
                    });
                    dialog.open();
                }.bind(this));
                // const oModel = this.getOwnerComponent().getModel();
                // const oList = oModel.bindList("/ConvertPLO");

                // const sGroupId = 'ConvertPLO';
                // oList.changeParameters({
                //     $$updateGroupId: sGroupId
                // });

                // const oTable = this.getView().byId('TableCombined')
                // const aSelectedContext = oTable.getSelectedContexts()

                // aSelectedContext.forEach(context => {
                //     const contextData = context.getObject();
                //     console.log(contextData);
                // });

                // oModel.submitBatch(sGroupId).then(() => {
                //     MessageToast.show("Do Assemble completed.");
                //     sap.ui.getCore().byId('fragmentPezze--_IDGenDialogPezze').close();
                //     oTableBinding.refresh(true);
                // }).catch((oError) => {
                //     MessageToast.show("Do Assemble error.");
                //     console.error("Error", oError);
                // });
            },
            onCloseDialog: function (oEvent) {
                const oDialog = oEvent.getSource().getParent();
                oDialog.close();
                oDialog.destroy();
            },
            doConvert: function (oEvent) {
                debugger;
            }
        });
    }
);
