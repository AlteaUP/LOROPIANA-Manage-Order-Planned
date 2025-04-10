sap.ui.define([
    "sap/ui/model/json/JSONModel",
    "sap/m/MessageToast",
    "sap/m/MessageBox",
    "sap/ui/core/BusyIndicator"
], function (JSONModel, MessageToast, MessageBox, BusyIndicator) {
    'use strict';

    return {
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
        doAssegnaPezze: function (oEvent) {
            const id = "manageplannedorder.manageplannedorder::ZZ1_CombinedPlnOrdersAPI_to_CombinPlannedOrdersComObjectPage--fe::table::to_ZZ1_CombPlnOrdersStock::LineItem::Stock-innerTable"
            const obj = this.getBindingContext().getObject()
            const selectedItems = this._view.byId(id).getSelectedItems()
            const oModel = this._controller.getOwnerComponent().getModel()
            const _selectedItems = []
            for (let i = 0; i < selectedItems.length; i++) {
                const oObj = selectedItems[i].getBindingContext().getObject()
                _selectedItems.push(oObj)
            }
            const model = new JSONModel()
            model.setData({ ...obj, selectedItems: _selectedItems })

            if (!this._fragmentPezze) {
                this._fragmentPezze = this.loadFragment({
                    id: "fragmentPezze",
                    name: "manageplannedorder.manageplannedorder.ext.fragment.Pezze",
                    controller: this._controller
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
                tabella.bindAggregation('items', {
                    path: '/ZZ1_MFP_ASSIGNMENT',
                    filters: [
                        new sap.ui.model.Filter("FSH_MPLO_ORD", sap.ui.model.FilterOperator.EQ, obj.CplndOrd),
                        new sap.ui.model.Filter("MATNR", sap.ui.model.FilterOperator.EQ, obj.Material)
                    ],
                    template: new sap.m.ColumnListItem({
                        cells: [
                            new sap.m.ObjectIdentifier({
                                title: "{CHARG}"
                            }),
                            new sap.m.Text({
                                text: "{MATNR}"
                            }),
                            new sap.m.Text({
                                text: "{LGORT}"
                            }),
                            new sap.m.Text({
                                text: "{AvaibilityQty}"
                            }),
                            new sap.m.Input({
                                value: "{QTA_ASS_V}"
                            })
                        ]
                    }),
                    templateShareable: true,
                    parameters: { $$updateGroupId: 'CreatePezzeBatch' },
                });

                const binding = tabella.getBinding('items');
                binding.resetChanges()

                _selectedItems.forEach((item) => {

                    binding.create({
                        "SAP_UUID": crypto.randomUUID(),
                        "WERKS": item.Plant,
                        "LGORT": item.StorageLocation,
                        "FSH_MPLO_ORD": obj.CplndOrd,
                        "BAGNI": item.dye_lot || "antani",
                        "MATNR": item.Material,
                        "CHARG": item.Batch,
                        "Bagno": item.dye_lot,
                        "QTA_ASS_V": 0,
                        "QTA_ASS_U": "",
                        "QTA_ASS_U_Text": "",
                        "FABB_TOT_V": item.AvaibilityQty || 0,
                        "FABB_TOT_U": "",
                        "FABB_TOT_U_Text": "",
                        "COPERTURA": 0,
                        "SORT": 0,
                        "SAP_CreatedDateTime": new Date(),
                        "SAP_CreatedByUser": "LASPATAS",
                        "SAP_CreatedByUser_Text": "",
                        "SAP_LastChangedDateTime": new Date(),
                        "SAP_LastChangedByUser": "LASPATAS",
                        "SAP_LastChangedByUser_Text": ""
                    });
                });

                dialog.open();
            }.bind(this));
        },
        doDisassignPezze: async function (oEvent) {
            const obj = this.getBindingContext().getObject()
            const oModel = this._controller.getOwnerComponent().getModel();

            const oList = oModel.bindList("/ZZ1_MFP_ASSIGNMENT");
            const filterCombined = new sap.ui.model.Filter("FSH_MPLO_ORD", sap.ui.model.FilterOperator.EQ, obj.CplndOrd)
            const filterMatnr = new sap.ui.model.Filter("MATNR", sap.ui.model.FilterOperator.EQ, obj.Material)
            oList.filter([filterCombined, filterMatnr]);

            BusyIndicator.show(0);

            const pContexts = await oList.requestContexts(0, 20)
            const aContexts = pContexts.map(oContext => oContext)

            if (!aContexts.length) {
                MessageToast.show("No items to disassemble.");
                BusyIndicator.hide(0);
                return;
            }

            try {
                await this._controller.showMessageConfirm(`disassemble (${aContexts.length})`)
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
            if (!oData)
                MessageToast.show("Disassemble completed successfully.");
            else
                MessageToast.show("Disassemble failed.");

        },
        doWhereUsed: function (oEvent) {
            sap.m.MessageToast.show("Custom handler invoked. [WHERE USED]");
            const id = "manageplannedorder.manageplannedorder::ZZ1_CombinedPlnOrdersAPI_to_CombinPlannedOrdersComObjectPage--fe::table::to_ZZ1_CombPlnOrdersStock::LineItem::Stock-innerTable"
            const obj = this.getBindingContext().getObject()
            const selectedItems = this._view.byId(id).getSelectedItems()
            const oModel = this._controller.getOwnerComponent().getModel()
            const _selectedItems = []
            for (let i = 0; i < selectedItems.length; i++) {
                const oObj = selectedItems[i].getBindingContext().getObject()
                _selectedItems.push(oObj)
            }
            const model = new JSONModel()
            model.setData({ ...obj, selectedItems: _selectedItems })

            if (!this._fragmentPezze) {
                this._fragmentPezze = this.loadFragment({
                    id: "fragmentPezze",
                    name: "manageplannedorder.manageplannedorder.ext.fragment.WhereUsed",
                    controller: this._controller
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
                tabella.bindAggregation('items', {
                    path: '/ZZ1_CombPlnOrdersStockAPI',
                    filters: [
                        new sap.ui.model.Filter("CplndOrd", sap.ui.model.FilterOperator.EQ, obj.CplndOrd),
                        new sap.ui.model.Filter("Material", sap.ui.model.FilterOperator.EQ, obj.Material),
                        new sap.ui.model.Filter("Plant", sap.ui.model.FilterOperator.EQ, obj.Plant),
                    ],
                    template: new sap.m.ColumnListItem({
                        cells: [
                            new sap.m.ObjectIdentifier({
                                title: "{CplndOrd}"
                            }),
                            new sap.m.Text({
                                text: "{Material}"
                            }),
                            new sap.m.Text({
                                text: "{Plant}"
                            }),
                            new sap.m.Text({
                                text: "{StorageLocation}"
                            }),
                        ]
                    }),
                    templateShareable: true,
                    parameters: { $$updateGroupId: 'CreatePezzeBatch' },
                });

                const binding = tabella.getBinding('items');
                binding.resetChanges()

                _selectedItems.forEach((item) => {

                    binding.create({
                        "SAP_UUID": crypto.randomUUID(),
                        "WERKS": item.Plant,
                        "LGORT": item.StorageLocation,
                        "FSH_MPLO_ORD": obj.CplndOrd,
                        "BAGNI": item.dye_lot || "antani",
                        "MATNR": item.Material,
                        "CHARG": item.Batch,
                        "Bagno": item.dye_lot,
                        "QTA_ASS_V": 0,
                        "QTA_ASS_U": "",
                        "QTA_ASS_U_Text": "",
                        "FABB_TOT_V": item.AvaibilityQty || 0,
                        "FABB_TOT_U": "",
                        "FABB_TOT_U_Text": "",
                        "COPERTURA": 0,
                        "SORT": 0,
                        "SAP_CreatedDateTime": new Date(),
                        "SAP_CreatedByUser": "LASPATAS",
                        "SAP_CreatedByUser_Text": "",
                        "SAP_LastChangedDateTime": new Date(),
                        "SAP_LastChangedByUser": "LASPATAS",
                        "SAP_LastChangedByUser_Text": ""
                    });
                });

                dialog.open();
            }.bind(this));
        },
        onCloseDialog: function (oEvent) {
            const dialog = oEvent.getSource().getParent();
            dialog.close();
            // dialog.destroy();
        }
    };
});
