sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'example/projectsapp/test/integration/FirstJourney',
		'example/projectsapp/test/integration/pages/ProjectsList',
		'example/projectsapp/test/integration/pages/ProjectsObjectPage'
    ],
    function(JourneyRunner, opaJourney, ProjectsList, ProjectsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('example/projectsapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheProjectsList: ProjectsList,
					onTheProjectsObjectPage: ProjectsObjectPage
                }
            },
            opaJourney.run
        );
    }
);