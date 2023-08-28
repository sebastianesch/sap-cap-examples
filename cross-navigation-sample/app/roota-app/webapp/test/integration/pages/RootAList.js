sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'example.rootaapp',
            componentId: 'RootAList',
            entitySet: 'RootA'
        },
        CustomPageDefinitions
    );
});