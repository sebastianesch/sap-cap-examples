const cds = require('@sap/cds')

module.exports = function (){

    const { Foo } = this.entities; // Using the object does not work

    this.on('DELETE', 'Foo', async req => {
        const tx = this.transaction(req);
        const updateCount = await tx.run (
            UPDATE('Foo').set({ status: 'D'}).where({ID: req.data.ID}) // Provide Foo as String works
        );
        req.reply();
    });
}