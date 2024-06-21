const BaseDAO = require('./basedao')

module.exports = class operationDAO extends BaseDAO {
    constructor(db) {
        super(db, "operation")
    }
    insert(operation) {
        return this.db.query("INSERT INTO operation (designation, description, machine) VALUES ($1, $2, $3)",
            [ operation['designation'], operation['description'], operation['machine']])
    }
    // getByNomDesignation(designation) {
    //     return new Promise((resolve, reject) =>
    //         this.db.query("SELECT * FROM operation WHERE designation=$1", [ designation ])
    //             .then(res => resolve(res.rows[0]) )
    //             .catch(e => reject(e)))
    // }
    getAll() {
        return new Promise((resolve, reject) =>
            this.db.query("SELECT * FROM operation")
                .then(res => resolve(res.rows) )
                .catch(e => reject(e)))
    }
}