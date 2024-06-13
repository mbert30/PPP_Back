const BaseDAO = require('./basedao')

module.exports = class UserAccountDAO extends BaseDAO {
    constructor(db) {
        super(db, "utilisateur")
    }
    insert(log) {
        return this.db.query("INSERT INTO utilisateur (identifiant, mdp, datecreation) VALUES ($1, $2, NOW())",
            [ log['login'], log['password'] ])
    }
    getByLogin(identifiant) {
        return new Promise((resolve, reject) =>
            this.db.query("SELECT * FROM utilisateur WHERE identifiant=$1", [ identifiant ])
                .then(res => resolve(res.rows[0]) )
                .catch(e => reject(e)))
    }
}