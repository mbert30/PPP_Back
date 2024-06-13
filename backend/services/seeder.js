const db = require("./database")

module.exports = async () => {
    return new Promise(async (resolve, reject) => {
        await db.connect();
        try {
            await db.query('CREATE TABLE utilisateur (id SERIAL PRIMARY KEY, identifiant TEXT NOT NULL, mdp TEXT, dateCreation DATE NOT NULL);')

            await db.query('CREATE TABLE fournisseur (id SERIAL PRIMARY KEY, nomentreprise VARCHAR(50));')

            await db.query('CREATE TABLE piece (id SERIAL PRIMARY KEY, refpiece VARCHAR(25) NOT NULL, designation VARCHAR(50) NOT NULL, longueur FLOAT, largeur FLOAT, hauteur FLOAT, typepiece SMALLINT NOT NULL, prix FLOAT, estvendable SMALLINT  NOT NULL, nbstock INT, id_fournisseur INT REFERENCES fournisseur);')

            await db.query('CREATE TABLE listepiece (id SERIAL PRIMARY KEY, id_piecePrincipal INT NOT NULL REFERENCES piece, id_composant INT NOT NULL REFERENCES piece);')

            await db.query('CREATE TABLE operation (id SERIAL PRIMARY KEY, designation VARCHAR(50) NOT NULL, description VARCHAR(100) NOT NULL, machine VARCHAR(50) NOT NULL);')

            await db.query('CREATE TABLE gamme (id SERIAL PRIMARY KEY, id_piece INT NOT NULL REFERENCES piece, id_operation INT NOT NULL REFERENCES operation);')
        }
        catch(e)  {
            if (e.code === "42P07") {
                console.log("BDD Déjà existante")
                resolve()
            } else {
                console.log("ERREUR" . e)
                reject(e)
            }
        }
    })
}