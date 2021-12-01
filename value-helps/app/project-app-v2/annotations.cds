using ProjectService as service from '../../srv/project-service';

annotate service.Projects with @(UI : {
    LineItem : [
        {
            $Type: 'UI.DataField',
            Value: name
        },
        {
            $Type: 'UI.DataField',
            Value: description
        },
        {
            $Type: 'UI.DataField',
            Value: type.name
        },
        {
            $Type: 'UI.DataField',
            Value: createdBy
        },
        {
            $Type: 'UI.DataField',
            Value: createdAt
        }
    ],
    HeaderInfo  : {
        $Type : 'UI.HeaderInfoType',
        TypeName : '{i18n>project}',
        TypeNamePlural : '{i18n>projects}',
        Title: { Value: name },
        Description: { Value: description }
    },
    SelectionFields : [ type_code ],
    Facets : [
        {
            $Type: 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#ProjectData',
            Label: '{i18n>projectData}'
        },
        {
            $Type: 'UI.ReferenceFacet',
            Target: 'members/@UI.LineItem#Display',
            Label: '{i18n>projectMembers}'
        },
        {
            $Type: 'UI.ReferenceFacet',
            Target: 'members/@UI.LineItem#Edit',
            Label: '{i18n>projectMembers}'
        }
    ],
    FieldGroup #ProjectData : {
        $Type : 'UI.FieldGroupType',
        Data : [
            { Value: name },
            { Value: description },
            { Value: type_code }
        ]
    }
}) {
    type @(
        Common: {
            Text : 'name',
            TextArrangement : #TextOnly,
            ValueListWithFixedValues: true,
            ValueList : {
                CollectionPath: 'ProjectTypes',
                SearchSupported: true,
                Parameters: [
                    {
                        $Type: 'Common.ValueListParameterOut',
                        LocalDataProperty: 'type_code',
                        ValueListProperty: 'code'
                    },
                    {
                        $Type: 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty: 'name'
                    },
                    {
                        $Type: 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty: 'descr'
                    }
                ]
            }
        }
    );
};

annotate service.ProjectMembers with @(UI: {
    // The Display LineItem shows the project members in a user friendly manner, but in edit mode,
    // all fields are displayed as text fields - is there a way to define tables on object pages
    // as not editable if the object page is switched into edit mode?
    LineItem #Display : [
        {
            $Type: 'UI.DataField',
            Value: person.firstName
        },
        {
            $Type: 'UI.DataField',
            Value: person.lastName
        },
        {
            $Type: 'UI.DataField',
            Value: role.name
        }
    ],
    // The Edit LineItem makes the table on the object page editable in a user friendly manner,
    // but the display of the value help fields only shows IDs.
    LineItem #Edit : [
        {
            $Type: 'UI.DataField',
            Value: person_ID
        },
        {
            $Type: 'UI.DataField',
            Value: role_code
        }
    ],
    Facets : [
        {
            $Type: 'UI.ReferenceFacet',
            Target: '@UI.FieldGroup#ProjectMember',
            Label: '{i18n>projectMember}'
        }
    ],
    FieldGroup #ProjectMember : {
        $Type : 'UI.FieldGroupType',
        Data: [
            {
                Value: person_ID
            },
            {
                Value: role_code
            }
        ]
    }
}) {
    project @UI.Hidden: true; // Hides the project field in project members table
    person @(
        Common: {
            ValueList : {
                CollectionPath: 'Persons',
                SearchSupported: true,
                Parameters: [
                    {
                        $Type: 'Common.ValueListParameterOut',
                        LocalDataProperty: 'person_ID',
                        ValueListProperty: 'ID'
                    },
                    {
                        $Type: 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty: 'firstName'
                    },
                    {
                        $Type: 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty: 'lastName'
                    }
                ]
            },
            // Concatenating the Text Value does not work
            // Text : { $edmJson: { $Apply: [ firstName, ' ', lastName], $Function: 'odata.concat' } },
            Text: 'firstName',
            TextArrangement : #TextOnly
        }
    );
    role @(
        Common: {
            Text: 'name',
            TextArrangement : #TextOnly,
            ValueList : {
                CollectionPath: 'ProjectRoles',
                SearchSupported: true,
                Parameters: [
                    {
                        $Type: 'Common.ValueListParameterOut',
                        LocalDataProperty: 'role_code',
                        ValueListProperty: 'code'
                    },
                    {
                        $Type: 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty: 'name'
                    },
                    {
                        $Type: 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty: 'descr'
                    }
                ]
            }
        }
    );
};

annotate service.Persons with @(
    UI: {
        SelectionFields : [ firstName, lastName ]
    }
) {
    ID @(
        UI: {
            Hidden: true,
            HiddenFilter: true
        },
        Common: {
            // Concatenating the Text Value does not work
            //Text : { $edmJson: { $Apply: [ firstName, ' ', lastName], $Function: 'odata.concat' } },
            Text : firstName,
            TextArrangement : #TextOnly
        }
    )
};

annotate service.ProjectRoles with @(
    UI: {
        SelectionFields : [ name ]
    }
) {
    code @(
        UI: {
            Hidden: true,
            HiddenFilter: true
        },
        Common: {
            Text: name, // changes the displayed attribute on the object page
            TextArrangement : #TextOnly // has no effect on the Text Arrangement on the Object Page
        }
    );
    localized @(
        UI: {
            Hidden,
            HiddenFilter
        }
    );
};

annotate service.ProjectTypes with {
    code @(
        UI: {
            Hidden: true,
            HiddenFilter: true
        },
        // The Common.Text Annotation of the entity type affects the Input Field in the Object Page Form but not the Table in the List Report
        // the table in the list report can be configured by selecting type.name as the property for the line item, as the table for the
        // list report is not editable inline.
        Common: {
            Text: name,
            TextArrangement : #TextOnly
        }
    );
    localized @(
        UI: {
            Hidden: true,
            HiddenFilter: true
        }
    );
};

