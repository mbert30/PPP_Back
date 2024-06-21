module.exports = (app, svc, jwt) => {

    app.get('/piece/getById/:id', jwt.validateJWT, async (req, res) => {
        if ((req.params.id === undefined)) {
            return res.status(400).end()
        }
        svc.getById(req.params.id)
        .then(piece => {
            return res.json({piece})
        })
        .catch(e => {
            console.log(e)
            return res.status(500).end()
        })
    })

    app.post('/piece/creationPiece', jwt.validateJWT, async (req, res) => {
        const {refpiece, designation, longueur, largeur, hauteur, typepiece, prix, estvendable, nbstock, id_fournisseur, tabcomposant} = req.body
        if((refpiece === undefined) || (designation === undefined) || (typepiece === undefined) || (estvendable === undefined)) {
            return res.status(400).end()
        }
        try {
            if (typepiece === 2) {
                if (tabcomposant) {
                    await svc.insertProduit(refpiece, designation, longueur, largeur, hauteur, typepiece, prix, estvendable, nbstock, id_fournisseur, tabcomposant);
                    return res.status(200).send({});
                } else {
                    console.log('Le tableau tabcomposant est vide');
                    return res.status(400).end();
                }
            } else {
                await svc.insert(refpiece, designation, longueur, largeur, hauteur, typepiece, prix, estvendable, nbstock, id_fournisseur);
                return res.status(200).send({});
            }
        } catch (e) {
            console.log(e);
            return res.status(500).end();
        }
    })

    app.get("/piece/getComposant", jwt.validateJWT, async (req, res) => {
        svc.getComposant()
        .then(piece => {
            return res.json({piece})
        })
        .catch(e => {
            console.log(e)
            return res.status(500).end()
        })
    
    })

    app.get("/piece/getAll", jwt.validateJWT, async (req, res) => {
        svc.getAll()
        .then(piece => {
            return res.json({piece})
        })
        .catch(e => {
            console.log(e)
            return res.status(500).end()
        })
    
    })

    app.get('/piece/getPieceComposant/:id', jwt.validateJWT, async (req, res) => {
        if ((req.params.id === undefined)) {
            return res.status(400).end()
        }
        svc.getPieceComposant(req.params.id)
        .then(piece => {
            return res.json({piece})
        })
        .catch(e => {
            console.log(e)
            return res.status(500).end()
        })
    })

    app.delete("/piece/delete", jwt.validateJWT, async (req, res) => {
        const {id} = req.body
        svc.deleteById(id)
        .then(res.status(200).send({}))
        .catch(e => {
            console.log(e)
            return res.status(500).end()
        })
    
    })
}