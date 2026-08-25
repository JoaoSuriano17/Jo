-- Preencha com o SQL de inicialização do 
CREATE DATABASE livraria;

CREATE TABLE IF NOT EXISTS usuario (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    login VARCHAR(255) UNIQUE NOT NULL,
    senha CHAR(60) NOT NULL,
    img VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS editora (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS autor (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    idade INT NOT NULL,
    nacionalidade VARCHAR(200) NOT NULL
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
    idAutor INT NOT NULL,
    idEditora INT NOT NULL, 
    CONSTRAINT idAutor_Fk FOREIGN KEY (idAutor) REFERENCES autor(id),
    CONSTRAINT idEditora_Fk FOREIGN KEY (idEditora) REFERENCES editora(id)
);



-- USUÁRIOS
INSERT INTO usuario (nome, login, senha, img) VALUES
('João Silva', 'joao.silva', '123456789012345678901234567890123456789012345678901234567890', 'joao.jpg'),
('Maria Oliveira', 'maria.oliveira', 'abcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdef', 'maria.jpg'),
('Carlos Souza', 'carlos.souza', 'qwertyqwertyqwertyqwertyqwertyqwertyqwertyqwertyqwertyqwerty', 'carlos.jpg');


-- AUTORES
INSERT INTO autor (nome, idade, nacionalidade) VALUES
('J. K. Rowling', 60, 'Britânica'),
('George R. R. Martin', 77, 'Americana'),
('Machado de Assis', 69, 'Brasileira'),
('Jorge Amado', 88, 'Brasileira'),
('Rick Riordan', 61, 'Americana');


-- EDITORAS
INSERT INTO editora (nome) VALUES
('Rocco'),
('Intrínseca'),
('Companhia das Letras'),
('Record'),
('HarperCollins');


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
    idAutor,
    idEditora
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
    1
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
    1
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
    2
),
(
    'Dom Casmurro',
    'Romance',
    '14',
    'Companhia',
    1,
    1899,
    256,
    15,
    40,
    'Bentinho relembra sua vida e seu relacionamento com Capitu.',
    '21x14',
    3,
    3
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
    4,
    4
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
    5,
    2
);
