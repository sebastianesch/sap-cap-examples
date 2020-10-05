const cds = require('@sap/cds')
const expect = require('chai').expect

describe('Localized messages should work... ', () => {
    const app = require('express')()
    const request = require('supertest')(app)

    beforeAll(async () => {
        await cds.deploy(__dirname + '/../srv/example-service').to('sqlite::memory:')
        await cds.serve('ExampleService').from(__dirname + '/../srv/example-service').in(app)
    })

    it('if the translation is located in an i18n folder', async () => {
        const response = await request.get('/example/I18n').expect(500)
        expect(response.text).to.include('Message from i18n')
    })

    it('if the translation is located in an _i18n folder', async () => {
        const response = await request.get('/example/UnderscoreI18n').expect(500)
        expect(response.text).to.include('Message from _i18n')
    })

    it('if the translation is located in an assets/i18n folder', async () => {
        const response = await request.get('/example/AssetsI18n').expect(500)
        expect(response.text).to.include('Message from assets/i18n')
    })

    it('if the translation is located in an srv/i18n folder', async () => {
        const response = await request.get('/example/ServiceI18n').expect(500)
        expect(response.text).to.include('Message from Service i18n')
    })

    it('if the translation is located in an srv/_i18n folder', async () => {
        const response = await request.get('/example/ServiceUnderscoreI18n').expect(500)
        expect(response.text).to.include('Message from Service _i18n')
    })

    it('if the translation is located in an srv/assets/i18n folder', async () => {
        const response = await request.get('/example/ServiceAssetsI18n').expect(500)
        expect(response.text).to.include('Message from Service assets/i18n')
    })

    it('if the translation is located in an srv/translations folder', async () => {
        const response = await request.get('/example/ServiceTranslations').expect(500)
        expect(response.text).to.include('Message from Service translations')
    })

    it('if the translation is located in an translations folder', async () => {
        const response = await request.get('/example/Translations').expect(500)
        expect(response.text).to.include('Message from translations')
    })
})