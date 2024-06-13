const bcrypt = require('bcrypt')
const UserAccountDAO = require('../models/userAccountDao')
const UserAccount = require('../models/userAccount')

module.exports = class UserAccountService {
    constructor(db) {
        this.dao = new UserAccountDAO(db)
    }
    get(identifiant) {
        return this.dao.getByLogin(identifiant)
    }
    hashPassword(mdp) {
        return bcrypt.hashSync(mdp, 10)  // 10 : cost factor -> + élevé = hash + sûr
    }
    insert(identifiant, mdp) {
        return this.dao.insert(new UserAccount(identifiant, this.hashPassword(mdp)))
    }
    comparePassword(mdp, hash) {
        return bcrypt.compareSync(mdp, hash)
    }
    async validatePassword(identifiant, mdp) {
        const utilisateur = await this.dao.getByLogin(identifiant.trim())
        if ((utilisateur != null) && this.comparePassword(mdp, utilisateur.mdp)) {
            return utilisateur;
        }
        return null;
    }
}