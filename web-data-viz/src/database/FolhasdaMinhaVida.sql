create database FolhasdaMinhaVida;
use FolhasdaMinhaVida;

create table usuario (
    id_usuario int primary key auto_increment,
    nome varchar(100),
    email varchar(100),
    senha varchar(45)
);

create table livro (
    id_livro int primary key auto_increment,
    nome varchar(100),
    preco decimal(10,2),
    autor varchar(100),
    genero varchar(45),
    editora varchar(45),
    nacionalidade_livro varchar(45),
    constraint unique_obra unique (nome, autor)
);

create table status_leitura (
    id_status int primary key auto_increment,
    nome_status varchar(45) not null
);

create table estante (
    id_estante int primary key auto_increment,
    fk_usuario int,
    fk_livro int,
    fk_status int,
    preco decimal(10,2),
    paginas_lidas int default 0,
    total_paginas int, 
    nacionalidade_livro varchar(45),
    constraint fk_usuario_estante 
    foreign key (fk_usuario) references usuario(id_usuario),
    constraint fk_livro_estante 
    foreign key (fk_livro) references livro(id_livro),
    constraint fk_status_estantes 
    foreign key (fk_status) references status_leitura(id_status)
);

create table historico_leitura (
    id_historico int primary key auto_increment,
    paginas_lidas int,
    data_registro datetime default current_timestamp,
    fk_livro int,
    constraint fk_livro_historico_leitura 
    foreign key (fk_livro) references livro(id_livro)
);

create table avaliacao_livro(
	id_avaliacao_livro int primary key auto_increment,
    nota int,
    fk_livro int,
    fk_usuario int,
    constraint fk_livro_avaliacao_livro
    foreign key(fk_livro) references livro(id_livro),
    constraint fk_usuario_avaliacao_livro
    foreign key(fk_usuario) references usuario(id_usuario)
);

create table postagem(
	id_postagem int primary key auto_increment,
    titulo varchar(45),
    conteudo text,
    data_postagem datetime default current_timestamp,
    fk_usuario int,
    constraint fk_usuario_postagem
    foreign key(fk_usuario) references usuario(id_usuario)
);

create table comentario(
	id_comentario int primary key auto_increment,
    descricao text,
    data_comentario datetime default current_timestamp,
    fk_usuario int,
    fk_postagem int,
    constraint fk_usuario_comentario
    foreign key(fk_usuario) references usuario(id_usuario),
    constraint fk_postagem_comentario
    foreign key(fk_postagem) references postagem(id_postagem)
);

insert into usuario (nome, email, senha) values 
('Thabata', 'thabata@email.com', 'senha123');

insert into status_leitura (nome_status) values 
('Quero ler'), 
('Lendo'), 
('Lido'), 
('Abandonado');

insert into livro (nome, autor, genero, editora) values 
('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 'Fábula', 'Agir'),
('O Ladrão de Raios', 'Rick Riordan', 'Fantasia', 'Intrínseca'),
('O Mar de Monstros', 'Rick Riordan', 'Fantasia', 'Intrínseca'),
('A Maldição do Titã', 'Rick Riordan', 'Fantasia', 'Intrínseca'),
('A Batalha do Labirinto', 'Rick Riordan', 'Fantasia', 'Intrínseca'),
('O Último Olimpiano', 'Rick Riordan', 'Fantasia', 'Intrínseca'),
('Jogos Vorazes', 'Suzanne Collins', 'Distopia', 'Rocco'),
('Em Chamas', 'Suzanne Collins', 'Distopia', 'Rocco'),
('A Esperança', 'Suzanne Collins', 'Distopia', 'Rocco'),
('A Droga da Obediência', 'Pedro Bandeira', 'Mistério', 'Moderna'),
('Pântano de Sangue', 'Pedro Bandeira', 'Mistério', 'Moderna'),
('Anjo da Morte', 'Pedro Bandeira', 'Mistério', 'Moderna'),
('A Droga do Amor', 'Pedro Bandeira', 'Mistério', 'Moderna'),
('Droga de Americana!', 'Pedro Bandeira', 'Mistério', 'Moderna'),
('A Droga do Destino', 'Pedro Bandeira', 'Mistério', 'Moderna'),
('A Menina que Roubava Livros', 'Markus Zusak', 'Drama', 'Intrínseca'),
('O Mar Sem Estrelas', 'Erin Morgenstern', 'Fantasia', 'Intrínseca'),
('Os Sete Maridos de Evelyn Hugo', 'Taylor Jenkins Reid', 'Ficção', 'Paralela'),
('E se fôssemos nós?', 'Becky Albertalli e Adam Silvera', 'Romance', 'Intrínseca'),
('A Primeira Pessoa a Morrer no Final', 'Adam Silvera', 'Drama', 'Intrínseca'),
('Por Lugares Incríveis', 'Jennifer Niven', 'Drama', 'Seguinte'),
('A Cinco Passos de Você', 'Rachael Lippincott', 'Romance', 'Globo Alt'),
('É Assim que Acaba', 'Colleen Hoover', 'Drama', 'Galera Record'),
('Aristóteles e Dante Descobrem os Segredos do Universo', 'Benjamin Alire Sáenz', 'Romance', 'Seguinte'),
('Heartstopper', 'Alice Oseman', 'Graphic Novel', 'Seguinte'),
('Vermelho, Branco e Sangue Azul', 'Casey McQuiston', 'Romance', 'Seguinte'),
('O Ódio que Você Semeia', 'Angie Thomas', 'Drama', 'Galera Record');

insert into estante (fk_usuario, fk_livro, fk_status, total_paginas, paginas_lidas) 
values (1, 1, 3, 96, 96);

insert into estante (fk_usuario, fk_livro, fk_status, total_paginas, paginas_lidas) 
values (1, 2, 2, 400, 150);

insert into postagem (titulo, conteudo, fk_usuario) values 
('Iniciando minha jornada', 'Acabei de organizar minha estante aqui no Folhas da Minha Vida!', 1);
