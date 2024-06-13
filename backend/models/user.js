const db = require("../services/database")

exports.test = async () => {
    return await db.query('');
}