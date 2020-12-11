/* IFNULL */

/* Nome, Email, Numero, Estado - USANDO AS TABELAS EM COMERCIO */

SELECT C.Nome, C.Email, E.Estado, T.Numero
FROM cliente C
	INNER JOIN endereco E
	ON C.IdCliente = E.Id_Cliente
	INNER JOIN telefone T
	ON C.IdCliente = T.Id_Cliente;

+---------+------------------------+--------+-------------+
| Nome    | Email                  | Estado | Numero      |
+---------+------------------------+--------+-------------+
| Joao    | joao@mail.com          | PE     | 8134552236  |
| Joao    | joao@mail.com          | PE     | 81997548798 |
| Joao    | joao@mail.com          | PE     | 81997587896 |
| Maria   | maria@ig.com           | PE     | 81997585897 |
| Flavio  | flaviopa@mail.com      | RJ     | 2132514566  |
| Lisa    | lisa.s@springfield.com | PA     | 3213205666  |
| Bart    | bart.s@springfield.com | PA     | 3213205444  |
| Pedro   | pedro.parque@ny.com    | RJ     | 2432554499  |
| Claudia | claudia@gmail.com      | SP     | 11992564789 |
| Claudia | claudia@gmail.com      | SP     | 1332657895  |
| Eduardo | duda@hotmail.com       | SP     | 1332657895  |
| ANDRE   | ANDRE@GLOBO.COM        | MG     | 68976565    |
| ANDRE   | ANDRE@GLOBO.COM        | MG     | 99656675    |
| GIOVANA | giovana@gmail.com      | RJ     | 33567765    |
| KARLA   | NULL                   | RJ     | 88668786    |
| KARLA   | NULL                   | RJ     | 55689654    |
| DANIELE | DANIELE@GMAIL.COM      | RJ     | 88687979    |
| LORENA  | lorena@mail.com        | ES     | 88965676    |
| EDUARDO | edu@mail.com           | RJ     | 89966809    |
| ANTONIO | ANTONIO@IG.COM         | PR     | 88679978    |
| ANTONIO | ANTONIO@UOL.COM        | SP     | 99655768    |
| ELAINE  | ELAINE@GLOBO.COM       | PR     | 89955665    |
| CARMEM  | CARMEM@IG.COM          | SP     | 77455786    |
| ADRIANA | ADRIANA@GMAIL.COM      | RJ     | 89766554    |
| JOICE   | JOICE@GMAIL.COM        | RJ     | 77755785    |
| Roberto | ROBERTOBETO@GMAIL.COM  | RJ     | 44522578    |
+---------+------------------------+--------+-------------+

SELECT C.Nome, IFNULL(C.Email,'EMAIL NAO REGISTRADO') AS 'Email', E.Estado, T.Numero
FROM cliente C
	INNER JOIN endereco E
	ON C.IdCliente = E.Id_Cliente
	INNER JOIN telefone T
	ON C.IdCliente = T.Id_Cliente;
	
+---------+----------------------------------------+--------+-------------+
| Nome    | IFNULL(C.Email,'EMAIL NAO REGISTRADO') | Estado | Numero      |
+---------+----------------------------------------+--------+-------------+
| Joao    | joao@mail.com                          | PE     | 8134552236  |
| Joao    | joao@mail.com                          | PE     | 81997548798 |
| Joao    | joao@mail.com                          | PE     | 81997587896 |
| Maria   | maria@ig.com                           | PE     | 81997585897 |
| Flavio  | flaviopa@mail.com                      | RJ     | 2132514566  |
| Lisa    | lisa.s@springfield.com                 | PA     | 3213205666  |
| Bart    | bart.s@springfield.com                 | PA     | 3213205444  |
| Pedro   | pedro.parque@ny.com                    | RJ     | 2432554499  |
| Claudia | claudia@gmail.com                      | SP     | 11992564789 |
| Claudia | claudia@gmail.com                      | SP     | 1332657895  |
| Eduardo | duda@hotmail.com                       | SP     | 1332657895  |
| ANDRE   | ANDRE@GLOBO.COM                        | MG     | 68976565    |
| ANDRE   | ANDRE@GLOBO.COM                        | MG     | 99656675    |
| GIOVANA | giovana@gmail.com                      | RJ     | 33567765    |
| KARLA   | EMAIL NAO REGISTRADO                   | RJ     | 88668786    |
| KARLA   | EMAIL NAO REGISTRADO                   | RJ     | 55689654    |
| DANIELE | DANIELE@GMAIL.COM                      | RJ     | 88687979    |
| LORENA  | lorena@mail.com                        | ES     | 88965676    |
| EDUARDO | edu@mail.com                           | RJ     | 89966809    |
| ANTONIO | ANTONIO@IG.COM                         | PR     | 88679978    |
| ANTONIO | ANTONIO@UOL.COM                        | SP     | 99655768    |
| ELAINE  | ELAINE@GLOBO.COM                       | PR     | 89955665    |
| CARMEM  | CARMEM@IG.COM                          | SP     | 77455786    |
| ADRIANA | ADRIANA@GMAIL.COM                      | RJ     | 89766554    |
| JOICE   | JOICE@GMAIL.COM                        | RJ     | 77755785    |
| Roberto | ROBERTOBETO@GMAIL.COM                  | RJ     | 44522578    |
+---------+----------------------------------------+--------+-------------+	



