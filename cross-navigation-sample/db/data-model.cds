using {
  cuid,
  managed,
  sap.common.CodeList
} from '@sap/cds/common';

namespace example.domain;

entity RootA : cuid, managed {
  name        : String @title: '{i18n>name}';
  description : String @title: '{i18n>description}';
  rootB       : Association to one RootB;
  status      : Association to one Status;
}

entity RootB : cuid, managed {
  name        : String @title: '{i18n>name}';
  description : String @title: '{i18n>description}';
  rootA       : Association to one RootA;
  status      : Association to one Status;
}

entity Status : CodeList, managed {
  key code : String;
      criticality : Integer;
}
