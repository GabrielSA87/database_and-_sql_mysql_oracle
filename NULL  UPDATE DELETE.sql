/* IS NULL and IS NOT NULL */

SELECT atributo(s) FROM table_name WHERE atributo IS NULL;

SELECT atributo(s) FROM table_name WHERE atributo IS NOT NULL;


/* UPDATE */

UPDATE table_name SET atributo = valor_desejado WHERE atributo = valor_condicional

/* UPDATE na tabela de Cliente */

USE projeto;

SELECT * FROM cliente;	/* Joao e Lisa ambos tem Email nulos */

UPDATE cliente SET Email = 'joao@newmail.com.br' WHERE Nome = 'Joao';


/* DELETE FROM */

USE projeto;

SELECT * FROM cliente;	/* Lisa está com Email nulo, então vamos deletar */

DELETE FROM cliente WHERE Nome = 'Lisa';
