CREATE OR REPLACE VIEW view_historico_transacoes_pessoa AS
SELECT
    T.idTransacoes,
    P.nomePessoa,
    T.dataTransacao,
    T.valorTransacao,
    T.tipoTransacao,
    T.descricaoTransacao
FROM
    Transacoes T
    JOIN Pessoa P ON T.Pessoa_idPessoa = P.idPessoa;
