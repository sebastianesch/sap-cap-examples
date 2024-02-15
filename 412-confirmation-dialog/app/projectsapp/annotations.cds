using ExampleService as service from '../../srv/example-service';

annotate service.Projects with @(
    UI.LineItem               : [
        {Value: name},
        {Value: isClosed},
        {
            $Type : 'UI.DataFieldForAction',
            Action: 'ExampleService.closeProject',
            Label : 'Close Project',
        }
    ],
    UI.FieldGroup #projectData: {
        Label: 'Project Data',
        Data : [
            {Value: name},
            {Value: isClosed}
        ]
    },
    UI.FieldGroup #adminData  : {
        Label: 'Admin Data',
        Data : [
            {Value: createdBy},
            {Value: createdAt},
            {Value: modifiedBy},
            {Value: modifiedAt}
        ]
    },
    UI.Facets                 : [
        {
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#projectData'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#adminData'
        }
    ],
    UI.Identification         : [{
        $Type : 'UI.DataFieldForAction',
        Label : 'Close Project',
        Action: 'ExampleService.closeProject'
    }]
);
