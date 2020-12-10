/* EXECICIO DML */

/* ORDEM PARA O INSERT: ID, NOME, CPF, SEXO, EMAIL */

INSERT INTO CLIENTE VALUES(NULL,'ANDRE','76875678701','M','ANDRE@GLOBO.COM');
INSERT INTO CLIENTE VALUES(NULL,'GIOVANA','58419632070','F','giovana@gmail.com');
INSERT INTO CLIENTE VALUES(NULL,'KARLA','78945625878','F','KARLA@GMAIL.COM');
INSERT INTO CLIENTE VALUES(NULL,'DANIELE','10203040506','F','DANIELE@GMAIL.COM');
INSERT INTO CLIENTE VALUES(NULL,'LORENA','45896325874','F','lorena@mail.com');
INSERT INTO CLIENTE VALUES(NULL,'EDUARDO','45871290345','M','edu@mail.com');
INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','58712360147','M','ANTONIO@IG.COM');
INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','58712347800','M','ANTONIO@UOL.COM');
INSERT INTO CLIENTE VALUES(NULL,'ELAINE','45678914702','F','ELAINE@GLOBO.COM');
INSERT INTO CLIENTE VALUES(NULL,'CARMEM','47823695180','F','CARMEM@IG.COM');
INSERT INTO CLIENTE VALUES(NULL,'ADRIANA','58752314690','F','ADRIANA@GMAIL.COM');
INSERT INTO CLIENTE VALUES(NULL,'JOICE','14523698788','F','JOICE@GMAIL.COM');
INSERT INTO CLIENTE VALUES(NULL,'Roberto','94364820011','M','ROBERTOBETO@GMAIL.COM');


/* ORDEM PARA O INSERT: ID, LOGRADOURO, BAIRRO, CIDADE, UF, ID_CLIENTE */

INSERT INTO ENDERECO VALUES(NULL,'RUA GUEDES','CASCADURA','B. HORIZONTE','MG',18);
INSERT INTO ENDERECO VALUES(NULL,'RUA MAIA LACERDA','ESTACIO','RIO DE JANEIRO','RJ',19);
INSERT INTO ENDERECO VALUES(NULL,'RUA VISCONDESSA','CENTRO','RIO DE JANEIRO','RJ',20);
INSERT INTO ENDERECO VALUES(NULL,'RUA NELSON MANDELA','COPACABANA','RIO DE JANEIRO','RJ',21);
INSERT INTO ENDERECO VALUES(NULL,'RUA ARAUJO LIMA','CENTRO','VITORIA','ES',22);
INSERT INTO ENDERECO VALUES(NULL,'RUA CASTRO ALVES','LEBLON','RIO DE JANEIRO','RJ',23);
INSERT INTO ENDERECO VALUES(NULL,'AV CAPITAO ANTUNES','CENTRO','CURITIBA','PR',24);
INSERT INTO ENDERECO VALUES(NULL,'AV CARLOS BARROSO','JARDINS','SAO PAULO','SP',25);
INSERT INTO ENDERECO VALUES(NULL,'ALAMEDA SAMPAIO','BOM RETIRO','CURITIBA','PR',26);
INSERT INTO ENDERECO VALUES(NULL,'RUA DA LAPA','LAPA','SAO PAULO','SP',27);
INSERT INTO ENDERECO VALUES(NULL,'RUA GERONIMO','CENTRO','RIO DE JANEIRO','RJ',28);
INSERT INTO ENDERECO VALUES(NULL,'RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',29);
INSERT INTO ENDERECO VALUES(NULL,'RUA GOMES FREIRE','CENTRO','RIO DE JANEIRO','RJ',30);


/* ORDEM PARA O INSERT: ID, NUMERO, TIPO, ID_CLIENTE */

INSERT INTO TELEFONE VALUES(NULL,'68976565','RESIDENCIAL',18);
INSERT INTO TELEFONE VALUES(NULL,'99656675','CELULAR',18);
INSERT INTO TELEFONE VALUES(NULL,'33567765','CELULAR',19);
INSERT INTO TELEFONE VALUES(NULL,'88668786','CELULAR',20);
INSERT INTO TELEFONE VALUES(NULL,'55689654','COMERCIAL',20);
INSERT INTO TELEFONE VALUES(NULL,'88687979','COMERCIAL',21);
INSERT INTO TELEFONE VALUES(NULL,'88965676','COMERCIAL',22);
INSERT INTO TELEFONE VALUES(NULL,'89966809','CELULAR',23);
INSERT INTO TELEFONE VALUES(NULL,'88679978','COMERCIAL',24);
INSERT INTO TELEFONE VALUES(NULL,'99655768','CELULAR',25);
INSERT INTO TELEFONE VALUES(NULL,'89955665','RESIDENCIAL',26);
INSERT INTO TELEFONE VALUES(NULL,'77455786','RESIDENCIAL',27);
INSERT INTO TELEFONE VALUES(NULL,'89766554','RESIDENCIAL',28);
INSERT INTO TELEFONE VALUES(NULL,'77755785','RESIDENCIAL',29);
INSERT INTO TELEFONE VALUES(NULL,'44522578','COMERCIAL',30);

