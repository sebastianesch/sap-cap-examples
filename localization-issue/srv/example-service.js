const cds = require('@sap/cds')

module.exports = function () {

    this.on('READ', 'I18n', async req => {
        req.reject(500, 'MESSAGE_FROM_I18N');
    });

    this.on('READ', 'UnderscoreI18n', async req => {
        req.reject(500, 'MESSAGE_FROM_UNDERSORCE_I18N');
    });

    this.on('READ', 'AssetsI18n', async req => {
        req.reject(500, 'MESSAGE_FROM_ASSETS_I18N');
    });

    this.on('READ', 'ServiceI18n', async req => {
        req.reject(500, 'MESSAGE_FROM_SERVICE_I18N');
    });

    this.on('READ', 'ServiceUnderscoreI18n', async req => {
        req.reject(500, 'MESSAGE_FROM_SERVICE_UNDERSORCE_I18N');
    });

    this.on('READ', 'ServiceAssetsI18n', async req => {
        req.reject(500, 'MESSAGE_FROM_SERVICE_ASSETS_I18N');
    });

    this.on('READ', 'Translations', async req => {
        req.reject(500, 'MESSAGE_FROM_TRANSLATIONS');
    });

    this.on('READ', 'ServiceTranslations', async req => {
        req.reject(500, 'MESSAGE_FROM_SERVICE_TRANSLATIONS');
    });

}