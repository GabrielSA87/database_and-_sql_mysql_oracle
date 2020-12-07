/* Modelagem Básica */

/* ENTIDADE = TABELA */
/* CAMPOS = ATRIBUTOS */


CLIENTE
campos - tipagem(qtd)
NOME - CARACTER(30)
CPF - NUMERICO(11)
EMAIL - CARACTER(30)
TELEFONE - CARACTER(30)
ENDERECO - CARACTER(100)
SEXO - CARACTER(1)

/* PROCESSOS DE MODELAGEM */

/* FASE 01 E FASE 02 - AD (ADM DE DADOS)*/

MODELAGEM CONCEITUAL - RASCUNHO
MODELAGEM LÓGICA - QUALQUER SOFTWARE DE MODELAGEM (EX.: MySQL WORKBENCH)

/* FASE 03 - DBA ou AD */

MODELAGEM FÍSICA - SCRIPTS DE BANCO

create database projeto;

use projeto;

create table cliente(
	Nome varchar(30),
	Sexo char(1),
	Email varchar(30),
	CPF varchar(11),
	Telefone varchar(30),
	Endereco varchar(100)
);

insert into cliente (Nome,Email,CPF,Telefone,Endereco,Sexo) values ('Gabriel','gabriel@icloud.com','07235782498','81997531122','Rua Pajussara, 110','M'), ('Elenn','elenn@icloud.com','05785705481','3212305643','Avenida Liberdade','F');

select Nome, Sexo, Email, Endereco from cliente;

select Nome, Sexo from cliente where Sexo = 'M';

select Nome, Telefone from cliente where Endereco like '%PE';

select Nome, Telefone from cliente where Endereco like 'Rua%';

select Nome, Telefone from cliente where Endereco like '%Recife%'; 