/* ESCOPO */

/* 
	1 - RELATORIO GERAL DE TODOS OS CLIENTE;
	2 - RELATORIO DE HOMENS;
	3 - RELATORIO DE MULHERES;
	4 - QUANTIDADE DE HOMENS E MULHERES;
	5 - IDs E EMAILS DAS MULHERES QUE MOREM NO CENTRO DO RIO DE JANEIRO E NAO TENHAM CELULAR;
	6 - PARA UMA CAMPANHA DE PRODUTOS DE BELEZA, O COMERCIAL SOLICITOU UM RELATÓRIO COM O NOME,
		EMAIL E TELEFONE CELULAR DAS MULHERES QUE MORAM NO ESTADO DE SÃO PAULO.
		VOCÊ TERÁ QUE PASSAR A QUERY PARA GERAR O RELATORIO PARA O PROGRAMADOR;
	7 - TABELA COM NOME, EMAIL, ESTADO E NUMERO TELEFONICO.
*/

/* INFOS: DB: COMERCIO
		  TABELAS: - CLIENTE (IdCliente, Nome, CPF, Sexo, Email)
				   - ENDERECO (IdEndereco, Logradouro, Bairro, Cidade, Estado, Id_Cliente)
				   - TELEFONE (IdTelefone, Numero, Tipo, Id_Cliente)
/*

/* 1 - RELATORIO GERAL DE TODOS OS CLIENTE; */

SELECT C.IdCliente, C.Nome, C.CPF, C.Sexo, C.Email, E.Logradouro, E.Bairro, E.Cidade, E.Estado, T.Numero, T.Tipo
FROM cliente C
	INNER JOIN endereco E
	ON C.IdCliente = E.Id_Cliente
	INNER JOIN telefone T
	ON C.IdCliente = T.Id_Cliente;
