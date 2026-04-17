create database FolhasdaMinhaVida;

use FolhasdaMinhaVida;

create table usuario(
	id_usuario int primary key auto_increment,
    nome varchar(100),
    email varchar(100),
    senha varchar(45),
    meta_livros int
);

create table livro(
	id_livro int primary key auto_increment,
    nome varchar(100),
    preco float,
    autor varchar(100),
    genero varchar(45),
    editora varchar(45),
    nacionalidade_livro varchar(45),
    total_paginas int,
    paginas_lidas int,
    fk_id_usuario int,
    constraint fk_id_usuario_livro 
    foreign key(fk_id_usuario) references usuario(id_usuario)
);

create table historico_leitura(
	id_historico int primary key auto_increment,
    qtd_paginas_lidas int,
    data_registro date,
    fk_id_livro int,
    constraint fk_id_livro_historico_leitura
    foreign key(fk_id_livro) references livro(id_livro)
);

create table avaliacao_livro(
	id_avaliacao_livro int primary key auto_increment,
    nota int,
    fk_id_livro int,
    constraint fk_id_livro_avaliacao_livro
    foreign key(fk_id_livro) references livro(id_livro),
    fk_id_usuario int,
    constraint fk_id_usuario_avaliacao_livro
    foreign key(fk_id_usuario) references usuario(id_usuario)
);

create table postagem(
	id_postagem int primary key auto_increment,
    titulo varchar(45),
    conteudo text,
    data_postagem datetime,
    fk_id_usuario int,
    constraint fk_id_usuario_postagem
    foreign key(fk_id_usuario) references usuario(id_usuario)
);

create table comentario(
	id_comentario int,
    descricao text,
    data_comentario datetime,
    fk_id_usuario int,
    constraint fk_id_usuario_comentario
    foreign key(fk_id_usuario) references usuario(id_usuario),
    fk_id_postagem int,
    constraint fk_id_postagem_comentario
    foreign key(fk_id_postagem) references postagem(id_postagem)
);