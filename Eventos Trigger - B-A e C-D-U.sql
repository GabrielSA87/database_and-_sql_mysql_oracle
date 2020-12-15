/* EVENTOS - BEFORE/AFTER INSERT/DELETE/UPDATE */

ALTER TABLE BACKUP.BKP_PRODUTO
ADD EVENTO CHAR(1);

DROP TRIGGER BACKUP_DELETE_PRODUTO;

DELIMITER #

CREATE TRIGGER BACKUP_DELETE_PRODUTO
AFTER DELETE ON PRODUTO
FOR EACH ROW
BEGIN
	INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL,OLD.IDPRODUTO,OLD.NOME,OLD.VALOR,'D');
END
#

DELIMITER ;

DELETE FROM PRODUTO WHERE IDPRODUTO = 4;


DELIMITER #

CREATE TRIGGER BACKUP_INSERT_PRODUTO
AFTER INSERT ON PRODUTO
FOR EACH ROW
BEGIN
	INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL,NEW.IDPRODUTO,NEW.NOME,NEW.VALOR,'C');
END
#

DELIMITER ;

DELIMITER #

CREATE TRIGGER BACKUP_UPDATE_PRODUTO
AFTER UPDATE ON PRODUTO
FOR EACH ROW
BEGIN
	INSERT INTO BACKUP.BKP_PRODUTO VALUES(NULL,OLD.IDPRODUTO,OLD.NOME,OLD.VALOR,'U');
END
#

DELIMITER ;

SELECT * FROM PRODUTO;
SELECT * FROM BACKUP.BKP_PRODUTO;