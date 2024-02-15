using {confirmationdialog.db as db} from '../db/schema';

service ExampleService {

    @odata.draft.enabled
    entity Projects as projection on db.Projects actions {
                           action closeProject();
                       };

}
