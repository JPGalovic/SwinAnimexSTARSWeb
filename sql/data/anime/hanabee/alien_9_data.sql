-- ALIEN 9 Data, Version 1.0.0, JAN18, JSimmonds-Browne
INSERT INTO ANIME(ANIME_TITLE, NUMBER_OF_EPISODES, ANIME_SYNOPSIS, ANIME_DESCRIPTION, COMPANY_NAME, COPYRIGHT) VALUES
		("ALIEN 9",
		 4,
		 "In sixth grade Yuri just wants to end her last year in elementary school on a quiet note...not as a member of the 'Alien Party'. The objective of the 'Alien Party' is to capture any rogue aliens that wonder on to the school premises. However to capture these aliens you need the help of one, called a &quot;Borg&quot;. A symbiotic life-form that offers the ability to protect, incapacitate and ultimately capture other aliens in compensation for being able to feed off their wastes by licking their back.",
		 "In sixth grade Yuri just wants to end her last year in elementary school on a quiet note...not as a member of the 'Alien Party'.",
		 "Hanabee",
		 "&copy; J.C. STAFF"
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("ALIEN 9",
		 3,
		 4,
		 "M - fantasy themes and violence",
		 4,
		 "https://hanabee.com.au/products/alien-9-dvd"
		)
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("ALIEN 9",
		 1,
		 "9th Elementary Anti-Alien Squad",
		 NULL
		)
	,	("ALIEN 9",
		 2,
		 "Boredom, Spaceship and Overgrowth",
		 NULL
		)
	,	("ALIEN 9",
		 3,
		 "Summer Vacation, Borg and Death",
		 NULL
		)
	,	("ALIEN 9",
		 4,
		 "The End of the Beginning",
		 NULL
		)
;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("ALIEN 9", 0, 1, 1)
	,	("ALIEN 9", 0, 2, 1)
	,	("ALIEN 9", 0, 3, 2)
	,	("ALIEN 9", 2, 1, 4)
;
