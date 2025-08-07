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
      debugger;
      const model = new JSONModel()
      const id = "manageplannedorder.manageplannedorder::ZZ1_CombinedPlnOrdersAPI_to_CombinPlannedOrdersComObjectPage--fe::table::to_ZZ1_CombPlnOrdersStock::LineItem::Stock-innerTable"
      const obj = this.getBindingContext().getObject()
      const selectedItems = this._view.byId(id).getSelectedItems()
      const oModel = this._controller.getOwnerComponent().getModel()
      const _selectedItems = []
      // In testata aggiungere il total  Comb Plan All qty delle righe selezionate 
      let TotCombPlanAllQty = 0;
      // In testata mettere un nuovo campo Open qty che rappresenta la differenza tra la Required Quantity 
      // - il totale Comb Plan All (quello di tutte le righe non di solo quelle selezionate) 
      // - la Quantity to Assign delle righe presente nel pop up.
      let OpenQty = 0;
      for (let i = 0; i < selectedItems.length; i++) {
        const oObj = selectedItems[i].getBindingContext().getObject()
        TotCombPlanAllQty += parseInt(oObj.CombPlanAllQty)
        _selectedItems.push(oObj)
      }

      OpenQty = obj.RequiredQuantity - TotCombPlanAllQty;


      model.setData({
        ...obj,
        TotalPlanAllQty: TotCombPlanAllQty.toFixed(3).toString(),
        OpenQty: OpenQty.toFixed(3).toString(),
        selectedItems: _selectedItems
      })

      this._controller.getView().setModel(model, 'selectedPezze');

      if (!this._fragmentPezze) {
        this._fragmentPezze = this.loadFragment({
          id: "fragmentPezze",
          name: "manageplannedorder.manageplannedorder.ext.fragment.Pezze",
          controller: this._controller
        });
      }

      this._fragmentPezze.then(function (dialog) {
        dialog.setModel(model, 'selected');
        dialog.setModel(oModel);
        const table = dialog.getContent().at(-1);


        table.bindAggregation('items', {
          path: '/ZZ1_MFP_ASSIGNMENT',
          filters: [
            new sap.ui.model.Filter("FSH_MPLO_ORD", sap.ui.model.FilterOperator.EQ, obj.CplndOrd),
            new sap.ui.model.Filter("MATNR", sap.ui.model.FilterOperator.EQ, obj.Material)
          ],
          template: new sap.m.ColumnListItem({
            cells: [
              new sap.m.ObjectIdentifier({ title: "{CHARG}" }),
              new sap.m.Text({ text: "{StockSegment}" }),
              new sap.m.Text({ text: "{SpecialStock}" }),
              new sap.m.Text({ text: "{BatchBySupplier}" }),
              new sap.m.Text({ text: "{LGORT}" }),
              new sap.m.Text({ text: "{FABB_TOT_V}" }),
              new sap.m.Text({ text: "{COPERTURA}" }),
              //new sap.m.Input({ value: "{COPERTURA_EDITABLE}" }),
              new sap.m.Input({ value: "{QTA_ASS_V}", change: function(oEvent) {
                var oInput = oEvent.getSource();
                var sNewValue = sap.ui.getCore().byId(oInput.getId()).getValue();
                sNewValue = sNewValue.toString().replace(",",".")

                var remainingQty = sap.ui.getCore().byId("fragmentPezze--inputRemainingQty").getText()
                var requiredQty = sap.ui.getCore().byId("fragmentPezze--inputRequiredQuantity").getText()
                
                sap.ui.getCore().byId("fragmentPezze--inputRemainingQty").setText(Number(requiredQty) - Number(sNewValue))

                // Esempio: aggiornare un'altra proprietà
                // oContext.getModel().setProperty(oContext.getPath() + "/SomeField", sNewValue);
            } }),
              //new sap.m.Text({ text: "{BatchBySupplier}" })
            ]
          }),
          templateShareable: false,
          parameters: { $$updateGroupId: 'CreatePezzeBatch' },
        });

        // modifica DL - aggiungo campo con quantità rimamente
        sap.ui.getCore().byId("fragmentPezze--inputRemainingQty").setText(dialog.getModel("selected").oData.OpenQty);
        // modifica DL - aggiungo campo con quantità rimamente - FINE
        
        const binding = table.getBinding('items');
        binding.resetChanges();
        const oODataModel = table.getModel();
        binding.attachDataReceived(async function () {
          await binding.requestContexts(0, 1); // forza la creazione del context

          // sommatoria AvaibilityQty 
          const TotAvaibilityQty = _selectedItems.reduce((acc, item) => acc + parseInt(item.AvaibilityQty || 0), 0);
          console.log("Total Availability Quantity: ", TotAvaibilityQty);

          _selectedItems.forEach((_item) => {
            const item = structuredClone(_item)
            // Aggiungere in riga la colonna % Coverage rappresenta (Avaibility Quantity di riga / totale delle Avaibility Quantiy delle righe selezionate) * 100
            const COPERTURA = Math.round(parseInt(item.AvaibilityQty) / TotAvaibilityQty * 100);
            // Il campo Quantity to Assign deve essere modificabile a mano e deve seguire il seguente algoritmo: 
            // total Avaibility qty * la percentuale di copertura del punto precedente, presentare il minore tra questa operazione e la Available Quantity di riga.
            const QTA_ASS_V = Math.min(parseInt(obj.AvailableQuantity), (obj.AvailableQuantity * (COPERTURA / 100)));

            const SAP_UUID = crypto.randomUUID()

            const newCreate = structuredClone({
              "SAP_UUID": SAP_UUID,
              "WERKS": item.Plant,
              "LGORT": item.StorageLocation || "X",
              "FSH_MPLO_ORD": obj.CplndOrd,
              "BAGNI": item.dye_lot || "X",
              "MATNR": item.Material,
              "CHARG": item.Batch,
              "Bagno": item.dye_lot,
              //"BatchBySupplier": 12345,
              "QTA_ASS_V": QTA_ASS_V.toFixed(3).toString(),
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
              "SpecialStock": item.InventorySpecialStockType
            })

            const isPresent = binding.getContexts().some(context => context.getObject().CHARG === _item.Batch);

            if (!isPresent) {
              console.warn("Combined planned order is not present in binding.");
              binding.create(newCreate, false, false, false);
            } else {
              console.log("Combined planned order is present in binding.");
            }
          });
         // binding.refresh(true);
          table.invalidate(); // Forza il rendering della tabella
        }.bind(this));
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

      var pContexts = await oList.requestContexts(0, 20)
      var aContexts = pContexts.map(oContext => oContext)

      if (!aContexts.length) {
        MessageToast.show("No items to disassemble.");
        BusyIndicator.hide(0);
        return;
      }
 
      // modifica DL - 29/07/2025 - disassegno solo record selezionati
      var table = sap.ui.getCore().byId("manageplannedorder.manageplannedorder::ZZ1_CombinedPlnOrdersAPI_to_CombinPlannedOrdersComObjectPage--fe::table::to_ZZ1_CombPlnOrdersStock::LineItem::Stock-innerTable")
      var selectedItems = table.getSelectedContexts()
      if(selectedItems.length > 0){
        var batchSelected = []
        // creo array partite selezionate
        for(var i = 0; i < selectedItems.length; i++){
          batchSelected.push(selectedItems[i].getObject().Batch)
        }
        // elimino da aContexts quello che non è stato selezionato
        var aContextsToKeep = aContexts.filter(function(oContext) {
            const oData = oContext.getObject(); console.log(oData);
            return batchSelected.includes(oData.CHARG);
        });
        aContexts = aContextsToKeep
      }
      // modifica DL - 29/07/2025 - disassegno solo record selezionati - FINE

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
      const oStockTable = sap.ui.getCore().byId('manageplannedorder.manageplannedorder::ZZ1_CombinedPlnOrdersAPI_to_CombinPlannedOrdersComObjectPage--fe::table::to_ZZ1_CombPlnOrdersStock::LineItem::Stock-innerTable');
      if (!oData) {
        MessageToast.show("Disassemble completed successfully.");
        oStockTable.refreshItems();
        oStockTable.getBinding('items').refresh();

        // refresh header facet
        const oDataPoint = sap.ui.getCore().byId('manageplannedorder.manageplannedorder::ZZ1_CombinedPlnOrdersAPI_to_CombinPlannedOrdersComObjectPage--fe::HeaderFacet::KeyFigure::TotalProdAllQty');
        oDataPoint.getBindingContext().refresh();
      } else {
        MessageToast.show("Disassemble failed.");
      }

    },
    doWhereUsed: function (oEvent) {
      // sap.m.MessageToast.show("Custom handler invoked. [WHERE USED]");
      const obj = this.getBindingContext().getObject()
      const oModel = this._controller.getOwnerComponent().getModel()
      const model = new JSONModel()
      model.setData({ ...obj })

      this._controller.getView().setModel(model, 'selectedWhereUsed');

      if (!this._fragmentWhereUsed) {
        this._fragmentWhereUsed = this.loadFragment({
          id: "fragmentPezze",
          name: "manageplannedorder.manageplannedorder.ext.fragment.WhereUsed",
          controller: this._controller
        });
      }

      this._fragmentWhereUsed.then(function (dialog) {

        dialog.setModel(model, 'selected');
        dialog.setModel(oModel)

        // const fakeTabella = dialog.getContent().at(-2);
        const tabella = dialog.getContent().at(-1);

        tabella.bindAggregation('items', {
          path: '/ZZ1_CombPlnOrdersStockAPI',
          filters: [
            new sap.ui.model.Filter("CplndOrd", sap.ui.model.FilterOperator.NE, obj.CplndOrd),
            new sap.ui.model.Filter("Material", sap.ui.model.FilterOperator.EQ, obj.Material),
            new sap.ui.model.Filter("Plant", sap.ui.model.FilterOperator.EQ, obj.Plant),
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
        // binding.attachDataReceived(function () {
        //   fakeTabella.bindAggregation('items', {
        //     path: '/atp_item',
        //     filters: [],
        //     template: new sap.m.ColumnListItem({
        //       cells: [
        //         new sap.m.ObjectIdentifier({
        //           title: "{fsh_cplnd_ord}"
        //         }),
        //         new sap.m.Text({
        //           text: "{flag}"
        //         }),
        //       ]
        //     }),
        //     templateShareable: true,
        //     parameters: { $$updateGroupId: 'CreateWhereUsedBatch' },
        //   });
        //   fakeTabella.resetChanges()
        // }.bind(this));

        dialog.open();
      }.bind(this));
    },
    onCloseDialog: function (oEvent) {
      const dialog = oEvent.getSource().getParent();
      dialog.close();
      // dialog.destroy();
    },
    formatAvaibilityQty: function (sValue) {

      return sValue
    }
  };
});
