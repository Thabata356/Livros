//Copiei do aquarioModelo e alterei para o meu;

var database = require("../database/config");

function buscarLivrosPorUsuario(idUsuario) {
    var instrucaoSql = `
        SELECT id_livro, nome, autor, genero, total_paginas, paginas_lidas 
        FROM livro 
        WHERE fk_usuario = ${idUsuario};
    `;
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarLivrosPorUsuario 
};