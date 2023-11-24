using {
    cuid,
    managed,
    sap.common.CodeList
} from '@sap/cds/common';

namespace messaging.example.db;

entity Bikes : cuid, managed {
    name : String(128) not null  @mandatory  @title: '{i18n>name}';
    type : Association to BikeTypes          @title: '{i18n>type}'  @assert.target;
}

entity BikeTypes : CodeList {
    key code : String(10) @title: '{i18n>code}';
}
