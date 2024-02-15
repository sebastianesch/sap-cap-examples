using {
    cuid,
    managed
} from '@sap/cds/common';


namespace confirmationdialog.db;

entity Projects : cuid, managed {
    name     : String;
    isClosed : Boolean default false;
}
