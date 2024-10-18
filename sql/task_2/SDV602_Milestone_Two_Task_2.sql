USE sys;
DROP DATABASE IF EXISTS DAT602m2t2db;
CREATE DATABASE DAT602m2t2db;
USE DAT602m2t2db;

SET SQL_SAFE_UPDATES = 0;

DROP TABLE IF EXISTS tb_Game; 
DROP TABLE IF EXISTS tb_user;
DROP TABLE IF EXISTS tb_Tile;
DROP TABLE IF EXISTS tb_Map;
DROP TABLE IF EXISTS tb_Item;
DROP TABLE IF EXISTS tb_ItemType;
DROP TABLE IF EXISTS tb_ChatSession;
DROP TABLE IF EXISTS tb_Tile_Item;
DROP TABLE IF EXISTS tb_Game_Player;
DROP TABLE IF EXISTS tb_Chat_Player;
DROP TABLE IF EXISTS tb_Inventory_Item;

-- Create all required table
CREATE TABLE tb_Game (
    GameID INT(10) PRIMARY KEY AUTO_INCREMENT,
    StartTime DATETIME,
    EndTime DATETIME,
    State VARCHAR(32) DEFAULT 'Running' 
);

CREATE TABLE tb_Map (
	MapID INT(10) PRIMARY KEY AUTO_INCREMENT,
	GameID INT(10),
	MaxRow INT(10),
	MaxColumn INT(10),
	FOREIGN KEY (GameID) REFERENCES tb_Game(GameID)
);

CREATE TABLE tb_User (
	UserID INT(10) PRIMARY KEY AUTO_INCREMENT,
	Username VARCHAR(255),
	Email VARCHAR(255),
	Password VARCHAR(255),
	LockState BIT DEFAULT 0,
	LoginState BIT DEFAULT 0,
	GameState BIT DEFAULT 0,
	IsAdministrator BIT DEFAULT 0,
	Attempt INT DEFAULT 0
);

CREATE TABLE tb_Tile (
	TileID INT(10) PRIMARY KEY AUTO_INCREMENT,
	MapID INT(10),
	TileRow INT(10),
	TileCol INT(10),
	ItemType INT NOT NULL DEFAULT 0,
    IsEmptied BIT DEFAULT 1,
    IsOccupied BIT DEFAULT 0,
	FOREIGN KEY (MapID) REFERENCES tb_Map(MapID)
);

CREATE TABLE tb_ItemType (
    ItemTypeID INT(10) PRIMARY KEY AUTO_INCREMENT,
    Type VARCHAR(255),
    Harm INT(10),
    Heath INT(10)
);

CREATE TABLE tb_Item (
	ItemID INT(10) PRIMARY KEY AUTO_INCREMENT,
    ItemTypeID INT(10),
    FOREIGN KEY (ItemTypeID) REFERENCES tb_ItemType(ItemTypeID)    
);

CREATE TABLE tb_Inventory_Item (
    UserID INT(10),
    ItemID INT(10),
    Quantity INT(10) DEFAULT 0,
    PRIMARY KEY (UserID, ItemID),
    FOREIGN KEY (UserID) REFERENCES tb_User(UserID),
    FOREIGN KEY (ItemID) REFERENCES tb_Item(ItemID)
);

CREATE TABLE tb_Tile_Item (
	TileID INT(10),
    ItemID INT(10),
    PRIMARY KEY (TileID, ItemID),
    FOREIGN KEY (TileID) REFERENCES tb_Tile(TileID),
    FOREIGN KEY (ItemID) REFERENCES tb_Item(ItemID)
);

CREATE TABLE tb_Game_Player (
    GameID INT(10),
    UserID INT(10),
    TileID INT(10),
    Score INT(10) DEFAULT 0,
    PRIMARY KEY (GameID, UserID),
    FOREIGN KEY (GameID) REFERENCES tb_Game(GameID),
    FOREIGN KEY (UserID) REFERENCES tb_User(UserID),
    FOREIGN KEY (TileID) REFERENCES tb_Tile(TileID)
);

