sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        doChangeWorkCenter: function(oEvent) {
            MessageToast.show("Custom handler invoked.");
        }
    };
});
