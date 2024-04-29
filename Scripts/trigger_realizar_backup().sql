CREATE OR REPLACE FUNCTION realizar_backup()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO BackupTransacoes (idTransacoes, Pessoa_idPessoa, dataTransacao, valorTransacao, tipoTransacao, descricaoTransacao)
  VALUES (NEW.idTransacoes, NEW.Pessoa_idPessoa, NEW.dataTransacao, NEW.valorTransacao, NEW.tipoTransacao, NEW.descricaoTransacao);
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER backup_transacoes_trigger
AFTER INSERT ON Transacoes
FOR EACH ROW
EXECUTE FUNCTION realizar_backup();
