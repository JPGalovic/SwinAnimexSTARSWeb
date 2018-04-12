-- Anime Data
INSERT INTO ANIME(ANIME_TITLE, NUMBER_OF_EPISODES, ANIME_SYNOPSIS, ANIME_DESCRIPTION, COMPANY_NAME, COPYRIGHT) VALUES
		("Angelic Layer",
		 26,
		 "Twelve-year-old Misaki, a middle school freshman now living with her aunt, quickly makes friends with others who are as interested in Angelic Layer as she is. Misaki builds her own Angel, Hikaru, and begins competing in battles where will and determination count for far more than size and strength. 

Will Misaki get the hang of Angelic Layer quickly enough to avoid defeat? Who is that mysterious man who keeps popping up, anyway? And what is really the deal with Misaki's mom? Watch the first four fun-filled episodes to see how Misaki fares in battle and deals with life in the big city. ",
		 "Twelve-year-old Misaki, a middle school freshman now living with her aunt, quickly makes friends with others who are as interested in Angelic Layer as she is. Misaki builds her own Angel, Hikaru, and begins competing in battles where will and determination count for far more than size and strength. 

Will Misaki get the hang of Angelic Layer quickly enough to avoid defeat? Who is that mysterious man who keeps popping up, anyway? And what is really the deal with Misaki's mom? Watch the first four fun-filled episodes to see how Misaki fares in battle and deals with life in the big city. ",
		 "Madman",
		 "&copy; CLAMP/ANGELIC PRODUCTION COMMITTEE, TV TOKYO"
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("Angelic Layer Series Collection",
		 1,
		 1,
		 "PG - Medium Level Violence",
		 x,
		 "https://www.madman.com.au/catalogue/view/33250"
		)
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("Angelic Layer",
		 1,
		 "How Do You Do? My Very Own Angel",
		 "Twelve-year-old Misaki Suzuhara arrives in Tokyo. She becomes interested in Angelic Layer after seeing a battle on screen and meeting Ichiro Mihara (Icchan). She creates her Angel, Hikaru, when she arrives at her Aunt's apartment later that night. 
"
		)
	,	("Angelic Layer",
		 2,
		 "Do Your Best, Hikaru! It’s Your Very First Fight!!",
		 "Misaki learns more about Angelic Layer and even partakes in a competition battle herself, though by accident. She also meets fellow classmates Kotaro Kobayashi and Tamayo Kizaki as well as fellow and famous Deus Hatoko Kobayashi."
		)
;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("Angelic Layer", 1, 1, 2)
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