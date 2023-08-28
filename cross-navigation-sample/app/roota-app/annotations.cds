using RootAService as service from '../../srv/roota-service';

annotate service.RootA with @(
    UI.HeaderInfo     : {
        TypeName      : '{i18n>rootA}',
        TypeNamePlural: '{i18n>rootAs}',
        Title         : {
            $Type: 'UI.DataField',
            Value: name,
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: description,
        },
        TypeImageUrl  : 'sap-icon://arobase',
        Initials      : name,
    },
    UI.SelectionFields: [
        rootB_ID,
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
            Value         : rootB_ID,
            SemanticObject: 'RootB',
            Action        : 'manage',
            Mapping       : [{
                $Type                 : 'Common.SemanticObjectMappingType',
                LocalProperty         : rootB_ID,
                SemanticObjectProperty: 'ID',
            }]
        }
    ]
);

annotate service.RootA with @(
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
                Value         : rootB_ID,
                SemanticObject: 'RootB',
                Action        : 'manage',
                Mapping       : [{
                    $Type                 : 'Common.SemanticObjectMappingType',
                    LocalProperty         : rootB_ID,
                    SemanticObjectProperty: 'ID',
                }]
            }
        ],
    },
    UI.Facets                     : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneratedFacet1',
        Label : 'General Information',
        Target: '@UI.FieldGroup#GeneratedGroup1',
    }]
);

annotate service.RootA with {
    rootB       @(Common: {
        Text           : rootB.name,
        TextArrangement: #TextFirst,
        ValueList      : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'RootB',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: rootB_ID,
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

annotate service.RootB with {
    ID          @UI.ExcludeFromNavigationContext
                @(Common: {
        Text           : name,
        TextArrangement: #TextFirst,
    });
    name        @UI.ExcludeFromNavigationContext;
    description @UI.ExcludeFromNavigationContext;
};
