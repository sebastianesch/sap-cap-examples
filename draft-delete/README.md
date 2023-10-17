# Draft Delete Example

This project shows the different behaviours of DELETE requests for Draft and non-Draft entities for CAP 7.3.0.

In DELETE handlers for non-Draft entities, the ID of the entity that is to be deleted is contained in the `request.data.ID` property and in `request.params[0].ID`.

In DELETE handlers for Draft entities the ID is not included in `request.data` nor in `request.params`. The only way to get the ID of the entitiy to be deleted is via `request.query.DELETE.from.ref[0].where[2].val` (in case of entites with a single property key).

Expected behaviour would be to have ID for the entity in `request.data` and / or `request.params` as in the non-Draft case.

## Steps to reproduce

Run `cds watch` and then execute the API calls in `test/example-service.http`

The sample data csv files contain one entry for Foos with two Bars, first create a draft for the Foo entity with the `Create Foo Draft` request, then delete one Bar from the created draft via the `Delete Bar from Foo Draft` request. Then delete a non-draft Bar with the `Delete Bar without Draft` request.

Notice the log output on the console:

```
[odata] - POST /odata/v4/example/Foos(ID=d9fb30aa-3577-41cd-95a4-f3bf36eb2307,IsActiveEntity=true)/ExampleService.draftEdit
[odata] - DELETE /odata/v4/example/Bars(ID=2533d2c0-ce53-4cda-ad71-ca98c37fb9d4,IsActiveEntity=false)
[example-service] - before DELETE Bars.drafts - request.data: {} - request.params: []
[example-service] - Bars.drafts ID: 2533d2c0-ce53-4cda-ad71-ca98c37fb9d4
[odata] - DELETE /odata/v4/example/Bars(ID=7717cc0f-5618-4ab2-b5ca-2732a781f390,IsActiveEntity=true)
[example-service] - before DELETE Bars - request.data: { ID: '7717cc0f-5618-4ab2-b5ca-2732a781f390' } - request.params: [ { ID: '7717cc0f-5618-4ab2-b5ca-2732a781f390' } ]
```

The last line shows that `request.data` and `request.params` contain the ID of the Bar to be deleted for a non-draft Bar.

The third line shows that the request to delete a draft Bar has empty `request.data` and `request.params`.
The fourth line shows, that in the current case, the ID of the Bar to be deleted is available via `request.query.DELETE.from.ref[0].where[2].val`.

## Version Info

draft-delete % cds -v
@cap-js/sqlite: 1.3.1
@sap/cds: 7.3.0
@sap/cds-compiler: 4.3.0
@sap/cds-dk (global): 7.3.0
@sap/cds-fiori: 1.1.0
@sap/cds-foss: 4.0.2
@sap/cds-mtxs: 1.12.0
@sap/eslint-plugin-cds: 2.6.3
Node.js: v18.17.1
draft-delete: 1.0.0
