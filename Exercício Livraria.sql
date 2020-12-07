/* EXERCÍCIO LIVRARIA */

/* TABELA CRIADA NO MYSQL WORKBENCH

	SCHEMA : livraria
	
	TABLES : livros
	
		Id = int(11) AI PK
		Nome = text
		Autor = text
		Autor_Sexo = char(1)
		Paginas = int(11)
		Editora = tinytext
		Preco = double
		UF_Editora = char(2)
		Ano_Publicado = year(4)
	
 */

/* Unicode: */

USE livraria;

INSERT INTO livros (Nome,Autor,Autor_Sexo,Paginas,Editora,Preco,UF_Editora,Ano_Publicado)
values ('Cavaleiro Real','Ana Claudia','F', 465,'Atlas',49.9,'RJ',2009),
('SQL para Leigos','João Nunes','M', 450,'Addison',98,'SP',2018),
('Receitas Caseiras','Celia Tavares','F', 210,'Atlas',45,'RJ',2008),
('Pessoas Efetivas','Eduardo Santos','M', 390,'Beta',78.99,'RJ',2018),
('Habitos Saudáveis','Eduardo Santos','M', 630,'Beta',150.98,'RJ',2019),
('Casa Marron','Hermes Macedo','M', 250,'Bubba',60,'MG',2016),
('Estado Querido','Geraldo Francisco','M', 310,'Insignia',100,'ES',2015),
('Pra Sempre Amigas','Leda Silva','F', 510,'Insignia',78.98,'ES',2011),
('Copas Inesqueciveis','Marco ALcantara','M', 200,'Larson',130.98,'RS',2018),
('O Poder da Mente','Clara Mafra','F', 120,'Continental',56.58,'SP',2017);

/* 1 - RETORNAR TODOS OS DADOS */
SELECT * FROM LIVROS;

/* 2 - RETORNAR O NOME DO LIVRO E O NOME DA EDITORA */
SELECT Nome, Editora FROM livros;

/* 3 - RETORNAR O NOME DO LIVRO E A UF DA EDITORA POR AUTORES DO SEXO MASCULINO */
SELECT Nome, UF_Editora FROM livros WHERE Autor_Sexo = 'M';

/* 4 - RETORNAR O NOME DO LIVRO E O NÚMERO DE PÁGINAS POR AUTORES DO SEXO FEMININO */
SELECT Nome, Paginas FROM livros WHERE Autor_Sexo = 'F';

/* 5 - RETORNAR NOME E OS PRECOS DOS LIVROS DAS EDITORAS DE SÃO PAULO */
SELECT Nome, Preco FROM livros WHERE UF_Editora = 'SP';

/* 6 - RETORNAR DADOS DOS AUTORES MASCULINOS QUE PUBLICARAM EM SÃO PAULO OU RIO DE JANEIRO. */
SELECT Autor, Autor_Sexo FROM livros WHERE Autor_Sexo = 'M' AND (UF_Editora = 'SP' OR UF_Editora = 'RJ');