/*	
+-----------+---------+-------------+------+------------------------+-----------------------+------------+----------------+--------+-------------+-------------+
| IdCliente | Nome    | CPF         | Sexo | Email                  | Logradouro            | Bairro     | Cidade         | Estado | Numero      | Tipo        |
+-----------+---------+-------------+------+------------------------+-----------------------+------------+----------------+--------+-------------+-------------+
|         1 | Joao    | 02358468922 | M    | joao@mail.com          | Rua Parnaiba          | Barro      | Recife         | PE     | 8134552236  | RESIDENCIAL |
|         1 | Joao    | 02358468922 | M    | joao@mail.com          | Rua Parnaiba          | Barro      | Recife         | PE     | 81997548798 | COMERCIAL   |
|         1 | Joao    | 02358468922 | M    | joao@mail.com          | Rua Parnaiba          | Barro      | Recife         | PE     | 81997587896 | CELULAR     |
|         2 | Maria   | 12345678955 | F    | maria@ig.com           | Avenida Leopoldina    | Boa Viagem | Recife         | PE     | 81997585897 | CELULAR     |
|         3 | Flavio  | 98765432100 | M    | flaviopa@mail.com      | Rua Roberto Carlos    | Lapa       | Rio de Janeiro | RJ     | 2132514566  | COMERCIAL   |
|         4 | Lisa    | 74185296377 | F    | lisa.s@springfield.com | Rua Trindade          | Nuclear    | Springfield    | PA     | 3213205666  | CELULAR     |
|         5 | Bart    | 96385274111 | M    | bart.s@springfield.com | Rua Trindade          | Nuclear    | Springfield    | PA     | 3213205444  | CELULAR     |
|         6 | Pedro   | 75315965482 | M    | pedro.parque@ny.com    | Rua Tiroteio          | Morrao     | Rio de Janeiro | RJ     | 2432554499  | RESIDENCIAL |
|         7 | Claudia | 12365478900 | F    | claudia@gmail.com      | Avenida Tranquilidade | Canal 7    | Santos         | SP     | 11992564789 | CELULAR     |
|         7 | Claudia | 12365478900 | F    | claudia@gmail.com      | Avenida Tranquilidade | Canal 7    | Santos         | SP     | 1332657895  | RESIDENCIAL |
|         8 | Eduardo | 98745632199 | M    | duda@hotmail.com       | Rua Dois de Julho     | Vila Julia | Guaruja        | SP     | 1332657895  | COMERCIAL   |
|        18 | ANDRE   | 76875678701 | M    | ANDRE@GLOBO.COM        | RUA GUEDES            | CASCADURA  | B. HORIZONTE   | MG     | 68976565    | RESIDENCIAL |
|        18 | ANDRE   | 76875678701 | M    | ANDRE@GLOBO.COM        | RUA GUEDES            | CASCADURA  | B. HORIZONTE   | MG     | 99656675    | CELULAR     |
|        19 | GIOVANA | 58419632070 | F    | 0876655                | RUA MAIA LACERDA      | ESTACIO    | RIO DE JANEIRO | RJ     | 33567765    | CELULAR     |
|        20 | KARLA   | 78945625878 | F    | KARLA@GMAIL.COM        | RUA VISCONDESSA       | CENTRO     | RIO DE JANEIRO | RJ     | 88668786    | CELULAR     |
|        20 | KARLA   | 78945625878 | F    | KARLA@GMAIL.COM        | RUA VISCONDESSA       | CENTRO     | RIO DE JANEIRO | RJ     | 55689654    | COMERCIAL   |
|        21 | DANIELE | 10203040506 | F    | DANIELE@GMAIL.COM      | RUA NELSON MANDELA    | COPACABANA | RIO DE JANEIRO | RJ     | 88687979    | COMERCIAL   |
|        22 | LORENA  | 45896325874 | F    | 774557887              | RUA ARAUJO LIMA       | CENTRO     | VITORIA        | ES     | 88965676    | COMERCIAL   |
|        23 | EDUARDO | 45871290345 | M    | 54376457               | RUA CASTRO ALVES      | LEBLON     | RIO DE JANEIRO | RJ     | 89966809    | CELULAR     |
|        24 | ANTONIO | 58712360147 | M    | ANTONIO@IG.COM         | AV CAPITAO ANTUNES    | CENTRO     | CURITIBA       | PR     | 88679978    | COMERCIAL   |
|        25 | ANTONIO | 58712347800 | M    | ANTONIO@UOL.COM        | AV CARLOS BARROSO     | JARDINS    | SAO PAULO      | SP     | 99655768    | CELULAR     |
|        26 | ELAINE  | 45678914702 | F    | ELAINE@GLOBO.COM       | ALAMEDA SAMPAIO       | BOM RETIRO | CURITIBA       | PR     | 89955665    | RESIDENCIAL |
|        27 | CARMEM  | 47823695180 | F    | CARMEM@IG.COM          | RUA DA LAPA           | LAPA       | SAO PAULO      | SP     | 77455786    | RESIDENCIAL |
|        28 | ADRIANA | 58752314690 | F    | ADRIANA@GMAIL.COM      | RUA GERONIMO          | CENTRO     | RIO DE JANEIRO | RJ     | 89766554    | RESIDENCIAL |
|        29 | JOICE   | 14523698788 | F    | JOICE@GMAIL.COM        | RUA GOMES FREIRE      | CENTRO     | RIO DE JANEIRO | RJ     | 77755785    | RESIDENCIAL |
|        30 | Roberto | 94364820011 | M    | ROBERTOBETO@GMAIL.COM  | RUA GOMES FREIRE      | CENTRO     | RIO DE JANEIRO | RJ     | 44522578    | COMERCIAL   |
+-----------+---------+-------------+------+------------------------+-----------------------+------------+----------------+--------+-------------+-------------+
*/

/* 2 - RELATORIO DE HOMENS */

SELECT C.IdCliente, C.Nome, C.CPF, C.Sexo, C.Email, E.Logradouro, E.Bairro, E.Cidade, E.Estado, T.Numero, T.Tipo
FROM cliente C
	INNER JOIN endereco E
	ON C.IdCliente = E.Id_Cliente
	INNER JOIN telefone T
	ON C.IdCliente = T.Id_Cliente
WHERE C.Sexo = 'M';

