using RootBService as service from '../../srv/rootb-service';

annotate service.RootB with @(
    UI.HeaderInfo     : {
        TypeName      : '{i18n>rootB}',
        TypeNamePlural: '{i18n>rootBs}',
        Title         : {
            $Type: 'UI.DataField',
            Value: name,
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: description,
        },
        Initials      : name,
        TypeImageUrl  : 'sap-icon://bell'
    },
    UI.HeaderFacets   : [{
        $Type : 'UI.ReferenceFacet',
        Label : '{i18n>status}',
        ID    : 'StatusHeaderFacet',
        Target: '@UI.FieldGroup#Status'
    }, ],
    UI.SelectionFields: [
        rootA_ID,
        status_code
    ],
    UI.LineItem       : [
        {
            $Type: 'UI.DataField',
            Value: name,
        },
        {
            $Type: 'UI.DataField',
            Value: description,
        },
        {
            $Type                    : 'UI.DataField',
            Value                    : status_code,
            Criticality              : status.criticality,
            CriticalityRepresentation: #WithIcon
        },
        {
            $Type         : 'UI.DataFieldWithIntentBasedNavigation',
            Value         : rootA_ID,
            SemanticObject: 'RootA',
            Action        : 'manage',
            Mapping       : [{
                $Type                 : 'Common.SemanticObjectMappingType',
                LocalProperty         : rootA_ID,
                SemanticObjectProperty: 'ID',
            }]
        }
    ]
);

annotate service.RootB with @(
    UI.FieldGroup #Status         : {
        $Type: 'UI.FieldGroupType',
        Data : [{
            $Type                    : 'UI.DataField',
            Value                    : status_code,
            Criticality              : status.criticality,
            CriticalityRepresentation: #WithIcon
        }]
    },
    UI.FieldGroup #GeneratedGroup1: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: name,
            },
            {
                $Type: 'UI.DataField',
                Value: description,
            },
            {
                $Type                    : 'UI.DataField',
                Value                    : status_code,
                Criticality              : status.criticality,
                CriticalityRepresentation: #WithIcon
            },
            {
                $Type         : 'UI.DataFieldWithIntentBasedNavigation',
                Value         : rootA_ID,
                SemanticObject: 'RootA',
                Action        : 'manage',
                Mapping       : [{
                    $Type                 : 'Common.SemanticObjectMappingType',
                    LocalProperty         : rootA_ID,
                    SemanticObjectProperty: 'ID',
                }]
            }
        ]
    },
    UI.Facets                     : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneratedFacet1',
        Label : 'General Information',
        Target: '@UI.FieldGroup#GeneratedGroup1',
    }]
);

annotate service.RootB with {
    rootA       @(Common: {
        Text           : rootA.name,
        TextArrangement: #TextFirst,
        ValueList      : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'RootA',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: rootA_ID,
                    ValueListProperty: 'ID',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'name',
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'description',
                },
            ],
            SearchSupported,
        },
    });
    name        @UI.ExcludeFromNavigationContext;
    description @UI.ExcludeFromNavigationContext;
};

annotate service.RootA with {
    ID          @UI.ExcludeFromNavigationContext
                @(Common: {
        Text           : name,
        TextArrangement: #TextFirst,
    });
    name        @UI.ExcludeFromNavigationContext;
    description @UI.ExcludeFromNavigationContext;
};
