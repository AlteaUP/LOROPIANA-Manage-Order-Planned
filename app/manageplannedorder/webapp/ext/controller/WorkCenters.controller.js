sap.ui.define(['sap/ui/core/mvc/ControllerExtension',"sap/m/MessageToast",], function (ControllerExtension, MessageToast) {
	'use strict';

	return {

		sTableId: "manageplannedorder.manageplannedorder::ZZ1_CombinedPlnOrdersAPIObjectPage--fe::table::to_CombinPlannedOrdersCom::LineItem::Components",
        _fnUpdateFinished: null,
        onInit: function () {
			debugger;
            var that = this;
            this._fnUpdateFinished = function (oEvent) {
                const oTable = oEvent.getSource();
                const aItems = oTable.getItems();
                aItems.forEach(function (oRow) {
                    const item = oRow.getBindingContext().getObject();
                    if (item.BaseUnit && item.BaseUnit.toUpperCase() === 'M2') {
                        if (parseFloat(item.RequiredQuantity) === parseFloat(item.CombPlanAllQty)) {
                            oRow.setHighlight("Success");
                            oRow.setHighlightText("Quantity matches");
                        } else {
                            oRow.setHighlight("Error");
                            oRow.setHighlightText("Quantity does not match");
                        }
                    }
                });
            };
        },
        // Helper per ottenere la vera inner Table, preferendo API pubbliche
        _getInnerTable: function () {
			debugger;
            var oSmartTable = sap.ui.getCore().byId(this.sTableId);
            if (!oSmartTable) return null;
            // Provaci prima con metodo pubblico
            if (typeof oSmartTable.getTable === "function") {
                return oSmartTable.getTable();
            }
            // Fallback su member privato
            if (oSmartTable._oTable) {
                return oSmartTable._oTable;
            }
            return null;
        },
/* 
		onBeforeBinding: function () {
            // Stacca PRIMA di ogni nuovo binding/context!
            var oTable = this._getInnerTable();
            if (oTable && this._fnUpdateFinished) {
                oTable.detachUpdateFinished(this._fnUpdateFinished);
            }
        }, */
		
        onPageReady: function () {
			debugger;
            var oTable = this._getInnerTable();
            if (oTable && this._fnUpdateFinished) {
                // Stacca prima per sicurezza (non fa niente se non era attaccato)
                oTable.detachUpdateFinished(this._fnUpdateFinished);
                oTable.attachUpdateFinished(this._fnUpdateFinished);
            }
        },
/*         onAfterLeavePage: function () {
			debugger;
            var oTable = this._getInnerTable();
            if (oTable && this._fnUpdateFinished) {
                oTable.detachUpdateFinished(this._fnUpdateFinished);
            }
		}, */

		onCloseDialog: function (oEvent) {
			const dialog = oEvent.getSource().getParent();
			dialog.close();
		},

		onSubmitChangeWorkCenter: function (oEvent) {
			//recuper workCenter selezionato
			const idWorkCenter = "fragmentWorkCenter--workCenterTable";
			const selectedItemWorkCenter = sap.ui.getCore().byId(idWorkCenter).getSelectedItems();
			var oResourceBundle = this.getOwnerComponent().getModel("i18n").getResourceBundle();
            var sMessage = oResourceBundle.getText("SelectOnlyOneRecord");
			if (selectedItemWorkCenter.length > 1 || selectedItemWorkCenter.length === 0) {
				MessageToast.show(sMessage);
				return;
			}
			const oBjWorkCenter = selectedItemWorkCenter[0].getBindingContext().getObject();
			var workCenterSelected = oBjWorkCenter.BOOWorkCenterInternalID;

			//recupero record selezionato tabella Capacity
			const idTabCapacity =
				"manageplannedorder.manageplannedorder::ZZ1_CombinedPlnOrdersAPIObjectPage--fe::table::to_ZZ1_PLOCAPACITYCORD::LineItem::Capacity-innerTable";
			const oBjRecordCapacity = sap.ui.getCore().byId(idTabCapacity).getSelectedItems();
			const selectedRecordCapacity = oBjRecordCapacity[0].getBindingContext().getObject();

			//recupero campo CombPLOrder 
			var combPlOrder = selectedRecordCapacity.CombinedMasterOrder;

			var payload = {
				"CombPlOrder" : combPlOrder,
				"Operation" : selectedRecordCapacity.Operation,
				"Sequence" : selectedRecordCapacity.Sequence,
				"WorkCenter" : workCenterSelected
			}

			const oModel = this.getView().getModel();
			var oBindingContext = oModel.bindContext("/ChangeWorkCenter(...)");

			oBindingContext.setParameter("Payload", 
				payload
			);

			oBindingContext.execute().then((oResult) => {
				MessageToast.show("Successo")
			}).catch((oError) => {
				MessageToast.show(oError.value)
			});
		}

	};
});
