const { Pool } = require('pg')

const db = new Pool({
    host: process.env.HOST,
    port: process.env.PORTDB,
    user: 'mbert30',
    password: 'password',
    database: 'PingPongProject'
})

module.exports = db