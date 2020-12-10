/* ORDEM PARA CLIENTE = ID, NOME, CPF, SEXO, EMAIL */

INSERT INTO cliente VALUES(NULL,'Joao','02358468922','M','joao@mail.com'),
(NULL,'Maria','12345678955','F','maria@ig.com'),
(NULL,'Flavio','98765432100','M','flaviopa@mail.com'),
(NULL,'Lisa','74185296377','F','lisa.s@springfield.com'),
(NULL,'Bart','96385274111','M','bart.s@springfield.com'),
(NULL,'Pedro','75315965482','M','pedro.parque@ny.com'),
(NULL,'Claudia','12365478900','F','claudia@gmail.com'),
(NULL,'Eduardo','98745632199','M','duda@hotmail.com');

+----+---------+-------------+------+------------------------+
| id | Nome    | CPF         | Sexo | Email                  |
+----+---------+-------------+------+------------------------+
|  1 | Joao    | 02358468922 | M    | joao@mail.com          |
|  2 | Maria   | 12345678955 | F    | maria@ig.com           |
|  3 | Flavio  | 98765432100 | M    | flaviopa@mail.com      |
|  4 | Lisa    | 74185296377 | F    | lisa.s@springfield.com |
|  5 | Bart    | 96385274111 | M    | bart.s@springfield.com |
|  6 | Pedro   | 75315965482 | M    | pedro.parque@ny.com    |
|  7 | Claudia | 12365478900 | F    | claudia@gmail.com      |
|  8 | Eduardo | 98745632199 | M    | duda@hotmail.com       |
+----+---------+-------------+------+------------------------+



/* ORDEM PARA ENDERECO = ID, LOGRADOURO, BAIRRO, CIDADE, ESTADO, CLIENTE_ID */

INSERT INTO endereco VALUES(NULL,'Rua Parnaiba','Barro','Recife','PE',1),
(NULL,'Avenida Leopoldina','Boa Viagem','Recife','PE',2),
(NULL,'Rua Roberto Carlos','Lapa','Rio de Janeiro','RJ',3),
(NULL,'Rua Trindade','Nuclear','Springfield','PA',4),
(NULL,'Rua Trindade','Nuclear','Springfield','PA',5),
(NULL,'Rua Tiroteio','Morrao','Rio de Janeiro','RJ',6),
(NULL,'Avenida Tranquilidade','Canal 7','Santos','SP',7),
(NULL,'Rua Dois de Julho','Vila Julia','Guaruja','SP',8);

+----+-----------------------+------------+----------------+--------+------------+
| id | Logradouro            | Bairro     | Cidade         | Estado | cliente_id |
+----+-----------------------+------------+----------------+--------+------------+
|  1 | Rua Parnaiba          | Barro      | Recife         | PE     |          1 |
|  2 | Avenida Leopoldina    | Boa Viagem | Recife         | PE     |          2 |
|  3 | Rua Roberto Carlos    | Lapa       | Rio de Janeiro | RJ     |          3 |
|  4 | Rua Trindade          | Nuclear    | Springfield    | PA     |          4 |
|  5 | Rua Trindade          | Nuclear    | Springfield    | PA     |          5 |
|  6 | Rua Tiroteio          | Morrao     | Rio de Janeiro | RJ     |          6 |
|  7 | Avenida Tranquilidade | Canal 7    | Santos         | SP     |          7 |
|  8 | Rua Dois de Julho     | Vila Julia | Guaruja        | SP     |          8 |
+----+-----------------------+------------+----------------+--------+------------+


/* ORDEM PARA TELEFONE = ID, NUMERO, TIPO, CLIENTE_ID */

INSERT INTO telefone VALUES(NULL,'81997585897','Celular',2),
(NULL,'8134552236','Residencial',1),
(NULL,'3213205666','Celular',4),
(NULL,'3213205444','Celular',5),
(NULL,'2132514566','Comercial',3),
(NULL,'2432554499','Residencial',6),
(NULL,'11992564789','Celular',7),
(NULL,'81997548798','Comercial',1),
(NULL,'81997587896','Celular',1),
(NULL,'1332657895','Residencial',7);

