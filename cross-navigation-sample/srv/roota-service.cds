using { example.domain as db } from '../db/data-model';

@(requires: 'User')
service RootAService {

    @odata.draft.enabled
    entity RootA as projection on db.RootA;
    @readonly
    entity RootB as projection on db.RootB;

}