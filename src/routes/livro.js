const express = require("express");
const router = express.Router();
const db = require("../db");

//Get - geral
router.get("/", async (req, res) => {
  const r = await db.query("SELECT * FROM livro")
  if (r.rowCount == 0){
    return res.status(404).json({msg: "Não há livros nesta lista!"})
  }

  res.status(200).json(r.rows)
});

//Get - específico
router.get("/:id", async (req, res) => {
  let id = req.params.id

  const r = await db.query("SELECT * FROM livro WHERE id = $1", [id])
  if (r.rowCount == 0){
    return res.status(404).json({msg: "Não há livro nesta posição!"})
  }

  res.status(200).json(r.rows)
});

router.post("/", async (req, res) => {

  const {
    titulo,
    genero,
    classificacao,
    editora,
    volume,
    data_publicacao,
    qtde_paginas,
    estoque,
    preco,
    sinopse,
    tamanho,
    idAutor,
    idEditora
  } = req.body;

  console.log(req.body)
  /*if (!titulo || !genero || !classificacao || !editora || !volume || !data_publicacao || !qtde_paginas || !estoque || !preco || !sinopse || !tamanho || !idAutor || !idEditora){
    return res.status(400).json({msg: "Todos os dados devem ser inseridos!"})
  }*/

  const idA = await db.query("SELECT * FROM autor WHERE id = $1", [idAutor])
  if (idA.rowCount == 0){
    return res.status(404).json({msg: "Não há autor com esse id!"})
  }
  
  const idE = await db.query("SELECT * FROM editora WHERE id = $1", [idEditora])
  if (idE.rowCount == 0){
    return res.status(404).json({msg: "Não há editora com esse id!"})
  }

  const r = await db.query("INSERT INTO livro(titulo, genero, classificacao, editora, volume, data_publicacao, qtde_paginas, estoque, preco, sinopse, tamanho, idAutor, idEditora) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13) RETURNING *",
    [titulo, genero, classificacao, editora, volume, data_publicacao, qtde_paginas, estoque, preco, sinopse, tamanho, idAutor, idEditora]
  )

  if (r.rowCount == 0){
    return res.status(404).json({msg: "Não foi possível adicionar este livro!"})
  }

  res.status(200).json(r.rows)
});


//Delete
router.delete("/:id", async (req, res) => {
  let id = req.params.id
  //const { idEditora, idAutor } = req.body
  const r = await db.query("DELETE FROM livro WHERE id = ?1 RETURNING *", [id])


  if (r.rowCount == 0){
    return res.status(404).json({msg: "Não há livro nesta posição!"})
  }

  res.status(200).json(r.rows)
});

module.exports = router;
