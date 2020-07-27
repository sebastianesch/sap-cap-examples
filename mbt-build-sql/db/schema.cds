using { cuid, managed } from '@sap/cds/common';
namespace com.example;

type Status : String enum {
  A; D;
}

entity Foo : cuid, managed {
    name : String(128);
    description: String(1024);
    status : Status;
}
