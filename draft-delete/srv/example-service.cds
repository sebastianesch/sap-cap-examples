using {example.db as db} from '../db/schema';

service ExampleService {

    @odata.draft.enabled
    entity Foos as projection on db.Foos;

    entity Bars as projection on db.Bars;

}
