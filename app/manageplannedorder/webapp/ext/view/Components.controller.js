sap.ui.define(
    [
        "sap/fe/core/PageController",
        "sap/ui/model/json/JSONModel"
    ],
    function (PageController, JSONModel, Icon) {
        "use strict";

        return PageController.extend("manageplannedorder.manageplannedorder.ext.view.Components", {
            onInit: function () {
                const oRouter = this.getOwnerComponent().getExtensionComponent().getRouter();
                oRouter.getRoute("ComponentsPage").attachPatternMatched(this._onRouteMatched, this);
            },
            _onRouteMatched: function () {
                debugger
                const oComponentsModel = new sap.ui.model.json.JSONModel({
                    tableCount: 0
                });
                this.getView().setModel(oComponentsModel, "componentsModel");
                const aKeys = JSON.parse(sessionStorage.getItem("selectedOrders") || "[]");
                const listCplndOrd = [];

                for (const aKey of aKeys) {
                    const match = aKey.match(/CplndOrd=(\d+),CrossPlantConfigurableProduct='([^']+)'/);
                    if (!match) continue;

                    listCplndOrd.push({
                        CplndOrd: match[1],
                        CrossPlantConfigurableProduct: match[2]
                    });
                }
                //this._detachTableEvents();
                this._callActionAndBindData(listCplndOrd);
            },
            /*            _detachTableEvents: function () {
                           debugger
                           try {
                               const oMacroTable = this.byId("TableComponents");
                               const oInnerTable = oMacroTable?.getMDCTable()?._oTable;
                               if (!oInnerTable) return;
           
                               oInnerTable.detachUpdateFinished(this._onUpdateFinished, this);
                               this._bUpdateAttached = false;
                           } catch (err) {
                               console.warn("detachTableEvents failed:", err);
                           }
                       }, */
            _callActionAndBindData: function (listCplndOrd) {
                debugger
                const oFilterBar = this.byId("orderComponentFilter");
                const oMacroTable = this.byId("TableComponents");
                    //nascondo action delete
                const oMDCTable = oMacroTable.getMDCTable();
                const aActions = oMDCTable.getActions()
                aActions.forEach((oAction) => {
                    const sId = oAction.getId();
                    if (sId?.includes("StandardAction::Delete")) {
                        oAction.setVisible(false);
                    }
                });
                if (!oMacroTable || !oFilterBar) return;

                oFilterBar.setVisible(false);
                oMacroTable.setBindingSuspended(true);

                const aCplndOrd = listCplndOrd.map(k => k.CplndOrd.replace(/'/g, ""));
                const aCrossPlant = listCplndOrd.map(k => k.CrossPlantConfigurableProduct.replace(/'/g, ""));

                if (aCplndOrd.length === 0 && aCrossPlant.length === 0) {
                    oMacroTable.setBindingSuspended(false);
                    return;
                }

                //this._addSearchToToolbar();
                this._addCustomColumnIconActive();

                oFilterBar.removeAllFilterFields();
                oFilterBar.setFilterValues("CplndOrd", aCplndOrd);
                oFilterBar.setFilterValues("CrossPlantConfigurableProduct", aCrossPlant);

                oMacroTable.setBindingSuspended(false);
                try {
                    const oBinding = oMacroTable.getRowBinding();
                    if (oBinding && oBinding.isA("sap.ui.model.odata.v4.ODataListBinding")) {
                        oBinding.refresh();
                    }
                } catch (err) {
                    console.warn("Refresh binding fallito:", err);
                }

                setTimeout(() => {
                    // Esegue la search e attacca il listener su updateFinished
                    oFilterBar.getContent().fireSearch();

                    const oMDCTable = oMacroTable.getMDCTable();
                    const oInnerTable = oMDCTable && oMDCTable._oTable;
                    if (oInnerTable) {
                        oInnerTable.detachUpdateFinished(this._onUpdateFinished, this);
                        oInnerTable.attachUpdateFinished(this._onUpdateFinished, this);
                    }
                }, 400);
            },
            _onUpdateFinished: function (oEvent) {
                debugger
                const oInnerTable = oEvent.getSource();
                const oMacroTable = this.byId("TableComponents");
                const oRowBinding = oMacroTable.getRowBinding();
                if (!oRowBinding) return;

                const aContexts = oRowBinding.getCurrentContexts() || [];
                const aRows = oInnerTable.isA("sap.m.Table")
                    ? oInnerTable.getItems()
                    : oInnerTable.getRows();

                const len = Math.min(aContexts.length, aRows.length);
                //setto total count
                const oModelComponent = this.getView().getModel("componentsModel");
                oModelComponent.setProperty('/tableCount', len)

                for (let i = 0; i < len; i++) {
                    const row = aRows[i];
                    const itm = aContexts[i].getObject();

                    // reset
                    row.setHighlight?.("None");
                    row.setHighlightText?.("");
                    row.removeStyleClass("row--iconactive");
                    row.setType("Active");

                    // Logica highlight standard quantità
                    if (itm.flagHighlights === "X") {
                        const match =
                            parseFloat(itm.CombPlanAllQty || 0) >= parseFloat(itm.RequiredQuantity || 0);
                        row.setHighlight?.(match ? "Success" : "Error");
                        row.setHighlightText?.(match ? "Quantity matches" : "Quantity does not match");
                    }
                    /*    if (itm.IconActive) {
                           row.addStyleClass("row--iconactive");
                           //row.setType("Detail");
                           row.setType("Active");
                       } else {
                           row.setType("Active");
                       } */
                }
                // Righe cliccabili
                if (!this._bPressAttached) {
                    oInnerTable.attachItemPress(this.onRowPress, this);
                    this._bPressAttached = true;
                }
                //this._bUpdateAttached = false;
            },
            /*     _addSearchToToolbar: function () {
                   debugger
                   const oMacroTable = this.byId("TableComponents");
                   if (!oMacroTable || !oMacroTable.getMDCTable) return;
   
                   const oMDCTable = oMacroTable.getMDCTable();
                   if (!oMDCTable || !oMDCTable.getActions) return;
   
                   const aActions = oMDCTable.getActions() || [];
   
                   const bSearchExists = aActions.some(ctrl => ctrl && ctrl.isA && ctrl.isA("sap.m.SearchField"));
                   if (bSearchExists) {
                       console.log("SearchField già presente nella toolbar → skip");
                       return;
                   }
   
                   const oSearch = new sap.m.SearchField({
                       width: "250px",
                       placeholder: "Cerca",
                       placement: "After",
                       liveChange: this.onSearchChange.bind(this),
                       search: this.onSearchChange.bind(this)
                   });
   
                   if (oMDCTable.addAction) {
                       oMDCTable.addAction(oSearch);
                   } else {
                       oMDCTable.addAggregation("actions", oSearch);
                   }
   
                   console.log("SearchField aggiunto nella toolbar standard");
               },  */
            _addCustomColumnIconActive: function () {
                debugger
                const oMacroTable = this.byId("TableComponents");
                if (!oMacroTable || !oMacroTable.getMDCTable) return;

                const oMDCTable = oMacroTable.getMDCTable();
                if (!oMDCTable) return;

                const aColumns = oMDCTable.getColumns?.() || [];
                const bExists = aColumns.some(c => c.getId && c.getId().includes("IconActive"));
                if (bExists) {
                    return;
                }

                const oCustomColumn = new sap.ui.mdc.table.Column(this.createId("IconActive"), {
                    header: "",
                    width: "50px",
                    template: new sap.ui.core.Icon({
                        src: "{IconActive}",
                        tooltip: "Icon Active",
                        decorative: false
                    })
                });

                oMDCTable.addColumn(oCustomColumn);
            },
            onRowPress: function (oEvent) {
                debugger
                const oItem = oEvent.getParameter("listItem");
                const oCtx = oItem.getBindingContext();
                const oData = oCtx.getObject();

                sessionStorage.setItem("selectedContextComponent", JSON.stringify(oData));
                const sKey = this._buildCompositeKey(oData);
                //this._detachTableEvents();

                const oComponent = this.getOwnerComponent().getExtensionComponent();
                oComponent.getRouter().navTo("StockPage", { Keys: sKey });
            },
            _buildCompositeKey: function (oData) {
                return (
                    `CplndOrd=${oData.CplndOrd},` +
                    `CrossPlantConfigurableProduct='${oData.CrossPlantConfigurableProduct}',` +
                    `Material='${oData.Material}',` +
                    `Plant='${oData.Plant}',` +
                    `StorageLocation='${oData.StorageLocation}',` +
                    `Batch='${oData.Batch}',` +
                    `BillOfMaterialItemNumber_2='${oData.BillOfMaterialItemNumber_2}'`
                );
            },
            /*   onSearchChange: function (oEvent) {
                  debugger
                  const sQuery = oEvent.getParameter("newValue") || oEvent.getParameter("query");
                  const oTable = this.byId("TableComponents");
                  if (oTable && oTable.setSearch) {
                      oTable.setSearch(sQuery);
                      oTable.rebind();
                  }
              } */
        });
    }
);