CREATE TABLE tb_ChatSession (
    ChatID INT(10) PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE tb_Chat_Player (
    ChatID INT(10),
    UserID INT(10),
    MessageContent VARCHAR(255),
    ChatTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (ChatID, UserID),
    FOREIGN KEY (ChatID) REFERENCES tb_ChatSession(ChatID),
    FOREIGN KEY (UserID) REFERENCES tb_user(UserID)
);

-- 1. Player login, including lock out. [4]
DROP PROCEDURE IF EXISTS login;
DELIMITER //
CREATE PROCEDURE login(IN pEmail VARCHAR(255), IN pPassword VARCHAR(255))
BEGIN
	SELECT COUNT(*) FROM tb_user WHERE email = pemail AND password = pPassword;
END//
DELIMITER ;

-- 2. Player registration,[4]
DROP PROCEDURE IF EXISTS registration;
DELIMITER //
CREATE PROCEDURE registration(
	IN pUsername VARCHAR(255), 
	IN pEmail VARCHAR(255), 
	IN pPassword VARCHAR(255)
)
BEGIN
	INSERT INTO tb_User (Username, Email, Password) VALUES (pUsername, pEmail, pPassword);
END//
DELIMITER ;

-- 3. Laying out tiles on a game board. [4]
-- This stored function for assigning type for each Tile
DROP FUNCTION IF EXISTS assign_item_type;
DELIMITER //
CREATE FUNCTION assign_item_type() RETURNS INT
DETERMINISTIC
BEGIN
    -- item_type = 2 is bomb
    IF FLOOR(RAND() * 3) % 3 = 2 THEN
        RETURN 2;
    -- item_type = 1 is diamond
    ELSEIF FLOOR(RAND() * 3) % 3 = 1 THEN
        RETURN 1;
    ELSE
    -- item_type = 0 is empty
        RETURN 0;
    END IF;
END //
DELIMITER ;

DROP PROCEDURE IF EXISTS make_a_board;
DELIMITER //
CREATE PROCEDURE make_a_board(IN pMaxRow INT, IN pMaxCol INT)
BEGIN	
    DECLARE new_game_id INT;
	DECLARE new_board_id INT;
    DECLARE current_row INT DEFAULT 0;
    DECLARE current_col INT DEFAULT 0;
    DECLARE item_type INT DEFAULT 0;
    
    INSERT INTO tb_game (StartTime, EndTIme) VALUES (current_timestamp, current_timestamp);
    SET new_game_id = LAST_INSERT_ID();

	INSERT INTO tb_Map (MapID, MaxRow, MaxColumn) VALUES (new_game_id, pMaxRow, pMaxCol);
    -- Get last insert ID
	SET new_board_id = LAST_INSERT_ID();
    
    -- Use WHILE loop to traverse each row and col
    WHILE current_row < pMaxRow DO
		WHILE current_col < pMaxCol DO
			-- call assign_item_types to get item type
			SET item_type = assign_item_type();
            -- When item_type not equal to 0
            -- Only item_type not equal to 0 will be stored in database
            IF item_type <> 0
            THEN
				INSERT INTO tb_Tile (MapID, TileROW, TileCol, ItemTYpe, IsEmptied) VALUES (new_board_id, current_row, current_col, item_type, 0);
			ELSE
				INSERT INTO tb_Tile (MapID, TileROW, TileCol, ItemTYpe) VALUES (new_board_id, current_row, current_col, item_type);
            END IF;
            SET current_col = current_col + 1;
            
		END WHILE;
        -- Initial current_col and plus current_row
        SET current_col = 0;
		SET current_row = current_row + 1;
	END WHILE;
	SELECT 'Add tile successfully!' AS Message;
    -- Getting last insert MapID
    SELECT new_board_id AS MapID;
END//
DELIMITER ;

-- 4. Placing an item on a tile. [4]
DROP PROCEDURE IF EXISTS placing_item_on_tile;
DELIMITER //
CREATE PROCEDURE placing_item_on_tile(IN pMapID INT)
BEGIN
    DECLARE total_row INT DEFAULT 0;
    DECLARE total_col INT DEFAULT 0;
    DECLARE current_row INT DEFAULT 0;
    DECLARE current_col INT DEFAULT 0;
    DECLARE current_tile_id INT DEFAULT 0;

	INSERT INTO tb_ItemType (ItemTypeID, Type, Harm, Heath) VALUES (1, 'Diamond', 0, 10);
	INSERT INTO tb_ItemType (ItemTypeID, Type, Harm, Heath) VALUES (2, 'Bomb', 10, 0);

    INSERT INTO tb_item (ItemTypeID) VALUES (1);
	INSERT INTO tb_item (ItemTypeID) VALUES (2);
    
    -- Get max row size of board
	SELECT MAX(TileRow) INTO total_row 
    FROM tb_Tile 
    WHERE MapID = pMapID;
    
    -- Get max col size of board
    SELECT MAX(TileCol) INTO total_col 
    FROM tb_Tile 
    WHERE MapID = pMapID;
    
    -- 
    IF EXISTS (SELECT 1 FROM tb_map WHERE MapID = pMapID) 
    THEN
		-- traverse the whole board
		WHILE current_row <= total_row DO
			WHILE current_col <= total_col DO            
				-- Get current Tile_ID
				SELECT TileID INTO current_tile_id
                FROM tb_Tile
                WHERE MapID = pMapID AND TileRow = current_row AND TileCol = current_col LIMIT 1;
                                
                -- If the current_tile_id is not null, then according ItemTYpe to insert into tb_tile_item
				IF current_tile_id IS NOT NULL
                THEN
					IF (SELECT ItemType FROM tb_tile WHERE MapID = pMapID AND TileRow = current_row AND TileCol = current_col) = 1
					THEN						
                        INSERT INTO tb_tile_item (TileID, ItemID) VALUES (current_tile_id, 1);                        
					ELSEIF (SELECT ItemType FROM tb_tile WHERE MapID = pMapID AND TileRow = current_row AND TileCol = current_col) = 2
                    THEN						
						INSERT INTO tb_tile_item (TileID, ItemID) VALUES (current_tile_id, 2);                        
					END IF;
				END if;
                
                -- Initial current_col 
                SET current_col = current_col + 1;     
			END WHILE;			
            
            -- Initial current_col and plus current_row
			SET current_col = 0;
			SET current_row = current_row + 1;
        END WHILE;        
	ELSE
		SELECT 'Invalid MapID, please check again!' AS Message;
    END IF;
END//
DELIMITER ;

-- 5. Player game play movement [4]
DROP PROCEDURE IF EXISTS player_movement;
DELIMITER //
CREATE PROCEDURE player_movement(IN pUserID INT, IN pTileRow INT, IN pTileCol INT)
BEGIN
	DECLARE current_tile_id INT;
    DECLARE current_tile_row INT;
    DECLARE current_tile_col INT;
    DECLARE current_tile_occupied_state BIT;
    DECLARE target_tile_id INT;
    DECLARE target_tile_occupied_state BIT;

	START TRANSACTION;
    -- Get player current TileID
    SELECT TileID INTO current_tile_id
    FROM tb_game_player
    WHERE UserID = pUserID;
    
    -- Get player current tile position
    SELECT TileRow, TileCol INTO current_tile_row, current_tile_col
    FROM tb_Tile
    WHERE TileID = current_tile_id;

    -- Get player target tile position
    SELECT TileID INTO target_tile_id
    FROM tb_Tile
    WHERE TileRow = pTileRow AND
		TileCol = pTileCol;
    
	-- Check if target tile state
	SELECT IsOccupied INTO target_tile_occupied_state
    FROM tb_Tile
    WHERE TileID = target_tile_id;
    
    -- If target tile is legal, update tb_game_player
    IF target_tile_occupied_state = 0 AND 
    ((ABS(pTileRow - current_tile_row) = 1 AND pTileCol = current_tile_col) OR
    (pTileRow = current_tile_row AND ABS(pTileCol - current_tile_col) = 1))
		
    THEN
		-- Update original tile state
        UPDATE tb_tile
        SET IsOccupied = 0
        WHERE TileID = current_tile_id;
                
		-- Player movement implement
		UPDATE tb_game_player
        SET TileID = target_tile_id
        WHERE UserID = pUserID;
        
        -- Update target tile state after movement
        UPDATE tb_tile
        SET IsOccupied = 1
        WHERE TileID = target_tile_id;
			
        COMMIT;
        SELECT 'Player movement successfully!' AS Message;
	ELSE
		ROLLBACK;
        SELECT 'Player movement Fail!' AS Message;
    END IF;
END//
DELIMITER ;

-- 6. Game play scoring. [4]
-- 7. Player game play acquiring inventory [4]
DROP PROCEDURE IF EXISTS game_play_scoring;
DELIMITER //
CREATE PROCEDURE game_play_scoring(IN pUserID INT, IN target_tile_id INT)
BEGIN
    DECLARE current_item_id INT;

    -- Check if the target tile has been emptied
    IF (SELECT IsEmptied FROM tb_Tile WHERE TileID = target_tile_id) = 0
    THEN
        -- Check the ItemType on the target tile
        IF (SELECT ItemType FROM tb_Tile WHERE TileID = target_tile_id) = 1
        THEN
            -- Player gains 10 points for picking up a Diamond
            UPDATE tb_game_player
            SET Score = Score + 10
            WHERE UserID = pUserID;
            
            SELECT 'You get the Diamond! Score + 10!' AS Message;
            
        ELSEIF (SELECT ItemType FROM tb_Tile WHERE TileID = target_tile_id) = 2
        THEN
            -- Player loses 5 points for picking up a Bomb
            UPDATE tb_game_player
            SET Score = Score - 5
            WHERE UserID = pUserID;
            
            SELECT 'You get the Bomb! Score - 5!' AS Message;

        ELSE
            SELECT 'Nothing happened' AS Message;
        END IF;

        -- Mark the tile as emptied after item is picked up
        UPDATE tb_Tile
        SET IsEmptied = 1
        WHERE TileID = target_tile_id;

        -- Get the ItemID from the current tile
        SELECT ItemID INTO current_item_id
        FROM tb_Tile_Item
        WHERE TileID = target_tile_id;

        -- Check if the player already has this item in their inventory
        IF EXISTS (SELECT 1 FROM tb_Inventory_Item WHERE UserID = pUserID AND ItemID = current_item_id)
        THEN
            -- If exists, increase the quantity
            UPDATE tb_Inventory_Item
            SET Quantity = Quantity + 1
            WHERE UserID = pUserID AND ItemID = current_item_id;
        ELSE
            -- If not exists, insert the item into the inventory
            INSERT INTO tb_Inventory_Item (UserID, ItemID, Quantity)
            VALUES (pUserID, current_item_id, 1);
        END IF;

    END IF;
END//
DELIMITER ;

-- 8. Move an Item [4]
-- 9. Kill running games. [4]
DROP PROCEDURE IF EXISTS kill_running_game;
DELIMITER //
CREATE PROCEDURE kill_running_game(IN pGameID INT)
BEGIN 
	UPDATE tb_Game
	SET State = 'Terminated'
	WHERE GameID = pGameID;

    -- Check if the update was successful
    -- ROW_COUNT() returns number of influenced of last SQL statement
    IF ROW_COUNT() > 0
    THEN
        SELECT 'Kill running game successfully!' AS Message;
    ELSE
        SELECT 'Sorry, this game does not exist or is not currently running!' AS Message;
    END IF;
END//
DELIMITER ;

-- 10. Add new players. [4]
DROP PROCEDURE IF EXISTS add_player;
DELIMITER //
CREATE PROCEDURE add_player(
	IN pUsername VARCHAR(255), 
	IN pEmail VARCHAR(255), 
    IN pPassword VARCHAR(255),
	IN pLockState BIT,
	IN pIsAdministrator BIT		
)
BEGIN
	INSERT INTO tb_user (Username, Email, Password, LockState, IsAdministrator) 
    VALUES 
    (pUsername, pEmail, pPassword, pLockState, pIsAdministrator);
END//
DELIMITER ;

-- 11. Update data of a player. [4]
DROP PROCEDURE IF EXISTS update_player;
DELIMITER //
CREATE PROCEDURE update_player(
    IN pUsername VARCHAR(255), 
    IN pEmail VARCHAR(255), 
    IN pPassword VARCHAR(255), 
    IN pLockState BIT,
    IN pLoginState BIT, 
    IN pGameState BIT, 
    IN pIsAdministrator BIT
)
BEGIN 
    IF EXISTS (SELECT 1 FROM tb_User WHERE Username = pUsername)
    THEN
        UPDATE tb_User
        SET
            Password = pPassword,
            LockState = pLockState,
            LoginState = pLoginState,
            GameState = pGameState,
            IsAdministrator = pIsAdministrator
        WHERE Username = pUsername AND
			email = pEmail;
    ELSE
        SELECT 'This player does not exist' AS Message;
    END IF;
END//
DELIMITER ;

-- 12. Delete a player. [4]
DROP PROCEDURE IF EXISTS delete_player;
DELIMITER //
CREATE PROCEDURE delete_player(IN pEmail VARCHAR(255))
BEGIN
	DELETE FROM tb_user WHERE pEmail = pEmail;
END//
DELIMITER ;

DROP PROCEDURE IF EXISTS add_player_to_game;
DELIMITER //
CREATE PROCEDURE add_player_to_game(IN pGameID INT, IN pUserID INT, IN pTileID INT)
BEGIN
	IF EXISTS (SELECT 1 FROM tb_game WHERE GameID = pGameID)
	THEN 
		IF EXISTS (SELECT 1 FROM tb_user WHERE UserID = pUserID)
        THEN
			IF EXISTS (SELECT 1 FROM tb_tIle WHERE TileID = pTileID)
            THEN
				IF NOT EXISTS (SELECT 1 FROM tb_game_player WHERE GameID = pGameID AND UserID = pUserID)
                THEN
					INSERT INTO tb_game_player (GameID, UserID, TileID) VALUES (pGameID, pGameID, pTileID);
                    SELECT "Successfully!" AS Message;
				ELSE
					SELECT "THis record already exists!" AS Message;
				END IF;
			ELSE
				SELECT "Invalid Tile!" AS Message;
			END IF;
		ELSE
			SELECT "Invalid Player!" AS Message;
		END IF;
	ELSE
		SELECT "Invalid Game!" AS Message;
	END IF;
END//