# Request Headers not set

In the Event Handlers the `req.headers` is undefined. The only way to access HTTP Headers at the moment is
via `req._.req.headers`. According to the documentation
[Core Services API](https://cap.cloud.sap/docs/node.js/api#cds-event) `msg.headers` or `req.headers` should return
the headers of the message or the HTTP request.

The custom event handler in `srv/example-service.js` returns an entity Foo with the properties `requestHeaders` and
`expressHeaders` using `req.headers` and `req._.req.headers` to return the respective values.

Access to the request headers does not work, the Express headers work fine.

Run `npm test` to execute the test.