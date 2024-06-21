const express = require("express");
const cors = require('cors');
const db = require("./services/database")
const seed = require("./services/seeder")
const UserAccountService = require("./services/compteUtilisateur")
const PieceService = require("./services/piece")
const OperationService = require("./services/operation")
const { DateTime } = require('luxon');
require('dotenv').config();
const app = express();

//Middlware pour traiter les données d'une requete
app.use(express.json());
app.use(cors());
app.use(express.urlencoded({ extended:false }));


app.use((req, res, next) => {
    const begin = new DateTime(new Date());

    res.on('finish', () => {
        const requestDate = begin.toFormat('dd/MM/yyyy HH:mm:ss.SSS');
        const remoteIP = `IP: ${req.socket.remoteAddress}`;
        const urlInfo = `${req.baseUrl}${req.path}`
        const method = `${req.method}` ;

        const end = new DateTime(new Date());
        const requestDurationMs = end.diff(begin).toMillis();
        const requestDuration = `Duration: ${requestDurationMs}ms`;
        process.stdout.write(`\x1b[36m[${requestDate}] - \x1b[0m`)
        process.stdout.write(`\x1b[35m[${remoteIP}] - \x1b[0m`)
        switch (method) {
            case "GET": process.stdout.write(`\x1b[92m[${method}] - \x1b[0m`);break
            case "POST": process.stdout.write(`\x1b[93m[${method}] - \x1b[0m`);break
            case "PUT": process.stdout.write(`\x1b[94m[${method}] - \x1b[0m`);break
            case "DELETE": process.stdout.write(`\x1b[91m[${method}] - \x1b[0m`);break
        }
        process.stdout.write(`\x1b[97m[${urlInfo}] - \x1b[0m`)
        console.log(`\x1b[36m[${requestDuration}]\x1b[0m`);
    })
    next();
});

// Appel du seeder
seed()

const compteUtilisateur = new UserAccountService(db)
const pieceService = new PieceService(db)
const operationService = new OperationService(db)
const jwt = require('./jwt')(compteUtilisateur)
require('./routes/auth_routes')(app, compteUtilisateur, jwt)
require('./routes/piece_routes')(app, pieceService, jwt)
require('./routes/operation_routes')(app, operationService, jwt)

//app.use("/auth", require("./routes/auth_routes"));
app.use("/piece", require("./routes/piece_routes"));

// Lancer le serveur
app.listen(process.env.PORT, () => console.log("Le serveur a démarré au port " + process.env.PORT));