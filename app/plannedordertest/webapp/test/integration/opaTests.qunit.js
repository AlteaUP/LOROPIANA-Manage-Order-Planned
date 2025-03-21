sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'planned/order/test/plannedordertest/test/integration/FirstJourney',
		'planned/order/test/plannedordertest/test/integration/pages/ZZTEST_COMBORDERCOMPLISTMain'
    ],
    function(JourneyRunner, opaJourney, ZZTEST_COMBORDERCOMPLISTMain) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('planned/order/test/plannedordertest') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheZZTEST_COMBORDERCOMPLISTMain: ZZTEST_COMBORDERCOMPLISTMain
                }
            },
            opaJourney.run
        );
    }
);