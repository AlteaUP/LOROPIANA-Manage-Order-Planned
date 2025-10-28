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
      this._bSaldoScorta = false;
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

      if (this._fragmentPezze) {
        this._fragmentPezze.then(function (dialog) {
          if (dialog) {
            dialog.destroy();
          }
        });
      }

      // Ricrea sempre
      this._fragmentPezze = this.loadFragment({
        id: "fragmentPezze",
        name: "manageplannedorder.manageplannedorder.ext.fragment.Pezze",
        controller: this._controller
      });

      /*    if (!this._fragmentPezze) {
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
          if (binding) {
            binding.resetChanges();
          }
        });
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
            new sap.ui.model.Filter("FSH_MPLO_ORD", sap.ui.model.FilterOperator.EQ, obj.CplndOrd),
            new sap.ui.model.Filter("MATNR", sap.ui.model.FilterOperator.EQ, obj.Material)
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

                  var remainingQty = sap.ui.getCore().byId("fragmentPezze--inputRemainingQty").getText()
                  var requiredQty = sap.ui.getCore().byId("fragmentPezze--inputRequiredQuantity").getText()

                  sap.ui.getCore().byId("fragmentPezze--inputRemainingQty").setText(Number(requiredQty) - Number(sNewValue))

                  // Esempio: aggiornare un'altra proprietà
                  // oContext.getModel().setProperty(oContext.getPath() + "/SomeField", sNewValue);
                }
              }),
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
          const oComponent = this._controller.getOwnerComponent();
          let highlightModel = oComponent.getModel('highlight');
          if (!highlightModel) {
            highlightModel = new sap.ui.model.json.JSONModel({
              assignedRecords: []
            });
            oComponent.setModel(highlightModel, 'highlight');
          }
          // 3. Imposta i record già assegnati nel modello condiviso
          // Usiamo 'Set' per evitare duplicati se riapri il dialog più volte
          const allAssignedRecords = [...new Set([...highlightModel.getProperty('/assignedRecords'), ...existingKeys])];
          highlightModel.setProperty('/assignedRecords', allAssignedRecords);

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
              "SpecialStock": item.InventorySpecialStockType,
              "SaldoScorta": !!this._bSaldoScorta
            })

            const isPresent = binding.getContexts().some(context =>
              context.getObject().CHARG === _item.Batch &&
              context.getObject().LGORT === _item.StorageLocation
            );
            if (!isPresent) {
              console.warn("Combined planned order is not present in binding.");
              binding.create(newCreate, false, false, false);
            } else {
              console.log("Combined planned order is present in binding.");
              const recordKey = _item.Batch + '|' + _item.StorageLocation;
              if (!highlightModel.getProperty('/assignedRecords').includes(recordKey)) {
                const currentAssigned = highlightModel.getProperty('/assignedRecords');
                currentAssigned.push(recordKey);
                highlightModel.setProperty('/assignedRecords', currentAssigned);
              }
            }
          });
          // binding.refresh(true);
          table.invalidate(); // Forza il rendering della tabella
        }.bind(this));
        dialog.open();
      }.bind(this));
    },
    AssegnaAuto: function (oEvent) {
      debugger;
      this._bSaldoScorta = false;
      const model = new JSONModel();
      const oModel = this._controller.getOwnerComponent().getModel()
      const idTable = 'manageplannedorder.manageplannedorder::ZZ1_CombinedPlnOrdersAPI_to_CombinPlannedOrdersComObjectPage--fe::table::to_ZZ1_CombPlnOrdersStock::LineItem::Stock-innerTable';
      const oTable = this._view.byId(idTable);
      const aRows = oTable.getItems();
      const obj = this.getBindingContext().getObject();
      const items = [];
      let _selectedItems = [];

      for (let i = 0; i < aRows.length; i++) {
        const oObj = aRows[i].getBindingContext().getObject()
        items.push(oObj)
      }

      let RequiredQty = Number(obj.RequiredQuantity);

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

          // Se esiste almeno un record che rispetta la condizione, prendo solo quelli
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

        OpenQty = obj.RequiredQuantity - TotCombPlanAllQty;

        model.setData({
          ...obj,
          TotalPlanAllQty: TotCombPlanAllQty.toFixed(3).toString(),
          OpenQty: OpenQty.toFixed(3).toString(),
          selectedItems: _selectedItems
        })

        this._controller.getView().setModel(model, 'selectedPezze');

        if (this._fragmentPezze) {
          this._fragmentPezze.then(function (dialog) {
            if (dialog) {
              dialog.destroy();
            }
          });
        }

        // Ricrea sempre
        this._fragmentPezze = this.loadFragment({
          id: "fragmentPezze",
          name: "manageplannedorder.manageplannedorder.ext.fragment.Pezze",
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
            if (binding) {
              binding.resetChanges();
            }
          });
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
              new sap.ui.model.Filter("FSH_MPLO_ORD", sap.ui.model.FilterOperator.EQ, obj.CplndOrd),
              new sap.ui.model.Filter("MATNR", sap.ui.model.FilterOperator.EQ, obj.Material)
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

                    var remainingQty = sap.ui.getCore().byId("fragmentPezze--inputRemainingQty").getText()
                    var requiredQty = sap.ui.getCore().byId("fragmentPezze--inputRequiredQuantity").getText()

                    sap.ui.getCore().byId("fragmentPezze--inputRemainingQty").setText(Number(requiredQty) - Number(sNewValue))
                  }
                }),
              ]
            }),
            templateShareable: false,
            parameters: { $$updateGroupId: 'CreatePezzeBatch' },
          });

          sap.ui.getCore().byId("fragmentPezze--inputRemainingQty").setText(dialog.getModel("selected").oData.OpenQty);

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
            const oComponent = this._controller.getOwnerComponent();
            let highlightModel = oComponent.getModel('highlight');
            if (!highlightModel) {
              highlightModel = new sap.ui.model.json.JSONModel({
                assignedRecords: []
              });
              oComponent.setModel(highlightModel, 'highlight');
            }
            // 3. Imposta i record già assegnati nel modello condiviso
            // Usiamo 'Set' per evitare duplicati se riapri il dialog più volte
            const allAssignedRecords = [...new Set([...highlightModel.getProperty('/assignedRecords'), ...existingKeys])];
            highlightModel.setProperty('/assignedRecords', allAssignedRecords);

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
                "SpecialStock": item.InventorySpecialStockType,
                "SaldoScorta": !!this._bSaldoScorta
              })

              const isPresent = binding.getContexts().some(context =>
                context.getObject().CHARG === _item.Batch &&
                context.getObject().StorageLocation === _item.StorageLocation
              );

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


      } else {
        MessageToast.show("Assegnazione automatica non consentita");
      }
    },
    doDisassignPezze: async function (oEvent) {
      debugger
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
      if (selectedItems.length > 0) {
        var batchSelected = []
        // creo array partite selezionate
        for (var i = 0; i < selectedItems.length; i++) {
          batchSelected.push(selectedItems[i].getObject().Batch)
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
        oStockTable.removeSelections();

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