/* --------------------------------------------------------------------------------------- */


/* VIEW */

SELECT C.Nome, 
	   C.Sexo, 
	   IFNULL(C.Email,'***') AS 'Email', 
	   T.Numero, 
	   T.Tipo, 
	   E.Bairro, 
	   E.Cidade, 
	   E.Estado
FROM cliente C
	INNER JOIN telefone T
	ON C.IdCliente = T.Id_Cliente
	INNER JOIN endereco E
	ON C.IdCliente = E.Id_Cliente;

CREATE VIEW relatorio AS
SELECT C.Nome, 
	   C.Sexo, 
	   IFNULL(C.Email,'***') AS 'Email', 
	   T.Numero, 
	   T.Tipo, 
	   E.Bairro, 
	   E.Cidade, 
	   E.Estado
FROM cliente C
	INNER JOIN telefone T
	ON C.IdCliente = T.Id_Cliente
	INNER JOIN endereco E
	ON C.IdCliente = E.Id_Cliente;

SELECT * FROM relatorio;

+---------+------+------------------------+-------------+-------------+------------+----------------+--------+
| Nome    | Sexo | Email                  | Numero      | Tipo        | Bairro     | Cidade         | Estado |
+---------+------+------------------------+-------------+-------------+------------+----------------+--------+
| Joao    | M    | joao@mail.com          | 8134552236  | RESIDENCIAL | Barro      | Recife         | PE     |
| Joao    | M    | joao@mail.com          | 81997548798 | COMERCIAL   | Barro      | Recife         | PE     |
| Joao    | M    | joao@mail.com          | 81997587896 | CELULAR     | Barro      | Recife         | PE     |
| Maria   | F    | maria@ig.com           | 81997585897 | CELULAR     | Boa Viagem | Recife         | PE     |
| Flavio  | M    | flaviopa@mail.com      | 2132514566  | COMERCIAL   | Lapa       | Rio de Janeiro | RJ     |
| Lisa    | F    | lisa.s@springfield.com | 3213205666  | CELULAR     | Nuclear    | Springfield    | PA     |
| Bart    | M    | bart.s@springfield.com | 3213205444  | CELULAR     | Nuclear    | Springfield    | PA     |
| Pedro   | M    | pedro.parque@ny.com    | 2432554499  | RESIDENCIAL | Morrao     | Rio de Janeiro | RJ     |
| Claudia | F    | claudia@gmail.com      | 11992564789 | CELULAR     | Canal 7    | Santos         | SP     |
| Claudia | F    | claudia@gmail.com      | 1332657895  | RESIDENCIAL | Canal 7    | Santos         | SP     |
| Eduardo | M    | duda@hotmail.com       | 1332657895  | COMERCIAL   | Vila Julia | Guaruja        | SP     |
| ANDRE   | M    | ANDRE@GLOBO.COM        | 68976565    | RESIDENCIAL | CASCADURA  | B. HORIZONTE   | MG     |
| ANDRE   | M    | ANDRE@GLOBO.COM        | 99656675    | CELULAR     | CASCADURA  | B. HORIZONTE   | MG     |
| GIOVANA | F    | giovana@gmail.com      | 33567765    | CELULAR     | ESTACIO    | RIO DE JANEIRO | RJ     |
| KARLA   | F    | KARLA@GMAIL.COM        | 88668786    | CELULAR     | CENTRO     | RIO DE JANEIRO | RJ     |
| KARLA   | F    | KARLA@GMAIL.COM        | 55689654    | COMERCIAL   | CENTRO     | RIO DE JANEIRO | RJ     |
| DANIELE | F    | DANIELE@GMAIL.COM      | 88687979    | COMERCIAL   | COPACABANA | RIO DE JANEIRO | RJ     |
| LORENA  | F    | lorena@mail.com        | 88965676    | COMERCIAL   | CENTRO     | VITORIA        | ES     |
| EDUARDO | M    | edu@mail.com           | 89966809    | CELULAR     | LEBLON     | RIO DE JANEIRO | RJ     |
| ANTONIO | M    | ANTONIO@IG.COM         | 88679978    | COMERCIAL   | CENTRO     | CURITIBA       | PR     |
| ANTONIO | M    | ANTONIO@UOL.COM        | 99655768    | CELULAR     | JARDINS    | SAO PAULO      | SP     |
| ELAINE  | F    | ELAINE@GLOBO.COM       | 89955665    | RESIDENCIAL | BOM RETIRO | CURITIBA       | PR     |
| CARMEM  | F    | CARMEM@IG.COM          | 77455786    | RESIDENCIAL | LAPA       | SAO PAULO      | SP     |
| ADRIANA | F    | ADRIANA@GMAIL.COM      | 89766554    | RESIDENCIAL | CENTRO     | RIO DE JANEIRO | RJ     |
| JOICE   | F    | JOICE@GMAIL.COM        | 77755785    | RESIDENCIAL | CENTRO     | RIO DE JANEIRO | RJ     |
| Roberto | M    | ROBERTOBETO@GMAIL.COM  | 44522578    | COMERCIAL   | CENTRO     | RIO DE JANEIRO | RJ     |
+---------+------+------------------------+-------------+-------------+------------+----------------+--------+

 /* APAGANDO UMA VIEW */
 
 DROP VIEW relatorio;


