INSERT INTO EVENT_DATA (EVENT_TIME, EVENT_TYPE_ID, EVENT_TITLE, EVENT_LOCATION, EVENT_FACEBOOK_ID, EVENT_UNIONE_URL) VALUES
		("Date", type, "Event_Title", location_id, fb_id, "Unione_URL")
;

INSERT INTO EVENT_ANIME_DATA (EVENT_TIME, ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER) VALUES
		("Date", "Anime_Title", Session_Type_ID, Session_Number)
;

INSERT INTO EVENT_GAME_DATA (EVENT_TIME, GAME_TITLE, GAME_EVENT_TYPE) VALUES
		("Date", "Game_Title", Game_Event_Type_ID)
;

-- General Event Data
	,	("Date", type, "Event_Title", location_id, fb_id, "Unione_URL")
	
-- Anime Event Data
	,	("Date", "Anime_Title", Session_Type_ID, Session_Number)
	
-- Game Event Data
	,	("Date", "Game_Title", Game_Event_Type_ID)