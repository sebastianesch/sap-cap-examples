using { example.domain as db } from '../db/data-model';

@(requires: 'User')
service RootBService {

    @odata.draft.enabled
    entity RootB as projection on db.RootB;
    @readonly
    entity RootA as projection on db.RootA;

}