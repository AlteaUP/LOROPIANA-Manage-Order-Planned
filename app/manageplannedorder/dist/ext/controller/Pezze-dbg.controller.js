sap.ui.define([
  "sap/m/MessageToast",
  "sap/m/MessageBox",
  "sap/ui/model/Context",
  "jquery.sap.global",
  "sap/ui/core/BusyIndicator"
], function (MessageToast, MessageBox, Context, jQuery, BusyIndicator) {
  'use strict';

  return {
    onInit: function () {
      console.log('Pezze controller initialized');
      const idTable = 'manageplannedorder.manageplannedorder::ZZ1_CombinedPlnOrdersAPI_to_CombinPlannedOrdersComObjectPage--fe::table::to_ZZ1_CombPlnOrdersStock::LineItem::Stock-innerTable';
      const oTable = sap.ui.getCore().byId(idTable);
      oTable.setGrowing(false);
      oTable.attachItemPress(function (oEvent) {
        console.log("Item pressed:", oEvent);
      }, this);

      oTable.attachSelectionChange(function (oEvent) {
        console.log("Selection changed:", oEvent);
        const idTable = 'manageplannedorder.manageplannedorder::ZZ1_CombinedPlnOrdersAPI_to_CombinPlannedOrdersComObjectPage--fe::table::to_ZZ1_CombPlnOrdersStock::LineItem::Stock-innerTable';
        const oTable = sap.ui.getCore().byId(idTable);
        oEvent.preventDefault();
        const oContext = oEvent.getParameter('listItem');
        // const selected = oEvent.getParameter('selected')
        const highlight = oContext.getHighlight()
        // se highlight === 'Success' permetto la selezione altrimenti no
        // if (!selected) return
        // if (highlight === 'Success') {
        //   oContext.setSelected(true);
        // } else {
        //   debugger;
        //   oContext.setSelected(false);
        //   oTable.removeSelections();
        //   MessageToast.show("Item not selectable");
        // }
        if (highlight === 'Error') {
          setTimeout(() => {
            oTable.removeSelections(); // Rimuove selezione visiva
            // Rimuove il context anche dalla lista effettiva
            const oBinding = oTable.getBinding("items");
            if (oBinding && oBinding.getContexts) {
              oTable.setSelectedItem(null); // forza aggiornamento
              // remove all selected items
              // const selectedItems = oTable.getSelectedItems();
              // selectedItems.forEach((item) => {
              //   const oContext = item.getBindingContext();
              //   if (oContext) {
              //     oTableBinding.removeItem(oContext);
              //   }
              // });
            }
            sap.m.MessageToast.show("Item not selectable");
          }, 0);
        }
      }, this);

      oTable.attachUpdateFinished(function (oEvent) {
        console.log("Update finished:", oEvent);
        const idTable = oEvent.getParameter('id');
        const oTable = sap.ui.getCore().byId(idTable)
        const aItems = oTable.getItems()
        aItems.forEach((item) => {
          const oContext = item.getBindingContext().getObject();
          const { AvaibilityQty, CombPlanAllQty } = oContext;

          let highlight = 'Success';
          let highlightText = 'Stock available';

          if (parseFloat(AvaibilityQty) === 0 && parseFloat(CombPlanAllQty) === 0) {
            highlight = 'Error';
            highlightText = 'No stock available';
          }
          // else if (parseFloat(AvaibilityQty) === 0 && parseFloat(CombPlanAllQty) > 0) {
          //   highlight = 'Warning';
          //   highlightText = 'Stock available but not enough';
          // }
          else if (parseFloat(AvaibilityQty) > 0 && parseFloat(CombPlanAllQty) === 0) {
            highlight = 'None';
            highlightText = '';
          }

          item.setHighlight(highlight);
          item.setHighlightText(highlightText)
        });
      }, this);
      // attach data retrieve
      // oTable.getBinding("items").attachDataReceived(function (oEvent) {
      //   console.log("Data received:", oEvent);
      //   debugger;
      // });
    },
    onAfterRendering: function () {
      console.log('Pezze controller after rendering');
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
    doAssign: function (oEvent) {
      const oModel = this.getOwnerComponent().getModel();
      const oTable = sap.ui.getCore().byId('fragmentPezze--selectedItemsTable');
      const oTableBinding = oTable.getBinding("items");

      this.showMessageConfirm("assign").then(function () {
        BusyIndicator.show(0);
        oModel.submitBatch("CreatePezzeBatch").then((a, b, c) => {
          const oStockTable = sap.ui.getCore().byId('manageplannedorder.manageplannedorder::ZZ1_CombinedPlnOrdersAPI_to_CombinPlannedOrdersComObjectPage--fe::table::to_ZZ1_CombPlnOrdersStock::LineItem::Stock-innerTable');
          MessageToast.show("Do Assemble completed.");
          sap.ui.getCore().byId('fragmentPezze--_IDGenDialogPezze').close();
          oStockTable.refreshItems();
          oStockTable.getBinding('items').refresh()
          // remove all selected items
          oStockTable.removeSelections();
          // refresh header facet
          const oDataPoint = sap.ui.getCore().byId('manageplannedorder.manageplannedorder::ZZ1_CombinedPlnOrdersAPI_to_CombinPlannedOrdersComObjectPage--fe::HeaderFacet::KeyFigure::TotalProdAllQty');
          oDataPoint.getBindingContext().refresh();
          // const selectedItems = oStockTable.getSelectedItems();
          // selectedItems.forEach((item) => {
          //   const oContext = item.getBindingContext();
          //   if (oContext) {
          //     oTableBinding.removeItem(oContext);
          //   }
          // });
          BusyIndicator.hide();
        }).catch((oError, err, err1) => {
          MessageToast.show("Do Assemble error.");
          console.error("Error", oError);
          BusyIndicator.hide();
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
      const selectedItems = sap.ui.getCore().byId(id).getSelectedItems();
      const oModel = this.getOwnerComponent().getModel();
      const oSelectedWhereUsed = this.getView().getModel('selectedWhereUsed');
      const mainCplndOrd = oSelectedWhereUsed.getProperty("/CplndOrd");

      // Create array for atpplo items
      const atpplo = [];

      // Add the main CplndOrd with flag=false
      atpplo.push({
        id: "1",
        fsh_cplnd_ord: mainCplndOrd,
        flag: false
      });

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

      // Prepare payload for the action
      const payload = {
        id: "1",
        atpplo: atpplo
      };

      // Call the atpPlo action using AJAX
      this.showMessageConfirm("process ATP").then(() => {
        // Get service URL from the model
        const serviceUrl = oModel.sServiceUrl;

        // First get CSRF token
        // jQuery.ajax({
        //   url: serviceUrl,
        //   type: "GET",
        //   headers: {
        //     "X-CSRF-Token": "Fetch",
        //     "Accept": "application/json"
        //   },
        //   success: function (data, textStatus, jqXHR) {
        //     const csrfToken = jqXHR.getResponseHeader("X-CSRF-Token");

        // Now make the actual call to the action
        debugger;
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
            sap.ui.getCore().byId('fragmentPezze--_IDGenDialogWhereUsed').close();

            const oStockTable = sap.ui.getCore().byId('manageplannedorder.manageplannedorder::ZZ1_CombinedPlnOrdersAPI_to_CombinPlannedOrdersComObjectPage--fe::table::to_ZZ1_CombPlnOrdersStock::LineItem::Stock-innerTable');
            oStockTable.refreshItems();
            oStockTable.getBinding('items').refresh();

            // refresh header facet
            const oDataPoint = sap.ui.getCore().byId('manageplannedorder.manageplannedorder::ZZ1_CombinedPlnOrdersAPI_to_CombinPlannedOrdersComObjectPage--fe::HeaderFacet::KeyFigure::TotalProdAllQty');
            oDataPoint.getBindingContext().refresh();
          },
          error: function (jqXHR, textStatus, errorThrown) {
            debugger;
            MessageToast.show("ATP Process failed");
            console.error("Error in ATP Process:", textStatus, errorThrown);
          }
        });
        //   },
        //   error: function (jqXHR, textStatus, errorThrown) {
        //     MessageToast.show("Failed to fetch CSRF token");
        //     console.error("CSRF Token Error:", textStatus, errorThrown);
        //   }
        // });
      }).catch(() => {
        MessageToast.show("ATP Process cancelled");
      });
    }
  };
});
