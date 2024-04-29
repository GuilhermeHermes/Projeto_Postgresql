CREATE OR REPLACE FUNCTION verificar_categoria_atleta()
RETURNS TRIGGER AS $$
DECLARE
    idade_atleta INTEGER;
    categoria_atleta INTEGER;
BEGIN

    idade_atleta := EXTRACT(YEAR FROM AGE((
        SELECT dataNascPessoa
        FROM Pessoa
        WHERE idPessoa = (SELECT Pessoa_idPessoa FROM Funcionario WHERE idFuncionario = NEW.Funcionario_idFuncionario)
    )));

    -- Determinar a categoria com base na idade
    IF idade_atleta <= 13 THEN
        categoria_atleta := 11;  -- Substitua com o ID correto para 'Sub13'
    ELSIF idade_atleta <= 15 THEN
        categoria_atleta := 12;  -- Substitua com o ID correto para 'Sub15'
    ELSIF idade_atleta <= 18 THEN
        categoria_atleta := 13;  -- Substitua com o ID correto para 'Sub18'
    ELSIF idade_atleta <= 23 THEN
        categoria_atleta := 14;  -- Substitua com o ID correto para 'Sub23'
    ELSE
        categoria_atleta := 15;  -- Substitua com o ID correto para 'Adulto'
    END IF;

    -- Verificar se a categoria está correta e gerar uma exceção se não estiver
    IF categoria_atleta <> NEW.Categoria_idCategoria THEN
        RAISE EXCEPTION 'A categoria do atleta está incorreta. Esperada: %, Atual: %', categoria_atleta, NEW.Categoria_idCategoria;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;


CREATE TRIGGER trigger_verificar_categoria_atleta
BEFORE INSERT OR UPDATE ON atleta
FOR EACH ROW
EXECUTE FUNCTION verificar_categoria_atleta();
