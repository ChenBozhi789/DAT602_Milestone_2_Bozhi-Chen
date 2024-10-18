-- CALL register procedure
CALL register('Alice Smith', 'alice.smith@example.com', '234567890');
CALL register('Bob Johnson', 'bob.johnson@example.com', '345678901');
CALL register('Emily Davis', 'emily.davis@example.com', '456789012');
CALL register('Michael Brown', 'michael.brown@example.com', '567890123');
SELECT * FROM tb_Player;

-- CALL login procedure
-- 	1. Player credential invalid't -> Attempt + 1
CALL login('alice.smith@example.com', '666666');
CALL login('alice.smith@example.com', '666666');
CALL login('alice.smith@example.com', '666666');
-- 	2. Player credential valid't -> Login successfully
CALL login('bob.johnson@example.com', '345678901');

-- CALL make_a_board procedure
CALL make_a_board(5, 5);
SELECT * FROM tb_map;

-- CALL placing_item_on_tile procedure
CALL placing_item_on_tile(1);
SELECT * FROM tb_tile_item;

-- CALL add_plyer procedure
-- 	1. Player doesn't exists -> Insert new player
CALL add_player('Tester1', '111@qq.com', '5588465');
-- 	2. Player already exists -> Prompt pops up
CALL add_player('Tester1', '111@qq.com', '5588465');

-- CALL update_plyer procedure
-- 1. Player doesn't exists -> Prompt pops up
CALL update_player(20, 'updateEMAIL', 'updatePASSWORD', 1, 1, 1, 1);
-- 2. Player exists -> Update data normally
CALL update_player(1, 'updateEMAIL', 'updatePASSWORD', 1, 1, 1, 1);

-- CALL delete_plyer procedure
-- 1. Player doesn't exists -> Prompt pops up
CALL delete_player(3);
-- 2. Player exists -> Delete player normally
CALL delete_player(2);
SELECT * FROM tb_Player;

-- Add player to game
CALL add_player_to_game(1, 1, 1);
SELECT * FROM dat602m2t1db.tb_game_player;

-- Just reminder:
-- For requirements 5, 6 and 7, I wrote them as separate stored procedures, 
-- so when you want to test, please uncomment/remove the stored procedures 
-- of the other two tasks first, thank you 

-- PLayer movement
-- CALL player_movement(1, 1, 2);

-- Game play scoring
-- CALL game_play_scoring(1, 1, 0);
-- CALL game_play_scoring(1, 1, 1);
-- CALL game_play_scoring(1, 1, 2);
-- CALL game_play_scoring(1, 2, 2);
-- SELECT * FROM tb_game_player;

-- Player game play acquiring inventory
-- CALL acquire_item_to_inventory(1, 1, 0);
-- CALL acquire_item_to_inventory(1, 1, 1);
-- CALL acquire_item_to_inventory(1, 1, 2);
-- CALL acquire_item_to_inventory(1, 2, 2);
-- CALL acquire_item_to_inventory(1, 2, 3);

-- Kill running games
CALL kill_running_game(1);