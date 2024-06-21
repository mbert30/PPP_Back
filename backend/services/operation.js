const OperationDAO = require('../models/operationDao')
const Operation = require('../models/operation')

module.exports = class OperationService {
    constructor(db) {
        this.dao = new OperationDAO(db)
    }
    insert(designation, description, machine) {
        return this.dao.insert(new Operation(designation, description, machine))
    }
    getById(id) {
        return this.dao.getById(id)
    }
    getAll() {
        return this.dao.getAll()
    }
    deleteById(id) {
        return this.dao.delete(id)
    }
}