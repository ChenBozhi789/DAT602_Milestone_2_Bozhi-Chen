-- This script is for registration function
-- This script is for login function
-- This is a test, so i will create a new database to test
-- isAtesterdb
USE sys;
DROP DATABASE IF EXISTS isRegDB;
CREATE DATABASE isRegDB;

USE isRegDB;

SET SQL_SAFE_UPDATES = 0;

-- Create Player table
DROP TABLE IF EXISTS Player;
CREATE TABLE Player (
	PlayerID INT(10) PRIMARY KEY AUTO_INCREMENT,
	Username VARCHAR(255),
	Email VARCHAR(255),
	Password VARCHAR(255),
	LockState BIT DEFAULT 0,
	LoginState BIT DEFAULT 0,
	GameState BIT DEFAULT 0,
	IsAdministrator BIT DEFAULT 0,
	Attempt INT DEFAULT 0
);

DROP PROCEDURE IF EXISTS register;
DELIMITER //
-- IN 关键字用于指定参数的类型
CREATE PROCEDURE register(IN pUsername VARCHAR(255), IN pEmail VARCHAR(255), IN pPassword VARCHAR(255))
BEGIN
	-- Register failed
	-- If account already exists in database
	IF EXISTS( SELECT `Email`
				FROM Player p
				WHERE
					p.Email = pEmail
			)
	THEN 
		SELECT 'Register failed!' AS Message;
    
	-- Register successfully
	ELSE
		INSERT INTO Player (`Username`, `Email`, `Password`) VALUES (pUsername, pEmail, pPassword);
		SELECT 'Register successfully!' AS Message;

	END IF;
END//

DELIMITER ;

-- Call login 5 times
call register('Tester1', 'bozhi.chen@outlook.com', '123123');


SELECT *
FROM Player