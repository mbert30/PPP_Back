const BaseDAO = require('./basedao')

module.exports = class fournisseurDAO extends BaseDAO {
    constructor(db) {
        super(db, "fournisseur")
    }
    insert(fournisseur) {
        return this.db.query("INSERT INTO fournisseur (nomentreprise) VALUES ($1)",
            [ fournisseur['nomentreprise']])
    }
    getByNomEntreprise(nomentreprise) {
        return new Promise((resolve, reject) =>
            this.db.query("SELECT * FROM fournisseur WHERE nomentreprise=$1", [ nomentreprise ])
                .then(res => resolve(res.rows[0]) )
                .catch(e => reject(e)))
    }
}