USE projeto;

SHOW TABLES;

SELECT * FROM cliente;

/* OR */

SELECT Nome, Sexo, Endereco FROM cliente WHERE Sexo = 'M' OR Endereco LIKE '%PE';

SELECT Nome, Sexo, Endereco FROM cliente WHERE Sexo = 'F' OR Endereco LIKE '%Santos%';

/* AND */

SELECT Nome, Sexo, Endereco FROM cliente WHERE Sexo = 'M' AND Endereco LIKE '%SP'; /*Retornará "EMPTY SET" pois em SP não tem ninguém do Sexo 'M'! */

SELECT Nome, Sexo, Endereco FROM cliente WHERE Sexo = 'F' AND Endereco LIKE 'Avenida%';


/* PERFORMANCE EM OPERADORES LÓGICOS */

/* 1 MILHÃO DE REGISTROS

-PARA CONTAR-
SELECT COUNT(*) AS "Quantidade de Registros" FROM cliente;

SELECT Sexo, COUNT(*) AS "Quantidade de Registros" FROM cliente GROUP BY Sexo;

-CONDICÃO-
Sexo = F
Cidade = São Paulo

-SITUACÃO - TRATANDO COM 'OR'-
70% Mulheres = Sexo = F
30% Moram em São Paulo

SELECT Nome, Sexo, Endereco FROM Cliente WHERE Sexo = 'F' OR Cidade = 'São Paulo';

-STUACÃO - TRATANDO COM 'AND'-
70% Mulheres = Sexo = F
30% Moram em São Paulo

SELECT Nome, Sexo, Endereco FROM Cliente WHERE Cidade = 'São Paulo' AND Sexo = 'F';

*/