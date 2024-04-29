CREATE OR REPLACE FUNCTION verificar_valor_transacao()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.valorTransacao < 0 THEN
        RAISE EXCEPTION 'O valor da transação não pode ser negativo';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER trigger_verificar_valor_transacao
BEFORE INSERT ON Transacoes
FOR EACH ROW
EXECUTE FUNCTION verificar_valor_transacao();
