drop database if exists example_game;
create database example_game;

use example_game;


-- STEP 0 
DROP TABLE IF EXISTS tblPlayer;
CREATE TABLE tblPlayer (
	`Name` VARCHAR(255),
	`Password` VARCHAR(255),
	attempts INT DEFAULT 0
);

-- STEP 1 Insert test DATA
INSERT INTO tblPlayer (`Name`,`Password`)
			VALUES	  ('Todd','&XUU(*@HOD'),
			          ('Tammy','jkdfqw83y');
UPDATE tblPlayer
SET attempts = 5 
WHERE `Name` = 'Todd';	
				  
-- STEP 2 Write the basic query - run it

-- TEST 1
SELECT `Name`,`Password`,attempts 
FROM tblPlayer p
WHERE 
       p.name = 'Todd' AND 
	   p.password = '&XUU(*@HOD';
	   
-- TEST 2
SELECT `Name`,`Password`,attempts 
FROM tblPlayer p
WHERE 
       p.name = 'Todd' AND 
	   p.password = 'sdasdasdasd' AND
	   p.attempts < 5;

-- TEST 3
SELECT `Name`,`Password`,attempts 
FROM tblPlayer p
WHERE 
       p.name = 'Tammy' AND 
	   p.password = 'jkdfqw83y' AND
	   p.attempts < 5;
	   
drop procedure if exists login;
delimiter //
create procedure login(IN pUserName varchar(255),IN  pPassword varchar(255) )
begin
	   IF EXISTS(  SELECT `Name`,`Password`,attempts 
					FROM tblPlayer p
					WHERE 
						   p.name = pUserName AND 
						   p.password = pPassword AND
						   p.attempts < 5
				 ) 
		THEN
			BEGIN
			  SELECT 'Logged in' AS Message;
			END;

		ELSE
				IF EXISTS(  SELECT `Name`,`Password`,attempts 
							FROM tblPlayer p
							WHERE 
								p.attempts >= 5
				 		) 
				THEN 
				   BEGIN
					SELECT 'Player Locked Out' AS Message;
				   END;
				-- When user also have remaining attempt to log in
				ELSE 
				  BEGIN
					UPDATE tblPlayer
					SET attempts = attempts + 1
					WHERE 
					 `Name` = pName;
					 -- Why is useless
					--  Our target: When User enter the invalid password, the attempt will plus 1, but in here, it looks like when user entered valid password,
					-- the attempt will plus 1. It's weird...
					-- `Password` = pPassword
					 
					
					SELECT 'Not Logged in' AS Message;
				  END;
				END IF;
			
		END IF;
END//

delimiter ;

call login('Todd','sajdaksdh');
call login('Tammy','asdasd');
call login('Tammy','asdasd');
call login('Tammy','asdasd');
call login('Tammy','asdasd');
call login('Tammy','asdasd');

call login('Todd','&XUU(*@HOD');