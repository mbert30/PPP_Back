const express = require('express');
const router = express.Router();

router.get("/getPostByID/:id", (req, res) => {
    res.json({
        //SELECT Titre, Contenu, Reaction, CreatedAt FROM Post WHERE ID_Post = id
    });
});

router.post("/createPost", (req, res) => {
    console.log(req.body)
    res.json({
        //INSERT INTO Post (Titre, Contenu, ID_User, CreatedAt) VALUES (Titre, Contenu, Reaction, ID_User, NOW());
    });
});

router.post("/getCommentByPost", (req, res) => {
    console.log(req.body)
    res.json({
        //INSERT INTO Comment (Contenu, ID_User, CreatedAt) VALUES (Contenu, ID_User, NOW());
    });
});







// router.get("/", (req, res) => {
//     res.json({message: "Voici les données"});
// });

// router.post("/", (req, res) => {
//     console.log(req.body)
//     res.json({message: req.body.message});
// });

// router.put("/:id", (req, res) => {
//     res.json({ messageId: req.params.id });
// });

// router.delete("/:id", (req, res) => {
//     res.json({ message: "Poste supprimé id : " + req.params.id });
// });

// router.patch("/like-post/:id", (req, res) => {
//     res.json({message: "Voici les données"});
// });

module.exports = router;