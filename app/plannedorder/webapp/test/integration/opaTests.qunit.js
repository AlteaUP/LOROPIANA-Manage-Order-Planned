sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'plannedorder/plannedorder/test/integration/FirstJourney',
		'plannedorder/plannedorder/test/integration/pages/ZZ1_CombinedPlnOrdersAPIMain'
    ],
    function(JourneyRunner, opaJourney, ZZ1_CombinedPlnOrdersAPIMain) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('plannedorder/plannedorder') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheZZ1_CombinedPlnOrdersAPIMain: ZZ1_CombinedPlnOrdersAPIMain
                }
            },
            opaJourney.run
        );
    }
);