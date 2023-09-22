using {
    cuid,
    managed
} from '@sap/cds/common';


namespace singleton.example.db;

@assert.unique: {createdBy: [createdBy]}
entity Data : cuid, managed {
    name : String not null;
}

entity Foo : cuid, managed {
    name        : String not null;
    description : String not null;
}