/*
+-----------+---------+-------------+------+------------------------+--------------------+------------+----------------+--------+-------------+-------------+
| IdCliente | Nome    | CPF         | Sexo | Email                  | Logradouro         | Bairro     | Cidade         | Estado | Numero      | Tipo        |
+-----------+---------+-------------+------+------------------------+--------------------+------------+----------------+--------+-------------+-------------+
|         1 | Joao    | 02358468922 | M    | joao@mail.com          | Rua Parnaiba       | Barro      | Recife         | PE     | 8134552236  | RESIDENCIAL |
|         1 | Joao    | 02358468922 | M    | joao@mail.com          | Rua Parnaiba       | Barro      | Recife         | PE     | 81997548798 | COMERCIAL   |
|         1 | Joao    | 02358468922 | M    | joao@mail.com          | Rua Parnaiba       | Barro      | Recife         | PE     | 81997587896 | CELULAR     |
|         3 | Flavio  | 98765432100 | M    | flaviopa@mail.com      | Rua Roberto Carlos | Lapa       | Rio de Janeiro | RJ     | 2132514566  | COMERCIAL   |
|         5 | Bart    | 96385274111 | M    | bart.s@springfield.com | Rua Trindade       | Nuclear    | Springfield    | PA     | 3213205444  | CELULAR     |
|         6 | Pedro   | 75315965482 | M    | pedro.parque@ny.com    | Rua Tiroteio       | Morrao     | Rio de Janeiro | RJ     | 2432554499  | RESIDENCIAL |
|         8 | Eduardo | 98745632199 | M    | duda@hotmail.com       | Rua Dois de Julho  | Vila Julia | Guaruja        | SP     | 1332657895  | COMERCIAL   |
|        18 | ANDRE   | 76875678701 | M    | ANDRE@GLOBO.COM        | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     | 68976565    | RESIDENCIAL |
|        18 | ANDRE   | 76875678701 | M    | ANDRE@GLOBO.COM        | RUA GUEDES         | CASCADURA  | B. HORIZONTE   | MG     | 99656675    | CELULAR     |
|        23 | EDUARDO | 45871290345 | M    | 54376457               | RUA CASTRO ALVES   | LEBLON     | RIO DE JANEIRO | RJ     | 89966809    | CELULAR     |
|        24 | ANTONIO | 58712360147 | M    | ANTONIO@IG.COM         | AV CAPITAO ANTUNES | CENTRO     | CURITIBA       | PR     | 88679978    | COMERCIAL   |
|        25 | ANTONIO | 58712347800 | M    | ANTONIO@UOL.COM        | AV CARLOS BARROSO  | JARDINS    | SAO PAULO      | SP     | 99655768    | CELULAR     |
|        30 | Roberto | 94364820011 | M    | ROBERTOBETO@GMAIL.COM  | RUA GOMES FREIRE   | CENTRO     | RIO DE JANEIRO | RJ     | 44522578    | COMERCIAL   |
+-----------+---------+-------------+------+------------------------+--------------------+------------+----------------+--------+-------------+-------------+
*/

/* 3 - RELATORIO DE MULHERES */

SELECT C.IdCliente, C.Nome, C.CPF, C.Sexo, C.Email, E.Logradouro, E.Bairro, E.Cidade, E.Estado, T.Numero, T.Tipo
FROM cliente C
	INNER JOIN endereco E
	ON C.IdCliente = E.Id_Cliente
	INNER JOIN telefone T
	ON C.IdCliente = T.Id_Cliente
WHERE C.Sexo = 'F';

