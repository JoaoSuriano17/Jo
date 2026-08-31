-- Preencha com o SQL de inicialização do 
CREATE DATABASE livraria;

CREATE TABLE IF NOT EXISTS usuario (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    login VARCHAR(255) UNIQUE NOT NULL,
    senha varCHAR(60) NOT NULL,
    img VARCHAR(255),
    autor BOOLEAN DEFAULT FALSE,
    nacionalidade VARCHAR(200) NULL
);

CREATE TABLE IF NOT EXISTS livro (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(40),
    genero VARCHAR(20),
    classificacao VARCHAR(3),
    editora VARCHAR(20),
    volume INTEGER NOT NULL,
    data_publicacao INTEGER NOT NULL,
    qtde_paginas INTEGER NOT NULL,
    estoque INTEGER NOT NULL,
    preco INTEGER NOT NULL,
    sinopse VARCHAR(255),
    tamanho VARCHAR(5),
    idUsuario INT NOT NULL,
    ativo BOOLEAN DEFAULT TRUE,

    CONSTRAINT idUsuario_FK FOREIGN KEY (idUsuario) REFERENCES usuario(id)
);

CREATE TABLE IF NOT EXISTS usuario_livro(
    idCompra SERIAL PRIMARY KEY,
    idUsuario INT NOT NULL,
    idLivro INT NOT NULL,

    CONSTRAINT idUsuario_FK FOREIGN KEY (idUsuario) REFERENCES usuario(id),
    CONSTRAINT idLivro_FK FOREIGN KEY (idLivro) REFERENCES livro(id)
);


-- USUÁRIOS
INSERT INTO usuario (nome, login, senha, img, autor, nacionalidade) VALUES
('João Silva', 'joao.silva', '123', 'joao.jpg', FALSE, 'Brasileira'),
('Maria Oliveira', 'maria.oliveira', '123', 'maria.jpg', FALSE, 'Brasileira'),
('Carlos Souza', 'carlos.souza', '123', 'carlos.jpg', FALSE, 'Brasileira'),
('Carlos Souza2', 'carlos.souza.AUTOR', '123', 'carlos.jpg', TRUE, 'Brasileira');


-- LIVROS
INSERT INTO livro (
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
    idUsuario,
    ativo
) VALUES
(
    'Harry Potter e a Pedra Filosofal',
    'Fantasia',
    '12',
    'Rocco',
    1,
    1997,
    264,
    10,
    50,
    'Harry descobre que é um bruxo e começa seus estudos em Hogwarts.',
    '20x14',
    1,
    TRUE
),
(
    'Harry Potter e a Câmara Secreta',
    'Fantasia',
    '12',
    'Rocco',
    2,
    1998,
    287,
    8,
    55,
    'Harry retorna a Hogwarts e enfrenta novos mistérios.',
    '20x14',
    1,
    TRUE
),
(
    'A Guerra dos Tronos',
    'Fantasia',
    '16',
    'Intrínseca',
    1,
    1996,
    592,
    7,
    70,
    'Famílias nobres disputam o poder em um reino marcado por conflitos.',
    '23x16',
    2,
    TRUE
),
(
    'Dom Casmurro',
    'Romance',
    '14',
    'Companhia das Letras',
    1,
    1899,
    256,
    15,
    40,
    'Bentinho relembra sua vida e seu relacionamento com Capitu.',
    '21x14',
    3,
    TRUE
),
(
    'Capitães da Areia',
    'Romance',
    '14',
    'Record',
    1,
    1937,
    280,
    12,
    45,
    'A história de um grupo de meninos que vive nas ruas de Salvador.',
    '21x14',
    1,
    TRUE
),
(
    'Percy Jackson e o Ladrão de Raios',
    'Fantasia',
    '12',
    'Intrínseca',
    1,
    2005,
    384,
    20,
    60,
    'Percy descobre ser filho de um deus grego e parte em uma aventura.',
    '23x16',
    2,
    TRUE
);


-- RELAÇÃO USUÁRIO_LIVRO
INSERT INTO usuario_livro (idUsuario, idLivro) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(1, 5),
(2, 6);
