const cds = require('@sap/cds')
const expect = require('chai').expect

describe('Foo should contain... ', () => {
    const app = require('express')()
    const request = require('supertest')(app)

    beforeAll(async () => {
        await cds.deploy(__dirname + '/../srv/example-service').to('sqlite::memory:')
        await cds.serve('ExampleService').from(__dirname + '/../srv/example-service').in(app)
    })

    it('request headers and express headers', async () => {
        const response = await request.get('/example/Foo').expect(200)
        const foo = response.body.value[0]
        console.log(foo)
        expect(foo.id).to.equal('42')
        expect(foo.requestHeaders).to.exist
        expect(foo.expressHeaders).to.exist
    })

})