-- Preencha com o SQL de inicialização do 
CREATE DATABASE livraria;

CREATE TABLE IF NOT EXISTS usuario (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    login VARCHAR(255) UNIQUE NOT NULL,
    senha CHAR(60) NOT NULL,
    img VARCHAR(255)
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
    CONSTRAINT idAutor_Fk FOREIGN KEY idAutor REFERENCES autor(id),
    CONSTRAINT idEditora_Fk FOREIGN KEY idEditora REFERENCES editora(id)
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