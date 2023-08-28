sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'example/rootaapp/test/integration/FirstJourney',
		'example/rootaapp/test/integration/pages/RootAList',
		'example/rootaapp/test/integration/pages/RootAObjectPage'
    ],
    function(JourneyRunner, opaJourney, RootAList, RootAObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('example/rootaapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheRootAList: RootAList,
					onTheRootAObjectPage: RootAObjectPage
                }
            },
            opaJourney.run
        );
    }
);