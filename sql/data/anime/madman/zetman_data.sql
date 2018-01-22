-- Anime Data
INSERT INTO ANIME(ANIME_TITLE, NUMBER_OF_EPISODES, ANIME_SYNOPSIS, ANIME_DESCRIPTION, COMPANY_NAME, COPYRIGHT) VALUES
		("Zetman",
		 13,
		 "There are two forces in the world: the Zet, who are entrusted with the survival of humanity, and the Alphas, who have chosen an extreme form of justice. In a certain city, Jin lives under a bridge with an old man, struggling to pay off debts. He carries the destiny of humanity's survival. Kouga lives on a hill and stands to inherit vast wealth. In his admiration for heroes, he seeks out the meaning of justice.",
		 "There are two forces in the world: the Zet, who are entrusted with the survival of humanity, and the Alphas, who have chosen an extreme form of justice.",
		 "Madman",
		 "&copy; MK/S, ZP"
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("Zetman",
		 0,
		 1,
		 "MA15+",
		 13,
		 "https://www.animelab.com/shows/zetman"
		)
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("Zetman",
		 1,
		 "Untaught Emotions",
		 "Jin Kanzaki is poor, but he lives a happy life with his grandfather. Together with his friends Kouga and Konoha, he helps out people for a fee. Meanwhile, the police are searching for a vicious serial killer."
		)
	,	("Zetman",
		 2,
		 "In the Fire",
		 "A few years have passed since Jin went missing. Kouga, still dreaming of becoming a real hero, is intent on catching a serial arsonist prowling the streets."
		)
	,	("Zetman",
		 3,
		 "Tears",
		 "When Jin wakes up, he sees a monster holding the lifeless body of his foster mother, Akemi. An old man named Mitsugai is attempting to awaken ZET within Jin by using her. Mitsugai succeeds and ZET awakens…but he’s still incomplete."
		)
	,	("Zetman",
		 4,
		 "Ill Fortune",
		 "Two years have passed. Players are wreaking havoc in society, but humans are still unaware of their existence. People live in fear, and Mitsugai is unable to produce another ZET."
		)
	,	("Zetman",
		 5,
		 "Alphas",
		 "Kouga tries to become a superhero by creating a real-life Alphas. A mysterious man approaches him with a test to see if he’s qualified to become one."
		)
	,	("Zetman",
		 6,
		 "Hostage",
		 "Konoha is taken hostage and Jin is unable to do anything. Unlike before, he cannot become ZET by hurting himself and doesn’t have his Activation Gum."
		)
	,	("Zetman",
		 7,
		 "The Ring Of Exposure",
		 "ZET finally turns red and displays powers unlike anything seen before. With overwhelming strength, ZET dominates the fight against a Player. Meanwhile, Kouga is having a tough time fending off a Player in his first battle as Alphas."
		)
	,	("Zetman",
		 8,
		 "A Normal Family",
		 "Kouga learns that Jin has been fighting by himself as ZET. Thrilled over meeting a true hero, Kouga calls him “ZETMAN” and declares he will fight alongside him. Jin and Kouga head for the lab to find out why Red ZET turned white."
		)
	,	("Zetman",
		 9,
		 "Whereabouts of the Pendant",
		 "The key to completing ZET is the pendant that Konoha has in her possession. Haitani and his men easily infiltrate the Amagi residence. Konoha wakes up and finds Jin standing in front of her. She hands him the pendant, not knowing he’s actually a clone."
		)
	,	("Zetman",
		 10,
		 "Party",
		 "Konoha goes missing. Kouga receives a phone call from the man who gave him the first test where he had to choose between the lives of his sister or three high school girls he didn’t know. Kouga chose Konoha and the girls were killed."
		)
	,	("Zetman",
		 11,
		 "Puppet",
		 "Haitani hijacks a broadcast signal in Middletown to declare war against humanity. Under his leadership, regressed Players start wreaking havoc, but Jin appears as ZET to protect people and fights as a one-man army."
		)
	,	("Zetman",
		 12,
		 "The Red Stake",
		 "Inside Amagi Tower, ZET is severely wounded by Haitani and can no longer retain his form. Does he have to become complete in order to defeat Haitani? Why does Haitani want ZET to be complete so desperately?"
		)
	,	("Zetman",
		 13,
		 "Funeral Procession",
		 "Jin walks down a bloody path in solitude as ZET… Alphas has fulfilled his dream of becoming a hero and fights according to his idea of justice… After so much bloodshed and tears, what is it that they wished to attain at the end?"
		)
;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("Zetman", 3, 1, 2)
;

