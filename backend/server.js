const express = require("express");
const db = require("./services/database")
const seed = require("./services/seeder")
const UserAccountService = require("./services/compteUtilisateur")
require('dotenv').config();
const app = express();

//Middlware pour traiter les données d'une requete
app.use(express.json());
app.use(express.urlencoded({ extended:false }));

// Appel du seeder
seed()

const compteUtilisateur = new UserAccountService(db)
const jwt = require('./jwt')(compteUtilisateur)
require('./routes/auth_routes')(app, compteUtilisateur, jwt)

//app.use("/auth", require("./routes/auth_routes"));
app.use("/piece", require("./routes/piece_routes"));
// Lancer le serveur
app.listen(process.env.PORT, () => console.log("Le serveur a démarré au port " + process.env.PORT));