using {singleton.example.db as db} from '../db/schema';


service ExampleService @(requires: 'authenticated-user') {
    @singleton
    entity MyData as projection on db.Data where createdBy = $user;

    entity Data   as projection on db.Data;
    entity Foo    as projection on db.Foo where createdBy = $user;
    entity Bar    as projection on db.Foo;
}
