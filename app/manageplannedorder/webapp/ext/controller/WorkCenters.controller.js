sap.ui.define(['sap/ui/core/mvc/ControllerExtension',"sap/m/MessageToast",], function (ControllerExtension, MessageToast) {
	'use strict';

	return {

		onInit: function () {
			debugger;
			// you can access the Fiori elements extensionAPI via this.base.getExtensionAPI
			// var oModel = this.base.getExtensionAPI().getModel();
			const idComponentsTable = 'manageplannedorder.manageplannedorder::ZZ1_CombinedPlnOrdersAPIObjectPage--fe::table::to_CombinPlannedOrdersCom::LineItem::Components'
			const oComponentsTable = sap.ui.getCore().byId(idComponentsTable)._oTable
			oComponentsTable.setGrowing(false);
			oComponentsTable.attachUpdateFinished(function (oEvent) {

				// verde se la required quantity = ATP Quantity
				// altrimenti rosso
				const oTable = oEvent.getSource();
				debugger;
				const aItems = oTable.getItems()
				aItems.forEach(function (oRow) {
					const item = oRow.getBindingContext().getObject();
					if (item.BaseUnit.toUpperCase() === 'M2') {
						if (parseFloat(item.RequiredQuantity) === parseFloat(item.CombPlanAllQty)) {
							// oRow.addStyleClass('green');
							oRow.setHighlight("Success");
							oRow.setHighlightText("Quantity matches");
						} else {
							// oRow.addStyleClass('red');
							oRow.setHighlight("Error");
							oRow.setHighlightText("Quantity does not match");
						}
					}
				});
			})
		},

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
