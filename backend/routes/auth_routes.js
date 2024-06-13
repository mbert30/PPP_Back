module.exports = (app, svc, jwt) => {

    app.post('/auth/authenticate', async (req, res) => {
        const {identifiant, mdp} = req.body
        if ((identifiant === undefined) || (mdp === undefined)) {
            return res.status(400).end()
        }
        svc.validatePassword(identifiant, mdp)
            .then(user => {
                if (user == null) {
                    res.status(401).end()
                    return
                }
                console.log(`${user.identifiant} authenticated`)
                return res.json({
                    'identifiant' : user.identifiant,
                    'token': jwt.generateJWT(identifiant)
                })
            })
            .catch(e => {
                console.log(e)
                return res.status(500).end()
            })
    })

    app.post('/useraccount', async (req, res) => {
        const {identifiant, mdp} = req.body
        if((identifiant === undefined) || (mdp === undefined)) {
            console.log(req.body);
            return res.status(400).end()
        }
        const user = await svc.get(identifiant)
        if (user != null) {
            return res.status(400).end()
        }
        svc.insert(identifiant, mdp)
            .then(res.status(200).end())
            .catch(e => {
                console.log(e)
                return res.status(500).end()
            })
    })

    app.get("/useraccount/:identifiant", async (req, res) => {
        return res.status(await svc.get(req.params.identifiant) == null ? 404 : 200).end()
    })

    app.get("/useraccount/refreshtoken/:identifiant", jwt.validateJWT, (req, res) => {
        res.json({'token': jwt.generateJWT(req.user.identifiant)})
    })
}