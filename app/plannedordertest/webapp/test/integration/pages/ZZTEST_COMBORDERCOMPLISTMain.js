sap.ui.define(['sap/fe/test/TemplatePage'], function(TemplatePage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new TemplatePage(
        'planned.order.test.plannedordertest::ZZTEST_COMBORDERCOMPLISTMain',
        CustomPageDefinitions
    );
});