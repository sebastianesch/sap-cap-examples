sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'example/rootbapp/test/integration/FirstJourney',
		'example/rootbapp/test/integration/pages/RootBList',
		'example/rootbapp/test/integration/pages/RootBObjectPage'
    ],
    function(JourneyRunner, opaJourney, RootBList, RootBObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('example/rootbapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheRootBList: RootBList,
					onTheRootBObjectPage: RootBObjectPage
                }
            },
            opaJourney.run
        );
    }
);