-- This script is for login function
-- This is a test, so i will create a new database to test
-- isAtesterdb
USE sys;
DROP DATABASE IF EXISTS isLoginDB;
CREATE DATABASE isLoginDB;

USE isLoginDB;

SET SQL_SAFE_UPDATES = 0;

-- STEP 0
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

-- STEP 1 insert test DATA
INSERT INTO Player (`Username`, `Email`, `Password`) 
VALUES		
('Tester1', 'EmailTest1', 'Password1'),
('Tester2', 'EmailTest2', 'Password2');

UPDATE Player
SET Attempt = 2
WHERE `Email` = 'Email111';

	-- Login successfully
DROP PROCEDURE IF EXISTS login;
DELIMITER //
CREATE PROCEDURE login(IN pEmail VARCHAR(255), IN pPassword VARCHAR(255))
BEGIN
	-- If account is exists
	IF EXISTS (SELECT 1
				FROM Player p
				WHERE
					Email = pEmail
				)
	THEN
		-- Account attempt less than 5
		IF EXISTS (SELECT 1
					FROM Player p
					WHERE
						Email = pEmail AND
						p.Attempt < 5
				)
		THEN
			-- Valid credentials
			IF EXISTS (SELECT 1
						FROM Player p
						WHERE
							Email = pEmail AND
							Password = pPassword
					)
			THEN
				-- If logged successfully, update attempt to 0
				UPDATE Player
				SET Attempt = 0
				WHERE Email = pEmail;
				SELECT 'You have Logged in successfully' AS Message;
			ELSE
				-- Valid credentials
				UPDATE Player
				SET Attempt = Attempt + 1
				WHERE Email = pEmail;
				SELECT 'Invalid credentials! Attempt + 1' AS Message;
			END IF;
		-- Account attempt greater than or equal 5
		ELSE 
			SELECT 'You account has been locked out' AS Message;
		END IF;
	-- If account isn't exists
	ELSE
		SELECT 'This Account is not exists!' AS Message;
	END IF;
END//

DELIMITER ;

-- Test account locked out
call login('EmailTest1', 'Password');
call login('EmailTest1', 'Password');
call login('EmailTest1', 'Password');
call login('EmailTest1', 'Password');
call login('EmailTest1', 'Password');

call login('EmailTest2', 'Password1');
call login('EmailTest2', 'Password1');
call login('EmailTest2', 'Password1');
call login('EmailTest2', 'Password1');

-- Test correct Email and Password
-- call login('EmailTest2', 'Password2');

-- Test incorrect Email,
-- xcepted Result:This Account is not exists!
call login('uioyuiyhuoi', 'Password2');

-- Test incorrect Password
-- Excepted Result: Invalid credentials! Attempt + 1
call login('EmailTest2', 'Password1');

-- Test incorrect Email and Password 
-- Excepted Result:This Account is not exists!
call login('iouyiuyhiou', 'Password1');


SELECT *
FROM Player