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
	,	(3, "Linux Game", "This game runs on Linux.")
	,	(4, "Board Game", "This game is a phisical board game.")
	,	(5, "Card Game", "This game is a phisical card game.")
	,	(6, "Role Playing Game", "This game is a phisical role playing game.")
	,	(7, "Live Action Role Playing Game", "This game is a LARP.")
;

-- Table for Game Data
CREATE TABLE IF NOT EXISTS GAME (
		GAME_TITLE						VARCHAR(100)
	,	GAME_DESCIRPTION				VARCHAR(500)
	,	MIN_NUMBER_OF_PLAYERS			INT(11)
	,	MAX_NUMBER_OF_PLAYERS			INT(11)
	,	RECOMMENDED_NUMBER_OF_PLAYERS	INT(11)
	,	GAME_CLASSIFICATION				VARCHAR(100)
	,	PRIMARY KEY						(GAME_TITLE)
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
;