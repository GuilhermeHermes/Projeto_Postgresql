CREATE OR REPLACE VIEW view_informacoes_treinadores AS
SELECT
    T.idTreinador,
    P.nomePessoa,
    C.nomeCategoria,
    M.nomeModalidade
FROM
    Treinador T
    JOIN Funcionario F ON T.Funcionario_idFuncionario = F.idFuncionario
    JOIN Pessoa P ON F.Pessoa_idPessoa = P.idPessoa
    JOIN Categoria C ON T.Categoria_idCategoria = C.idCategoria
    JOIN Modalidade M ON T.Modalidade_idModalidade = M.idModalidade;
