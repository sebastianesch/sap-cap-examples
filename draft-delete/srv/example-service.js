const cds = require('@sap/cds')
const log = cds.log('example-service')

class ExampleService extends cds.ApplicationService {

    init() {

        this.before('DELETE', 'Bars', async function beforeDeleteBars(request) {
            log.warn('before DELETE Bars - request.data:', request.data, '- request.params:', request.params)
        })

        this.before('DELETE', 'Bars.drafts', async function beforeDeleteBarsDrafts(request) {
            log.info('before DELETE Bars.drafts - request.data:', request.data, '- request.params:', request.params)
            /*
                Output: [example-service] - before DELETE Bars.drafts - request.data: {} - request.params: []
                request.data and request.params do not contain any information about the draft to be deleted.
            */
            log.info('Bars.drafts ID:', request.query.DELETE.from.ref[0].where[2].val)
            /* The only way to get the draft ID get it from the DELETE query in the request. */
        })

        return super.init()
    }
}

module.exports = ExampleService