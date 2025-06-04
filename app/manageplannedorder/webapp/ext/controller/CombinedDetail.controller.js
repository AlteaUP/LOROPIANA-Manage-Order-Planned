sap.ui.define(['sap/ui/core/mvc/ControllerExtension'], function (ControllerExtension) {
	'use strict';

	return ControllerExtension.extend('manageplannedorder.manageplannedorder.ext.controller.CombinedDetail', {
		// this section allows to extend lifecycle hooks or hooks provided by Fiori elements
		override: {
			/**
						 * Called when a controller is instantiated and its View controls (if available) are already created.
						 * Can be used to modify the View before it is displayed, to bind event handlers and do other one-time initialization.
						 * @memberOf manageplannedorder.manageplannedorder.ext.controller.CombinedDetail
						 */
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
			}
		}
	});
});
