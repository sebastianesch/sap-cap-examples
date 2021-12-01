using { cuid, managed, sap.common.CodeList } from '@sap/cds/common';

namespace examples.vh;

entity Projects : cuid, managed {
    name : String @title: '{i18n>projectName}';
    description : String @title: '{i18n>projectDescription}';
    type : Association to ProjectTypes not null @title: '{i18n>projectType}';
    members : Composition of many ProjectMembers on members.project = $self @title: '{i18n>projectMembers}';
}

entity ProjectMembers : managed {
    key project : Association to Projects @title: '{i18n>project}';
    key person : Association to Persons @title: '{i18n>person}';
        role : Association to ProjectRoles @title: '{i18n>role}';
}

entity Persons : cuid, managed {
    firstName : String not null @title: '{i18n>firstName}';
    lastName : String not null @title: '{i18n>lastName}';
}

entity ProjectRoles : CodeList {
    key code : String @title: '{i18n>code}';
}

entity ProjectTypes : CodeList {
    key code : String @title: '{i18n>code}';
}