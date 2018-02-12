-- Anime Data
INSERT INTO ANIME(ANIME_TITLE, NUMBER_OF_EPISODES, ANIME_SYNOPSIS, ANIME_DESCRIPTION, COMPANY_NAME, COPYRIGHT) VALUES
		("Aquarion Logos",
		 26,
		 "Celebrating its 10th anniversary, Aquarion returns with a new series, new characters and a brand new adventure! Inspired by the classic mecha series of the ‘70s and ‘80s, Aquarion Logos is ready to serve up more high-flying robotic battles animated by Satelight, the same team that brought you Log Horizon, Fairy Tail and the first two installments in the Aquarion franchise.",
		 "Celebrating its 10th anniversary, Aquarion returns with a new series, new characters and a brand new adventure! Inspired by the classic mecha series of the ‘70s and ‘80s, ",
		 "Madman",
		 "&copy;2015 SHOJI KAWAMORI,SATELIGHT/Project AQUARION LOGOS"
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("Aquarion Logos",
		 3,
		 1,
		 "Animated violence and sexual references",
		 26,
		 "https://www.madman.com.au/catalogue/view/34310"
		)
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("Aquarion Logos",
		 1,
		 "Shout! Sousei Gattai!",
         NULL
		)
	,	("Aquarion Logos",
		 2,
		 "Shine! Light of Thought",
         NULL
		)
	,	("Aquarion Logos",
		 3,
		 "Resound! A Dream for Me Alone",
         NULL
		)
	,	("Aquarion Logos",
		 4,
		 "Let Fly! an Arrow That Pierces the Heart",
		 NULL
		)
	,	("Aquarion Logos",
		 5,
		 "Take It Back! Our Summer",
		 NULL
		)
	,	("Aquarion Logos",
		 6,
		 "Light Up! Your Strength",
		 NULL
		)
	,	("Aquarion Logos",
		 7,
		 "Burn It! the Savior's Flames!",
		 NULL
		)
	,	("Aquarion Logos",
		 8,
		 "Pierce It! the Insect Part",
		 NULL
		)
	,	("Aquarion Logos",
		 9,
		 "Clear Them! the Inviting Shadows",
		 NULL
		)
	,	("Aquarion Logos",
		 10,
		 "Reach Them! My True Voice",
		 NULL
		)
	,	("Aquarion Logos",
		 11,
		 "Flap! Bound Wings",
		 NULL
		)
	,	("Aquarion Logos",
		 12,
		 "Bring Them Together! Heart and Heart",
		 NULL
		)
	,	("Aquarion Logos",
		 13,
		 "A Great Victory! We Are the Saviors",
		 NULL
		)
	,	("Aquarion Logos",
		 14,
		 "Show It! You at Your Worst",
		 NULL
		)
	,	("Aquarion Logos",
		 15,
		 "Ah! Days of Our Youth",
		 NULL
		)
	,	("Aquarion Logos",
		 16,
		 "Carve Them In! the Scars of Destiny",
		 NULL
		)
	,	("Aquarion Logos",
		 17,
		 "Shatter! the One I Must Strike Down",
		 NULL
		)
	,	("Aquarion Logos",
		 18,
		 "Howl! an Honest Beaten Dog",
		 NULL
		)
	,	("Aquarion Logos",
		 19,
		 "Fall in Love! Asagaya",
		 NULL
		)
	,	("Aquarion Logos",
		 20,
		 "Know It! the Reason You Were Born",
		 NULL
		)
	,	("Aquarion Logos",
		 21,
		 "Tragic! an Immoral Gattai",
		 NULL
		)
	,	("Aquarion Logos",
		 22,
		 "Listen! the Voice Calling Out to You",
		 NULL
		)
	,	("Aquarion Logos",
		 23,
		 "Revive! the Vow Beneath the Moonlight",
		 NULL
		)
	,	("Aquarion Logos",
		 24,
		 "To Battle! With My Existence on the Line",
		 NULL
		)
	,	("Aquarion Logos",
		 25,
		 "Gather! Voices for Tomorrow",
		 NULL
		)
	,	("Aquarion Logos",
		 26,
		 "It Will Not End! Aquarion Logos",
		 NULL
		)

;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("Aquarion Logos ", 0, 1, 8)
	,	("Aquarion Logos ", 0, 2, 9)
	,	("Aquarion Logos ", 0, 3, 9)
	,	("Aquarion Logos ", 2, 1, 26)
	,	("Aquarion Logos ", 3, 1, 2)
;