/*
+-----------+---------+-------------+------+------------------------+-----------------------+------------+----------------+--------+-------------+-------------+
| IdCliente | Nome    | CPF         | Sexo | Email                  | Logradouro            | Bairro     | Cidade         | Estado | Numero      | Tipo        |
+-----------+---------+-------------+------+------------------------+-----------------------+------------+----------------+--------+-------------+-------------+
|         2 | Maria   | 12345678955 | F    | maria@ig.com           | Avenida Leopoldina    | Boa Viagem | Recife         | PE     | 81997585897 | CELULAR     |
|         4 | Lisa    | 74185296377 | F    | lisa.s@springfield.com | Rua Trindade          | Nuclear    | Springfield    | PA     | 3213205666  | CELULAR     |
|         7 | Claudia | 12365478900 | F    | claudia@gmail.com      | Avenida Tranquilidade | Canal 7    | Santos         | SP     | 11992564789 | CELULAR     |
|         7 | Claudia | 12365478900 | F    | claudia@gmail.com      | Avenida Tranquilidade | Canal 7    | Santos         | SP     | 1332657895  | RESIDENCIAL |
|        19 | GIOVANA | 58419632070 | F    | 0876655                | RUA MAIA LACERDA      | ESTACIO    | RIO DE JANEIRO | RJ     | 33567765    | CELULAR     |
|        20 | KARLA   | 78945625878 | F    | KARLA@GMAIL.COM        | RUA VISCONDESSA       | CENTRO     | RIO DE JANEIRO | RJ     | 88668786    | CELULAR     |
|        20 | KARLA   | 78945625878 | F    | KARLA@GMAIL.COM        | RUA VISCONDESSA       | CENTRO     | RIO DE JANEIRO | RJ     | 55689654    | COMERCIAL   |
|        21 | DANIELE | 10203040506 | F    | DANIELE@GMAIL.COM      | RUA NELSON MANDELA    | COPACABANA | RIO DE JANEIRO | RJ     | 88687979    | COMERCIAL   |
|        22 | LORENA  | 45896325874 | F    | 774557887              | RUA ARAUJO LIMA       | CENTRO     | VITORIA        | ES     | 88965676    | COMERCIAL   |
|        26 | ELAINE  | 45678914702 | F    | ELAINE@GLOBO.COM       | ALAMEDA SAMPAIO       | BOM RETIRO | CURITIBA       | PR     | 89955665    | RESIDENCIAL |
|        27 | CARMEM  | 47823695180 | F    | CARMEM@IG.COM          | RUA DA LAPA           | LAPA       | SAO PAULO      | SP     | 77455786    | RESIDENCIAL |
|        28 | ADRIANA | 58752314690 | F    | ADRIANA@GMAIL.COM      | RUA GERONIMO          | CENTRO     | RIO DE JANEIRO | RJ     | 89766554    | RESIDENCIAL |
|        29 | JOICE   | 14523698788 | F    | JOICE@GMAIL.COM        | RUA GOMES FREIRE      | CENTRO     | RIO DE JANEIRO | RJ     | 77755785    | RESIDENCIAL |
+-----------+---------+-------------+------+------------------------+-----------------------+------------+----------------+--------+-------------+-------------+
*/

/* 4 - QUANTIDADE DE HOMENS E MULHERES */

SELECT COUNT(*) AS Quantidade, Sexo
FROM cliente
GROUP BY Sexo;

/*
+------------+------+
| Quantidade | Sexo |
+------------+------+
|         10 | M    |
|         11 | F    |
+------------+------+
*/


/* 5 - IDs E EMAILS DAS MULHERES QUE MOREM NO CENTRO DO RIO DE JANEIRO E NAO TENHAM CELULAR */

SELECT C.IdCliente, C.Email, T.Tipo
FROM cliente C
	INNER JOIN endereco E
	ON C.IdCliente = E.Id_Cliente
	INNER JOIN telefone T
	ON C.IdCliente = T.Id_Cliente
WHERE C.Sexo = 'F' AND (E.Bairro = 'Centro' AND E.Cidade = 'Rio de Janeiro' AND T.Tipo != 'Celular');

/*
+-----------+-------------------+
| IdCliente | Email             |
+-----------+-------------------+
|        20 | KARLA@GMAIL.COM   |
|        21 | DANIELE@GMAIL.COM |
|        28 | ADRIANA@GMAIL.COM |
|        29 | JOICE@GMAIL.COM   |
+-----------+-------------------+
*/

/* 6 - PARA UMA CAMPANHA DE PRODUTOS DE BELEZA, O COMERCIAL SOLICITOU UM RELATÓRIO COM O NOME,
	   EMAIL E TELEFONE CELULAR DAS MULHERES QUE MORAM NO ESTADO DE SÃO PAULO.
	   VOCÊ TERÁ QUE PASSAR A QUERY PARA GERAR O RELATORIO PARA O PROGRAMADOR.
*/

SELECT C.Nome, C.Email, C.Sexo, T.Numero, T.Tipo, E.Estado
FROM cliente C
	INNER JOIN telefone T
	ON C.IdCliente = T.Id_Cliente
	INNER JOIN endereco E
	ON C.IdCliente = E.Id_Cliente
WHERE C.Sexo = 'F' AND (E.Estado = 'SP' AND T.Tipo = 'Celular');

/* 7 - TABELA COM NOME, EMAIL, ESTADO E NUMERO TELEFONICO */

SELECT C.Nome, C.Email, E.Estado, T.Numero
FROM cliente C
	INNER JOIN endereco E
	ON C.IdCliente = E.Id_Cliente
	INNER JOIN telefone T
	ON C.IdCliente = T.Id_Cliente;
