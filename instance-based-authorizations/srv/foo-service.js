const cds = require('@sap/cds')

module.exports = cds.service.impl(async (srv) => {

    srv.before('READ', 'BeforeFoo', (request) => {
        request.query.where('createdBy = ', request.user.id)
    })

    srv.before('READ', '*', request => {
        console.log('query: ', request.query)
    })

})