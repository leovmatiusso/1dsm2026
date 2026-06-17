<<<<<<< HEAD
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
 
=======
create database db_direcao;

use db_direcao;

create table preCadastro (
    id int auto_increment primary key,
    nome varchar(100) not null,
    cpf int not null unique,
    email varchar(100) not null,
    telefone varchar(20) not null,
    servico_desejado varchar(100)
);
ALTER TABLE preCadastro MODIFY cpf VARCHAR(14) NOT NULL;
>>>>>>> 41a8ed605d5d18e9ccf918f95f42dbfdeca37a2d
