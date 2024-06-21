const PieceDAO = require('../models/pieceDao')
const Piece = require('../models/piece')

module.exports = class PieceService {
    constructor(db) {
        this.dao = new PieceDAO(db)
    }
    get(piece) {
        return this.dao.getByPiece(piece)
    }
    getById(id) {
        return this.dao.getById(id)
    }
    getComposant() {
        return this.dao.getComposant()
    }
    getAll() {
        return this.dao.getAll()
    }
    deleteById(id) {
        return this.dao.delete(id)
    }
    getLastId() {
        return this.dao.getLastId()
    }

    getPieceComposant(id) {
        return this.dao.getPieceComposant(id)
    }
    
    insert(refpiece, designation, longueur, largeur, hauteur, typepiece, prix, estvendable, nbstock, id_fournisseur) {
        return this.dao.insert(new Piece(refpiece, designation, longueur, largeur, hauteur, typepiece, prix, estvendable, nbstock, id_fournisseur))
    }

    insertProduit(refpiece, designation, longueur, largeur, hauteur, typepiece, prix, estvendable, nbstock, id_fournisseur, tabcomposant) {
        console.log()
        this.insert(refpiece, designation, longueur, largeur, hauteur, typepiece, prix, estvendable, nbstock, id_fournisseur)
        .then(() => {
            this.getLastId()
            .then(res => {
                const baseQuery = "INSERT INTO listepiece (id_pieceprincipal, id_composant, qt) VALUES ";
                const values = Object.keys(tabcomposant).map(key => {
                    const component = tabcomposant[key];
                    return `(${res.rows[0].max}, ${component.id}, ${component.qt})`;
                }).join(", ");
                console.log(baseQuery+values+';')
                this.dao.insertProduit(baseQuery+values+';')
            })
        })
    }
}