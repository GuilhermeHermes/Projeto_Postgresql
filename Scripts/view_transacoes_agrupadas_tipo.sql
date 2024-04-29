CREATE OR REPLACE VIEW view_transacoes_agrupadas_tipo AS
SELECT
    tipoTransacao,
    SUM(valorTransacao) AS total_valor
FROM
    Transacoes
GROUP BY
    tipoTransacao;
