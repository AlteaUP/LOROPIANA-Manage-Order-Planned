sap.ui.define(['sap/ui/core/mvc/ControllerExtension',"sap/m/MessageToast",], function (ControllerExtension, MessageToast) {
	'use strict';

	return {

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
