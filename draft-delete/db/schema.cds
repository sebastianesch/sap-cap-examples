using {
    cuid,
    managed
} from '@sap/cds/common';

namespace example.db;

entity Foos : cuid, managed {
    name : String not null  @title: '{i18n>name}'  @description: '{i18n>name.description}'  @mandatory;
    bars : Composition of many Bars
               on bars.foo = $self;
}

entity Bars : cuid, managed {
    name : String not null  @title: '{i18n>name}'  @description: '{i18n>name.description}'  @mandatory;
    foo  : Association to one Foos;
}
