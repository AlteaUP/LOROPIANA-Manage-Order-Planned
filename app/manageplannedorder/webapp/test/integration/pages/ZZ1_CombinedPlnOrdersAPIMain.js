sap.ui.define(['sap/fe/test/TemplatePage'], function(TemplatePage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new TemplatePage(
        'manageplannedorder.manageplannedorder::ZZ1_CombinedPlnOrdersAPIMain',
        CustomPageDefinitions
    );
});