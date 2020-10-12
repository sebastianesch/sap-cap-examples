# Localizations for messages from other directories as <project_root>/_i18n do not work

This SAP Cloud Application Programming example project demonstrates the issue,
that localized messages are only picked up, if the messages.properties file
is located in an _18n folder in the root of the project. All other locations do not work.

Reading the documentation, my expectation would be, that all locations work and custom locations defined in package.json
are also supported.

| Location of messages.properties                 | Status        |
|-------------------------------------------------|:-------------:|
| <project_root>/_i18n/messages.properties        | Works         |
| <project_root>/i18n/messages.properties         | Does not work |
| <project_root>/assets/messages.properties       | Does not work |
| <project_root>/translations/messages.properties | Does not work |
| srv/_i18n/messages.properties                   | Does not work |
| srv/i18n/messages.properties                    | Does not work |
| srv/assets/messages.properties                  | Does not work |
| srv/translations/messages.properties            | Does not work |


The CAP documentation links in the API description for [req.reject](https://cap.cloud.sap/docs/node.js/api#req-reject)
and [req.notify|info|warn|error](https://cap.cloud.sap/docs/node.js/api#req-msg) to
[Localized Messages](https://cap.cloud.sap/docs/node.js/app-services#i18n):

> You can provide localized error messages for a growing number of runtime errors.
> To do so, they simply need to provide messages_<locale>.properties files into one
> of the valid text bundles folders in the project root. See
> [Where to Place Text Bundles?](https://cap.cloud.sap/docs/guides/i18n#where-to-place-text-bundles) for more details.

The documentation states that *"one of the valid text bundle folders"* should work.

The CAP documentation for the Localization mentions in the section
[Where to Place Text Bundles?](https://cap.cloud.sap/docs/guides/i18n#where-to-place-text-bundles)

> By default, text bundles can be placed in and are fetched from folders named _i18n, i18n, or assets/i18n.
> These folders are placed next to the model files or in a parent folder as follows:
>
> ```
> srv/
>    my-service.cds          # the model file
>    _i18n/i18n.properties   # next to the model file
> _i18n/i18n.properties      # in a parent folder
> ```
> You can configure the folder names where cds searches for property bundles by setting cds.i18n.folders in your project’s package.json. The default is:
>
> ```
> "cds":{"i18n":{
>   "folders": [ "_i18n", "i18n", " assets/i18n" ]
> }}
> ```

Even specifying the locations in package.json does not make a difference. Of the three default folder names and a fourth
custom folder named "translations" and either located in the root folder of the project or next to the service,
only _i18n in the root folder is picked up.

To demonstrate the issue, the project provides eight entities with custom handlers, that reject a GET request with
a localized error message.

You can run the tests with `npm test`. Of the eight provided test cases, only one passes.

# Resolution

The answer in my [SAP Community Question](https://answers.sap.com/questions/13155742/) is that the message localization
picks the message.properties file from the first location specified (_i18n, i18n, assests/i18n) from the *root* folder
of the CAP project. Additional locations are ignored.