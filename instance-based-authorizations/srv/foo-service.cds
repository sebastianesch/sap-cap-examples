using { iba.db as db  } from '../db/schema';

service FooService @(requires: 'authenticated-user') {

    entity UnrestrictedFoo as projection on db.Foo;

    entity RestrictedFoo @(restrict: [{ grant: 'READ', where: 'createdBy = $user' }]) as projection on db.Foo;

    entity WhereFoo as select from db.Foo where createdBy = $user;

    entity BeforeFoo as projection on db.Foo;

}
