const cds = require('@sap/cds')

module.exports = function () {

    this.on('READ', 'Foo', async req => {
        const foo = {id : '42', requestHeaders: JSON.stringify(req.headers), expressHeaders: JSON.stringify(req._.req.headers)}
        req.reply(foo)
    })

}