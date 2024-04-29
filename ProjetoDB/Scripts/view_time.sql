CREATE OR REPLACE VIEW time AS
SELECT
    t.Funcionario_idFuncionario AS idTreinador,
    a.Funcionario_idFuncionario AS idAtleta,
    m.nomeModalidade,
    c.nomeCategoria
FROM
    Treinador t
JOIN
    Atleta a ON t.Modalidade_idModalidade = a.Modalidade_idModalidade
        AND t.Categoria_idCategoria = a.Categoria_idCategoria
JOIN
    Modalidade m ON t.Modalidade_idModalidade = m.idModalidade
JOIN
    Categoria c ON t.Categoria_idCategoria = c.idCategoria;
