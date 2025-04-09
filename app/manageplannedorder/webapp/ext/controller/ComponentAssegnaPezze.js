

sap.ui.define([
    "sap/ui/model/json/JSONModel",
    "sap/m/MessageToast",
    "sap/m/MessageBox"
], function (JSONModel, MessageToast, MessageBox) {
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
            console.log("Selected Items", obj)
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
                const binding = tabella.getBinding('items');
                binding.resetChanges()
                _selectedItems.forEach((item) => {
                    binding.create({
                        "SAP_UUID": crypto.randomUUID(), // "",//"00505699-bc7f-1fe0-80fd-bde5ce682408",
                        "WERKS": item.Plant, //"PF10",
                        "LGORT": item.StorageLocation,//"H1RP"
                        "FSH_MPLO_ORD": obj.CplndOrd, //"25",
                        "BAGNI": item.dye_lot || "antani",//item.dye_lot,//"A0",
                        "MATNR": item.Material,//"1000360",
                        "CHARG": item.Batch,//"1000360",
                        "Bagno": item.dye_lot,//"A1",
                        "QTA_ASS_V": 0,
                        "QTA_ASS_U": "",
                        "QTA_ASS_U_Text": "",
                        "FABB_TOT_V": item.AvaibilityQty || 0, // "",
                        "FABB_TOT_U": "",
                        "FABB_TOT_U_Text": "",
                        "COPERTURA": 0,
                        "SORT": 0,
                        "SAP_CreatedDateTime": new Date(), // "",
                        "SAP_CreatedByUser": "LASPATAS",//this._controller.getCurrentUser(),
                        "SAP_CreatedByUser_Text": "",
                        "SAP_LastChangedDateTime": new Date(), // "",
                        "SAP_LastChangedByUser": "LASPATAS",
                        "SAP_LastChangedByUser_Text": ""
                    });
                });

                dialog.open();
            }.bind(this));
        },
        doDisassignPezze: function (oEvent) {
            // const oOwnComponent = this._controller.getOwnerComponent();
            // const oModel = oOwnComponent.getModel();
            var URL = this._controller._mainService.sServiceUrl;
            this._controller.showMessageConfirm("disassemble").then(() => {
                MessageToast.show("Do Disassemble invoked.");
                // @ts-ignore
                $.ajax({
                    url: URL + "/disassemble",
                    type: "POST",
                    data: JSON.stringify({}),
                    //data: dataToSend,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (data) {
                        console.log("Success", data);
                        MessageToast.show("Disassemble invoked.");
                    },
                    error: function (error) {
                        console.log("Error", error);
                        MessageToast.show("Error Disassemble.");
                    }
                });
            }
            ).catch(() => {
                MessageToast.show("Do Disassemble cancelled.");
            });
        },
        doWhereUsed: function (oEvent) {
            sap.m.MessageToast.show("Custom handler invoked. [WHERE USED]");
        },
        onCloseDialog: function (oEvent) {
            const dialog = oEvent.getSource().getParent();
            dialog.close();
            // dialog.destroy();
        }
    };
});
