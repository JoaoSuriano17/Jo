const express = require("express");
const router = express.Router();
const db = require("../db");

//GET - geral
router.get("/", async (req, res) => {
  const r = await db.query("SELECT * FROM usuario")
  if (r.rowCount == 0){
    return res.status(404).json({msg: "Não há usuários na base de dados!"})
  }

  res.status(200).json(r.rows)
});

//Get específico
router.get("/:id", async (req, res) => {
  let id = req.params.id

  const r = await db.query("SELECT * FROM usuario WHERE id=$1", [id])
  if (r.rowCount == 0){
    return res.status(404).json({msg: "Não há usuário com este id!"})
  }

  res.status(200).json(r.rows)
});

module.exports = router;
