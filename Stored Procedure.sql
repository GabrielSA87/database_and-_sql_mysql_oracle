/* STORED PROCEDURES */

DELIMITER #

CREAT PROCEDURE nome()
BEGIN
	Qualquer Progamacao;
END
#

CREATE PROCEDURE nome_empresa()
BEGIN
	SELECT 'UNIVERSIDADE DOS DADOS' AS Empresa;
END
#

/* CHAMANDO UMA 'PROCEDURE' */

CALL nome_emrpesa()#


/* PROCEDURE COM PARAMETROS */

CREATE PROCEDURE conta()
BEGIN
	SELECT 10 + 10 AS Conta;
END#

CALL conta()#

DROP PROCEDURE conta#

CREATE PROCEDURE conta(num1 INT, num2 INT)
BEGIN
	SELECT num1 + num2 AS Conta;
END#

CALL conta(100,50)#


/* ----------------------------------------------------------------------------------------*/

/* PROCEDURES COM QUERRIES - PARAMETROS */

CREATE DATABASE projeto;

USE projeto;

CREATE TABLE cursos(
	IdCurso INT PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(30) NOT NULL,
	Horas INT(3) NOT NULL,
	Valor FLOAT(10,2) NOT NULL
);

SHOW TABLES;

INSERT INTO cursos VALUES (NULL, 'JAVA', 30, 500.00);
INSERT INTO cursos VALUES (NULL, 'Fundamentos de Banco de Dados', 40, 699.90);

SELECT * FROM cursos;

DELIMITER #

STATUS

CREATE PROCEDURE cad_curso(p_nome VARCHAR(30),
						   p_horas INT(30),
						   p_valor FLOAT(10,2))
BEGIN
	INSERT INTO cursos VALUES(NULL,p_nome,p_horas,p_valor);
END
#

DELIMITER ;

CALL cad_curso('BI SQL SERVER',35,3000.00);
CALL cad_curso('POWER BI',20,1000.00);
CALL cad_curso('TABLEAU',30,1200.00);
