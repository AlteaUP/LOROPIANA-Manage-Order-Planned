sap.ui.define([
  "sap/m/MessageToast",
  "sap/m/MessageBox",
  "sap/ui/model/Context",
  "jquery.sap.global",
  "sap/ui/core/BusyIndicator"
], function (MessageToast, MessageBox, Context, jQuery, BusyIndicator) {
  'use strict';

  return {
    oButtonAssegnaAuto: null,
    initialButtonState: false,
    hiddenColumns: [],
    onInit: function () {
      debugger;
      var that = this;
      // Intercetto click sulla value help icon dei filtri (id tipo __boxN-arrow) - dialog
      $(document).on("click", "span[id$='-arrow'][role='button'].sapMInputBaseIcon", function (event) {
        var sIconId = $(this).attr("id");
        var oIcon = sap.ui.getCore().byId(sIconId);

        console.log("Cliccata tendina filtro! ID:", sIconId, "Control:", oIcon);

        that._onDropdownFilterOpen(oIcon);
      });
      this.oButtonAssegnaAuto = sap.ui.getCore().byId('manageplannedorder.manageplannedorder::ZZ1_CombinedPlnOrdersAPI_to_CombinPlannedOrdersComObjectPage--fe::table::to_ZZ1_CombPlnOrdersStock::LineItem::Stock::CustomAction::AssegnaAuto');
      //this.initialButtonState = this.oButtonAssegnaAuto.getEnabled();
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
        const selected = oEvent.getParameter('selected');
        const selectedItem = oTable.getSelectedItems();
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
        //se si seleziona record disabilito bottone Assegnazione Auto (se abilitato)
        if (selected || (!selected && selectedItem.length > 0)) {
          // Se il bottone era abilitato, disabilitalo
          if (this.oButtonAssegnaAuto.getEnabled()) {
            this.oButtonAssegnaAuto.setEnabled(false);
          }
        } else {
          // Deselezione → ripristina lo stato iniziale del bottone
          this.oButtonAssegnaAuto.setEnabled(this.initialButtonState);
        }
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
        const idTable = oEvent.getParameter('id')
        const oTable = sap.ui.getCore().byId(idTable)
        const aItems = oTable.getItems()
        //const oContext = this.gContext
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
    //function che gestisce visibilità campi in tab filtro - dialog
    _onDropdownFilterOpen: function (oControl) {
      debugger;
      // Qui dentro metti la tua logica custom!
      // oControl è il controllo correlato al value help cliccato
      console.log("APERTA la tendina filtro su:", oControl, oControl.getMetadata().getName());
      // Aspetta che il popover si apra
      var that = this; // Salva il riferimento al controller   console.log("INIZIO - Impostando busy sulla view");
      setTimeout(function () {
        var aPopovers = $(".sapMPopover:visible, .sapMDialog:visible");

        if (aPopovers.length > 0) {
          var $lastPopover = $(aPopovers[aPopovers.length - 1]);
          console.log("Popover trovato:", $lastPopover);
          console.log("hiddenColumns:", that.hiddenColumns); // Usa 'that' invece di 'this'

          // Usa l'array hiddenColumns per gestire visibilità
          $lastPopover.find(".sapMSLI").each(function () {
            var sText = $(this).text(); // NO trim(), controllo esatto

            // Se la colonna è nell'array hiddenColumns, nascondila
            if (that.hiddenColumns.includes(sText)) { // that.hiddenColumns
              $(this).hide();
              console.log("Nascosta colonna dal filtro:", sText);
            } else {
              $(this).show(); // Rendi visibile se non è in hiddenColumns
              console.log("Mostrata colonna nel filtro:", sText);
            }
          });
        }

      }, 100);
    },
    onExit: function () {
      $(document).off("click.filterfieldVH");
    },
    onAfterRendering: function () {
      debugger;
      var oButton = sap.ui.getCore().byId("manageplannedorder.manageplannedorder::ZZ1_CombinedPlnOrdersAPI_to_CombinPlannedOrdersComObjectPage--fe::table::to_ZZ1_CombPlnOrdersStock::LineItem::Stock-settings");

      if (oButton && !oButton.data("listenerAttached")) {
        oButton.attachPress(this.onPressSettings, this);
        oButton.data("listenerAttached", true); // evita attach multipli
      }
    },
    onPressSettings: function (oEvent) {
      var that = this;

      setTimeout(function () {
        // prendo tutti i dialog aperti
        var aDialogs = sap.m.InstanceManager.getOpenDialogs();
        aDialogs.forEach(function (oDialog) {
          if (oDialog.isA("sap.m.Dialog")) {
            // cerco la tabella delle colonne
            var aTables = oDialog.findAggregatedObjects(true, function (oC) {
              return oC.isA("sap.m.Table");
            });

            if (aTables.length) {
              var oTable = aTables[0];
              var aItems = oTable.getItems();
              console.log(that.hiddenColumns);
              // nascondi Batch dal tab Colonne
              aItems.forEach(oItem => {
                let sLabel = "";
                try {
                  sLabel = oItem.getCells()[0].getItems()[0].getText();
                } catch (e) {
                  sLabel = "";
                }

                if (that.hiddenColumns.includes(sLabel)) {
                  oItem.setVisible(false);
                  console.log("Nascosta colonna:", sLabel);
                }
              });

              // nascondi/rimuovi Batch da Classifica e Raggruppa
              oDialog.findAggregatedObjects(true).forEach(function (oCtrl) {
                if (oCtrl.getText) {
                  const sText = oCtrl.getText();

                  // Verifica se il testo della colonna è dentro hiddenColumns
                  if (that.hiddenColumns.includes(sText)) {
                    // item nelle tendine
                    if (oCtrl.isA && (
                      oCtrl.isA("sap.ui.core.Item") ||
                      oCtrl.isA("sap.ui.core.ListItem")
                    )) {
                      const oParent = oCtrl.getParent && oCtrl.getParent();
                      if (oParent && typeof oParent.removeItem === "function") {
                        oParent.removeItem(oCtrl);
                        console.log("Rimossa colonna '" + sText + "' da:", oParent.getMetadata().getName());
                        return;
                      }
                    }

                    // righe di lista/tabella
                    let oHideTarget = oCtrl;
                    while (oHideTarget && !oHideTarget.isA("sap.m.ListItemBase")) {
                      oHideTarget = oHideTarget.getParent ? oHideTarget.getParent() : null;
                    }
                    if (oHideTarget && typeof oHideTarget.setVisible === "function") {
                      oHideTarget.setVisible(false);
                      console.log("Nascosta riga colonna:", sText);
                    }
                  }
                }
              });
              // aggiorna contatore Colonne (X/Y)
              var nTotali = 0;
              var nVisibili = 0;
              for (var i = 0; i < aItems.length; i++) {
                if (aItems[i].getVisible()) {
                  nTotali++;
                  if (aItems[i].getProperty("selected")) nVisibili++;
                }
              }
              var aTextLabels = oDialog.findAggregatedObjects(true, function (oCtrl) {
                return oCtrl.isA && oCtrl.isA("sap.m.Text") && oCtrl.getText() && oCtrl.getText().startsWith("Colonne (");
              });
              if (aTextLabels.length > 0) {
                aTextLabels[0].setText("Colonne (" + nVisibili + "/" + nTotali + ")");
              }
            }
          }
        });
      }, 300);
    },
    onPageReady: function () {
      debugger;

      const that = this;

      // ASPETTA che la pagina sia completamente caricata
      setTimeout(() => {
        that._initializePageData();
      }, 200);
    },
    _initializePageData: function () {
      const that = this;

      const oTableStock = sap.ui.getCore().byId('manageplannedorder.manageplannedorder::ZZ1_CombinedPlnOrdersAPI_to_CombinPlannedOrdersComObjectPage--fe::table::to_ZZ1_CombPlnOrdersStock::LineItem::Stock-innerTable');

      if (!oTableStock) {
        console.warn("Stock table not found, retrying...");
        setTimeout(() => {
          this._initializePageData();
        }, 500);
        return;
      }

      const oContext = oTableStock.getBindingContext();

      if (!oContext) {
        console.warn("Context not available, retrying...");
        setTimeout(() => {
          this._initializePageData();
        }, 500);
        return;
      }

      const obj = oContext.getObject();

      if (!obj) {
        console.warn("Context object not available, retrying...");
        setTimeout(() => {
          this._initializePageData();
        }, 500);
        return;
      }

      this._processContextData(obj, oTableStock);
    },
    _processContextData: function (obj, oTableStock) {
      const that = this;

      this.oButtonAssegnaAuto.setEnabled(!!obj.IconActive);
      this.initialButtonState = this.oButtonAssegnaAuto.getEnabled();

      // ... resto del codice per le colonne dinamiche ...
      const payload = {
        'Material': obj.Material,
        'Gruppo_merce': obj.ProductGroup,
        'Plant': obj.Plant
      };
      //funzione per formattare array colonne
      /*   function formatHeader(text) {
          if (text === "Dye Lot") return "Dye_Lot";
          return text.split(' ').map(w => w.charAt(0).toUpperCase() + w.slice(1)).join('');
        } */
      const oModel = this.getOwnerComponent().getModel();
      const oCtx = oModel.bindContext("/ReadBatchCust(...)");
      oCtx.setParameter("Payload", payload);

      oTableStock.setBusy(true);

      oCtx.execute()
        .then(() => {
          // ... resto del codice esistente ...
          var oResult = oCtx.getBoundContext().getObject();
          console.log(oResult);

          const resultFields = Object.keys(oResult)
            .filter(k => k.startsWith("Campo"))
            .map(k => oResult[k])
            .filter(v => v && v !== "");

          that.hiddenColumns = []; // reset array

          oTableStock.getColumns().forEach(col => {
            let headerText = col.getHeader().getText();
            //const formattedHeader = formatHeader(headerText);
            // Controllo se il testo è "InventorySpecialStockType trasformo in "InventorySpecialStoc"
            if (headerText === "InventorySpecialStockType") {
              headerText = "InventorySpecialStoc";
            }
            if (resultFields.includes(headerText)) {
              // Colonna autorizzata → assicurati che sia visibile
              col.setVisible(true);
            } else {
              // Colonna non autorizzata → nascondi e aggiungi a hiddenColumns
              col.setVisible(false);
              that.hiddenColumns.push(headerText);
            }
          });
          oTableStock.setBusy(false);
        })
        .catch(err => {
          console.error("ReadBatchCust failed:", err);
          MessageToast.show(err.message || err.value || "Error loading data");
        })
        .finally(() => {
          oTableStock.setBusy(false);
        });
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
      debugger;
      //model per quantità surplus
      const oModel = this.getOwnerComponent().getModel();
      const oTable = sap.ui.getCore().byId('fragmentPezze--selectedItemsTable');
      const binding = oTable.getBinding('items');
      const contexts = binding.getContexts();
      const requiredQty = Number(
        sap.ui.getCore().byId("fragmentPezze--inputRequiredQuantity").getText()
      );
      const remainingQty = Number(
        sap.ui.getCore().byId("fragmentPezze--inputRemainingQty").getText()
      );
      const rows = contexts
        .map(ctx => ({ ctx, obj: ctx.getObject() }))
        .filter(r => r.obj && r.obj.Scorta !== "X" && r.obj._origProposedQty !== undefined);

      const sumQtyUser = rows.reduce((acc, r) => acc + Number(r.obj.QTA_ASS_V), 0);
      const saldoScortaEnabled = rows.some(r => r.obj.SaldoScorta === true);

      console.log("RemainingQt:", remainingQty, "| Somma Utente:", sumQtyUser);
      if (remainingQty <= 0) {
        MessageToast.show("Quantità rimanente insufficiente");
        return;
      } else {
        if (!saldoScortaEnabled) {
          if (sumQtyUser > remainingQty) {
            MessageToast.show("Quantità rimanente insufficiente");
            return;
          }
        }
        if (saldoScortaEnabled && sumQtyUser > remainingQty) {

          const surplus = (sumQtyUser - remainingQty).toFixed(3);
          console.log("Surplus =", surplus);

          // surplus sul batch con CHARG più piccolo
          rows.sort((a, b) => Number(a.obj.CHARG) - Number(b.obj.CHARG));
          const { obj: surplusObjSource } = rows[0];

          // CASO 1: prima assegnazione → ripristino quantità originali
          if (remainingQty === requiredQty) {
            rows.forEach(({ ctx, obj }) =>
              ctx.setProperty("QTA_ASS_V", Number(obj._origProposedQty).toFixed(3))
            );
          }
          // CASO 2: riassegnazione → spalmare remaining equamente
          else {
            const quotaPerRow = remainingQty / rows.length;
            rows.forEach(({ ctx }) =>
              ctx.setProperty("QTA_ASS_V", quotaPerRow.toFixed(3))
            );
          }

          // CREAZIONE / UPDATE surplus
          const surplusCtx = binding.getContexts().find(c => {
            const o = c.getObject();
            return o &&
              o.CHARG === surplusObjSource.CHARG &&
              o.LGORT === surplusObjSource.LGORT &&
              String(o.FSH_MPLO_ORD).startsWith(surplusObjSource.FSH_MPLO_ORD + "_O");
          });

          if (surplusCtx) {
            const updated = (
              Number(surplusCtx.getObject().QTA_ASS_V) + Number(surplus)
            ).toFixed(3);
            surplusCtx.setProperty("QTA_ASS_V", updated);
            console.log("PATCH surplus →", updated);
          } else {
            const newRec = structuredClone(surplusObjSource);
            newRec.QTA_ASS_V = surplus;
            newRec.SAP_UUID = crypto.randomUUID();
            newRec.Scorta = "X";
            newRec.FSH_MPLO_ORD = surplusObjSource.FSH_MPLO_ORD + "_O";

            Object.keys(newRec).forEach(k => {
              if (k.startsWith("to_") || typeof newRec[k] === "object") delete newRec[k];
            });

            console.log("CREATE surplus →", newRec);
            binding.create(newRec, false, false, false);
          }
        }
      }
      console.log("Contesti dopo create:", binding.getContexts().map(c => c.getObject()));

      this.showMessageConfirm("assign").then(function () {
        BusyIndicator.show(0);
        //ELIMINO record surplus con qty 0
        binding.getContexts().forEach(ctx => {
          const obj = ctx.getObject();
          if (!obj) return;

          // Cancello solo surplus già salvati (SAP_UUID) con qty = 0
          if (obj.Scorta === "X" && Number(obj.QTA_ASS_V) === 0 && !!obj.SAP_UUID) {
            console.log("DELETE surplus con qty zero:", obj.CHARG, obj.SAP_UUID);

            try {
              ctx.delete("CreatePezzeBatch"); // DELETE nel batch
            } catch (e) {
              console.error("Errore durante delete surplus zero:", e);
            }
          }
        });
        oModel.submitBatch("CreatePezzeBatch").then((a, b, c) => {
          const oTable = sap.ui.getCore().byId('fragmentPezze--selectedItemsTable');
          const binding = oTable.getBinding('items');
          const highlightModel = this.getOwnerComponent().getModel('highlight');
          if (highlightModel) {
            const assigned = binding.getContexts()
              .map(ctx => ctx.getObject().SAP_UUID)
              .filter(Boolean);

            const uniqueAssigned = [...new Set(assigned)];
            highlightModel.setProperty('/assignedRecords', uniqueAssigned);
          }

          const oDialog = sap.ui.getCore().byId('fragmentPezze--_IDGenDialogPezze');
          if (oDialog && oDialog.getModel('selected')) {
            oDialog.getModel('selected').setProperty('/submitCompleted', true);
          }
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
          const oDialog = sap.ui.getCore().byId('fragmentPezze--_IDGenDialogPezze');
          if (oDialog && oDialog.getModel('selected')) {
            oDialog.getModel('selected').setProperty('/submitCompleted', true);
          }
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
      debugger
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
