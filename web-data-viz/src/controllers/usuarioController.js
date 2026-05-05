// var usuarioModel = require("../models/usuarioModel");
// var aquarioModel = require("../models/aquarioModel");

// function autenticar(req, res) {
//     var email = req.body.emailServer;
//     var senha = req.body.senhaServer;

//     if (email == undefined) {
//         res.status(400).send("Seu email está undefined!");
//     } else if (senha == undefined) {
//         res.status(400).send("Sua senha está indefinida!");
//     } else {

//         usuarioModel.autenticar(email, senha)
//             .then(
//                 function (resultadoAutenticar) {
//                     console.log(`\nResultados encontrados: ${resultadoAutenticar.length}`);
//                     console.log(`Resultados: ${JSON.stringify(resultadoAutenticar)}`); // transforma JSON em String

//                     if (resultadoAutenticar.length == 1) {
//                         console.log(resultadoAutenticar);

//                         res.json({
//                             id: resultadoAutenticar[0].id_usuario,
//                             email: resultadoAutenticar[0].email,
//                             nome: resultadoAutenticar[0].nome
//                         });

//                         // aquarioModel.buscarAquariosPorEmpresa(resultadoAutenticar[0].empresaId)
//                         //     .then((resultadoAquarios) => {
//                         //         if (resultadoAquarios.length > 0) {
//                         //             res.json({
//                         //                 id: resultadoAutenticar[0].id_usuario,
//                         //                 email: resultadoAutenticar[0].email,
//                         //                 nome: resultadoAutenticar[0].nome,
//                         //                 senha: resultadoAutenticar[0].senha,
//                         //                 // aquarios: resultadoAquarios
//                         //             });
//                         //         } //else {
//                         //     res.status(204).json({ aquarios: []  });
//                         // }
//                         //                 })

//                     } else if (resultadoAutenticar.length == 0) {
//                         res.status(403).send("Email e/ou senha inválido(s)");
//                     } else {
//                         res.status(403).send("Mais de um usuário com o mesmo login e senha!");
//                     }
//                 }
//             ).catch(
//                 function (erro) {
//                     console.log(erro);
//                     console.log("\nHouve um erro ao realizar o login! Erro: ", erro.sqlMessage);
//                     res.status(500).json(erro.sqlMessage);
//                 }
//             );
//     }
// }

// Copiei o antigo e modifiquei poucas coisas
var usuarioModel = require("../models/usuarioModel");

function autenticar(req, res) {
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;

    if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está indefinida!");
    } else {
        usuarioModel.autenticar(email, senha)
            .then(
                function (resultadoAutenticar) {
                    console.log(`\nResultados encontrados: ${resultadoAutenticar.length}`);

                    //não coloquei o de transfromar o json e string;

                    if (resultadoAutenticar.length > 0) { 
                        // Assim ele pega varios livros;
                        
                        // o usuario tem que estar em uma var porque o codigo tem que montar linha por linha na parte de livros para funcionar ao inves de já responder direto;
                        var usuario = {
                            id_usuario: resultadoAutenticar[0].id_usuario,
                            email: resultadoAutenticar[0].email,
                            nome: resultadoAutenticar[0].nome,
                            livros: [] 
                        };

                        //coloquei um for para ele percorer o autenticar uma linha por linha;
                        for (let i = 0; i < resultadoAutenticar.length; i++) {
                            let linha = resultadoAutenticar[i];
                            
                            //se tiver livro ele vai adicionar aqui;
                            if (linha.id_livro != null) {
                                usuario.livros.push({
                                    id_livro: linha.id_livro,
                                    nome: linha.nome_livro 
                                });
                            }
                        }

                        //envia da mesma forma parar o front-end;
                        // envia os dados aqui
                        res.json(usuario);

                    } else if (resultadoAutenticar.length == 0) {
                        res.status(403).send("Email e/ou senha inválido(s)");
                    } else {
                        res.status(403).send("Mais de um usuário com o mesmo login e senha!");
                    }
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

    function cadastrar(req, res) {
        // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
        var nome = req.body.nomeServer;
        var email = req.body.emailServer;
        var senha = req.body.senhaServer;

        // Faça as validações dos valores
        if (nome == undefined) {
            res.status(400).send("Seu nome está undefined!");
        } else if (email == undefined) {
            res.status(400).send("Seu email está undefined!");
        } else if (senha == undefined) {
            res.status(400).send("Sua senha está undefined!");
        } else {

            // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
            usuarioModel.cadastrar(nome, email, senha)
                .then(
                    function (resultado) {
                        res.json(resultado);
                    }
                ).catch(
                    function (erro) {
                        console.log(erro);
                        console.log(
                            "\nHouve um erro ao realizar o cadastro! Erro: ",
                            erro.sqlMessage
                        );
                        res.status(500).json(erro.sqlMessage);
                    }
                );
        }
    }

module.exports = {
    autenticar,
    cadastrar
}
