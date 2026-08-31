const express = require("express");
const cors = require("cors");
const path = require("path");
const app = express();

app.use(express.json());
app.use(cors());

app.use("/livro", require("./routes/livro"));
app.use("/usuario", require("./routes/usuario"));

/*
  Teremos o usuário comum que poderá comprar livros e comentar

  Editora só podera aceitar pedidos e, se quiser, retirar um livro

  Autor poderá adicionar, alterar e excluir seu livro, mas, tudo isso, com a autorização da editora
  
*/

app.get("/", (req, res) => {
  res.sendFile(path.join(__dirname, "static", "index.html"));
});

app.listen(3000, () => {
  console.log(`Servidor executando em http://localhost:3000`);
});
