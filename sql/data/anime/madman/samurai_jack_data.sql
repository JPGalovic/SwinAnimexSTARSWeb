-- Anime Data
INSERT INTO ANIME(ANIME_TITLE, NUMBER_OF_EPISODES, ANIME_SYNOPSIS, ANIME_DESCRIPTION, COMPANY_NAME, COPYRIGHT) VALUES
		("Samurai Jack",
		 13,
		 "Long ago in a distant land, I, Aku, the shape-shifting Master of Darkness, unleashed an unspeakable evil! But a foolish Samurai warrior wielding a magic sword stepped forth to oppose me. Before the final blow was struck, I tore open a portal in time and flung him into the future, where my evil is law! Now the fool seeks to return to the past, and undo the future that is Aku!",
		 "Long ago in a distant land, I, Aku, the shape-shifting Master of Darkness, unleashed an unspeakable evil! But a foolish Samurai warrior wielding a magic sword stepped forth to oppose me.",
		 "Madman",
		 "&copy;Genndy Tartakovsky, Dana Ritchey"
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("Samurai Jack",
		 3,
		 1,
		 "PG - Mild animated violence",
		 13,
		 "https://www.madman.com.au/catalogue/view/18508/samurai-jack-the-complete-seasons-14"
		)
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("Samurai Jack",
		 1,
		 "Samurai Jack: The Premiere Movie part 1",
		 "Aku, an evil shape-shifting demon, devastates a young prince's land, and his parents send him into exile. After years of intensive training, the prince receives a mystical sword and samurai's robes, and frees his people from Aku's minions. He then defeats Aku in battle, but before striking the final blow the latter casts a spell to send him into the future."
		)
	,	("Samurai Jack",
		 2,
		 "Samurai Jack: The Premiere Movie part 2",
		 "The samurai is plunged into a dystopian world ruled by Aku, adopting the name &quot;Jack&quot;. After getting in a fight at a nightclub, he is hired by a group of canine miners to protect them from Aku's forces."
		)
	,	("Samurai Jack",
		 3,
		 "Samurai Jack: The Premiere Movie part 3",
		 "Armed with various weapons and traps, Jack single-handledly defeats Akus &quot;beetle-bots&quot;. He subsequently vows to fight the demons oppression until he can return to the past."
		)
	,	("Samurai Jack",
		 4,
		 "Jack, the Woolies, and the Chritchellites",
		 "Jack helps free the Woolies from the tyrannical Chritchellites. In return, the leader of the Woolies bestows his wisdom upon Jack."
		)
	,	("Samurai Jack",
		 5,
		 "Jack in Space",
		 "After accidentally exposing a colony of scientists seeking to escape Earth, Jack trains as an astronaut to protect them from Aku's robots."
		)
	,	("Samurai Jack",
		 6,
		 "Jack and the Warrior Woman",
		 "A talented warrior named Ikra joins Jack as he seeks a magical jewel that could send him back to his own time. However, her true motives threaten to derail his quest."
		)
	,	("Samurai Jack",
		 7,
		 "Jack and the Three Blind Archers",
		 "Jack learns of a powerful wishing well that can return him to the past, but must find a way past the three deadly archers who protect it."
		)
	,	("Samurai Jack",
		 8,
		 "Jack vs. Mad Jack",
		 "Angered by the failure of his bounty hunters and mercenaries to defeat Jack, Aku uses the samurai's inner darkness to create an evil clone whose sole purpose is to destroy him."
		)
	,	("Samurai Jack",
		 9,
		 "Jack Under the Sea",
		 "Jack has an underwater adventure while hunting for an ancient time portal. The denizens of the deep, known as the Triceraquins, seem welcoming, but may prove to be untrustworthy."
		)
	,	("Samurai Jack",
		 10,
		 "Jack and the Lava Monster",
		 "Jack survives a series of traps and encounters a Viking king transformed into a giant rock figure by Aku, who insists that Jack slay him in battle so that he can reach Valhalla."
		)
	,	("Samurai Jack",
		 11,
		 "Jack and the Scotsman",
		 "Jack meets the Scotsman, a warrior who also wields an enchanted sword, and they argue on a bridge. After realizing that Aku has placed bounties on both of them, however, they join forces to escape."
		)
	,	("Samurai Jack",
		 12,
		 "Jack and the Gangsters",
		 "Jack teams up with some gangsters to try to get close to Aku. The only way to do it is to get a mystical jewel guarded by three elementals."
		)
	,	("Samurai Jack",
		 13,
		 "Aku's Fairy Tales",
		 "Seeking to weaken Jack's popularity among his subjects, Aku gathers the children of the world in his palace and tells them a series of &quot;fairy tales&quot;, all of which portray himself as a hero and Jack as the villain."
		)
;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("Samurai Jack", 0, 1, 4)
	,	("Samurai Jack", 0, 2, 4)
	,	("Samurai Jack", 0, 3, 5)
;
