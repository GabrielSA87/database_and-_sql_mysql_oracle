/* DELIMITADOR DO SQL SERVER - GO */

CREATE DATABASE AULA_SQL
GO

USE AULA_SQL
GO

CREATE TABLE TESTE(
	NOME VARCHAR(30)
)
GO

-- MDF E LDF --
/*

MDF = MASTER DATA FILE (ARMAZENA DADOS DO SISTEMA - DICIONARIO)

LDF = LOG DATA FILE (ARMAZENA LOG)

*/


-- ORGANIZAR FISICAMENTE E LOGICAMENTE UM BANCO DE DADOS --
/*

	1 - CRIAR O BANCO COM ARQUIVOS PARA OS SETRORES DE MKT E VENDAS.
	2 - CRIAR UM ARQUIVO GERAL.
	3 - DEIXAR O MDF APENAS COM O DICIONARIO DE DADOS.
	4 - CRIAR 2 GRUPOS DE ARQUIVOS (PRIMARY - MDF).

*/


-- CRIANDO TABELAS --

CREATE TABLE ALUNO(
	IDALUNO INT PRIMARY KEY IDENTITY(1,1), --NO SQL SERVER NO LUGAR DO AUTO_INCREMENT ESCREVE-SE IDENTITY OU IDENTITY(1,1).--
	NOME VARCHAR(30) NOT NULL,
	SEXO CHAR (1) NOT NULL,
	NASCIMENTO DATE NOR NULL,
	EMAIL VARCHAR(30) UNIQUE
)
GO

-- CONSTRAINTS --

ALTER TABLE ALUNO
ADD CONSTRAINT CK_SEXO CHECK (SEXO IN ('M','F'))
GO

-- RELACIONAMENTO 1 X 1 --

CREATE TABLE ENDERECO(
	IDENDERECO INT PRIMARY KEY IDENTITY(100,10),
	BAIRRO VARCHAR(30),
	UF CHAR(2) NOT NULL
	CHECK (UF IN ('RJ','SP','MG')),
	ID_ALUNO INT UNIQUE
)
GO

-- CRIANDO A FK --

ALTER TABLE ENDERECO ADD CONSTRAINT FK_ENDERECO_ALUNO
FOREIGN KEY (ID_ALUNO) REFERENCES ALUNO(IDALUNO)
GO

-- COMANDOS DE DESCRICAO --

-- NO MYSQL TEMOS OS COMANDOS: DESC, SHOW/CREATE TABLE --

-- NO SQL SERVER TEMOS: 'PROCEDURES' (JA CRIADAS E ARMAZENADAS NO SISTEMS) --

SP_COLUMNS ALUNO
GO

SP_HELP ALUNO
GO

-- INSERINDO DADOS --

INSERT INTO ALUNO VALUES ('ANDRE','M','1981/12/09','ANDRE@MAIL.COM') -- NO SQL SERVER NAO PRECISA PASSAR O VALOR 'NULL' PARA O CAMPO ID --
INSERT INTO ALUNO VALUES ('ANA','F','1978/03/14','ANA@MAIL.COM')
INSERT INTO ALUNO VALUES ('RUI','M','1965/07/25','RUI@MAIL.COM')
INSERT INTO ALUNO VALUES ('JOAO','M','2002/11/29','JOAO@MAIL.COM')
GO

SELECT * FROM ALUNO
GO

INSERT INTO ENDERECO VALUES ('FLAMENGO','RJ',1)
INSERT INTO ENDERECO VALUES ('MORUMBI','SP',2)
INSERT INTO ENDERECO VALUES ('CENTRO','MG',4)
INSERT INTO ENDERECO VALUES ('CENTRO','SP',6)
GO

-- CRIANDO TABELA TELEFONE --

CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY IDENTITY,
	TIPO CHAR(3) NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_ALUNO INT,
	CHECK (TIPO IN ('RESIDENCIAL','COMERCIAL','CELULAR'))
)
GO

INSERT INTO TELEFONE VALUES ('CELULAR','789456123',1)
INSERT INTO TELEFONE VALUES ('RESIDENCIAL','345678941',1)
INSERT INTO TELEFONE VALUES ('COMERCIAL','3421567890',2)
INSERT INTO TELEFONE VALUES ('CELULAR','987542136',2)
GO

SELECT * FROM ALUNO
GO


-- CLAUSULA AMBIGUA (COLUNAS IGUAIS EM UM JOIN) --

SELECT A.NOME, T.TIPO, T.NUMERO, E.BAIRRO, E.UF
FROM ALUNO A
	LEFT JOIN TELEFONE T
	ON A.IDALUNO = T.ID_ALUNO
	INNER JOIN ENDERECO E
	ON A.IDALUNO = E.ID_ALUNO
