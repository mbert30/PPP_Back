const BaseDAO = require('./basedao')

module.exports = class pieceDAO extends BaseDAO {
    constructor(db) {
        super(db, "piece")
    }

    insert(piece) {
        return this.db.query("INSERT INTO piece (refpiece, designation, longueur, largeur, hauteur, typepiece, prix, estvendable, nbstock, id_fournisseur) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)",
            [piece['refpiece'], piece['designation'], piece['longueur'], piece['largeur'], piece['hauteur'], piece['typepiece'], piece['prix'], piece['estvendable'], piece['nbstock'], piece['id_fournisseur']])
    }

    getLastId() {
        console.log("getLastId")
        return this.db.query("SELECT max(id) FROM piece")
    }

    insertProduit(requete) { 
        return this.db.query(requete)
    }

    getByRefpiece(refpiece) {
        return new Promise((resolve, reject) =>
            this.db.query("SELECT * FROM piece WHERE refpiece=$1", [ refpiece ])
                .then(res => resolve(res.rows[0]) )
                .catch(e => reject(e)))
    }

    getComposant() {
        return new Promise((resolve, reject) =>
            this.db.query("SELECT * FROM piece WHERE typepiece = 1")
                .then(res => resolve(res.rows) )
                .catch(e => reject(e)))
    }

    getAll() {
        return new Promise((resolve, reject) =>
            this.db.query("SELECT * FROM piece")
                .then(res => resolve(res.rows) )
                .catch(e => reject(e)))
    }

    getPieceComposant(id) {
        return new Promise((resolve, reject) =>
            this.db.query("SELECT Piece.refpiece, Piece.designation, ListePiece.qt FROM ListePiece LEFT JOIN Piece ON (ListePiece.id_composant = Piece.id) WHERE ListePiece.id_pieceprincipal=$1", [ id ])
                .then(res => resolve(res.rows) )
                .catch(e => reject(e)))
    }
}