/* -------------------------------------------------------------------------------------- */

/* SELECAO, PROJECAO E JUNCAO */

/* PROJECAO --> EH TUDO O QUE SE QUER VER NA TELA */

SELECT NOW() AS DATA_ATUAL;

SELECT Nome, Sexo, Email FROM Cliente;


/* SELECAO --> FILTRAR UM ELEMENTO ESPECIFICO DE UM CONJUNTO */
/* A CLAUSULA DE SELECAO É O 'WHERE' */

SELECT Nome, Sexo, Email	/*PROJECAO*/
FROM cliente				/*ORIGEM*/
WHERE Sexo = 'F';			/*FILTRO (SELECAO)*/

SELECT Numero				/*PROJECAO*/
FROM telefone				/*ORIGEM*/
WHERE Tipo = 'Celular';		/*FILTRO (SELECAO)*/


/* JUNCAO --> JOIN - Com Duas Tabelas*/

SELECT Nome, Email, IdCliente
FROM cliente;

SELECT Id_Cliente, Bairro, Cidade
FROM endereco;

SELECT Nome, Sexo, Bairro, Cidade
FROM cliente INNER JOIN endereco
	ON IdCliente = Id_Cliente;

SELECT Nome, Sexo, Bairro, Cidade	/*PROJECAO*/
FROM cliente 						/*ORIGEM*/
	INNER JOIN endereco				/*JUNCAO*/
	ON IdCliente = Id_Cliente		/*CONDICAO DA JUNCAO*/
WHERE Sexo = 'F';					/*SELECAO*/

SELECT Nome, Sexo, Email, Numero, Tipo
FROM cliente 
	INNER JOIN telefone 
	ON IdCliente = Id_Cliente;

/* JUNCAO --> JOIN - Com Tres ou mais Tabelas*/

SELECT cliente.Nome, cliente.Sexo, endereco.Bairro, endereco.Cidade, telefone.Numero, telefone.Tipo
FROM cliente
	INNER JOIN endereco
	ON cliente.IdCliente = endereco.Id_Cliente
	INNER JOIN telefone
	ON cliente.IdCliente = telefone.Id_Cliente;


/*--------------------------------------------------------------------------------------------*/

/* CREATED TABLE produto */

/* MODIFICANDO TABELA - 'ALTER TABLE' */

/* ALTERANDO O NOME DE UMA TABELA E/OU SEU TIPO - CHANGE */

ALTER TABLE produto
CHANGE Preco Valor INT NOT NULL;

ALTER TABLE produto
CHANGE Preco Preco DOUBLE NOT NULL; /*para alterar apenas o TYPE, repete-se o nome do atributo*/

/* ALTERANDO O NOME DE UMA TABELA E/OU SEU TIPO - MODIFY */

ALTER TABLE produto
MODIFY Preco Valor INT NOT NULL;

ALTER TABLE produto
MODIFY Preco DOUBLE NOT NULL; /*diferente do CHANGE, em MODIFY nao precisa repetir o nome do atributo para modificar o TYPE dele*/


/* ADICIONANDO COLUNAS EM UMA TABELA JA EXISTENTE */

ALTER TABLE produto
ADD Peso FLOAT(10,2) NOT NULL;


/* APAGANDO UMA COLUNA */

ALTER TABLE produto
DROP COLUMN peso;


/* ADICIONANDO UMA COLUNA NA ORDEM ESPECIFICA */

ALTER TABLE produto
ADD COLUMN Peso FLOAT(10,2) NOT NULL
AFTER Nome;


/* ADICIONANDO UMA COLUNA NA PRIMEIRA LINHA */

ALTER TABLE produto
ADD COLUMN Peso FLOAT(10,2) NOT NULL
FIRST;
