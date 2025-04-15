sap.ui.define([
  "sap/m/MessageToast",
  "sap/m/MessageBox",
  "sap/ui/model/Context"
], function (MessageToast, MessageBox, Context) {
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
            if (oAction === MessageBox.Action.OK) res();
            else rej();
          }
        }
      ));
    },
    doAssign: function (oEvent) {
      const oModel = this.getOwnerComponent().getModel();
      const oTable = sap.ui.getCore().byId('fragmentPezze--selectedItemsTable');
      const oTableBinding = oTable.getBinding("items");

      this.showMessageConfirm("assign").then(function () {
        MessageToast.show("Do Assemble invoked.");
        oModel.submitBatch("CreatePezzeBatch").then(() => {
          MessageToast.show("Do Assemble completed.");
          sap.ui.getCore().byId('fragmentPezze--_IDGenDialogPezze').close();
          oTableBinding.refresh(true);
        }).catch((oError) => {
          MessageToast.show("Do Assemble error.");
          console.error("Error", oError);
        });
      }.bind(this)).catch((e) => {
        MessageToast.show("Do Assemble cancelled. " + JSON.stringify(e));
      });
    },
    onCloseDialog: function (oEvent) {
      const dialog = oEvent.getSource().getParent();
      dialog.close();
    },
    formatAvailableQty: function (sValue) {
      if (!sValue) return 0
      return parseInt(sValue)
    },
    formatCustomQty: function (sValue) {
      return parseInt(sValue)
    },
    formatAvaibilityQty: function (sValue) {
      debugger;
      return sValue
    }
  }
});
