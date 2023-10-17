const cds = require('@sap/cds')
const log = cds.log('example-service')

class ExampleService extends cds.ApplicationService {

    init() {

        this.before('DELETE', 'Bars', async function beforeDeleteBars(request) {
            log.warn('before DELETE Bars - request.data:', request.data, '- request.params:', request.params)
        })

        this.before('DELETE', 'Bars.drafts', async function beforeDeleteBarsDrafts(request) {
            log.info('before DELETE Bars.drafts - request.data:', request.data, '- request.params:', request.params)
            log.info('Bars.drafts ID:', request.query.DELETE.from.ref[0].where[2].val)
        })

        return super.init()
    }
}

module.exports = ExampleService