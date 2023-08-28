const cds = require ('@sap/cds');

if (cds.env.production === false){
    const {cds_launchpad_plugin} = require('cds-launchpad-plugin');

    // Enable launchpad plugin
    cds.once('bootstrap',(app)=>{
        const handler = new cds_launchpad_plugin();
        app.use(handler.setup({theme:'sap_horizon', version: '1.117.1'}));
    });
}