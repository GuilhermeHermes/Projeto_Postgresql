CREATE OR REPLACE VIEW view_relatorio_modalidades AS
SELECT
    M.idModalidade,
    M.nomeModalidade,
    COUNT(A.idAtleta) AS total_atletas
FROM
    Modalidade M
    LEFT JOIN Atleta A ON M.idModalidade = A.Modalidade_idModalidade
GROUP BY
    M.idModalidade, M.nomeModalidade;
