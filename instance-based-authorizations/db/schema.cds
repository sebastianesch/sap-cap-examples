using { cuid, managed } from '@sap/cds/common';

namespace iba.db;

entity Foo : cuid, managed {
    description : String;
}