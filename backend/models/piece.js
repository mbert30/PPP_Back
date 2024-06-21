module.exports = class Piece {
    constructor(refpiece, designation, longueur, largeur, hauteur, typepiece, prix, estvendable, nbstock, id_fournisseur) {
        this.refpiece = refpiece
        this.designation = designation
        this.longueur = longueur
        this.largeur = largeur
        this.hauteur = hauteur
        this.typepiece = typepiece
        this.prix = prix
        this.estvendable = estvendable
        this.nbstock = nbstock
        this.id_fournisseur = id_fournisseur
    }
}