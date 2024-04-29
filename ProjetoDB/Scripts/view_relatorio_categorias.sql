CREATE OR REPLACE VIEW view_relatorio_categorias AS
SELECT
    C.idCategoria,
    C.nomeCategoria,
    COUNT(A.idAtleta) AS total_atletas
FROM
    Categoria C
    LEFT JOIN Atleta A ON C.idCategoria = A.Categoria_idCategoria
GROUP BY
    C.idCategoria, C.nomeCategoria;
