CREATE TABLE utilisateur (ID_Utilisateur SERIAL PRIMARY KEY, Identifiant VARCHAR(30) NOT NULL, mdp VARCHAR(128), DateCreation DATE NOT NULL);

CREATE TABLE fournisseur (ID_Fournisseur SERIAL PRIMARY KEY, NomEntreprise VARCHAR(50));

CREATE TABLE piece (ID_Piece SERIAL PRIMARY KEY, RefPiece VARCHAR(25) NOT NULL, Designation VARCHAR(50) NOT NULL, Longueur FLOAT, Largeur FLOAT, Hauteur FLOAT, TypePiece SMALLINT NOT NULL, Prix FLOAT, estVendable SMALLINT  NOT NULL, nbStock INT, ID_Fournisseur INT REFERENCES fournisseur);

CREATE TABLE listePiece (ID_listePiece SERIAL PRIMARY KEY, ID_PiecePrincipal INT NOT NULL REFERENCES piece, ID_Composant INT NOT NULL REFERENCES piece);

CREATE TABLE operation (ID_Operation SERIAL PRIMARY KEY, Designation VARCHAR(50) NOT NULL, Description VARCHAR(100) NOT NULL, Machine VARCHAR(50) NOT NULL);

CREATE TABLE gamme (ID_Gamme SERIAL PRIMARY KEY, ID_Piece INT NOT NULL REFERENCES piece, ID_Operation INT NOT NULL REFERENCES operation);








INSERT INTO User (`Identifiant`, `Nom`, `Prenom`, `Password`, `DateCreation`) VALUES
('USER1', 'Yves', 'Montand', 'b109f3bbbc244eb82441917ed06d618b9008dd09b3befd1b5e07394c706a8bb980b1d7785e5976ec049b46df5f1326af5a2ea6d103fd07c95385ffab0cacbc86', NOW()),
('USER2', 'Bernard', 'Dubois', 'b109f3bbbc244eb82441917ed06d618b9008dd09b3befd1b5e07394c706a8bb980b1d7785e5976ec049b46df5f1326af5a2ea6d103fd07c95385ffab0cacbc86', NOW());

INSERT INTO fournisseur (id, nomentreprise) VALUES 
(1, 'fournisseur1');

INSERT INTO piece (refpiece , designation, longueur, largeur, hauteur, typepiece, prix, estvendable, nbStock, id_fournisseur) VALUES 
('REF1TEST', 'designationTest1', 30, 30, 30, 1, 30, 1, 5, 1),
('REF2TEST', 'designationTest2', 30, 30, 30, 1, 30, 1, 5, 1),
('REF3TEST', 'designationTest3', 30, 30, 30, 1, 30, 1, 5, 1),
('REF4TEST', 'designationTest4', 30, 30, 30, 2, 30, 1, 5, 1);