-- Este arquivo é executado automaticamente pelo container MySQL na primeira inicialização
-- (via docker-entrypoint-initdb.d). O banco já é criado pela variável MYSQL_DATABASE.
 
USE db_direcao;
 
CREATE TABLE IF NOT EXISTS preCadastro (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    servico_desejado VARCHAR(100)
);
 