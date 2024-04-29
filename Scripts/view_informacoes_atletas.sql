CREATE OR REPLACE VIEW view_informacoes_atletas AS
SELECT
    A.idAtleta,
    P.nomePessoa,
    C.nomeCategoria,
    M.nomeModalidade
FROM
    Atleta A
    JOIN Funcionario F ON A.Funcionario_idFuncionario = F.idFuncionario
    JOIN Pessoa P ON F.Pessoa_idPessoa = P.idPessoa
    JOIN Categoria C ON A.Categoria_idCategoria = C.idCategoria
    JOIN Modalidade M ON A.Modalidade_idModalidade = M.idModalidade;