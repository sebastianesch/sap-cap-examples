using { examples.vh as db } from '../db/schema';

service ProjectService {

    entity Projects as projection on db.Projects;
    entity Persons as projection on db.Persons;
    entity ProjectMembers as projection on db.ProjectMembers;
}