const express = require("express");
const router = express.Router();
const db = require("../db");

//Get - geral
router.get("/", async (req, res) => {
  const r = await db.query("SELECT * FROM editora")
  if (r.rowCount == 0){
    return res.status(404).json({msg: "Não há nenhum autor!"})
  }

  res.status(200).json(r.rows)
});

//GEt - específico
router.get("/:id", async (req, res) => {
  let id = req.params.id

  const r = await db.query("SELECT * FROM editora WHERE id = $1", [id])
  if (r.rowCount == 0){
    return res.status(404).json({msg: "Esta editora não existe!"})
  }

  res.status(200).json(r.rows)
});


module.exports = router;
