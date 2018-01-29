-- Game Data Core, Version 1.1, JAN18, JPGalovic
-- Table for Game Platform
CREATE TABLE IF NOT EXISTS PLATFORM (
		PLATFORM_ID						INT(11)
	,	PLATFORM_NAME					VARCHAR(100)
	,	PLATFORM_DESCRIPTION			VARCHAR(500)
	,	PRIMARY KEY						(PLATFORM_ID)
);

-- Data for Game Platform
INSERT INTO PLATFORM (PLATFORM_ID, PLATFORM_NAME, PLATFORM_DESCRIPTION) VALUES
		(0, "Windows Game", "This game runs on Microsoft Windows.")
	,	(1, "MAC Game", "This game runs on Apple Macontosh.")
	,	(2, "Linux Game", "This game runs on Linux.")
	
	,	(10, "Board Game", "This game is a phisical board game.")
	,	(11, "Card Game", "This game is a phisical card game.")
	,	(12, "Role Playing Game", "This game is a phisical role playing game.")
	,	(13, "Live Action Role Playing Game", "This game is a LARP.")
	
	,	(23, "Play Station 4", "Sony Play Station 4")
	,	(22, "Play Station 3", "Sony Play Station 3")
	,	(21, "Play Station 2", "Sony Play Station 2")
	,	(20, "Play Station", "Sony Play Station")
	
	,	(31, "Play Station Vita", "Sony Play Station Vita")
	,	(30, "Play Station Portable", "Sony Play Station Portable")
	
	,	(42, "Xbox One", "Microsoft Xbox One")
	,	(41, "Xbox 360", "Microsoft Xbox 360")
	,	(40, "Xbox", "Microsoft Xbox")
	
	,	(66, "Nintindo Switch", "Nintendo Switch")
	,	(65, "Wii U", "Nintendo Wii U")
	,	(64, "Wii", "Nintendo Wii")
	,	(63, "GameCube", "Nintendo GameCube")
	,	(62, "Nintendo 64", "Nintendo 64")
	,	(61, "Super Nintendo", "Super Nintendo, Super Famicom")
	,	(60, "Nintendo Entertainment System", "Nintendo Entertainment System, Family Computer, Famicom")
	
	,	(76, "New 3DS", "Nintendo New 3DS, New 2DS")
	,	(75, "3DS", "Nintendo 3DS, 2DS")
	,	(74, "DSi", "Nintendo DSi")
	,	(73, "DS", "Nintendo DS")
	,	(72, "Gameboy Advance", "Nintendo Gameboy Advance, Advance SP, Nintendo Micro")
	,	(71, "Gameboy Color", "Nintendo Gamboy Color")
	,	(70, "Gameboy", "Nintendo Gameboy, Gameboy Pocket, Gameboy Light")
;

-- Table for Game Data
CREATE TABLE IF NOT EXISTS GAME (
		GAME_TITLE						VARCHAR(100)
	,	GAME_DESCIRPTION				VARCHAR(500)
	,	MIN_NUMBER_OF_PLAYERS			INT(11)
	,	MAX_NUMBER_OF_PLAYERS			INT(11)
	,	RECOMMENDED_NUMBER_OF_PLAYERS	INT(11)
	,	COMPANY_NAME					VARCHAR(50)		
	,	CLASSIFICATION					VARCHAR(100)
	,	PRIMARY KEY						(GAME_TITLE)
	,	FOREIGN KEY						(COMPANY_NAME) REFERENCES COMPANY (COMPANY_NAME)
	,	FOREIGN KEY						(CLASSIFICATION) REFERENCES CLASSIFICATION (CLASSIFICATION)
);

-- Table for Game Platform Definitions
CREATE TABLE IF NOT EXISTS GAME_PLATFORM (
		GAME_TITLE						VARCHAR(100)
	,	PLATFORM_ID						INT(11)
	,	PRIMARY KEY						(GAME_TITLE, PLATFORM_ID)
	,	FOREIGN KEY						(GAME_TITLE) REFERENCES GAME (GAME_TITLE)
	,	FOREIGN KEY						(PLATFORM_ID) REFERENCES PLATFORM (PLATFORM_ID)
);

-- Table for Game Event Type
CREATE TABLE IF NOT EXISTS GAME_EVENT_TYPE (
		TYPE_ID							INT(11)
	,	DESCRIPTION						VARCHAR(500)
	,	PRIMARY KEY						(TYPE_ID)
);

-- DATA for Game Event Type
INSERT INTO GAME_EVENT_TYPE (TYPE_ID, DESCRIPTION) VALUES
		(0, "Game Tourniment")
	,	(1, "Game Session")
	,	(2, "Marathon")
	,	(3, "LAN")
;