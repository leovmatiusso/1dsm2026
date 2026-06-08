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