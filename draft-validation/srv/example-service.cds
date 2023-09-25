using {draft.validation.example.db as db} from '../db/schema';

@(requires: ['authenticated-user'])
service ExampleService {

    @odata.draft.enabled
    entity RootEntities  as projection on db.RootEntities;

    entity ChildEntities as projection on db.ChildEntities;

}