GO

-- IFNULL --

SELECT A.NOME,
	   ISNULL (T.TIPO, 'SEM') AS 'TIPO',
	   ISNULL (T.NUMERO, 'NUMERO') AS 'TELEFONE',
	   E.BAIRRO,
	   E.UF
	FROM ALUNO A
		LEFT JOIN TELEFONE T
		ON A.IDALUNO = T.ID_ALUNO
		INNER JOIN ENDERECO E
		ON A.IDALUNO = E.ID_ALUNO
GO


-- **** DATAS **** --

SELECT NOME, NASCIMENTO
FROM ALUNO
GO

-- RETORNAR DATA ATUAL --

SELECT GETDATE() --FORMATO: yyyy-MM-dd hh:mm:ss--
GO

-- DATEIFF - CALCULA A DIFERENCA ENTRE DUAS DATAS --

SELECT NOME, (DATEIFF(DAY,NASCIMENTO,GETDATE())/365.2425) AS 'IDADE' --DIVIDIDO POR 365.2425 PARA CONSIDERAR O ANO BISEXTO--
FROM ALUNO
GO

SELECT NOME, (DATEIFF(MONTH,NASCIMENTO,GETDATE())/12) AS 'IDADE' --DIVIDIDO POR 365.2425 PARA CONSIDERAR O ANO BISEXTO--
FROM ALUNO
GO

SELECT NOME, DATEIFF(YEAR,NASCIMENTO,GETDATE()) AS 'IDADE' --DIVIDIDO POR 365.2425 PARA CONSIDERAR O ANO BISEXTO--
FROM ALUNO
GO

 -- TRAZER O NOME DA PARTE DA DATA EM QUESTAO --
 
SELECT NOME, DATANAME(MONTH, NASCIMENTO)
FROM ALUNO
GO
 
SELECT NOME, DATANAME(YEAR, NASCIMENTO)
FROM ALUNO
GO 

SELECT NOME, DATANAME(WEEKDAY, NASCIMENTO)
FROM ALUNO
GO

-- DATEPART - IGUAL AO DATANAME, MAS COMO INTEIRO --

SELECT NOME, DATEPART(MONTH, NASCIMENTO)
FROM ALUNO
GO

SELECT NOME, DATEPART(MONTH, NASCIMENTO), DATENAME(MONTH, NASCIMENTO)
FROM ALUNO
GO

-- DATEADD - RETORNA UMA DATA SOMANDO A OUTRA DATA --

SELECT DATEADD(DAY,365,GETDATE())
GO

SELECT DATEADD(YEAR,10,GETDATE())
GO

-- **** CONVERSAO DE DADOS **** --

SELECT 1 + '1' --RETORNARA 2--
GO

SELECT '1' + '1' --RETORNARA 11--
GO

SELECT 'CURSO' + '1' --RETORNARA CURSO1--
GO

SELECT 'CURSO' + 1 --RETORNARA UM ERRO, POIS O SQL SERVER TENTOU CONCATENAR UMA STRING COM UM INT, ISSO FORCARA UMA STRING PARA UM INT, RESULTANDO NESSE CASO EM ERRO--
GO

-- FUNCOES DE CONVERSAO DE DADOS --

SELECT CAST('1' AS INT) + CAST('1'AS INT) --RETORNARA 2--
GO

-- CONVERSAO E CONCATENACAO
-- https://msdn.microsoft.com/en-us/library/ms191530.aspx --

SELECT NOME, CAST(DAY(NASCIMENTO) AS VARCHAR) + '/' + CAST(MONTH(NASCIMENTO) AS VARCHAR) + '/' + CAST(YEAR(NASCIMENTO) AS VARCHAR) AS 'NASCIMENTO'
FROM ALUNO
GO

-- **** CHARINDEX **** -- CHARINDEX(O QUE, ONDE, A PARTIR DE) RESULTADO --
-- RETONA UM INTEIRO BASEADO NUMA BUSCA EM UMA COLUNA --

SELECT NOME, CHARINDEX('A',NOME) AS INDICE --COMO "A PARTIR DE" NAO FOI PASSADO AQUI, ELE VAI CONSIDERAR SENDO 01 (DEFAULT)-
FROM ALUNO
GO

 ------- -------
|NOME	|INDICE |
 ------- -------
|ANDRE  |1	|
|ANA	|1	|
|RUI	|0	|
|JOAO	|3	|
 ------- -------

SELECT NOME, CHARINDEX('A',NOME,2) AS INDICE
FROM ALUNO
GO

 ------- -------
|NOME	|INDICE |
 ------- -------
|ANDRE  |0	|
|ANA	|3	|
|RUI	|0	|
|JOAO	|3	|
 ------- -------
