-- Anime Data
INSERT INTO ANIME(ANIME_TITLE, NUMBER_OF_EPISODES, ANIME_SYNOPSIS, ANIME_DESCRIPTION, COMPANY_NAME, COPYRIGHT) VALUES
		("Title",
		 n,
		 "Synopsys",
		 "Description",
		 "Company"
		 "Copyright"
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("Title",
		 n,
		 m,
		 "Classification",
		 x,
		 "URL"
		)
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("Title",
		 n,
		 "Episode_Title",
		 "Episode_Synopsys"
		)
;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("Title", x, y, z)
;
		
-- General Anime Volume Data
	,	("Title",
		 n,
		 m,
		 "Classification",
		 x,
		 "URL"
		)
		
-- General Anime Episode Data
	,	("Title",
		 n,
		 "Episode_Title",
		 "Episode_Synopsys"
		)
		
-- General Anime Session Data
	,	("Title", x, y, z)