module.exports = (app, svc, jwt) => {

    app.get('/operation/getById/:id', jwt.validateJWT, async (req, res) => {
        if ((req.params.id === undefined)) {
            return res.status(400).end()
        }
        svc.getById(req.params.id)
        .then(operation => {
            return res.json({operation})
        })
        .catch(e => {
            console.log(e)
            return res.status(500).end()
        })
    })

    app.get('/operation/getAll/', jwt.validateJWT, async (req, res) => {
        svc.getAll()
        .then(operation => {
            return res.json({operation})
        })
        .catch(e => {
            console.log(e)
            return res.status(500).end()
        })
    })

    app.post('/operation/creationOperation', jwt.validateJWT, async (req, res) => {
        const {designation, description, machine} = req.body
        if((designation === undefined) || (machine === undefined)) {
            console.log(req.body);
            return res.status(400).end()
        }
        svc.insert(designation, description, machine)
            .then(res.status(200).send({}))
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