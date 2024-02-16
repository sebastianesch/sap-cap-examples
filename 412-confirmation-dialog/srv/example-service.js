const cds = require('@sap/cds')


const log = cds.log('example-service')

class ExampleService extends cds.ApplicationService {

    init() {

        const { Projects } = this.entities

        this.on('closeProject', ['Projects', 'Projects.drafts'], async function onCloseProject(request) {
            log.info('on closeProject - params:', request.params, ' data:', request.data)
            if (request.headers['prefer'] === 'handling=strict') {
                request.res.setHeader('Preference-Applied', 'handling=strict')
                return request.error(412, 'Precondition Failed: Confirm project closure')
            } else {
                await UPDATE(Projects).set({ isClosed: true }).where({ ID: request.params[0].ID })
            }
        })

        return super.init()
    }
}

module.exports = ExampleService