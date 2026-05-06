//Copiei do aquarioModelo e alterei para o meu;

var database = require("../database/config");

function buscarLivrosPorUsuario(idUsuario) {
    console.log("ACESSEI O LIVRO MODEL PARA BUSCAR OS LIVROS DO USUARIO");

    var instrucaoSql = `
        SELECT id_livro, nome, autor, genero, total_paginas, paginas_lidas 
        FROM livro 
        WHERE fk_id_usuario = ${idUsuario};
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarLivrosPorUsuario
};