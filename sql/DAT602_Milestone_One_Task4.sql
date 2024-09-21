USE sys;
DROP DATABASE IF EXISTS TreasureHuntAdventure;
CREATE DATABASE TreasureHuntAdventure;
USE TreasureHuntAdventure;

DELIMITER //
DROP PROCEDURE IF EXISTS CreateTables //
CREATE PROCEDURE CreateTables()
BEGIN
    CREATE TABLE Game (
        GameID INT(10) PRIMARY KEY AUTO_INCREMENT,
        StartTime DATE,
        EndTime DATE,
        State VARCHAR(32)
    );

    CREATE TABLE Map (
    MapID INT(10) PRIMARY KEY AUTO_INCREMENT,
    GameID INT(10),
    MaxRow INT(10),
    MaxColumn INT(10),
    FOREIGN KEY (GameID) REFERENCES Game(GameID)
    );

    CREATE TABLE Tile (
    TileID INT(10) PRIMARY KEY AUTO_INCREMENT,
    MapID INT(10),
    `Row` INT(10),
    `Column` INT(10),
    IsTileOccupied BIT,
    IsTileEmpty BIT,
    FOREIGN KEY (MapID) REFERENCES Map(MapID)
    );

    CREATE TABLE ItemType (
        ItemTypeID INT(10) PRIMARY KEY AUTO_INCREMENT,
        Type VARCHAR(255),
        Harm INT(10),
        Health INT(10)
    );

    CREATE TABLE Item (
        ItemID INT(10) PRIMARY KEY AUTO_INCREMENT,
        ItemTypeID INT(10),
        FOREIGN KEY (ItemTypeID) REFERENCES ItemType(ItemTypeID)
    );

    CREATE TABLE Tile_Item (
        TileID INT(10),
        ItemID INT(10),
        PRIMARY KEY (TileID, ItemID),
        FOREIGN KEY (TileID) REFERENCES Tile(TileID),
        FOREIGN KEY (ItemID) REFERENCES Item(ItemID)
    );

    CREATE TABLE Player (
        PlayerID INT(10) PRIMARY KEY AUTO_INCREMENT,
        Username VARCHAR(255),
        Email VARCHAR(255),
        Password VARCHAR(255),
        LockState BIT,
        LoginState BIT,
        GameState BIT,
        IsAdministrator BIT
    );

    CREATE TABLE Game_Player (
    GameID INT(10),
    PlayerID INT(10),
    TileID INT(10),
    Score INT(10),
    PRIMARY KEY (GameID, PlayerID),
    FOREIGN KEY (GameID) REFERENCES Game(GameID),
    FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID),
    FOREIGN KEY (TileID) REFERENCES Tile(TileID)
    );

    CREATE TABLE Inventory_Item (
        PlayerID INT(10),
        ItemID INT(10),
        Quantity INT(10),
        PRIMARY KEY (PlayerID, ItemID),
        FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID),
        FOREIGN KEY (ItemID) REFERENCES Item(ItemID)
    );

    CREATE TABLE Chat_Session (
        ChatID INT(10) PRIMARY KEY
    );

    CREATE TABLE Chat_Player (
        ChatID INT(10),
        PlayerID INT(10),
        MessageContent VARCHAR(255),
        TimeStamp TIMESTAMP,
        PRIMARY KEY (ChatID, PlayerID),
        FOREIGN KEY (ChatID) REFERENCES Chat_Session(ChatID),
        FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID)
    );

    INSERT INTO Game (StartTime, EndTime, State) 
    VALUES
        ('2024-08-01', '2024-08-15', 'active'),
        ('2024-08-02', '2024-08-16', 'completed'),
        ('2024-08-03', '2024-08-17', 'completed'),
        ('2024-08-04', '2024-08-18', 'active'),
        ('2024-08-05', '2024-08-19', 'active');

    INSERT INTO Map (GameID, MaxRow, MaxColumn) 
    VALUES
        (1, 10, 10),
        (2, 10, 10),
        (3, 15, 15),
        (4, 17, 17),
        (5, 20, 20);

    INSERT INTO Tile (MapID, `Row`, `Column`, IsTileOccupied, IsTileEmpty) 
    VALUES
        (1, 5, 5, 0, 1),
        (2, 7, 3, 1, 0),
        (3, 10, 5, 0, 1),
        (4, 10, 10, 1, 0),
        (5, 20, 20, 0, 1);

    INSERT INTO ItemType (Type, Harm, Health) 
    VALUES
        ('Jewel', 0, 10),
        ('Jewel', 0, 10),
        ('Bomb', 20, 0),
        ('Bomb', 20, 0),
        ('Jewel', 0, 10);

    INSERT INTO Item (ItemTypeID) 
    VALUES
        (1),
        (2),
        (3),
        (4),
        (5);

    INSERT INTO Tile_Item (TileID, ItemID) 
    VALUES
        (1, 5),
        (2, 4),
        (3, 3),
        (4, 2),
        (5, 1);

    INSERT INTO Player (Name, Email, Password, LockState, LoginState, GameState, IsAdministrator) 
    VALUES
        ('Alice', 'alice@example.com', 'password123', 0, 1, 1, 0),
        ('Bozhi', 'bozhi@example.com', 'password123', 0, 1, 1, 1),
        ('Charlie', 'charlie@example.com', 'password123', 0, 0, 0, 0),
        ('David', 'david@example.com', 'password123', 1, 0, 0, 0),
        ('Eve', 'eve@example.com', 'password123', 0, 1, 0, 1);

    INSERT INTO Game_Player (GameID, PlayerID, TileID, Score) 
    VALUES
        (1, 3, 1, 10),
        (1, 4, 2, 20),
        (2, 2, 3, 0),
        (3, 1, 4, 10),
        (4, 5, 5, 30);

    INSERT INTO Inventory_Item (PlayerID, ItemID, Quantity) 
    VALUES
        (1, 1, 1),
        (2, 2, 0),
        (3, 3, 1),
        (4, 4, 1),
        (5, 5, 3);

    INSERT INTO Chat_Session (ChatID) 
    VALUES
        (1),
        (2),
        (3),
        (4),
        (5);

    INSERT INTO Chat_Player (ChatID, PlayerID, MessageContent, TimeStamp) 
    VALUES
        (1, 1, 'Hello World!', CURRENT_TIMESTAMP),
        (2, 2, 'Good luck!', CURRENT_TIMESTAMP),
        (3, 3, 'Let\'s start the game!', CURRENT_TIMESTAMP),
        (4, 4, 'I will be the winner!', CURRENT_TIMESTAMP),
        (5, 5, 'Let\'s go', CURRENT_TIMESTAMP);

END//
DELIMITER ;

CALL CreateTables()