using {
    cuid,
    managed
} from '@sap/cds/common';

namespace draft.validation.example.db;

entity RootEntities : cuid, managed {
    name        : String;
    description : String;
    children    : Composition of many ChildEntities
                      on children.parent = $self;
}

entity ChildEntities : cuid, managed {
    name        : String;
    description : String;
    parent      : Association to RootEntities;
}