/* ISERINDO UM PREFIXO */
 
CREATE VIEW v_relatorio AS /* V_nome para VIEW */
SELECT C.Nome, 
	   C.Sexo, 
	   IFNULL(C.Email,'***') AS 'Email', 
	   T.Numero, 
	   T.Tipo, 
	   E.Bairro, 
	   E.Cidade, 
	   E.Estado
FROM cliente C
	INNER JOIN telefone T
	ON C.IdCliente = T.Id_Cliente
	INNER JOIN endereco E
	ON C.IdCliente = E.Id_Cliente;
	
	
/* PODE USAR A 'VIEW' CRIADA PARA RETORNAR DADOS DA TABELA */

SELECT Nome, Numero, Estado
FROM v_relatorio;



/* --------------------------------------------------------------------------------------- */

/* ORDER BY */

CREATE TABLE alunos(
	Numero INT,
	Nome VARCHAR(30)
);

INSERT INTO alunos VALUES(1,'Joao');
INSERT INTO alunos VALUES(1,'Maria');
INSERT INTO alunos VALUES(2,'Zoe');
INSERT INTO alunos VALUES(2,'Andre');
INSERT INTO alunos VALUES(3,'Clara');
INSERT INTO alunos VALUES(1,'Clara');
INSERT INTO alunos VALUES(4,'Mafra');
INSERT INTO alunos VALUES(5,'Janaina');
INSERT INTO alunos VALUES(1,'Janaina');
INSERT INTO alunos VALUES(3,'Marcelo');
INSERT INTO alunos VALUES(4,'Giovani');
INSERT INTO alunos VALUES(5,'Antonio');
INSERT INTO alunos VALUES(6,'Ana');
INSERT INTO alunos VALUES(6,'Viviane');

/* ORDENAR PELO 'NOME' DA COLUNA */
SELECT * FROM alunos
ORDER BY Numero;

/* ORDENAR PELO NUMERO INDICE DA COLUNA */
SELECT * FROM alunos
ORDER BY 1;

SELECT * FROM alunos
ORDER BY 2;

/* ORDENAR POR MAIS DE UMA COLUNA */
SELECT * FROM alunos
ORDER BY Numero, Nome;

SELECT * FROM alunos
ORDER BY 1, 2;


/* MESCLANDO 'ORDER BY' COM PROJECAO */

SELECT Nome FROM alunos
ORDER BY Numero, Nome;

/* ORDER BY DESC/ASC */

SELECT * FROM alunos
ORDER BY 1 DESC;

SELECT * FROM alunos
ORDER BY 1 ASC;

SELECT * FROM alunos
ORDER BY 1, 2 DESC;

SELECT * FROM alunos
ORDER BY 1 DESC, 2 DESC;


/* ORDENACAO COM 'JOIN' */

SELECT C.Nome, 
	   C.Sexo, 
	   IFNULL(C.Email,'***') AS 'Email', 
	   T.Numero, 
	   T.Tipo, 
	   E.Bairro, 
	   E.Cidade, 
	   E.Estado
FROM cliente C
	INNER JOIN telefone T
	ON C.IdCliente = T.Id_Cliente
	INNER JOIN endereco E
	ON C.IdCliente = E.Id_Cliente
ORDER BY 1;
