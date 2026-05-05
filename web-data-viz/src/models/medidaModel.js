var database = require("../database/config");

function buscarUltimasMedidas(idLivro, limite_linhas) {

    //Alterei o fk_aquario para livro
    var instrucaoSql = `SELECT 
        paginas_lidas as paginas, 
                        data_registro,
                        DATE_FORMAT(data_registro,'%H:%i:%s') as momento_grafico
                    FROM historico_leitura
                    WHERE fk_livro = ${idLivro}
                    ORDER BY id_historico DESC LIMIT ${limite_linhas}`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idLivro) {

    var instrucaoSql = `SELECT 
        paginas_lidas as paginas,
                        DATE_FORMAT(data_registro,'%H:%i:%s') as momento_grafico, 
                        fk_livro 
                        FROM historico_leitura WHERE fk_livro = ${idLivro} 
                    ORDER BY id_historico DESC LIMIT 1`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal
}
