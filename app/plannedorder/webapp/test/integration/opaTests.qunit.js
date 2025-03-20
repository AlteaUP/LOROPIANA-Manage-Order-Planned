sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'planned/order/plannedorder/test/integration/FirstJourney',
		'planned/order/plannedorder/test/integration/pages/ZC_RFM_ManageCombinedPlndOrderMain'
    ],
    function(JourneyRunner, opaJourney, ZC_RFM_ManageCombinedPlndOrderMain) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('planned/order/plannedorder') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheZC_RFM_ManageCombinedPlndOrderMain: ZC_RFM_ManageCombinedPlndOrderMain
                }
            },
            opaJourney.run
        );
    }
);