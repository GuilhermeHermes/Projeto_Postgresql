CREATE OR REPLACE VIEW view_salarios_funcionarios AS
SELECT
    F.idFuncionario,
    P.nomePessoa,
    F.salarioFuncionario
FROM
    Funcionario F
    JOIN Pessoa P ON F.Pessoa_idPessoa = P.idPessoa;
