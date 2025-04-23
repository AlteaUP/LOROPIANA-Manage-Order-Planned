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
    },
    onBeforeRebindTable: function (oEvent) {
      // var oSmartTable = oEvent.getSource();
      // debugger;
      // const data = this.getView().getModel('selectedPezze').getData()
      // selectedItems.forEach((item) => {
      //   const oBinding = oSmartTable.getTable().getBinding("items");
      //   const oFilter = new sap.ui.model.Filter("SAP_UUID", sap.ui.model.FilterOperator.EQ, item.SAP_UUID);
      //   oBinding.filter([oFilter]);
      // });
      // oSmartTable.applyVariant(
      //   {
      //     filter: {
      //       filterItems: [{
      //         columnKey: "YourSelectedColumn",
      //         exclude: false,
      //         operation: "EQ",
      //         value1: "SomeEnteredValue",
      //         value2: ""
      //       }]
      //     }
      //   }

      // );


    },
    onDesassembly: function () {

      const id = 'fragmentPezze--selectedItemsTableWhereUsed';
      const idFake = 'fragmentPezze--selectedItemsTableWhereUsedFake';
      const fakeTableInsert = sap.ui.getCore().byId(idFake);
      const binding = fakeTableInsert.getBinding("items");
      const selectedItems = sap.ui.getCore().byId(id).getSelectedItems()
      const oModel = this.getOwnerComponent().getModel();
      const oSelectedWhereUsed = this.getView().getModel('selectedWhereUsed');
      const CplndOrd = oSelectedWhereUsed.getProperty("/CplndOrd");

      binding.create({
        fsh_cplnd_ord: CplndOrd,
        flag: false
      })

      selectedItems.forEach((item) => {
        binding.create({
          fsh_cplnd_ord: item.getBindingContext().getProperty("CplndOrd"),
          flag: true
        })
      });

      oModel.submitBatch("CreateWhereUsedBatch").then(() => {
        MessageToast.show("Do Desassembly completed.");
        sap.ui.getCore().byId('fragmentPezze--_IDGenDialogWhereUsed').close();
        binding.refresh(true);
      }).catch((oError) => {
        MessageToast.show("Do Desassembly error.");
        console.error("Error", oError);
      });
    }
  }
});
