-- Clear out Database
DROP TABLE EVENT_ANIME_DATA;
DROP TABLE EVENT_DATA;
DROP TABLE EVENT_DETAILS;
DROP TABLE EVENT_LOCATION;
DROP TABLE EVENT_TYPE;
DROP TABLE ANIME_SESSION;
DROP TABLE ANIME_SESSION_TYPE;
DROP TABLE ANIME_EPISODE;
DROP TABLE ANIME_VOLUME;
DROP TABLE ANIME_VOLUME_TYPE;
DROP TABLE ANIME;
DROP TABLE CLASSIFICATION;
DROP TABLE COMPANY;

-- Table for Sponsors
CREATE TABLE IF NOT EXISTS COMPANY (
		COMPANY_NAME			VARCHAR(50)
	,	COMPANY_URL				VARCHAR(250)
	,	PRIMARY KEY				(COMPANY_NAME)
);

-- Data for Sponsors
INSERT INTO COMPANY (COMPANY_NAME, COMPANY_URL) VALUES
		("Madman", "https://madman.com.au/")
	,	("AnimeLab", "https://animelab.com")
	,	("Hanabee", "https://hanabee.com.au/")
	,	("Siren", "https://sirenvisual.com.au/")
;

-- Table For Classifications
CREATE TABLE IF NOT EXISTS CLASSIFICATION (
		CLASSIFICATION			VARCHAR(250)
	,	PRIMARY KEY				(CLASSIFICATION)
);

-- Data for Misc Classifications
INSERT INTO CLASSIFICATION (CLASSIFICATION) VALUES
		("CHECK THE CLASSIFICATION")
	,	("G")
	,	("PG")
	,	("M")
	,	("MA15+")
	,	("R18+")
;

-- Data for PG Classifications
INSERT INTO CLASSIFICATION (CLASSIFICATION) VALUES
		("PG - Mild animated violence and coarse language")
	,	("PG - Mild sexual references and animated violence")
	,	("PG - Mild sexual references and coarse language")
	,	("PG - Mild themes and animated violence")
	,	("PG - Mild themes and coarse language")
	,	("PG - Mild themes, sexual references and infrequent coarse language")
	,	("PG - Mild themes, sexual references and coarse language")
	,	("PG - Mild violence, themes, drug references and coarse language")
	,	("PG - Mild themes, animated violence and coarse language")
;

-- Data for M Classifications
INSERT INTO CLASSIFICATION (CLASSIFICATION) VALUES
		("M - Adult themes")
	,	("M - Animated science fiction violence")
	,	("M - Animated violence")
	,	("M - Animated violence and sexual references")
	,	("M - Animated violence and supernatural themes")
	,	("M - Animated violence, sexualised imagery and sexual references")
	,	("M - Crude humour, sexual references and coarse language")
	,	("M - Coarse language and mature themes")
	,	("M - Coarse language")
	,	("M - Mature themes")
	,	("M - Mature themes and sexual refernces")
	,	("M - Mature themes and animated violence")
	,	("M - Mature themes, animated violence and coarse language")
	,	("M - Mature themes, drug references, sexual references and animated violence")
	,	("M - Sexual references")
	,	("M - Sexual references, animated violence and nudity")
	,	("M - Sexual references and sexualised imagery")
	,	("M - Sexual references and animated nudity")
	,	("M - Mature themes and sexual references")
	,	("M - Sexual themes")
	,	("M - Supernatural themes and animated violence")
	,	("M - Violence, sexual references and nudity")
	,	("M - Fantasy themes and violence")
	,	("M - Infrequent coarse language")
	,	("M - Infrequent animated violence and sexual references")
	,	("M - Animated violence and infrequent coarse language")
	,	("M - Sexualised imagery and animated nudity")
	,	("M - Mature themes, sexual references and coarse language")
	,	("M - Animated nudity and sexualised imagery")
;

-- Data for MA15+ Classifications
INSERT INTO CLASSIFICATION (CLASSIFICATION) VALUES
		("MA15+ - Frequent animated nudity and sexualised imagery")
	,	("MA15+ - Strong animated violence")
	,	("MA15+ - Strong animated violence and sex scenes")
	,	("MA15+ - Strong themes and animated violence")
	,	("MA15+ - Strong themes, animated violence, sex scenes and nudity")
	,	("MA15+ - Strong themes and bloody violence")
	,	("MA15+ - Strong sexual themes, sexual references and animated violence")
	,	("MA15+ - Strong sexual themes, frequent animated nudity and sexualised imagery")
	,	("MA15+ - Strong sexual themes, frequent animated nudity, sex and sexual violence")
	,	("MA15+ - Strong sexualised imagery, crude sexual humour and coarse language")
	,	("MA15+ - Strong supernatural themes and violence")
	,	("MA15+ - Strong sexual references and frequent animated nudity")
	,	("MA15+ - Strong sexual references, animated nudity and violence")
;

-- Table for Anime Data
CREATE TABLE IF NOT EXISTS ANIME (
		ANIME_TITLE					VARCHAR(100)
	,	NUMBER_OF_EPISODES			INT(11)
	,	ANIME_SYNOPSIS				VARCHAR(10000)
	,	ANIME_DESCRIPTION			VARCHAR(1000)
	, 	COMPANY_NAME				VARCHAR(50)
	,	COPYRIGHT					VARCHAR(100)
	,	PRIMARY KEY					(ANIME_TITLE)
	,	FOREIGN KEY					(COMPANY_NAME) REFERENCES COMPANY (COMPANY_NAME)
);

-- Table for Anime Volume Type Data
CREATE TABLE IF NOT EXISTS ANIME_VOLUME_TYPE (
		VOLUME_TYPE_ID				INT(11)
	,	VOLUME_TYPE_DESCRIPTION		VARCHAR(50)
	,	PRIMARY KEY					(VOLUME_TYPE_ID)
);

-- Data for Anime Volume Type
INSERT INTO ANIME_VOLUME_TYPE (VOLUME_TYPE_ID, VOLUME_TYPE_DESCRIPTION) VALUES
		(0, "Stream")
	,	(1, "DVD")
	,	(2, "Blu-ray&trade;")
	,	(3, "DVD BoxSet")
	,	(4, "Bly-ray&trade; BoxSet")
;

-- Table for Anime Volume Data
CREATE TABLE IF NOT EXISTS ANIME_VOLUME (
		ANIME_TITLE					VARCHAR(100)
	,	VOLUME_TYPE_ID				INT(11)
	,	VOLUME_NUMBER				INT(11)
	,	CLASSIFICATION				VARCHAR(100)
	,	NUMBER_OF_EPISODES			INT(11)
	,	PURCHACE_URL				VARCHAR(250)
	,	PRIMARY KEY					(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER)
	,	FOREIGN KEY					(ANIME_TITLE) REFERENCES ANIME (ANIME_TITLE)
	,	FOREIGN KEY					(VOLUME_TYPE_ID) REFERENCES ANIME_VOLUME_TYPE (VOLUME_TYPE_ID)
	,	FOREIGN KEY					(CLASSIFICATION) REFERENCES CLASSIFICATION (CLASSIFICATION)
);

-- Table for Anime Episode DATA
CREATE TABLE IF NOT EXISTS ANIME_EPISODE (
		ANIME_TITLE					VARCHAR(100)
	,	EPISODE_NUMBER				INT(11)
	,	EPISODE_TITLE				VARCHAR(100)
	,	EPISODE_SYNOPSYS			VARCHAR(500)
	,	PRIMARY KEY					(ANIME_TITLE, EPISODE_NUMBER)
	,	FOREIGN KEY					(ANIME_TITLE) REFERENCES ANIME (ANIME_TITLE)
);

-- Table for Anime Session Type Data
CREATE TABLE IF NOT EXISTS ANIME_SESSION_TYPE (
		SESSION_TYPE_ID				INT(11)
	,	SESSION_TYPE_DESCRIPTION	VARCHAR(50)
	,	PRIMARY KEY					(SESSION_TYPE_ID)
);

-- Data for Anime Session Type
INSERT INTO ANIME_SESSION_TYPE(SESSION_TYPE_ID, SESSION_TYPE_DESCRIPTION) VALUES
		(0, "Screening Sessions")
	,	(1, "Special Session")
	,	(2, "Marathon")
	,	(3, "Showcase")
;

-- Table for Anime Session Data
CREATE TABLE IF NOT EXISTS ANIME_SESSION (
		ANIME_TITLE					VARCHAR(100)
	,	SESSION_TYPE_ID				INT(11)
	,	SESSION_NUMBER				INT(11)
	,	NUMBER_OF_EPISODES			INT(11)
	,	PRIMARY KEY					(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER)
	,	FOREIGN KEY					(ANIME_TITLE) REFERENCES ANIME (ANIME_TITLE)
	,	FOREIGN KEY					(SESSION_TYPE_ID) REFERENCES ANIME_SESSION_TYPE (SESSION_TYPE_ID)
);

-- Table for Event Type
CREATE TABLE IF NOT EXISTS EVENT_TYPE (
		EVENT_TYPE_ID					INT(11)
	,	EVENT_TYPE_DESCRIPTION			VARCHAR(100)
	,	PRIMARY KEY						(EVENT_TYPE_ID)
);

-- Data for Event Type
INSERT INTO EVENT_TYPE (EVENT_TYPE_ID, EVENT_TYPE_DESCRIPTION) VALUES
		(0, "Screening Session Event")
	,	(1, "Social Episode Event")
	,	(2, "Workshop Event")
	,	(3, "General Meeting")
;

-- Table for Event Locations
CREATE TABLE IF NOT EXISTS EVENT_LOCATION (
		LOCATION_ID						INT(11)
	,	CAMPUS							VARCHAR(30)
	,	ROOM							VARCHAR(10)
	,	ADDRESS							VARCHAR(150)
	,	LAT								FLOAT(53)
	,	LNG								FLOAT(53)
	,	ZOOM							INT(11)
	, 	PRIMARY KEY						(LOCATION_ID)
);

-- Data for Event Locations
INSERT INTO EVENT_LOCATION (LOCATION_ID, CAMPUS, ROOM, ADDRESS, LAT, LNG, ZOOM) VALUES
		(0, "Swinburne Hawthorn", NULL, "John St, Hawthorn VIC 3122", -37.822097, 145.038946, 17)
	,	(1, NULL, NULL, "Crown Entertainment Complex, 8 Whiteman St, Southbank VIC 3006", -37.824871, 144.958181, 17)
	,	(2, NULL, NULL, "Sorrento Oceach Beach, Ocean Beach Rod, Sorrento VIC 3943", -38.345876, 144.727014, 17)
	,	(3, NULL, NULL, "Hawthorn Aquatic &amp; Leasure Center, 1 Grace St, Hawthorn VIC 3122", -37.820791, 145.034434, 17)
;



-- Table for Event Details (MISC)
CREATE TABLE IF NOT EXISTS EVENT_DETAILS(
		EVENT_TITLE						VARCHAR(100)
	,	EVENT_DESCRIPTION				VARCHAR(500)
	,	MEETUP_INSTRUCTIONS				VARCHAR(500)
	,	TICKETS							VARCHAR(500)
	,	PRIMARY KEY						(EVENT_TITLE)
);

-- Screening Session Event Details
INSERT INTO EVENT_DETAILS (EVENT_TITLE, EVENT_DESCRIPTION, MEETUP_INSTRUCTIONS, TICKETS) VALUES
		("Summer Sessions",
		 "Our Summer Screenings bring unique and special series for our most dedicated members.",
		 "Event is open to all, just come along and scan your membership card as you enter.",
		 NULL
		)
	,	("Summer After Dark",
		 "Extra Summer Screening Session, only for out most dedicated members.",
		 "Come along, pay your fee and scan your membership card.",
		 "After Dark Sessions are run as an extra event for members, condition of entry is that a gold coin donation is made."
		)
	,	("Summer Showcase",
		 "Summer Edition of our Showcase Screenings, each week showing the first episode of anime avalible to watch now!",
		 "Event is open to all, just come along and scan your membership card as you enter.",
		 NULL
		)
	,	("Screening Sessions",
		 "Our regular screening sessions, brining you smash hit series shown in full over a three week period.",
		 "Event is open to all, just come along and scan your membership card as you enter.",
		 NULL
		)
	,	("SwinAnime After Dark",
		 "Extra Screening Sessions, only for our most dedicated members",
		 "Come along, pay your fee and scan your membership card.",
		 "After Dark Sessions are run as an extra event for members, condition of entry is that a gold coin donation is made."
		)
	,	("SwinAnime Showcase",
		 "Showcase Screenings, each week showing the first episode of anime avalible to watch now!",
	 	 "Event is open to all, just come along and scan your membership card as you enter.",
	 	 NULL
		)
	,	("Winter Sessions",
		 "Our Winter Screenings bring unique and special series for our most dedicated members.",
		 "Event is open to all, just come along and scan your membership card as you enter.",
		 NULL
		)
	,	("Winter After Dark",
		 "Extra Winter Screening Session, only for out most dedicated members.",
		 "Come along, pay your fee and scan your membership card.",
		 "After Dark Sessions are run as an extra event for members, condition of entry is that a gold coin donation is made."
		)
	,	("Winter Showcase",
		 "Winter Edition of our Showcase Screenings, each week showing the first episode of anime avalible to watch now!",
		 "Event is open to all, just come along and scan your membership card as you enter.",
		 NULL
		)
;

-- Social Event Details
INSERT INTO EVENT_DETAILS (EVENT_TITLE, EVENT_DESCRIPTION, MEETUP_INSTRUCTIONS, TICKETS) VALUES	
		("Beach Episode",
		 "Our Annual trip to the beach, fun with friends, building sand castles, have a swim or a surf, maby evan smash a melon or two.",
		 "Meet at Frankston Train Station for start of event, catching 788 bus to Sorrento. <br>Note: Sorrento is in zone 4, so miki fares are $3.36 concession or $6.72 full fare.",
		 "Event is free to attend, however generally we all pitch in on getting snacks and drinks for the group."
		)
	,	("Arcade Episode",
		 "Play some arcade games, have some fun.",
		 "Meet at Southern Cross Station (Spenser Street), Catching tram 12, 96 or 109 to Crown Casino.",
		 "Event is free to attend, paying what you can afford to play, reocmmended buget is $20-$40"
		)
	,	("Pool Episode",
		 "Our annual trip to the pool, swiming, swiming, swiming...",
		 "Meet at Glenferrie Station, walk across road to pool.",
		 "Event is free to attend, entry to pool is free for current swinburne students."
		)
;

-- Table for Basic Event Data
CREATE TABLE IF NOT EXISTS EVENT_DATA (
		EVENT_TIME						DATETIME
	,	EVENT_TYPE_ID					INT(11)
	,	EVENT_TITLE						VARCHAR(100)
	,	EVENT_LOCATION					INT(11)
	,	EVENT_FACEBOOK_ID				VARCHAR(20)
	,	EVENT_UNIONE_URL				VARCHAR(250)
	,	PRIMARY KEY						(EVENT_TIME)
	,	FOREIGN KEY						(EVENT_TYPE_ID) REFERENCES EVENT_TYPE (EVENT_TYPE_ID)
	,	FOREIGN KEY						(EVENT_LOCATION) REFERENCES EVENT_LOCATION (LOCATION_ID)
	,	FOREIGN KEY						(EVENT_TITLE) REFERENCES EVENT_DETAILS (EVENT_TITLE)
);

-- Table for Anime Events
CREATE TABLE IF NOT EXISTS EVENT_ANIME_DATA (
		EVENT_TIME						DATETIME
	,	ANIME_TITLE						VARCHAR(100)
	,	SESSION_TYPE_ID					INT(11)
	,	SESSION_NUMBER					INT(11)
	,	PRIMARY KEY						(EVENT_TIME)
	,	FOREIGN KEY						(EVENT_TIME) REFERENCES EVENT_DATA (EVENT_TIME)
	,	FOREIGN KEY						(ANIME_TITLE) REFERENCES ANIME (ANIME_TITLE)
	,	FOREIGN KEY						(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER) REFERENCES ANIME_SESSION (ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER)
);

-- Anime Data
INSERT INTO ANIME(ANIME_TITLE, NUMBER_OF_EPISODES, ANIME_SYNOPSIS, ANIME_DESCRIPTION, COMPANY_NAME, COPYRIGHT) VALUES
		("Little Busters Refrain",
		 13,
		 "On the back of their first baseball game, the Little Busters team is closer than ever. But amongst the celebration, Riki can't help but notice a strong sense of D&eacute;j&agrave; vu over everything that has happened. As the oddities of the world continue to unfold, the answers to Riki's questions appear to lie in the hands of a cat. Can Riki and Rin muster enough courage to fulfill the mission given to them and confront the truth of their reality that has been in front of them all along?",
		 "On the back of their first baseball game, the Little Busters team is closer than ever. But amongst the celebration, Riki can't help but notice a strong sense of D&eacute;j&agrave; vu over everything that has happened.",
		 "Hanabee",
		 "&copy;Yoshinobu Yamakawa, Michiru Shimada / J.C.Staff"
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("Little Busters Refrain",
		 4,
		 1,
		 "M - Mature themes, sexual references and coarse language",
		 13,
		 "https://hanabee.com.au/products/little-busters-refrain-blu-ray"
		)
    ,	("Little Busters Refrain",
		 3,
		 1,
		 "M - Mature themes, sexual references and coarse language",
		 13,
		 "https://hanabee.com.au/products/little-busters-refrain"
		)
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("Little Busters Refrain",
		 1,
		 "It Struck Without Warning",
		 "Following the loss of their first baseball game, the Little Busters have a pancake party. While returning from the party, Yuiko overhears some girls badmouthing her, claiming that they will pay her back for being humiliated in the past. Some time later, Riki and the others learn that someone had filled Kudryavka's bag with thumbtacks and destroyed Komari's notes. Suspicious of a girl who was overhearing them, Riki follows her and finds the same girls Yuiko had noticed the other day in a classroom, figuring that they are the culprits. Despite being confronted by Riki, the girls claim that there is nothing he can without any evidence of what they did, until Yuiko appears and plays a recorded conversation between them that proves their involvement. Despite that, the girls refuse to give up and claim that they will keep tormenting Yuiko's friends until Yuiko destroys the room's door with a single kick and threatens to do the same with their faces, forcing them to give up. When a teacher arrives and discovers the damage, Kyousuke and the other boys cover for Yuiko and Riki as they escape by themselves to the broadcast room. The room seems familiar to Riki despite never having been there before and with his memories confused, he suffers another attack of narcolepsy and collapses. "
		)
	,	("Little Busters Refrain",
		 2,
		 "It Was Also Raining at That Time",
		 "After waking up, Riki learns from Yuiko that she was taking care of him while he was asleep and cannot shake the suspicion that the whole situation has happened with them in the past. Some time later, Kyousuke and the other boys point out that Riki is behaving strangely since his last encounter with Yuiko. Believing that he has fallen in love with her, they decide to have him lure the girls to the school building as they prepare a fireworks show for them, with instructions to find a way to get alone with Yuiko to set up the mood for his &quot;confession&quot;. Wondering if he is actually in love with someone, Riki does as they say, but ends up alone with Yuiko by accident when the fireworks begin. The following day, Riki realizes that the same events of the previous day are being repeated as the date is also the same, June 20. "
		)
	,	("Little Busters Refrain",
		 3,
		 "I Always Wanted to Stay Here",
		 "The day of June 20 keeps repeating without anyone taking heed of it, except for Riki himself, and no one else seems to find it strange even when it starts snowing. Riki decides to look for Kyousuke to ask for his advice but he is nowhere to be found. However, Riki learns that Yuiko is the only other person who knows the truth and she claims that it all is her fault. Her wish for staying with the Little Busters forever had been granted in the form of a dream, and she tells Riki that she only knew what happiness was after meeting Riki and his friends. Yuiko tells him that things will return to normal when he wakes up from the dream, but Riki will forget everything that happened. Before bidding farewell, Yuiko warns Riki to take care of Rin, as the &quot;fated day&quot; is at hand. "
		)
	,	("Little Busters Refrain",
		 4,
		 "Riki and Rin",
		 "While thinking about what Yuiko said to him, Riki is approached by a girl who confesses her feelings for him, but claims that she knows he already likes someone else and flees. Wondering what she meant, Rin's image come to Riki's mind, and upon learning what happened, Kyousuke reveals that a third-year student had also confessed to Rin, but he helped her decline him. Later that day, Rin asks Riki to help her buy some cat food and on the way back, she suggests they start dating and Riki agrees after confirming that she likes him. Riki has trouble trying tell Kyouske about it the next day, but Kyousuke claims that he already knew about it. Riki and Rin later tell the rest of the Little Busters, who congratulate them, but Riki chases after Rin after she runs away embarrassed. The white cat Lennon brings them another mysterious letter telling them that they have one final task to do before &quot;learning the truth of the world&quot;, which is to &quot;volunteer themselves during homeroom&quot;. "
		)
	,	("Little Busters Refrain",
		 5,
		 "The Final Task",
		 "Members of the Prefectural Assembly are expected to make an inspection of the school and realizing that it is part of the &quot;final task&quot;, Riki and Rin volunteer themselves to guide them around. Despite Rin's shy demeanor, she manages to guide the visitors properly and they later invite her to take part in a student exchange program to help the students of another school overcome a tragedy that claimed the lives of some of their classmates. Riki at first asks Rin to decline their invitation, but he later realizes that this could be an important experience for her to grow as a person. However, when Riki tries to encourage her to take part in the program, she gets angry at him and ultimately accepts the invitation. On the eve of Rin's departure, Riki realizes that all the tasks they received helped her to mature and improve her confidence. He concludes that it was all a part of Kyousuke's plans, including inviting Komari and the other girls to become part of their group. His suspicions are confirmed when Riki finds Lennon with Kyousuke and then he confronts him about the &quot;truth of the world&quot; he mentioned in his letters. However, before getting some answers, they are forced to run away after being caught outdoors during curfew and when Riki trips over, Kyousuke disappears in front of him. "
		)
	,	("Little Busters Refrain",
		 6,
		 "At the End of the Escape",
		 "After Riki and the others watch Rin leave the school without a word, Riki is then left with the impression that Kyousuke sent her away and that he is trying to break apart the Little Busters. Riki continues getting text messages from Rin saying that she does not know what to do at the school, and all he can do is tell her to &quot;hang in there&quot;. Concerned for Rin being isolated, Riki decides to go after her, but he is stopped by Kyousuke, who makes a deal that he will bring her back for weekends only. When Rin come back the following weekend, she is depressed and stays in bed. Riki goes to Kengo for advice, who tells him he has to fight Kyousuke to keep Rin from going back to the school. Kyousuke agrees to settle it over a baseball game with Masato as his partner, but Riki and Kengo ultimately fail. Kengo claims that Kyousuke rigged the game and punches him before being restrained by Riki and Masato. The next morning, Riki tells Rin that they are running away together. They travel to a house in the country where they played as kids, but they are eventually discovered by the police who raid the house. "
		)
	,	("Little Busters Refrain",
		 7,
		 "May 13",
		 "Riki awakens several months before, with no memories about what happened during that time. Riki goes to stop Masato from fighting Kengo, but neither of them listen to him and Kyousuke is nowhere to be found. The result of the fight leads to Kengo fracturing his right arm, putting him out of commission for kendo practice; Kengo asks Riki to think of something fun all of them could do together. Rin is now afraid of everyone but Riki, who routinely drops her off at a local elementary school during the day. Meanwhile, Kyousuke is depressed and stays cooped up in his room reading manga. Initially unsuccessful to find something Rin enjoys to do, he eventually discovers her affinity for playing catch. Riki tries to invite Kyousuke to join in, but he refuses. Riki also invites Masato and Kengo to play a baseball game, but Kengo angrily refuses to participate, and Masato leaves shortly thereafter. Knowing the others are hiding something from him and Rin, Riki resolves to become a leader like Kyousuke and reform the Little Busters. "
		)
	,	("Little Busters Refrain",
		 8,
		 "Proof of the Strongest",
		 "Determined to reform the Little Busters, Riki attempts to invite Masato, who refuses, claiming that what only matters to him is to &quot;become the strongest&quot;. Soon after, Riki and Rin hear news of Masato attacking other students and devise a trap to stop him. However, the trap fails to restrain him fully and he starts pursuing them. After setting another trap with Rin's help, Riki manages to wear down Masato to the point of being able to defeat him barehanded. The knocked down Masato then reminisces that before meeting Kyousuke, he used to be treated as a fool by his peers until he trained his body enough to beat down whoever insulted him. This resulted in him becoming isolated because of it, until Kyousuke appeared and defeated him by also using traps, leading to them becoming friends. Masato began his rampage at school because he suddenly started seeing everyone else as a copy of himself and believed that he could only distinguish himself from the others by becoming the strongest of them all. After renewing his friendship with Masato, Riki realizes that he must eventually confront Kyousuke as well for his and his friends' sake, while a serious Kengo watches over him from afar. "
		)
	,	("Little Busters Refrain",
		 9,
		 "A Friend's Tears",
		 "Riki's next step to reassemble his friends is to convince Kengo to join their side, but Kengo refuses to listen to him, claiming that all Riki and Rin need to do is to rely on their friends. Riki visits Kyousuke, who hints that Kengo is lying about something and Riki realizes that Kengo's arm is not injured as he claims. Rin learns from Masato that Kengo originally joined the Little Busters after Kyousuke defeated his father in a kendo match. This leads Riki to challenge Kengo to a baseball match instead, with the first one to strike a home run being the winner and Kengo rejoining the Little Busters should he lose. After several attempts, Riki manages to land a home run but is too exhausted to throw the ball, so Rin takes his place. Rin's throws are fast but with initially no control, and when she manages to throw the ball properly, she succeeds in having Kengo strikeout, winning the match. Kengo rejoins the Little Busters, determined to follow Riki as long as he can. "
		)
	,	("Little Busters Refrain",
		 10,
		 "And So I'll Do It Over Again",
		 "Having assembled the rest of the original Little Busters, Riki intends to save Kyousuke from despair the same way he did for him when his parents died. Meanwhile, Kyousuke reminisces that in fact the world they are living in was created by his spirit with the purpose of preparing both Riki and Rin to live without him and the others, as all of them except the pair apparently died during an accident. Since then, Kyousuke created an alternate timeline that was always reset when Riki or Rin had fallen into despair. However, Kyousuke's power to maintain this realm is waning, leading to the strange events occurring in the previous loop, and the departure of the other girls. When Riki and Rin ran away after the latter broke down from being separated from the others, Kyousuke was losing his faith, until Riki managed to establish himself as the leader, and once reunited with his friends, Kyousuke claims that the time for him and the others to bid farewell to Riki and Rin has come. "
		)
	,	("Little Busters Refrain",
		 11,
		 "The End of the World",
		 "After having the Little Busters once again reunited, Riki suggests for them to play baseball, and the others accept. During the match, Kyousuke reveals to Riki that the world they are currently in was created by him and the others after a bus accident killed all students aboard except for Riki and Rin. Kyousuke explains that this world was meant to prepare them to move forward with their lives, so Kyousuke and the others gave the duo a series of trials to have them mature and become stronger. After Masato and Kengo bid their farewells, Kyousuke tearfully instructs Riki to take Rin past the school gates back to the real world, as the time for them to part has come. As Riki and Rin get past the gates, Kyousuke has one last tour around the school before sitting at his desk and disappearing along with the world he created. "
		)
	,	("Little Busters Refrain",
		 12,
		 "A Single Request",
		 "Riki and Rin awaken in the real world and recall that during their field trip, their bus got into an accident and Masato and Kengo used their own bodies to protect them. Despite being injured, they flee from the site of the accident to avoid being caught in the impending explosion, but after reaching a safe distance, Riki leaves Rin behind to return and attempt to help the others. However, he starts suffering another attack of narcolepsy and struggles to keep himself awake. Meanwhile, Rin has a meeting with Komari and the other girls in spirit and wishing to not part ways with them, she decides to look for a way to save them as well. "
		)
	,	("Little Busters Refrain",
		 13,
		 "Little Busters",
		 "Having another attack of narcolepsy, Riki realizes that he always falls asleep at the sight of unpleasant situations, since he saw his parents' dead bodies in a car accident when he was a child, and determined to overcome this weakness, he awakens with Rin's help. Knowing that the bus will explode, Riki and Rin start rescuing the other students from the wreckage only to discover that Kyousuke is using his own body to prevent the gas from leaking further, leaving the duo no other option but to pick him up after carrying all the others to safety. The bus explodes just after Riki and Rin return to rescue Kyousuke, but the incident ends with no deaths. Three months later, all of the students have returned from the hospital except Kyousuke, who is still in a coma, and the other Little Busters spend their days together, waiting for him to return. Once Kyousuke finally returns, the Little Busters have their own, private field trip to the beach together. "
		)
		
;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("Little Busters Refrain", 0, 1, 4)
	,	("Little Busters Refrain", 0, 2, 4)
	,	("Little Busters Refrain", 0, 3, 5)
;

INSERT INTO ANIME(ANIME_TITLE, NUMBER_OF_EPISODES, ANIME_SYNOPSIS, ANIME_DESCRIPTION, COMPANY_NAME, COPYRIGHT) VALUES
		("Plastic Memories",
		 13,
		 "Tsukasa Mizugaki is a recent hire of the SAI Corporation, renown for its production and management of androids capable of feeling human emotions called &quot;Giftia&quot;. Assigned to the terminal service department, Tsukasa is tasked with recovering Giftias who are nearing their expiration from their owners before they corrupt. But in this dead end department, Tsukasa is about to meet Isla, a female Giftia. Beneath her quiet exterior, she was once known as the best in Giftia retrievals and Tsukasa is determined to find out why she stopped.",
		 "From the writer of &quot;Steins;Gate&quot;, Naotaka Hayashi, comes an original love story!",
		 "Hanabee",
		 ""
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("Plastic Memories",
		 1,
		 1,
		 "M - Mature themes and sexual references",
		 7,
		 "https://hanabee.com.au/collections/anime-p-to-z/products/plastic-memories"
		)
	,	("Plastic Memories",
		 1,
		 2,
		 "M - Mature themes and sexual references",
		 6,
		 "https://hanabee.com.au/collections/anime-p-to-z/products/plastic-memories-part-2"
		)
	,	("Plastic Memories",
		 2,
		 1,
		 "M - Mature themes and sexual references",
		 7,
		 "https://hanabee.com.au/collections/anime-p-to-z/products/plastic-memories-blu-ray"
		)
	,	("Plastic Memories",
		 2,
		 2,
		 "M - Mature themes and sexual references",
		 6,
		 "https://hanabee.com.au/collections/anime-p-to-z/products/plastic-memories-part-2-blu-ray"
		)
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("Plastic Memories",
		 1,
		 "The First Partner",
		 "On the first day of his new job, Tsukasa Mizugaki rushes to Terminal Service No. 1, which is one of the offices in SAI Corp, where he is taught about Giftia, androids who survive on synthetic souls for a maximum lifespan of nine years and four months. Normally, humans and Giftia work in pairs to collect expired Giftia, where the human is assigned the job of a 'spotter' that is in-charge of overseeing his Giftia partner at work while the Giftia earns the job of a 'marksman' that persuades the owners to give up their Giftia. Tsukasa is then partnered with Isla, a Giftia who is highly regarded in the office and famous for a wide knowledge of herbs and tea. The two are led out by Tsukasa's trainer Michiru Kinushima and her partner Zack; Zack retrieves a Giftia, as a demonstration of their job for Tsukasa, and Michiru explains their job to him. Not long after, Tsukasa and Isla are assigned a mission to retrieve Nina, a child-type Giftia owned by an old woman named Chizu Shirohana. After multiple tries, Isla is unable to persuade Chizu to talk to them, which makes Tsukasa doubt her abilities. She finally manages to win a chance to talk with Nina, and Chizu overhears Nina giving her consent to be taken away so as not to cause trouble for Chizu, whom she loves dearly. Chizu, realising she had not considered Nina's feelings in the matter, finally allows Nina to be taken away, and thanks Tsukasa when he apologizes."
		)
	,	("Plastic Memories",
		 2,
		 "Don't Want to Cause Trouble",
		 "Tsukasa meets Yasutaka Hanada, a spotter and a ten-year veteran at Terminal Service No. 1, whose aloof behavior surprises him, as well as annoys his partner Sherry. When Yasutaka asks him about how he got the job, Tsukasa reveals that his father is a friend of one of the higher-ups in the company, who decided to help him after he failed his entrance exams. After another failed attempt at retrieving and a scolding from Michiru, Tsukasa takes the blame despite it being Isla who caused the problem. Back in the office, he is prompted by a message about her and heads to the Unit Testing Room, where he meets Eru Miru and Mikijiro Tetsuguro, who are measuring Isla's physical skills. Tsukasa asks Isla about the physical training, and she tells him of her belief that she is holding him back because of all the time she spent off the field. Because of this, Tsukasa decides to do the negotiating with Giftia owners instead of Isla, in spite of the fact that it isn't what a spotter does. The next day, he begins putting together his own manual about owner negotiations and is assisted by Michiru and Zack. Once he is finished, he comes across Yasutaka, who learns about Isla's visits to the Unit Testing Room and remarks the pointless nature of those visits, explaining that Isla's physical capabilities are on a consistent decline that cannot be fixed, a characteristic of Giftia. Later on, Tsukasa and Isla successfully retrieve the Giftia they were previously assigned to, while Kazuki Kuwanomi, an experienced spotter, and Yasutaka talk about Isla's lifespan, which is set to expire in less than 2,000 hours, giving her less than three months to live."
		 )
	,	("Plastic Memories",
		 3,
		 "We've Just Started Living Together",
		 "Tsukasa is assigned to live with Isla in the company dormitory, a rule mandated for all marksmen and spotter duos in Terminal Service No. 1. However, he is unsettled by the fact that Isla repeatedly ignores him there. At Terminal Service No. 1, he confides to other employees about the problem, although their individual suggestions fail miserably at helping him attract her attention. Finally, Kazuki approaches Tsukasa about the problem and tells him she ignores other people during her personal time, not just him. She then tells him to take Isla out somewhere if he wants some interaction with her. Following through with the suggestion, he successfully asks Isla to accompany him to a shopping mall. There, they go to a herb shop and, to buy some more time, Tsukasa asks Isla to help him pick out some herbs as a present to a person who he unintentionally describes as being a lot like her. Afterwards, they go to a nearby amusement park, where Tsukasa admits the person he was describing was Isla herself. When he says he did this to make some memories with her about their partnership, she emotionally shuts down and tells him that she was not built to play at an amusement park, which shocks him. When Isla runs off, he purchases a key ring pendant from the amusement park and gives it to her at their dorm room, telling her she can throw it away if she doesn't want it. She also apologizes apprehensively about her escape, and even though Eru had previously told Tsukasa that Isla didn't accept gifts, Isla makes the keychain an exception."
		)
	,	("Plastic Memories",
		 4,
		 "I Just Don't Know How to Smile",
		 "The Terminal Service No. 1 staff receives seven brand-new retrieval missions, and Tsukasa and Isla are assigned to retrieve a Giftia named Marcia. They are also warned of the presence of criminals who assume the identities of Terminal Service employees to retrieve Giftia and sell them on the black market. Tsukasa and Isla head to Marcia's residence, where they learn she is raising her owner, Souta Wakanae, in the role of an older sister after his parents died. When Souta arrives home from school, he acts hostile towards Tsukasa and Isla, but is surprisingly willing to sign the agreement form to take Marcia away, citing that she is just a Giftia and adding that Giftias cannot be trusted in telling the truth. Unable to acquire a signature as a result of Souta's attitude, Tsukasa confides in Michiru about the encounter, and she advises him to solve the problem by having Souta believe he was truly loved by Marcia. As a result, Tsukasa, Isla, and Marcia decide to bake a cake for his birthday on the following day, and are assisted by Michiru and Zack. Afterwards, Michiru tells Tsukasa that she tried all she could to keep her father, a Giftia, from being retrieved, which resulted in him becoming a Wanderer, a Giftia that still retains its motor skills but loses its personality and memories, causing it to become instinctual and aggressive. Later, Souta returns home and is surprised by the group. Upon spotting the birthday cake, which was modeled after one used for his birthday three years ago, he remembers his family and tearfully apologies to Marcia. On the day before the retrieval, Souta is visited by a shady man, who claims to be Tsukasa and Isla's replacement from the Terminal Service and asks for Marcia."
		)
	,	("Plastic Memories",
		 5,
		 "The Promise I Wanted to Keep",
		 "While returning home with groceries, Marcia is suddenly ambushed by the man from the previous episode. Later, Tsukasa and Isla are contacted by Souta, who informs them about Marcia's disappearance, and they assume it is the work of a black market retriever. With only 24 hours left on Marcia's lifespan, Tsukasa resolves to retrieve Marcia and return her to Souta, and the rest of Terminal Service No. 1 joins the search. The following day, the office narrows down the search to an area where a black market retrieval service is possibly located, although their efforts are hindered by a unit from R. Security, a private security firm that was hired to assist in the investigation. Kazuki confronts the unit's supervisor, Shinonome, who gives her a map of the area under scrutiny. As the retrievers get ready to converge on the area, Tsukasa is equipped with and learns about a gun-like device designed to forcibly crash all of a Giftia's functions when they turn into Wanderers. He is then approached by Kazuki, who asks him if Isla will be able to handle the situation, but is forced to drop the subject soon afterward. Michiru later tells Tsukasa about how Kazuki tried to retrieve her father when he became a Wanderer, only for him to injure Kazuki and then be shot down by members of R. Security. Soon afterward, the black market retriever is found unconscious and it is concluded that Marcia turned into a Wanderer. Kazuki orders the rest of the retrievers to stop Marcia before she is destroyed by R. Security. Tsukasa and Isla find Marcia, only to realize Souta had been following them. Marcia then injures Isla and kidnaps Souta. Despite Isla's injuries, she and Tsukasa follow her to a rooftop, where Tsukasa nearly manages to convince Marcia to surrender. However, when Souta speaks her name, Marcia snaps and begins strangling him, forcing Tsukasa to pull out his software destruction device and prepare to shoot Marcia. However, Isla suddenly dashes towards Marcia, just as Tsukasa fires the device. The scene then cuts to the Terminal Service office during the next morning, where it is revealed that Isla hasn't signed into the attendance log."
		 )
	,	("Plastic Memories",
		 6,
		 "Welcome Home the Both of Us",
		 "Three years ago, it is revealed that Isla began blaming herself for not accompanying Kazuki when she retrieved Michiru's father, which wound up costing Kazuki her ankle. As a result, Kazuki retired from her position as Isla's spotter. In the present day, it is revealed that Marcia was hit by Tsukasa's device, although Isla was able to block most of the blow without being hit herself. With Isla now under maintenance for her injuries inflicted by Marcia, Tsukasa is reassigned to desk duty. After a visit from Tsukasa, Isla notes that he is still remaining optimistic despite what happened and privately questions his feelings about the situation. Once most of her maintenance is done, Isla returns to the office and realizes that she has been paying attention to Tsukasa a lot more closely lately. She confides in Michiru and Eru about it, although they misinterpret her feelings as being motivated by love and Eru decides to help Isla stalk Tsukasa. However, after multiple attempts at observing him fail miserably, Isla confesses to Michiru about her confusion on Tsukasa's unwavering optimism. Michiru then tells her that Tsukasa never forgot about the incident with Marcia, even neglecting his desk duties to go and apologize to Souta for what happened, and assumes that he is smiling out of sadness. After finishing the last of her maintenance, Isla returns to the dorm, only to find he isn't there. When night falls and Tsukasa has yet to return home, she goes to the office, where she finds Tsukasa learning that she has 1,000 hours left in her lifespan, which translates to a month. However, when given the chance to partner up with a new Giftia, Tsukasa declares that he wants to remain partnered with Isla, which makes her happy."
		)
	,	("Plastic Memories",
		 7,
		 "How to Ask Her Out",
		 "One morning, Tsukasa decides to ask Isla out on a date. While trying to find opportunities to do so, he finds that Isla has been doing chores for him at their dormitory and the office. After asking her about it, he learns she is trying to be useful to him, much to his chagrin. When Tsukasa musters the courage to ask her out, Isla accepts his request and decides to go to the amusement park after discussing it with Michiru and Eru, later reasoning to Tsukasa that she felt guilty about running out on him during their previous time there. However, while reading Isla's diary, Tsukasa realizes that she and Kazuki often went there when they were still partners. The next day, the two of them go there and sit at a bench, Isla's favorite spot in the park, as she was able to observe the happiness and joy of so many people, which comforted her. After learning that Isla has never tried any of the park attractions, Tsukasa takes her on a tour through the entire area, eventually ending at the Ferris wheel. As they sit inside, Isla expresses her gratitude that she is riding it with Tsukasa. As he thinks about Isla's happiness, Tsukasa faints after working too hard lately, ending the date. In the end, Tsukasa wakes up and Isla apologizes for not telling him earlier that she has 1,000 hours remaining in her lifespan. Tsukasa promises that he will stay with Isla until the end, no matter what. He then asks if she would be willing to go out with him again, to which she smiles and takes his hand. However, as he sleeps, she observes him with a doubtful expression."
		)
	,	("Plastic Memories",
		 8,
		 "The Fireworks I've Never Seen",
		 "During a retrieval mission, Tsukasa is surprised when the owner of the newly assigned Giftia opts to delete the latter's current personality and memories by replacing her OS and start over from scratch instead of handing over the Giftia proper, having done it several times already. Intrigued, he asks around the office if a Giftia who has gone through that experience is capable of retaining their old memories, but everyone replies there is no precedent to that. Later on, Kazuki announces that a marksman from the Terminal Service No. 3 office will be sent in, as the assigned Giftia and his owner have gone into hiding, and assigns Tsukasa and Isla to assist her. They later meet the marksman, Andie; shortly afterward, they have an awkward encounter with Eru, who mistakes Andie for her friend Olivia. After the mission is a success, Tsukasa learns from Eru that Andie is indeed Olivia, whose OS was replaced due to the company cutting costs. Later on, Eru tells Tsukasa that she reconnected with Andie and mentioned a carnival they used to go to together when Andie was still Olivia, which caused Andie to decide to go there. Not wanting to deal with her memories of Olivia, Eru tries to get Tsukasa to take Andie to the carnival instead. However, Tsukasa convinces Eru to come along, and they take Isla and Andie to the carnival the following night. There, Eru decides to let go of Olivia and create new memories with Andie, concluding it wouldn't be fair to either of them if she saw them as one and the same. Later, Isla gets lost in the crowd and Tsukasa begins searching for her, eventually finding her at a lonely walkway, terrified by exploding fireworks. After he consoles her, Isla brings up Andie and asks if her presence is hurting him. He replies that it does, but insists on continuing to be her partner. When she asks why, Tsukasa responds that it is because he loves her. Shocked and embarrassed by the sudden confession, Isla shouts that she cannot accept his love."
		)
	,	("Plastic Memories",
		 9,
		 "After the Festival",
		 "In the wake of being shot down by Isla at the carnival, Tsukasa has maintained a heartbroken, depressed attitude that is evident at the office. Seeing this, Michiru asks Isla about it, and she tells her that she was just confused when she shot Tsukasa down and now feels guilty about hurting his feelings. Michiru suggests having the two of them live apart for a few days so Isla could have time to sort out her own feelings, and she transfers Isla to Eru's room and Tsukasa to hers and Zack's. When Tsukasa recovers from his stupor, Michiru consoles him and tells him the reason why she joined Terminal Service No. 1. The next day, Michiru sets up a lunch between Tsukasa and Isla, during which they agree to allow Isla more time to consider her true feelings. Later on, Michiru questions the effectiveness of her treatment over the whole situation. After observing Tsukasa and Isla acting like average coworkers at the office, Michiru approaches Isla one day and asks her about her feelings for Tsukasa, and she responds after a lengthy explanation that she does return his feelings. However, she concludes from this that she must stay away from Tsukasa. When a shocked Michiru asks why, Isla confesses to her that she has approximately one month left in her lifespan. Angered by this, Michiru confronts Tsukasa about it and asks for his true intention for confessing to Isla when he knew about her lifespan beforehand; he replies that he only wishes to make memories for the both of them. When she lashes out at him for refusing to see what kind of pain will result from his decisions, he insists on keeping Isla as a partner. When he returns back to his dorm room, Tsukasa finds Kazuki already there. As Isla also arrives, Kazuki announces she intends to dissolve their partnership."
		)
	,	("Plastic Memories",
		 10,
		 "No Longer Partners",
		 "Kazuki elaborates that she is dissolving Tsukasa and Isla's partnership on the basis that romantic relationships in the office are not allowed, and intends to reassign Tsukasa to her marksman Constance while she takes charge of Isla. Though Tsukasa protests against the decision, Isla immediately agrees, later explaining that it would be better for the both of them. At the office, Tsukasa confronts Kazuki about her decision, after which she reveals she only did it to protect them both from the inevitable pain that would've resulted. However, when Tsukasa proclaims he still intends on staying as Isla's spotter, Kazuki cryptically tells him to leave the situation to her. Later on, Tsukasa and Isla go out on separate retrieval missions with Constance and Kazuki, respectively. During her retrieval mission, Isla agrees to befriend Sarah, the Giftia in question, at the request of the owner Antonio Horizon, whose lifestyle as a mafia boss made it impossible for the Giftia to live a normal life. Simultaneously, Tsukasa and Constance talk about Isla's work performance and how she had closed herself off after Kazuki dissolved their partnership three years ago. Constance then tells Tsukasa that Kazuki has faith in entrusting him with Isla. Returning to the office, Kazuki reveals to Isla that she intentionally set her up for the mission and tries to convince her to stay with Tsukasa, saying that tearing herself away from him will only create painful memories for him. The following night, Isla muses about the unfulfilled expectations she had from her separation with Kazuki. The next day, she returns to the office, approaches Tsukasa, and explains her reason for rejecting him. Then, she proclaims that she wants to make more memories with him until the end and that she is in love with him."
		)
	,	("Plastic Memories",
		 11,
		 "Rice Omelette Day",
		 "In the wake of starting their relationship, Tsukasa and Isla have found it difficult to talk to one another without being embarrassed. However, Tsukasa is able to ask Isla out to dinner. At the office, their approving colleagues decide to give them advice on how to appease the other. At Kazuki's suggestion, Isla asks Michiru to help her learn how to cook for Tsukasa. However, upon finding out she doesn't know any of Tsukasa's favorite foods, Isla asks him, only for Constance to suggest that the two of them just cook together. After debating on what to cook for dinner, Tsukasa suggests rice omelettes. Later on, the two travel to Antonio's manor to visit Sarah. There, Tsukasa asks Sarah what would make her happy, and she recites a sentence Isla told her during her last visit, that people are at their happiest when they are with the ones they love. Afterwards, they go to the shopping mall to purchase herbs and pajamas for Isla, after which Tsukasa admits he doesn't know what to do to make her happy. She responds that she is already happy spending time with him. Returning home, the two begin cooking rice omelettes, and although the final product was not what they were expecting, they are able to enjoy it nevertheless. Isla then allows Tsukasa to read her latest diary entries, both of which recount the days she spent with him. When Tsukasa goes to sleep, Isla adds a new entry, in which she expresses her hope that she would be able to spend another wonderful day with him."
		)
	,	("Plastic Memories",
		 12,
		 "Filling Up with Memories",
		 "In the middle of the night, Isla breaks down in tears and sleeps in Tsukasa's bed for comfort. The next morning, she has reverted to a bright and cheery personality, much to Tsukasa's surprise and relief. At the office, the other employees give Tsukasa tickets to a number of events that he could take Isla to. The two then use tickets given to them by Michiru and Zack to watch a romantic movie. The next day, they return to work despite having taken that day off. Following Isla's visit to the Unit Testing Room, Michiru and Eru discuss about the necessity of her increasingly frequent visits. Meanwhile, Kazuki approaches Tsukasa in private and gives him a retrieval agreement form for Isla, telling him to sign it. Overhearing their conversation, Isla decides to begin teaching Tsukasa how to raise the herbs she had been cultivating in her spare time, as well as how to make tea. While serving Michiru tea, Tsukasa is confronted by her about why he and Isla are coming to work despite taking the day off, and he responds that it was a part of their decision to carry on as they were. The following night, Tsukasa gives Isla the retrieval agreement form, and she gives him her approval in signing it. The next day, they go to retrieve Sarah, their last retrieval mission together. Before erasing Sarah's memories, Isla whispers something indiscernible to her. They then return to the office, where they find the others holding a party in commemoration for Isla's last retrieval mission. After the party, Tsukasa asks Isla what she told Sarah, and she replies that she told her of her hope that she would be reunited with the person they cherished."
		)
	,	("Plastic Memories",
		 13,
		 "I Hope One Day, You'll be Reunited",
		 "It is the last day of Isla's lifespan and she and Tsukasa decide to first spend it by reading entries in her diary. They then spend the morning cleaning up their dormitory room and then taking a bath. They then head over to the office, where they take care of Isla's herbs and she leaves notes for the other employees. They are approached by an early Kazuki, who teases Isla for one last time. The two then decide to spend the day's remaining hours at the amusement park, which they enjoy to their hearts' content. Eventually, they stand at Isla's favorite bench, where she describes how she always observed the emotions of the park's many visitors and how contented they would be at the end of the day in bringing their happy memories home with them. Then, as the park closes, Tsukasa and Isla convince the operator to let them ride the Ferris wheel one last time after closing hours. There, they take turns describing what they love about each other, and Isla finally admits she loved the way Tsukasa held back his sadness and smiled, despite her worry over that characteristic. She then hands him her deactivation ring, saying that she wanted him to be the one to do it. Tsukasa begins crying, and Isla notes that it was the first time she ever saw him cry. He then puts the ring on, expresses his hope that she would be reunited with the person they cherished, and kisses Isla as her time expires. As he carries her to the vehicle, he is met by Kazuki, who thanks him for being there for her, which causes him to break down in tears. The other Terminal Service employees read Isla's letters, in which she thanks them for all the memories she had of them. In the epilogue, Tsukasa takes the same elevator where he met Isla and muses what it would be like if his lifespan was predetermined, concluding afterward that he would live that life to the fullest. Nine months later, he returns from a training course to resume work with Terminal Service No. 1, and is introduced to his new Giftia. "
		)
;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("Plastic Memories", 0, 1, 4)
	,	("Plastic Memories", 0, 2, 4)
	,	("Plastic Memories", 0, 3, 5)
;

-- Anime Data
INSERT INTO ANIME(ANIME_TITLE, NUMBER_OF_EPISODES, ANIME_SYNOPSIS, ANIME_DESCRIPTION, COMPANY_NAME, COPYRIGHT) VALUES
		("Assassination Classroom Season 2",
		 25,
		 "It's time for second term, and the assassination classroom is ready for a semester filled with intense training, studying, and new ways to kill their teacher. But even their most creative plans are falling flatter than a two-ton pudding. That is, until a powerful student decides to come back to class! Koro Sensei's days may finally be numbered. As their skills grow, so does their confidence. But will this lead to a successful assassination or reckless missteps that land them in trouble They'll have to keep their attitudes in check because a dangerous lesson with the Reaper awaits them. Not to mention clashing against A Class in another harsh round of midterms! Through it all, they'll have to face a question more challenging than any final exam-do they save the world or save the world's greatest teacher...",
		 "It's time for second term, and the assassination classroom is ready for a semester filled with intense training, studying, and new ways to kill their teacher.",
		 "Madman",
		 "&copy; &#194;&copyYusei Matsui/SHUEISHA,ASSASSINATION CLASSROOM Committee"
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("Assassination Classroom Season 2",
		 1,
		 1,
		 "M - Animated violence",
		 13,
		 "https://www.madman.com.au/catalogue/view/35866"
		)
	,	("Assassination Classroom Season 2",
		 1,
		 2,
		 "MA15+ - Strong animated violence",
		 12,
		 "https://www.madman.com.au/catalogue/view/39345"
		)
	,	("Assassination Classroom Season 2",
		 2,
		 1,
		 "M - Animated violence",
		 12,
		 "https://www.madman.com.au/catalogue/view/38834"
		)
	,	("Assassination Classroom Season 2",
		 2,
		 2,
		 "MA15+ - Strong animated violence",
		 12,
		 "https://www.madman.com.au/catalogue/view/39346"
		)
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("Assassination Classroom Season 2",
		 1,
		 "Summer Festival Time",
		 "Before the summer vacation at the island resort comes to a close, Koro-sensei gives his students a test of courage inside a cave, pairing them up into couples in hopes of getting juicy gossip. Although this soon backfires, both Koro-sensei and the students quickly notice that Irina Jelavić has feelings towards Tadaomi Karasuma. Koro-sensei and the students decide to set up a romantic dinner for the two teachers to get them together. Irina kisses her napkin and places it on Karasuma's lips as a subtle confession before leaving, but Karasuma seems to be more focused on his duty rather getting her message. On the final day of summer vacation, Koro-sensei invites his students to the local summer festival. Meanwhile, Lovro Brovski is attacked by a mysterious assassin."
		)
	,	("Assassination Classroom Season 2",
		 2,
		 "Kaede Time",
		 "Inspired by an article on a surplus of eggs, Kaede Kayano comes up with a plan to assassinate Koro-sensei by constructing a giant caramel pudding containing a hidden bomb, with all the students banding together to help make it. While Koro-sensei inevitably sees through the plan and disables the bomb, he shares the remaining caramel pudding with his students. Later, the students participate in a game of Cops and Robbers, in which they must use parkour to avoid being captured by Karasuma, but the captives manage to use bribes to have Koro-sensei let them escape. The next day, the students accuse Koro-sensei of stealing underwear from all over the city, but they later suspect that he is being framed by someone. They soon discover the true culprit to be one of Karasuma's underlings, who had been used by Shiro to lure Koro-sensei into a trap, a cage made from fibers that can hurt him. Shiro once again pit Koro-sensei against Itona Horibe."
		)
	,	("Assassination Classroom Season 2",
		 3,
		 "Itona Horibe Time",
		 "Despite Itona's increased deadliness, Koro-sensei manages to evade his attacks and defeat him. Just then, Itona starts reeling from the effects of his tentacle implants, which he had been keeping under control due to Shiro's treatments. Shiro leaves after deeming no further use of Itona, who later goes on a rampage and starts destroying cell phone shops. As Koro-sensei tries to reason with Itona, Shiro attacks Koro-sensei and capture Itona. Shiro lures Koro-sensei into another trap, but the students arrive on the scene to rescue Koro-sensei and Itona, forcing Shiro to retreat. The students soon learn that Itona was allegedly abandoned by his parents after their electronics company went bankrupt. After Takuya Muramatsu, Taisei Yoshida and Kirara Hazama each fail to cheer up Itona, Ryōma Terasaka manages to calm down Itona, allowing Koro-sensei to safely remove the tentacle implants and enroll him as an official student of Class 3-E."
		)
	,	("Assassination Classroom Season 2",
		 4,
		 "Spinning Time",
		 "Itona creates a prototype of a remote-controlled tank, which he plans to strike at Koro-sensei's heart as being the weak point. The other boys in the class suggest a fisheye lens and a camouflage design for the tank, but it later gets destroyed by a weasel. The girls soon figure out that the boys potentially wanted to use the tank to spy on them. Later, Masayoshi (Justice) Kimura feels embarrassment over his written name, Justice. The students are assigned code names by Koro-sensei during a training session against Karasuma, leaving Kimura assigned with his true name to show how well it fits him. Kimura is inspired by Koro-sensei to accept his true name, not by how it is written, but by how one is associated by it."
		)
	,	("Assassination Classroom Season 2",
		 5,
		 "Leader Time",
		 "Yūma Isogai secretly works part-time as a waiter at a restaurant, but he is soon discovered by Class 3-A's Big Five (Gakushū Asano, Teppei Araki, Ren Sakakibara, Natsuhiko Koyama and Tomoya Seo). Gakushū threatens that he will report Isogai to expulsion unless Class 3-E can beat Class 3-A in the sports festival's pole-toppling event. This turns out to be an unfair exhibition match since Gakushū has his team filled with powerful American foreign exchange students led by a boy named Kevin. Despite this, Isogai manages to come up with some unconventional countermeasures for his teammates and their use of unique skills against Kevin's group, eventually outwitting Gakushū and taking the victory."
		)
	,	("Assassination Classroom Season 2",
		 6,
		 "Before & After Time",
		 "While preparing for their midterm exams, the students of Class 3-E perform parkour outside of school grounds. However, Taiga Okajima and Kimura accidentally fall on Matsukata, an elderly principal of Wakaba Park Nursery School, who was on his way there by bike. As a result, Koro-sensei bans the students from studying for the midterms and has them volunteer at the nursery school until Matsukata recovers from his injured right femur. While the other students help entertain the naughty children and renovate the decrepit nursery school, Nagisa Shiota mentors a bullied girl named Sakura Kiyashiki, teaching her to find the strength to return to primary school. After two weeks, Matsukata returns to see the nursery school completely transformed into a safe and fun environment. With no time left to study, the students perform badly in the midterms, yet Karma Akabane scores second place overall due to studying during the summer. Having learned their lesson of being careful in using their newfound strength, the students receive new equipment for their future assassination efforts."
		)
	,	("Assassination Classroom Season 2",
		 7,
		 "Reaper Time, Part 1",
		 "The students of Class 3-E notice that Irina's birthday was a few days ago, so they go see a florist to arrange for Karasuma to give Irina a bouquet for the occasion. However, the mood is spoiled when Karasuma casts aside Irina's romantic interest for the good of the mission, leading her to storm off. After Irina stops showing up at school for a few days, the students are suddenly snuck up upon by the florist, revealing himself to be The Reaper, who tasks the students to rescue Irina from being bound and gagged inside a dungeon. The Reaper lures the students into his trap at a fortress, but they attempt to escape and find Irina. Some students are taken down by The Reaper one by one, and even Nagisa is thwarted by his clap stunner. Meanwhile, the remaining students manage to find Irina, but they discover that she has turned against them. As all of the students are recaptured, Koro-sensei and Karasuma begin their rescue attempt."
		)
	,	("Assassination Classroom Season 2",
		 8,
		 "Reaper Time, Part 2",
		 "When Koro-sensei and Karasuma reach the fortress, The Reaper reveals that he has placed neck braces as explosives on the students. The Reaper manages the lock Koro-sensei with the students, planning to kill them all in a canal flood. Choosing to protect his students, Karasuma chases after The Reaper, who sets off an explosion that traps Irina under some rubble. Hinano Kurahashi encourages Karasuma to rescue Irina, who was taken in by Lovro after her parents were killed in a civil war when she was a child. The students manage to remove the neck braces in time and camouflage from being seen in the live camera feed. Karasuma gets the drop on The Reaper and confronts him in close quarters combat. After being shot by The Reaper with a hidden gun in his index finger, Karasuma is saved by one of Koro-sensei's tentacles, allowing Karasuma to deliver the knockout blow. Afterwards, the students convince Irina to return as their teacher, while Karasuma gets the government to ensure that the students will remain safe from other assassins pursuing the bounty. "
		)
	,	("Assassination Classroom Season 2",
		 9,
		 "Round Two Time",
		 "As the students of Class 3-E are in the process of deciding on their future careers, Nagisa believes that he should become a professional assassin, but Koro-sensei tells him to give it some more thought. Nagisa comes home to his mother Hiromi Shiota, who urges Nagisa to move out of Class 3-E due to his poor grades and becomes hostile when Nagisa insists on staying in Class 3-E. On the next day, Koro-sensei agrees on Nagisa's behalf to impersonate Karasuma for a parent-teacher meeting with Hiromi, stating to her that Nagisa will not be allowed to leave Class 3-E unless solely desired. Unwilling to take no for an answer, Hiromi later drugs Nagisa when he eats dinner and drives him to the old campus. She tries to have him commit arson to the old campus in order to sever his connections with Class 3-E. However, they are interrupted by a whip-wielding hitman who is targeting Koro-sensei. Nagisa uses his assassination skills to take down the hitman and protect his mother. Choosing to pursue a different career, Nagisa decides to work hard to support Hiromi, who lets him stay in Class 3-E."
		)
	,	("Assassination Classroom Season 2",
		 10,
		 "School Festival Time",
		 "A school festival is held, and all the classes compete to make the most money in their dining stalls. The students of Class 3-E take advantage of their mountain location by using local ingredients to create dishes that prove a hit for customers of many familiar faces. Meanwhile, Gakushū and rest of the Big Five use music industry business sponsors to draw in customers. When Yūji Norita comes by for a visit, Rio Nakamura dresses up Nagisa like a girl. During their &quot;date&quot;, Nagisa eventually reveals his true gender to Yūji. Impressed by Nagisa's honesty, Yūji posts about the dining stall on his food blog, causing an influx of customers on the next day. Koro-sensei advises his students to close their dining stall early to avoid disrupting the mountain's ecosystem with excessive foraging. Hiromi arrives to patch things up with Nagisa. In spite of closing early, Class 3-E comes in third place, just behind Class 3-A and high school."
		)
	,	("Assassination Classroom Season 2",
		 11,
		 "End-of-Term Time, 2nd Period",
		 "With final exams approaching, Gakushū witnesses as Gakuhō Asano uses brainwashing tactics on Class 3-A to fuel their hatred towards Class 3-E. As Koro-sensei tasks the students of Class 3-E to make it into the top fifty, it is revealed that Gakuhō will be taking over the lessons for Class 3-A with his twisted educational methodology. Gakushū asks the students of Class 3-E to beat Gakuhō at his own academic game, but the students of Class 3-E already strive to do their best, perhaps better than Class 3-A. During the final exams, the students are faced with college-level questions added by Gakuhō, but the students of Class 3-E manage to get through them using techniques taught not only by Koro-sensei, but also each other."
		)
	,	("Assassination Classroom Season 2",
		 12,
		 "Think Outside the Box Time",
		 "The final exams climax with a showdown between Karma and Gakushū as they tackle the last math problem, solving the volume of an atom inside a cube of a domain. Gakushū struggles to come up with complex formulae after reading the last half of the problem, but Karma discovers a simple formula after reading the first part of the problem. Following the final exams, Koro-sensei reveals that all of his students manage to land in the top fifty. After Gakushū and the rest of Class 3-A state their preference to the ideals of Class 3-E, Gakuhō takes matters into his own hands, threatening to destroy the old campus and sack Koro-sensei. In order to save the class and his job, Koro-sensei is tasked with solving five workbooks containing grenades that could hurt him, with one of those workbooks containing a real grenade."
		)
	,	("Assassination Classroom Season 2",
		 13,
		 "Let Live Time",
		 "Despite getting hit by the math workbook, Koro-sensei manages to finish other subject workbooks without setting them off, having memorized all the problems beforehand. Left with the final workbook containing the real grenade, Gakuhō recalls his time as a kindhearted elementary teacher at a private cram school for his students Rikuto Ikeda, Mori and Nakai. Three years after these students moved onto junior high school, Gakuhō was shocked to discover that Ikeda committed suicide as a result of bullying. This led Gakuhō to change his teaching approach from kindhearted to ruthless. In the present, Koro-sensei protects Gakuhō from the real grenade, revealing that he bases his teaching methods in Class 3-E on Gakuhō's old stance on education. Gakuhō reflects on this, allowing Class 3-E to continue and aiming to become a better educator and parent. Afterwards, Class 3-E puts on a unique play about Momotaro for the drama festival."
		)
	,	("Assassination Classroom Season 2",
		 14,
		 "Secret Identity Time",
		 "Koro-sensei, Nagisa, and Kaede help to tidy up the storage shed, reminiscing over the past year together. Just then, Kaede suddenly attacks Koro-sensei with tentacles of her own, revealing her true identity to be Akari Yukimura, the younger sister of the previous teacher of Class 3-E, Aguri Yukimura. Believing Koro-sensei to be responsible for her sister's death, Kaede stole some tentacle serum from her sister's lab and arranged to join Class 3-E in order to exact her revenge, withstanding the pain of the tentacles while waiting for the right moment to strike. Kaede later puts her own life at risk to battle against Koro-sensei in a field of zebra grass, this time with the full strength of her flaming tentacles. Koro-sensei hears her inner voice, wishing to be saved."
		)
	,	("Assassination Classroom Season 2",
		 15,
		 "Confession Time",
		 "Determined to save Kaede before the tentacles kill her, Koro-sensei asks his students to think of a way to make Kaede forget her bloodlust while he lets her attack his weak point. Nagisa decides to use what he learned from Irina and delivers a powerful French kiss to Kaede, shocking her long enough to allow Koro-sensei to safely remove her tentacles. Shiro, who suddenly appears with The Reaper, reveals his identity to be Kōtarō Yanagisawa, a face that Koro-sensei is all too familiar with. After Kaede recovers, Koro-sensei proceeds to tell the truth about his past, unveiling that he was The Original Reaper. Two years ago, The Reaper was captured by Yanagisawa and brought to a lab, where he met Aguri. As The Reaper underwent experimentation with Yanagisawa's tentacle formula, he became well acquainted with Aguri, revealing that he was captured after being betrayed by a pupil who would go on to become The Second Reaper."
		)
	,	("Assassination Classroom Season 2",
		 16,
		 "Past Time",
		 "Over the course of a year, The Reaper's body continued to be altered by the experiment while his relationship with Aguri continued to grow stronger. Meanwhile, an experiment testing the effects of the tentacle formula on a rat proved disastrous, causing the explosion that destroyed seventy percent of the moon. Learning that the same thing may happen to him in a year's time, The Reaper unleashed his new powers in an attempt to escape from Yanagisawa's facility. As Aguri tried to keep him from leaving, she was fatally wounded by one of the facility's traps, asking him to watch over Class 3-E in her place. Devastated by Aguri's death, The Reaper wished to be weak and flawed, and his tentacles transformed him into the kindhearted teacher Koro-sensei. Back in the present, as the students are troubled over the thought of having to assassinate the teacher they had grown to admire, Nagisa states his desire to find a way to save Koro-sensei's life."
		)
	,	("Assassination Classroom Season 2",
		 17,
		 "Discord Time",
		 "Kurahashi is the first among some students to agree with Nagisa's wish to save Koro-sensei, but Nakamura is the first among other students to speak out against it. After Karma expresses that Nagisa is being arrogant and selfish, Karma grabs onto Nagisa's tie, but Nagisa does a triangle choke on Karma before Koro-sensei arrives to mediate the situation. The students are divided into two opposing teams in a paintball match to determine whether to kill or save Koro-sensei, with victory being decided by either total elimination or flag capture. As the match begins, Karma's talent for formulating combat strategy gives the red &quot;kill&quot; team an early advantage over the blue &quot;don't kill&quot; team. However, Karma is uneasy upon realizing that Nagisa has been seeming absence throughout the battle. Nakamura, Terasaka, Muramatsu and Yoshida of the red team approach the flag of the decimated blue team, only to be suddenly eliminated by Nagisa alone in an instant."
		)
	,	("Assassination Classroom Season 2",
		 18,
		 "Outcome Time",
		 "With only the two of them remaining, Karma challenges Nagisa to fight him in a melee duel. Nagisa and Karma each reminisce of their past friendship during their first year at junior high school, but they slowly began to drift apart due to Karma's violent behavior and Nagisa's hidden aura. During the duel, both of them lose their knives, and Karma does an axe kick on Nagisa to take him down. However, Nagisa rises up to execute his clap stunner, yet Karm bites his tongue to withstand its effect. Nagisa manages to catch Karma in a triangle choke, leading Karma to admit defeat and declaring the blue team victorious. Later on, Class 3-E prepares to sneak aboard a rocket bound for the International Space Station in order to obtain data on how to save Koro-sensei."
		)
	,	("Assassination Classroom Season 2",
		 19,
		 "Outer Space Time",
		 "After training for their mission, Nagisa and Karma are chosen as the two pilots to be sent into space. Thanks to Ritsu infiltrating the security mainframe of the space center, Nagisa and Karma manage to sneak aboard the rocket in place of some crash test dummies as it lifts off into space. Arriving at the International Space Station, the pair manage to convince the astronaut crew members to share their data before returning safely to Earth. Upon inspecting the data, Manami Okuda tells the other students that the chance of Koro-sensei actually exploding is less than one percent with the help of a drug. Nonetheless, the students agree to continue their assassination attempts until graduation."
		)
	,	("Assassination Classroom Season 2",
		 20,
		 "Valentine's Day Time",
		 "As the students prepare for their entrance exams, Nagisa is led to consider becoming a teacher when having a conversation with Sakura during their tutoring session. Meanwhile, Karma and Nakamura notice that Kaede hesitates to give Nagisa a box of chocolates for Valentine's Day, so they show her how the other female students take on this approach to the other male students. However, when Kaede works up the courage to do so, she is ultimately unable to confess her feelings for him. Elsewhere, Karasuma and Irina have a date together, discussing the likelihood that Koro-sensei will not stop being targeted simply because of his reduced chance of exploding. Also, Gakuhō offers Koro-sensei to continue teaching the class during the next term, but Koro-sensei considers resignation instead. Karasuma suggests Irina to work for the government due to her expertise, and he hints that she should move in with him."
		)
	,	("Assassination Classroom Season 2",
		 21,
		 "Trust Time",
		 "Koro-sensei decides to compile a yearbook specifically for the students of Class 3-E, though the students are not particularly enthusiastic with the candid photos he has taken over the year. After another tutoring session with Sakura, Nagisa tells Koro-sensei that he wants to become a teacher during his final career counseling session. That night, the government begins executing their plan to assassinate Koro-sensei, trapping him in an inescapable laser barrier as they prepare to fire an orbital laser cannon in a week. With the media claiming that the students were being held hostage, Nagisa and the others spend the next few days devising a plan to reach the classroom and save Koro-sensei."
		)
	,	("Assassination Classroom Season 2",
		 22,
		 "Happy Birthday Time",
		 "With three hours remaining until the orbital laser cannon is charged, Nagisa and the others begin infiltrating the mountain. Using their home turf to their advantage, the students knock out all the police troops guarding the area and reach Koro-sensei, who praises their efforts for coming so far despite the odds. He calmly shares words of wisdom to his students, preparing them for the road ahead. Just as Nakamura bring out a cake and all the students celebrate Koro-sensei's birthday, Yanagisawa appears on the scene with The Reaper, who has been powered up with tentacles. Koro-sensei looks back to when The Reaper used to be his apprentice, but he never gave The Reaper his approval as an assassin. While The Reaper battles Koro-sensei, Yanagisawa injects himself with the tentacle formula and attacks Koro-sensei as well."
		)
	,	("Assassination Classroom Season 2",
		 23,
		 "Final Boss Time",
		 "After struggling against both Yanagisawa and The Reaper, Koro-sensei takes further damage when Yanagisawa directs The Reaper to attack the students. Yanagisawa claims the students to be hindrances, but Koro-sensei defends his students, saying that they are his greatest gift as a teacher. Kaede attacks the Reaper, but is fatally injured in the process, seemingly sending Koro-sensei into a rage. However, his true expression turns out to be a mix of all of his emotions, giving him the power to kill both Yanasigawa and The Reaper, who had wanted to be acknowledged by his teacher all along. Afterwards, Koro-sensei, having managed to keep Kaede's blood safe during the battle, uses his skills to heal her injury and bring her back to life."
		)
	,	("Assassination Classroom Season 2",
		 24,
		 "Graduation Time",
		 "With Koro-sensei left weak from his battle against Yanasigawa and The Reaper, the students reluctantly but unanimously decide to kill him themselves. Held down by his beloved students, Koro-sensei says his farewell to Karasuma and Irina. Koro-sensei takes one final roll call, as he reminisces his great experience as a teacher. Although Nagisa shakes with his sword in hand, Koro-sensei calms him down, allowing Nagisa to deal the killing blow to the heart. Afterwards, the students check their classroom to find their diplomas, graduation albums and personalized guidebooks left behind by Koro-sensei."
		)
	,	("Assassination Classroom Season 2",
		 25,
		 "Future Time",
		 "With Karasuma's help, the students of Class 3-E attend the junior high school graduation ceremony, where Nagisa learns that Koro-sensei had helped his parents get back together. When the mass media shows up to try and interview the students of Class 3-E about the assassination, Gakushu and the rest of the Big Five help them leave safely. As time passes and the Class 3-E system is abolished, the students receive their reward money, setting aside some for living and education expenses, donating to the nursery school, purchasing the rights to the old campus and giving back to the government. Seven years later, several students get together to tidy up the old campus and discuss what everyone has been up to over the years. Meanwhile, Nagisa begins working as a trainee teacher at a municipal high school, using the skills he had learned from Koro-sensei to set his delinquent class straight. "
		)
;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("Assassination Classroom Season 2", 0, 1, 8)
	,	("Assassination Classroom Season 2", 0, 2, 8)
	,	("Assassination Classroom Season 2", 0, 3, 9)
;

INSERT INTO ANIME(ANIME_TITLE, NUMBER_OF_EPISODES, ANIME_SYNOPSIS, ANIME_DESCRIPTION, COMPANY_NAME, COPYRIGHT) VALUES
		("Ben-to",
		 12,
		 "Every day an epic struggle rages in grocery stores across Japan - the battle for half-priced bento boxes! Once the discount stickers go on, ravenous brawlers start throwing punches in a knockdown, drag-out war over who gets to take home the cheap eats. When a young, broke high school student named Sato joins the Half-Priced Food Lovers Club, he proves to be a rising talent in the world of insane food fights. But does he have what it takes to become the king of clearance cuisine?",
		 "Every day an epic struggle rages in grocery stores across Japan - the battle for half-priced bento boxes!",
		 "Madman",
		 "&copy;Asaura, Kaito Shibano / SHUEISHA, HalfPrice-club"
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("Ben-to",
		 3,
		 1,
		 "M - Sexual references",
		 12,
		 "https://www.madman.com.au/catalogue/view/23702/"
		)
	,	("Ben-to",
		 4,
		 1,
		 "M - Sexual references",
		 12,
		 "https://www.madman.com.au/catalogue/view/23703/"
		)
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("Ben-to",
		 1,
		 "Stick With It, Natto Okra Rice Bowl with Cheese Topping Bento 440kcal",
		 "You Satou finds himself beaten up on the supermarket floor, the last thing he remembers being going to get some half-priced bento. The next day, he encounters a silver haired girl who warns him not to go to the store again. He goes again alongside another student, Hana Oshiroi, and finds himself beaten up again upon reaching for the half price bento. The next day, he decides to act more strategically and witnesses an all-out battle for the bento that gets marked half-price, which is dominated by the silver haired girl, Sen Yarizui. After the battle ends in total defeat for You, Sen tells him to come to the Half-Priced Food Lovers club room."
		)
	,	("Ben-to",
		 2,
		 "Mackerel Boiled in Miso Bento 674kcal",
		 "Sen gets You and Hana to join the Half-Priced Food Lovers Club and starts training them in the ways of Bento Brawling. During one of the supermarket visits, they encounter a 'boar', a fat woman who raids all the half-priced bentos before a battle starts. The next day, You meets Yū 'Wizard' Kaneshiro, who encourages You to stand up to a boar so that the bento battle can properly take place. You comes to understand the pride of the 'wolves' and comes out with his first victory, obtaining a bento with an honor seal from the 'God of Discounts'. You then returns to the clubroom, where Sen congratulates him on his first victory and shows him a scrapbook showing the victories Yū managed to obtain."
		)
	,	("Ben-to",
		 3,
		 "Large Cheese Pork Cutlet Curry Rice 1080kcal",
		 "You is beaten up by the class president, Ume Shiraume, due to him hanging around Hana. As You and Hana go to a supermarket, they meet a kendo club member named Yamahara, who invites them to join a group called the Hounds, who use teamwork to help members get half-priced bento. As You and Hana take a trial period with the group, You feels the bento he obtains this method don't taste as good as he thinks. After reminiscing about old times, You turns down Yamahara's offer, realizing that food tastes best when you fight for it. Having realized the true meaning of half-price bento, Sen gives You and Hana keys to the club room. The next morning, You finds his cousin, Ayame Shaga, sleeping in his bed."
		)
	,	("Ben-to",
		 4,
		 "	Ginger Fried Pork Bento 852kcal",
		 "Ayame is revealed to be a wolf known as 'The Beauty of the Lake' who throws down a challenge to Sen. After barely escaping from the lust of Ume, Ayame accompanies You and Sen to a bento brawl, where she and Sen fight for the same bento. As Sen manages to defeat Ayame and claim her bento, You finds himself against a tough opponent but manages to win in the end."
		)
	,	("Ben-to",
		 5,
		 "Hokkaido Salmon Fish Soup 326kcal",
		 "You goes through some hassle to meet up with Ayame, where he also meets Asebi Inoue, who gives bad luck to anyone she touches. As You goes to a store with the others, he finds himself up against Ren Nikaidou, who is part of a group known as Gabriel Ratchett, and gets severely beaten by Tadaaki 'Monarch' Endo. After You regains consciousness, Ayame explains how Endo seeks revenge for some ancient slight, while Sen questions why she didn't warn You about him."
		)
	,	("Ben-to",
		 6,
		 "Special Hokkaido Style Fried Chicken Bento 795kcal",
		 "As Sen heads towards a store alone, Ayame learns about how Yū triumphed over the previous monarch butterfly, Matsuba, with Endo, her successor, wanting revenge on Yū's successor, Sen. As Ayame warns You about this, Sen, who had gotten severely beaten up by the Gabriel Retchetts, arrives at the Ralph Store to face against Endo. As Ren feels regret after hearing words of disappointment from Matsuba, the current God of Discounts, he tries to stop Endo but is knocked away. As the brawl begins, You and Ayame arrive and together they manage to defeat Endo. Afterwards, Ren follows Matsuba's advice and starts to live for himself. Meanwhile, Yū leaves the country to study overseas, and Matsuba bids him farewell, after reminiscing about their bento brawl with each other and discussing Endo's plan to succeed her."
		)
	,	("Ben-to",
		 7,
		 "Bosomelet Bento 752kcal and Loco Moco Bulging Bento 1100kcal",
		 "Matsuba gives You, Sen, Ayame and Hana free tickets to an indoor swimming pool, where they also run into Ren. There, they discover even a swimming pool has half-priced bento, featuring a unique bento brawl across the pool. As the waves provide a fierce battlefield, You manages to achieve his prey, albeit not without an embarrassing comeuppance."
		)
	,	("Ben-to",
		 8,
		 "Hamburg Steak Loaded with Garlic Chives Bento 765kcal",
		 "You becomes hospitalized after jumping out of a window while trying to protect his Sega Saturn that Sen threw out the window, ending up completely wrapped in bandages. Meanwhile, a pair of twin sisters from Ayame's school both named Kyou Sawagi, the older of which appears to have a thing for Sen, infiltrate the hospital hoping to meet Sen. They mistake You for Sen and perform some curious inspections on him, leading to chaos when they actually learn the truth."
		)
	,	("Ben-to",
		 9,
		 "Deluxe Western and Japanese Food Assortment 2910kcal and Piping Hot Porridge Bento 340kcal",
		 "Asebi decides to make You a homemade bento, in which every component tastes of something completely different. Meanwhile, Ume meets up with the Sawagi sisters concerning both You and Ayame trespassing on each others' schools. Later that night, as Hana has an accident with her computer while finishing up one of her erotic novels, Ume believes her to have fallen sick and comes over to tend to her 'fever'. As she does, she discovers one of Hana's books which she had posted You's face all over. Ume hits Yo once again, but not before he reveals Hana's passion for writing yaoi."
		)
	,	("Ben-to",
		 10,
		 "A Warm, Gentle Flavor I Remember from Long Ago at My Grandmother`s House. A Japanese Dish Easy on Both Mind and Body. Plum and Dried Sardines over Rice with Plenty of Stewed Seasonal Vegetables Bento 480kcal",
		 "Ayame is visited by Ren who tells her about a group called Orthros who are severely attacking other wolves and placing baskets on their heads. As You resumes his bento brawl duties, he becomes the latest victim to the Sawagi sisters. As You, Sen, Ayame and the others get together at a supermarket for a bento brawl the next day, Sen soon finds herself attacked by the sisters and, despite assistance from the others, is severely beaten."
		)
	,	("Ben-to",
		 11,
		 "Pocari Sweat 125kcal",
		 "You goes to visit Sen, who had been absent from school with a cold, where she discusses plans to fight against the twins for eel bentos in a few days. After another defeat by the twins, You and Ren learn from Ayame that they are the daughters of a chain store owner who came over from Yumehiro. Ren travels to Yumehiro to find out more while Ayame passes on Sen's message to the twins, although Sen's cold has gotten worse. Ren learns that, three years ago, the twins were driven out of Yumehiro by a brawler known as The Club of Hercules."
		)
	,	("Ben-to",
		 12,
		 "Domestic Eel Bento 790kcal",
		 "With four hours left until the bento brawl and Sen still not over her fever, You decides to let her sleep in while he goes in her stead. On the way he encounters Hercules, who tells him something that causes him to run away. As the twins arrive at the store, they encounter Hercules, who is forcing the cooperation of the other wolves to exclude them from the fight, just like he did three years ago. However, You returns, having run to build up an appetite which reminds the other wolves why they fight and convinces them to brawl fairly. After beating Hercules, Yo manages to convince the twins to join in the fight, where the twins are defeated and You wins the prize seal to share with Sen."
		)
;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("Ben-to", 0, 1, 4)
	,	("Ben-to", 0, 2, 4)
	,	("Ben-to", 0, 3, 4)
;

-- Anime Data
INSERT INTO ANIME(ANIME_TITLE, NUMBER_OF_EPISODES, ANIME_SYNOPSIS, ANIME_DESCRIPTION, COMPANY_NAME, COPYRIGHT) VALUES
		("Danganronpa",
		 13,
		 "Hope’s Peak Academy is an exclusive private school that only accepts the best of the best. Graduates of this elite – yet enigmatic – institution have the world at their fingertips, but getting a cap and gown is easier said than done. The hallowed halls are ruled by the sadistic administrator Monokuma, who declares that the only way to pass the class is by sending a fellow student home in a body bag. If you can get away with murder, you’ll get your diploma. But if you’re caught red handed, you’ll find yourself on the receiving end of a deadly detention slip!",
		 "Hope’s Peak Academy is an exclusive private school that only accepts the best of the best. Graduates of this elite – yet enigmatic – institution have the world at their fingertips, but getting a cap and gown is easier said than done.",
		 "Madman",
		 "&copy;Seiji Kishi"
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("Danganronpa",
		 4,
		 1,
		 "M - Mature themes and animated violence",
		 13,
		 "https://www.madman.com.au/catalogue/view/35203/danganronpa-the-animation-complete-series-bluray"
		)
	,	("Danganronpa",
		 3,
		 1,
		 "M - Mature themes and animated violence",
		 13,
		 "https://www.madman.com.au/catalogue/view/21688/danganronpa-the-animation-complete-series"
		)
		
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
    	("Danganronpa",
		 1,
		 "Welcome to Despair High School",
		 "After winning a special lottery, Makoto Naegi, an average student, enrolls at the prestigious Hope's Peak Academy for talented high school students. The moment Makoto steps inside the school grounds, however, he falls unconscious and later wakes up in a classroom littered with security cameras and steel plates. Following a note's instruction to assemble in the gym, Makoto finds fourteen other unique students in a similar situation, including a school idol from his old middle school, Sayaka Maizono. It is at this point that the self-proclaimed headmaster, a remote-controlled bear named Monokuma, appears before them, announcing that the students will be staying in the school for the rest of their lives and can only &quot;graduate&quot; by killing another student. Rejecting this idea, the students spend the next few days searching the school grounds to try to find an alternative exit. Deciding everyone needs a motive to kill, Monokuma shows each student a personalized DVD motivating them to try to escape at any cost; in Makoto's case, a video of his family being put in danger. As Sayaka is also unnerved by the contents of her video, Makoto tries to calm her down, promising that he will find a way to get both of them out. "
		)
	,	("Danganronpa",
		 2,
		 "(Not) Normal Arc: Kill and Live",
		 "After learning from Monokuma about the faulty door on his bedroom's shower room, Makoto is approached by Sayaka, who states she is afraid that someone may be after her, and offers to switch rooms with her to put her at ease. The next day, however, Makoto is horrified to discover Sayaka lying dead in his shower room, stabbed in the stomach with a kitchen knife. As Makoto becomes angered by this tragic turn of events, Monokuma explains that one of the students is responsible for her murder and they must judge for themselves who the killer is in a &quot;class trial&quot;. If the class can successfully determine the guilty party, that person alone will be executed, but if they guess wrong, the killer will be set free and everyone else will be put to death. When fashionista Junko Enoshima voices her objection and assaults Monokuma, she is impaled to death by spears as punishment, warning the other students what will happen if they don't follow the rules. After the students' electronic handbooks are updated with details about the murder, Makoto is immediately made a prime suspect when it is shown Sayaka had died in his room. The students begin their investigation, making notes of all the evidence they find, including a message written in Sayaka's blood reading &quot;11037&quot;. Before the trial begins, Makoto finds Sayaka's motivational DVD, which reveals that her fellow members in an idol group were all killed by Monokuma, who would only explain why if she managed to graduate. As the students head for the courtroom, Makoto receives cryptic words of advice from the mysterious Kyoko Kirigiri. "
		)
	,	("Danganronpa",
		 3,
		 "Not Normal Arc: Kill and Live",
		 "As the trial begins, swimmer Aoi Asahina testifies that she and martial artist Sakura Ogami witnessed Sayaka enter the kitchen, during which the kitchen knife used in the murder went missing. Meanwhile, Kyoko proves Makoto's innocence by pointing out that, since the boys' shower rooms don't have locks, he wouldn't have needed to dismantle his own doorknob to enter the shower room. After wondering how the culprit entered the room in the first place, Kyoko presents evidence which reveals Sayaka had purposely invited someone into the room in order to murder them and pin the crime on Makoto, only to wind up as the victim herself. Remembering the message written in blood, Makoto deduces that &quot;11037&quot; is an upside down spelling of &quot;LEON&quot; and accuses baseball star Leon Kuwata of the crime. His guilt is further proven by the method of which the culprit attempted to dispose of the evidence, his blood-stained shirt, in a manner only capable of a baseball star. When it is deduced that he must have used his tool set to take apart the doorknob, Leon is unanimously voted as the guilty culprit and is executed by Monokuma with a barrage of baseballs. Later that night, Kyoko consoles Makoto by theorising that Sayaka may have written her dying message in order to protect him. "
		)
	,	("Danganronpa",
		 4,
		 "(Not) Normal Arc: Weekly Shonen Despair Magazine",
		 "Following the first class trial, Monokuma grants access to the second floor of the academy, containing a library and a swimming pool with gender-divided changing rooms. Whilst searching the library, the group find a broken laptop and a letter that claims Hope's Peak Academy has been shut down for a while, along with a storeroom filled with confidential files. Later, Makoto comes across writer Toko Fukawa, who has a crush on the cold-hearted affluent progeny, Byakuya Togami, before winding up as a witness to a sauna endurance battle between biker Mondo Owada and moral compass Kiyotaka Ishimaru, who end up bonding with each other as a result. Soon after, Monokuma announces his next incentive, stating he will publicly announce everyone's personal secrets unless someone is killed in the next 24 hours. The next day, the students discover programmer Chihiro Fujisaki murdered in the girl's changing room, hung up like a crucifixion with the words &quot;Bloodbath Fever&quot; written in blood on the wall. During the investigation, some peculiarities are found, such as a seemingly disappearing coffee stain and curiously unfitting posters, along with a testimony by gambler Celestia Ludenberg that she saw Chihiro the night before. Byakuya tells Makoto that he believes the murder to be the work of Genocider Sho, a serial killer who crucified victims in a similar fashion. Meanwhile, Toko locks herself in her room, also mentioning something about Genocider Sho and failing to keep a promise to Byakuya. "
		)
	,	("Danganronpa",
		 5,
		 "Not Normal Arc: Weekly Shonen Despair Magazine",
		 "As the second trial begins, Byakuya states that Toko is the culprit as she has dissociative identity disorder, her other personality being none other than Genocider Sho. When Toko faints under the pressure, her personality switches to that of Genocider who, despite casually admitting she is a genuine homicidal maniac, denies killing Chihiro, as she always uses scissors in her serial killings. Being the only other one who knew of Genocider's crimes, Byakuya is suspected of the crime, curiously not denying it. However, after Makoto deduces Chihiro was actually killed in the boy's changing room, with Kyoko subsequently revealing Chihiro was, contrary to everyone's belief, not a girl but, in fact, a crossdressing boy, Byakuya admits he is not the killer and had only modified the crime scene to make the game more interesting. As Celestia gives her testimony about seeing Chihiro carry a sports bag containing a jersey the night before, Mondo accidentally lets slip that he knew what color the jersey was, eventually admitting he is the culprit. After the guilty verdict, Monokuma reveals that Chihiro had come to Mondo, revealing his true gender, in the hopes he could help him become stronger. Mondo, who had been keeping secret the fact that he was responsible for his brother's death in order to keep his gang together, became jealous of Chihiro's strength and killed him in a fit of rage, moving his corpse to the girl's changing room and destroying his e-handbook to protect his honor. Lamenting his actions, Mondo is put through his execution, in which he is spun around in a motorcycle death cage until liquified into butter, leaving Kiyotaka mortified. Meanwhile, Monokuma is seen talking with an unknown person, discussing the mysterious sixteenth student of the academy. "
		)
	,	("Danganronpa",
		 6,
		 "(Not) Normal Arc: Return of the New Century Galaxy Legend! O Armored Hero, Stand upon the Earth!",
		 "After the others investigate the newly opened third floor, containing a rec room, an art room and a physics lab, Monokuma announces his next incentive: a cash reward of 10 billion yen to whoever graduates, though nobody seems to fall for it. Afterwards, the gang discover a laptop, which Chihiro had left behind in the bath locker room, containing an A.I. program called Alter Ego who offers to help decrypt some files left on the laptop. When Kiyotaka asks Alter Ego if he blames him for Chihiro's death, he imitates Mondo to give him words of encouragement, proving a bit too successful. Alter Ego then shows a curious photo of Leon, Chihiro, and Mondo hanging together, which could not have possibly been taken during the time they've known each other. After Kyoko takes precautions following some unhealthy interests from both Kiyotaka and doujin artist Hifumi Yamada, Alter Ego suddenly goes missing, leading Byakuya to suspect that there may be a mole amongst their group. The next morning, Makoto, Kyoko, Aoi, and Sakura encounter Celestia, who claims to have been attacked by someone in a robot costume who took Hifumi hostage. After finding an injured Hifumi in the library and taking him to the infirmary, the gang split into groups to search for the perpetrator. While Byakuya's group chase after the perpetrator, Makoto's group returns to the infirmary and discovers Hifumi lying in a pool of blood, with Monokuma's 'corpse discovery' announcement suggesting he has been killed. Makoto rushes to inform the other group in the physics lab storage, where he discovers Kiyotaka has been killed as well. Upon returning to the infirmary, the group find Hifumi's body has gone missing, later discovering Kiyotaka's body has also disappeared. Discovering the bodies in the art supply room, Hifumi seemingly comes back to life, stating he may have met everyone before and leaving behind the name 'Yasuhiro' before passing away, at which point the 'corpse discovery' alert plays for a second time. "
		)
	,	("Danganronpa",
		 7,
		 "Not Normal Arc: Return of the New Century Galaxy Legend! O Armored Hero, Stand upon the Earth!",
		 "Hifumi's dying words leave most of the students convinced that the culprit is fortune teller Yasuhiro Hagakure, who is found by Kyoko near the pool stuck inside the aforementioned robot costume. Yasuhiro denies committing any murders, claiming he was knocked out after being called by a note, which had subsequently gone missing. After Makoto and Kyoko finish their investigation of the crime scene, the class trial begins. Makoto starts vouching for Yasuhiro's innocence, using evidence to point out he couldn't have designed the outfit, let alone carry the corpses whilst wearing it. After Kyoko asks the court to consider the two murders as separate incidents, Makoto deduces that Hifumi had only faked his death from before, with Kyoko's evidence revealing Hifumi was the one who killed Kiyotaka, moving his body to the art supply closet, where he himself was killed. Tasked with finding the true culprit behind both murders, Makoto accuses Celestia of the crime, as she knew there was a second victim before it was announced. As Celestia grows defensive and brings up Hifumi's dying words again, Makoto deduces that the 'Yasuhiro' he was referring to was actually Celestia's real name, Taeko Yasuhiro. Accepting defeat, Celestia reveals that she stole Alter Ego to coerce Hifumi into killing Kiyotaka under the premise that they would escape together, before killing him herself in the hope of winning the reward money and buying a castle. Leaving Kyoko with the key to Alter Ego's location, Celestia is put through a Versailles-style witch burning before being run over by a speeding fire truck. After the trial, Kyoko has Makoto investigate a hidden room behind the boy's toilets, where he finds a whole bunch of confidential records and a note reading &quot;You must not escape from here&quot;. However, he is suddenly knocked out by a mysterious assailant, discovering all of the files missing when he regains consciousness. Whilst returning to his room, Makoto spots Sakura and Monokuma squaring off against each other in the gymnasium."
		)
	,	("Danganronpa",
		 8,
		 "(Not) Normal Arc: All All Apologies",
		 "Makoto overhears that Sakura had been forced to become Monokuma's mole as he took her family dojo hostage. As Makoto feels he should not jump to conclusions until he has talked to Sakura, Kyoko becomes annoyed with him for keeping secrets from her. After exploring the fourth floor, containing some locked rooms that Monokuma forbids breaking into, the gang catch up with Alter Ego, who reports that Hope's Peak Academy was placed under lockdown due to a terrible incident that occurred, theorising that the school's true headmaster may be behind it. He also discovers another strange photo, this time of Sayaka, Celestia, and Hifumi together. Afterwards, Monokuma announces to everyone that Sakura is the mole, who was ordered to kill someone in exchange for her dojo's safety, hoping to bring about another murder amongst the group. As Aoi becomes angered by the mean words said about Sakura, she ends up getting into a scrape with Genocider, leaving Sakura angered that innocent people got involved. Meanwhile, Alter Ego asks Makoto and Kyoko, who forgives Makoto for keeping quiet about Sakura, to take him somewhere where he can connect to the school network so he can find a way to help the students escape. Despite knowing the risks involved, Makoto and Kyoko respect his wishes and set him up in the hidden room from before. Later, Makoto, Kyoko, and Aoi discover Sakura dead in the rec room, which has been locked from the inside. As Kyoko conducts her investigation, Aoi directs her anger towards Byakuya, Toko, and Yasuhiro, feeling one of them is responsible for Sakura's death. "
		)
	,	("Danganronpa",
		 9,
		 "All All Apologies II",
		 "Following an investigation in the chemics lab, the class trial begins. Toko reveals she, Byakuya, and Yasuhiro all received notes from Sakura calling them to the rec room, where she had witnessed Yasuhiro attack Sakura with a glass bottle out of fear. However, Yasuhiro being the culprit is ruled out when Makoto reveals Sakura had been hit twice. This second hit is revealed to have come from Toko after she had passed out from seeing Sakura's bloody forehead and became Genocider, hitting her with another bottle. As this is also revealed to have not been the killing blow, Byakuya reveals that the actual cause of death was poison, presenting a bottle of poison whose contents were replaced with protein shake. Aoi then announces that she herself is the culprit, claiming that she had replaced Sakura's protein shake with poison and gave it to her. However, Makoto and Kyoko's analysis of the 'closed room' scenario, along with a piece of glass found in the poison bottle Byakuya presented, reveal that Aoi had only been hiding the fact that Sakura had actually committed suicide. As the trial comes to an end, Aoi reveals she had purposely tried to steer the trial to a wrong verdict, believing from a suicide note that Sakura was suffering and feeling everyone deserved to die to make up for it. Monokuma subsequently reveals the note she read was a fake he had made, with Sakura's real suicide note stating that she took her own life to save her dojo, stating her wish for everyone else to make it out of the academy alive. Although the others feel encouraged by Sakura's dying wishes, Monokuma then reveals he had caught Alter Ego trying to hack into the school network and destroys his laptop with a digger. Later that night, Kyoko has Makoto distract Monokuma while she does some investigating of her own, later warning him about the academy's sixteenth student and Super High School Level Despair: Mukuro Ikusaba. "
		)
	,	("Danganronpa",
		 10,
		 "(Not) Normal Arc: The Junk Food of Despair for Racing through Youth",
		 "After the group explore the fifth and final floor, containing a botanical garden and a classroom filled with blood, Byakuya questions Kyoko about her identity, but she states she doesn't remember due to amnesia. As Byakuya dismisses this idea and confiscates Kyoko's room key, Makoto is given the responsibility of looking after a survival knife that Toko found. Later that night, Kyoko, who had managed to obtain a mysterious key and the details about Mukuro from the headmaster's office thanks to Sakura breaking down the door, asks Makoto to keep Monokuma occupied while she goes off to investigate the dorm building's second floor. As Makoto comes down with a fever as a result of staying up all night, he has a dream stating he is supposed to stay in Hope's Peak Academy instead of escape from it, before witnessing a masked person wielding the survival knife, followed by Kyoko telling him something he can't hear. Waking up the next morning to discover the knife he had been keeping has gone missing, Makoto heads to the gym where everyone else is disassembling a broken down Monokuma unit. Whilst looking for a way to break into the headmaster's office for answers, the group discover a corpse in the botanical garden resembling the masked attacker Makoto saw. Before they can remove the mask and identify the victim, a bomb goes off, torching the corpse and leaving it unidentifiable by the time they put the fire out. Finding a key to the data processing room, the group are confronted by a fully working Monokuma, who reveals all their actions are being broadcast live to the outside world. To make matters worse, a class trial is to be held for the corpse they found, which is revealed by Kyoko, who is alive and well, to be that of Mukuro Ikusaba. "
		)
	,	("Danganronpa",
		 11,
		 "Not Normal Arc: The Junk Food of Despair for Racing through Youth",
		 "Before the class trial, after Byakuya has Makoto investigate Kyoko's room, Kyoko tells Makoto that the key she found is a master key that can open any door in the school. As the trial begins, Byakuya accuses Kyoko, who has no alibi for Mukuro's death, while she curiously brings up evidence that effectively negates Makoto's alibi. Believing the cause of Mukuro's death to be a blow to the back of the head, Byakuya deduces the weapon was some steel arrows found in a dojo locker, the key to which was discovered in Kyoko's room. Although this appears to be contradicted by the fact Byakuya had the key to Kyoko's room the entire time, Makoto considers the possibility that Kyoko could have used the master key she stole from Monokuma. Noticing her desperation that she not be found guilty, Makoto decides to place his faith in Kyoko and not expose her, instead questioning the odd nature of the trial. However, Monokuma suddenly declares an abrupt end to the trial, declaring Makoto to be the culprit and deciding to have him executed. Before Makoto can be killed by a crusher, a virus left behind by Alter Ego stops the crusher and allows Makoto to fall safely into a garbage dump below. Some time later, Kyoko throws herself down the garbage chute to rescue Makoto, providing him with food and a means of escape, explaining how the mastermind had originally intended for Makoto to become the victim, planning to frame her for the murder and have her executed instead. Whilst making their way up a giant ladder, Kyoko states she has regained some of her memories, revealing herself to be the Super High School Level Detective who had come to Hope's Peak Academy to meet her father, the headmaster, who she is not on good terms with. Arriving back inside the academy, Makoto and Kyoko confront Monokuma, calling his bluff that simply executing Makoto again would not prove that hope cannot defeat despair. Thus, they propose a final all-or-nothing class trial with everyone's lives on the line, in which the students must not only determine Mukuro's killer, but also solve all of Hope's Peak Academy's secrets."
		)
	,	("Danganronpa",
		 12,
		 "The Reason Super High School Level Bad Luck Attracted Super High School Level Murder, Super High School Level Execution and Super High School Level Despair",
		 "After being granted access to all previously locked rooms, Makoto and Kyoko investigate the dorm's second floor and find a hidden room in the headmaster's lodge. There, they discover the remains of Kyoko's father, who had died long before the killing game started, along with an SD Card containing video interviews of all the students agreeing to spend their lives in Hope's Peak Academy, although Monokuma pulls the plug before the video gets too far. Whilst Kyoko deals with the revelation that her father cared more about her than she thought, Makoto uses the headmaster's e-handbook to open some lockers, finding some textbooks allegedly belonging to Yasuhiro and a notebook containing Kyoko's handwriting, hinting at there being two 'Despair' students. Afterwards, Makoto visits the science lab, being used as a morgue, noticing some curious wounds on Mukuro's body before Monokuma gives him a photo featuring all sixteen students except for himself. As the class trial soon begins, with Monokuma joining the fray, the other students reveal they had also received similar photos, only with them missing from their respective photos. Wondering where these photos came from, Makoto reveals the books he found, deducing they are each missing some of their memories, revealed to have been stolen by Monokuma. Makoto then accuses Monokuma of murdering Mukuro, deducing that Mukuro was murdered twice, pointing out the true cause of death were wounds eerily matching the ones Junko received. After Kyoko proves her innocence by revealing the shameful burns on her hands, Makoto deduces from Monokuma's obscured evidence the identity of the culprit, Monokuma's controller, and the academy's mastermind to be none other than the real Junko Enoshima, who soon appears and reveals herself to be the true Super High School Level Despair. "
		)
	,	("Danganronpa",
		 13,
		 "Goodbye, Despair High School",
		 "Junko reveals that she had used Mukuro, her older twin sister, to take her place, before showing the others footage of the outside world, revealing it to be in total chaos. This is confirmed by Genocider, who retained her memories as they are kept separate from Toko's, with Junko subsequently revealing that the memories that were stolen from the students were actually of two whole years spent together in Hope's Peak Academy. A year ago, when &quot;The Tragedy&quot; hit the world, the school was converted into a shelter to protect the students carrying hope on their shoulders. However, Junko killed the headmaster, erased the students' memories, and began the killing game, betraying her own sister in the process. Junko then holds a final vote between hope and despair; if everyone votes for hope, they must leave the academy, but should even one student vote in favor of despair, the students will remain in the academy and Makoto alone will be executed. Makoto manages to use his own hope to inspire the others to stand up against despair, earning him the new title of Super High School Level Hope. With the trial over, Junko revels herself in the ultimate despair and gives herself the ultimate execution, leaving behind an escape switch. With hope in their hearts, Makoto and the others use the switch to leave the academy and venture into the unknown world, unaware that Monokuma is still active. "
		)
;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("Danganronpa", 0, 1, 4)
	,	("Danganronpa", 0, 2, 4)
	,	("Danganronpa", 0, 3, 5)
;

-- Anime Data
INSERT INTO ANIME(ANIME_TITLE, NUMBER_OF_EPISODES, ANIME_SYNOPSIS, ANIME_DESCRIPTION, COMPANY_NAME, COPYRIGHT) VALUES
		("Death note",
		 37,
		 "Light Yagami is an ace student with great prospects - and he's bored out of his mind. But all that changes when he finds the Death Note, a notebook dropped by a rogue Shinigami death god. Any human whose name is written in the notebook dies, and now Light has vowed to use the power of the Death Note to rid the world of evil. But when criminals begin dropping dead, the authorities send the legendary detective L to track down the killer. With L hot on his heels, will Light lose sight of his noble goal... or his life?",
		 "Light Yagami is an ace student with great prospects - and he's bored out of his mind. But all that changes when he finds the Death Note, a notebook dropped by a rogue Shinigami death god.",
		 "Madman",
		 "&copy;Tsugumi Ohba, Takeshi Obata/Shueisha / DNDP, VAP, Shueisha, Madhouse"
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("Death note",
		 4,
		 1,
		 "M - Animated violence and supernatural themes",
		 37,
		 "https://www.madman.com.au/catalogue/view/38060"
		)
	,	("Death note",
		 3,
		 1,
		 "M - Animated violence and supernatural themes",
		 37,
		 "https://www.madman.com.au/catalogue/view/12888"
		)	
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("Death note",
		 1,
		 "Rebirth",
		 "Outside the grounds of his high school, Light Yagami discovers a notebook that claims to be able to kill anyone whose name and face is known to its owner. He initially dismisses the so-called &quot;Death Note&quot; as a hoax, but, after testing its powers, he discovers that these claims are indeed real. The original owner, a shinigami named Ryuk, approaches Light and explains that the notebook now belongs to him. Since Light is the new owner, he is the only one who can see and interact with Ryuk. The shinigami also says that when Light's time to die comes, Ryuk will be the one to write down his name in his book. Light decides to use the Death Note's power to rid the world of evil and become the god of a new, peaceful world. "
		)
	,	("Death note",
		 2,
		 "Confrontation",
		 "As criminals begin dying from inexplicable heart attacks left and right, Interpol convenes to discuss the phenomenon. Unable to come up with an explanation for it, they turn to the world's top-ranked detective, L, whose true identity is a well-kept secret. L speaks to the Interpol representatives through a computer and an electronic voice, promising them that they are dealing with mass-murder and that he will soon confront the killer whom the general public has been calling Kira (a play on the Japanese pronunciation of the English word killer). This displeases Light, who has been going to great lengths to keep the Death Note hidden, since learning that Ryuk becomes visible to anyone who touches the book. L tricks Light into revealing that Kira lives in Japan's Kanto region with a fake television broadcast. Having played right into L's hands, an enraged and humiliated Light swears to eliminate L. "
		)
	,	("Death note",
		 3,
		 "Dealings",
		 "Police authorities discuss the &quot;Kira case&quot; with L. Upon inquiring about the time of death of the victims, L concludes that Kira is likely a student with a naive concept of justice. He requests data on how the victims were publicized and begins to suspect that Kira has access to police information. Because the police officer in charge of the Kira case, Soichiro Yagami, is Light's father, Light can monitor the authorities' movements. Meanwhile, Ryuk tells Light that he is being followed. He also explains that not only do shinigami get the lifespans of people they have taken before their time, their eyes can see everyone's name and lifespan floating above their heads. He gives Light the option to trade half his remaining lifespan for the eyes of a shinigami, just like Ryuk's. "
		)
	,	("Death note",
		 4,
		 "Pursuit",
		 "Light tells Ryuk that he is trying to create an ideal world where no criminals are left unpunished and that as the god of such a world he cannot sacrifice half of his life for the shinigami eyes. Light begins experimenting to find out how much control he has over how a criminal dies. He tries to have prisoners escape or draw L's face before they die. When they fail to do so, he learns that the Death Note is not all-powerful. Using this knowledge, Light devises a plan to find out who has been following him. Light has a drug dealer touch the Death Note and makes him hijack a bus before he dies. During the hijacking, Light gets his tracker to reveal that he is Raye Penber, a Federal Agent from the United States employed by L and his associate Watari. "
		)
	,	("Death note",
		 5,
		 "Tactics",
		 "Light waits one week before killing Raye Penber. He follows Raye onto a train forces him to write down the names of his fellow agents on a piece of the Death Note by threatening Raye's family. Because of the simultaneous death of these twelve FBI agents in Japan, the police are scared to continue investigating, and the American President pulls the FBI off the Kira case. However, Penber's fiancée, a former FBI agent, seeks to find Kira for revenge. Light has another criminal leave a third coded note for L which finishes the phrase 'L, do you know? Gods of Death love apples'. Although there is truth to this, L determines that Kira is only mocking him as he considers his next move. "
		)
	,	("Death note",
		 6,
		 "Unraveling",
		 "In an effort to repair his relations with the Japanese police, L meets in secret with the remaining detectives who want to work on the Kira case. L insists that they use false identities for protection against Kira and asks that they call him Ryuzaki instead of L. He reveals his thoughts about how Kira might be following the murders of the FBI agents and pinpoints who the federal agents were tracking during that period. Meanwhile, Light happens to meet a woman who introduces herself as Maki. As the two talk, he realizes that she is Penber's fiancée and that she has worked out that Kira can kill by means other than heart attacks. Convinced that it is his destiny to use the Death Note to create a better world, Light is euphoric that he has come into contact with the very person who can get him caught. He formulates a plan to get rid of her. "
		)
	,	("Death note",
		 7,
		 "Overcast",
		 "Light writes the name Maki on the Death Note. When nothing happens, he realizes that Penber's fiancée has kept an alias and fears that she may lead the police to him. Ryuk starts pressuring Light to get the shinigami eyes, but Light coaxes her true name, Naomi Misora, out of her by pretending to work for L. As the Death Note takes effect, Light informs her that he is Kira and watches as Naomi walks away to commit suicide, tauntingly yelling after her how he could easily contact his father now, with her only feebly returning that she has nothing to say. Meanwhile, Watari reveals his identity in the meeting with Light's father and the other detectives. He gives the detectives special gadgets embedded in clothing in the event Kira comes into contact with them or they are in trouble. Detective Shuichi Aizawa is sent to the police headquarters by L and just misses Penber's fiancée. "
		)
	,	("Death note",
		 8,
		 "Glare",
		 "L is close to discovering the identity of Kira. Misora's disappearance causes L to shortlist the people who were being tracked by the FBI at the time of Raye Penber's death. He requests surveillance equipment to be installed in the homes of those he suspects, including Soichiro Yagami's son. Light, however, becomes aware that he is being watched and has the shinigami locate all the cameras in his room. Later, he deceives the surveillance team by watching the news on a portable television hidden in a bag of potato chips and continues to kill the criminals being reported. This throws off L's suspicions that he is Kira. "
		)
	,	("Death note",
		 9,
		 "Encounter",
		 "L's suspicions are momentarily subdued, but he does not discard the possibility that Light may be Kira and decides to meet him in person. At the college entrance exams, Light notices a mysterious and eccentric student staring at him, who introduces himself as Hideki Ryuga, the same name as a famous idol. Light is shocked when &quot;Hideki Ryuga&quot; told Light he was L. Since it would be too suspicious for L to die right after meeting Light, he decides to befriend L and kill him at a later time. He decides that the best course of action is to get closer to L, gather more information about his true identity and keep an eye on the police. "
		)
	,	("Death note",
		 10,
		 "Doubt",
		 "In a bid to profile Light's behavior, L challenges him to a game of tennis. L asks him some questions regarding the Kira case and invites him to help in the investigation. The two then receive news that Soichiro Yagami has had a heart attack and is in the hospital. Light promises to his father that he will make sure Kira is caught and executed for making him suffer. On the way out, L confronts and scrutinizes Light, still uncertain whether or not he is Kira. Light attempts a bluff and demands to be placed in a prison cell without television for one month to prove his innocence. L is satisfied but curious that Light should offer this proposition. Meanwhile, television station Sakura TV receives audio tapes from an anonymous person claiming to be Kira. "
		)
	,	("Death note",
		 11,
		 "Assault",
		 "The Kira investigation team is discussing the disappearance of Naomi Misora when Watari interrupts their meeting. Sakura TV is broadcasting an audio tape which is allegedly from Kira. To prevent Kira from gaining public support, L demands that the broadcast be stopped. Hirokazu Ukita, one of the investigators working with L, rushes to Sakura TV but mysteriously dies in front of the station. The investigation team realizes that Kira no longer needs to know the person's name to kill and panics. Light, who is watching the broadcast from his room, concludes that he should involve himself in the Kira investigation to gather intelligence on L and the second Kira, whom he correctly infers has already accepted the shinigami eye deal. Meanwhile, L suspects that the person behind the broadcast must be a different Kira from the one they are chasing. "
		)
	,	("Death note",
		 12,
		 "Love",
		 "Light meets with L and the detectives. Meaning to test Light's analytical skills, L has him listen to the recordings confiscated by the team to determine if there are any clues in the reader's voice. In this way, L concludes that Light cannot be Kira. The team then broadcasts a recording made by L and Light to trick the second Kira, Misa Amane, into replying. Misa unwittingly reveals important details about the properties of the Death Note and shinigami when she responds and Light begins to panic. In her reply, Misa demands that the first Kira meet her in person. Shocked and wanting to pursue this lead, the investigation team formulates a plan, while Light decides what to do. "
		)
	,	("Death note",
		 13,
		 "Confession",
		 "Detective Touta Matsuda and Light volunteer to go to Aoyama to investigate on the date mentioned in the journal entry. Light intends to find out who the Second Kira is, and in order to keep his identity unknown to the shinigami following Misa, he gets a group of his friends to surround them while they walk. Possessing the shinigami eyes, however, Misa finds out that Kira is Light Yagami because his life span is the only one she can't see. Later, Misa confirms to the investigation team that she has found the real Kira. The team decides to change their approach and try to reason with her. They release a television broadcast condemning Kira as a heartless murderer who will kill anyone who discovers his identity. Furthermore, they offer to lessen the severity of the punishment the second Kira will face if she reveals information about the real Kira. Misa ignores this, finds Light and explains that she tracked him down because she loves him. "
		)
	,	("Death note",
		 14,
		 "Friend",
		 "After Light introduces Misa to Ryuk, the two discuss their plans to get rid of L. Taking advantage of the situation and of Misa's love for him, Light concludes that he can use her to mislead L, while furthering his plans for a better world. Misa's shinigami, Rem, however, threatens to write down Light's name in her own Death Note if Misa's safety is compromised. In the meantime, L is thrown off the trail by the second Kira and is confused by the new audio tapes purposely denouncing the police's attempt to make the first Kira appear as a pariah. L concludes that the two Kiras might have met and are working towards the same goal. "
		)
	,	("Death note",
		 15,
		 "Wager",
		 "Worried at the prospect that he might be murdered, as he is convinced the two Kiras have met, L demands that in the event of his death, Light should be arrested. Later, Light and L meet each other outside college. Much to the anger and frustration of Light, Misa appears and converses with the two. Minutes after Misa leaves, Light receives the news from L that she has been arrested on grounds of being the second Kira. Misa appears to be blindfolded and tied to a chair, while L instructs Watari to torture her to obtain information. A few days later, Misa relinquishes ownership of her Death Note, thus erasing her memories of its existence. "
		)
	,	("Death note",
		 16,
		 "Decision",
		 "Light decides to tell L that he thinks that he may be Kira subconsciously and wishes to be confined. Light's father also believes it is a good idea that he himself be confined to a cell as he cannot risk his emotions getting the better of him in this investigation. Light concocts a plan whereby he tells Ryuk he will relinquish ownership of the Death Note at any time in a discreet discussion, while being monitored by L. After Light's imprisonment, Kira's executions stop and L's suspicion is heightened. Light chooses this time to give up the Death Note, ensuring he will lose his memories of being Kira. His change in behavior puzzles L; Light goes from being calm to completely desperate. The Kira executions then resume and the new spate of killings confuses L. "
		)
	,	("Death note",
		 17,
		 "Execution",
		 "In a last bid to determine if Light and Misa are the two Kiras, L and Soichiro stage a stunt in which Light's father attempts to kill Light and then himself out of shame. Seeing Light and Misa's reactions to it, L intervenes and announces that he no longer suspects them of being Kira, although he is still suspicious over the fact that Misa's DNA was found on the audio tapes. Misa is released, but Light continues working on the Kira case. L and Watari move the investigation team's headquarters to a new building inside the city. Elsewhere, Rem speaks to a mysterious businessman about the Death Note. Eight businessmen then plan the next murder Kira will commit in order for the Yotsuba Group to excel in the market. "
		)
	,	("Death note",
		 18,
		 "Ally",
		 "L proposes that he be tied to Light, causing a scuffle to break out in the new headquarters. It is some time until Kira begins killing again, which has L and Light thinking that Kira may be killing for monetary profit. Their suspicions lead them to the Yotsuba Group, a rich organization that dominates global markets. Kira is also reported to have been sending threats to politicians and the investigation team is forced to conduct their operations in secret. As far as the public is concerned, the Kira investigation remains unsolved and the team is disbanded. At this point, L brings two new members to the investigation team, Aiber and Wedy. "
		)
	,	("Death note",
		 19,
		 "Matsuda",
		 "Feeling inferior at his lack of participation in the Kira case, Matsuda decides to snoop around the Yotsuba Group and do his own research. He finds evidence that Kira is in the building, but, before he can act, he is apprehended by the eight businessmen. Using the fake identity card Watari gave him, he passes himself off as Misa's manager. He pretends to offer a deal involving her in their commercial campaign, while contacting L using his modified belt buckle. Following L's instructions, he then fakes his own death. In one of the Group's later meetings, one of its members chooses to leave out of fear he may have to face the consequences of Kira's actions. "
		)
	,	("Death note",
		 20,
		 "Makeshift",
		 "The investigation team installs wiretaps and surveillance cameras to monitor the Yotsuba Group meetings and are amazed at how openly they discuss their use of Kira. Light and L come up with a plan to contact one of the members of the Group, Reiji Namikawa. Namikawa agrees to act as a spy and help postpone Kira's killings by discussing them at the meetings. L reveals that he still suspects Light is the first Kira by playing mind games with him. Afterward, L questions Misa and wants her to infiltrate the Yotsuba Group to obtain information. Soichiro worries that even if they do gather enough information on the Group it will be difficult to capture all of its members at the same time. "
		)
	,	("Death note",
		 21,
		 "Performance",
		 "The third Kira sets his eyes on Misa after meeting her. While Misa is taking a break from meeting with the Yotsuba Group, Rem contacts her. Misa is able to see the shinigami, but her memories of being the second Kira do not return upon touching a portion of the Death Note that Rem has brought her. Rem then tells Misa about everything that has happened and that she must trust Light lest she be killed. Upon re-entering the room, she spots who the third Kira must be: Kyosuke Higuchi. Misa goes on a date with him and is able to obtain proof that Higuchi is the criminal L is looking for. Her ease in determining who Kira is leaves L very suspicious, since he could not deduce it himself. "
		)
	,	("Death note",
		 22,
		 "Guidance",
		 "After learning that Higuchi is Kira, L decides that the police must not apprehend him until they understand his killing method. He points out that this will be an advantage in curing society of Kira and proving that he has been caught. He arranges for Sakura TV to air a &quot;Kira special&quot; where Matsuda will declare he knows the identity of Kira to lure out Higuchi. Having been granted immunity from prosecution, several of the businessmen trick Higuchi and lead him to follow L's plan. As the third Kira races to the television station, determined to kill the whistleblower, L and the investigation team watch his every move via cameras and wiretaps. "
		)
	,	("Death note",
		 23,
		 "Frenzy",
		 "While driving to Sakura TV, Higuchi talks with Rem about his situation. L, Light and Misa watch from the investigation team building and wonder who he is talking to. L wonders if Higuchi is talking to a shinigami. Rem convinces Higuchi to go to the station, but he has his own selfish motives for doing so. Higuchi enters the station's offices and writes Matsuda's fake name in his Death Note. The team thinks he has just written a note to himself, but find his subsequent erratic behavior odd. L argues that Higuchi has attempted to use his killing method. Higuchi then makes the deal with Rem to obtain shinigami eyes. A furious pursuit ensues when L realizes Higuchi can kill after looking at a person's face and orders the police to apprehend him. "
		)
	,	("Death note",
		 24,
		 "Revival",
		 "Higuchi is arrested on grounds of being Kira and causing multiple murders in the region of Kanto. Inspecting Higuchi's Death Note, L discovers that shinigami do exist. While L is stunned, Light takes the Death Note from him and remembers that he is the original Kira. Light then kills Higuchi by writing his name on a scrap of the Death Note. It is revealed that when Light gave away his Death Note, he added a fake rule stating that, after having written in the book, its owner must continue to use it at least once every thirteen days or perish. The investigation team reviews the rules written in the book and finds that they can do little to get rid of it. Meanwhile, Light orders Misa to recover the other Death Note he had hidden a few months earlier. Misa makes a second deal with Ryuk for the shinigami eyes in order to find out L's true identity. "
		)
	,	("Death note",
		 25,
		 "Silence",
		 "L asks Rem about Death Notes, but he reveals as little information as possible to avoid implicating Light or Misa. Meanwhile, Misa begins to use her Death Note to kill criminals. Although Light denies Misa's involvement, L becomes suspicious of her and Rem realizes that it was Light's plan all along to endanger Misa so that Rem would sacrifice himself to kill L. Later, Light finds L on the roof of the investigation team headquarters. The latter laments how distant he is from other people and how often they, like most people, lie. When the two rejoin the rest of the team, L reveals that he is planning on testing the thirteen-day rule, the only thing currently absolving Misa. Before he can do so, however, Rem kills Watari and L, and herself in the process. After secretly snatching away Rem's notebook, Light celebrates his victory in silence. "
		)
	,	("Death note",
		 26,
		 "Renewal",
		 "The first half of the episode features L narrating the events of the first 25 episodes. This account of the Kira case is revealed to have been left behind by L as a record of his achievements as a detective. It is deleted by Light when he discovers it. The investigation team appoints Light as L's successor and agrees to not publicly announce L's death. Light learns to wield the power he has inherited, while resuming his executions as Kira. The show jumps ahead in time five years, depicting Light joining the National Police Agency (NPA) of Japan in 2012, at the age of 23. Five years earlier, shortly after L's death, L's computer is shown automatically notifying an elderly man of L's fate. The man then reveals this information to two children. "
		)
	,	("Death note",
		 27,
		 "Abduction",
		 "Orphanage caretaker Roger Ruvie informs L's true successors, Mello and Near, that L has died. Relinquishing the opportunity to succeed L, Mello leaves the orphanage to pursue Kira on his own, backed by the American Mafia. Near allies himself with the President of the United States. Along with Steve Mason of the FBI, he forms an organization whose goal is to catch Kira, the Special Provision for Kira (SPK). Mello eventually abducts the director of the NPA and demands the Death Note under Light's task force's possession as ransom. As soon as Light discovers this, he kills the director. Mello then decides to kidnap Light's sister, Sayu. While scrambling to find a way to rescue Sayu, the investigation team receives a phone call from Near, who reveals that he knows of L's death and that someone has attempted to replace him. "
		)
	,	("Death note",
		 28,
		 "Impatience",
		 "Near suggests that he and Light cooperate to rescue Sayu. Soichiro takes the Death Note to the exchange point chosen by the kidnappers in Los Angeles, but Mello's men hijack the plane he is on and drop him off in the middle of the desert. Light monitors his father via satellite, until he enters an underground facility. There, Soichiro exchanges the Death Note for Sayu. Most of the SPK members die soon after Mello grabs hold of the Death Note. Near then proposes to Light that the two cooperate completely in the future and shares his suspicions that Mello is behind these deaths and is playing a game to see who can catch Kira faster. Meanwhile, in the shinigami realm, a shinigami named Sidoh tells another, Armonia Justin, that he lost his Death Note. Justin informs him that it was stolen by Ryuk and dropped in the human world. He advises Sidoh to go retrieve it. "
		)
	,	("Death note",
		 29,
		 "Father",
		 "Light uses the Death Note to have a member of Mello's Mafia mail him the address of their hideout. Sidoh sees the address and goes to find Mello. Meanwhile, Light informs Ryuk that he will give up ownership of his Death Note and borrow Misa's. The next day, Misa, posing as Kira, calls the investigation team to tell them that she will give them her Death Note. She also tells them that most of the members of Mello's mafia will die on November 10 and that that will be the best time to find the stolen Death Note. Upon receiving the second Death Note, Soichiro makes the deal with Ryuk to obtain shinigami eyes. The investigation team storms Mello's facility on the set date. Soichiro comes face to face with Mello and reads his true name: Mihael Keehl. Before he can write it on the recently recovered Death Note, however, Soichiro is shot. Mello escapes the rest of the investigation team by detonating explosives and Soichiro is taken to a hospital, where he dies comforted by the knowledge that his son cannot be Kira because he can see Light's lifespan. Light returns Sidoh's lost Death Note to him. "
		)
	,	("Death note",
		 30,
		 "Justice",
		 "The President of the United States declares America's neutrality regarding Kira in Sakura TV's program &quot;Kira's Kingdom&quot;. Meanwhile, a deeply scarred Mello uses SPK agent Halle Lidner as hostage to gain entrance into Nears headquarters and meet with him. Mello wants the picture Near has of him so that he will remain safe from Kira. In return, he tells Near about shinigami and that some of the Death Notes rules are fake. Already suspicious of Light, Near proposes to the investigation team that they test the &quot;thirteen-day&quot; rule, but none of them believe that they should. In response to Nears actions, Light contacts the President of the United States, asking for information on the whereabouts of the SPK and threatening to kill him if he does not cooperate. Later, Hitoshi Demegawa, the host of Sakura TVs show, goes to America as Kiras messenger and gives a worldwide broadcast inciting people to break into the newly found headquarters of the supposedly evil SPK. "
		)
	,	("Death note",
		 31,
		 "Transfer",
		 "Demegawa commands Kira's followers to break into the SPK headquarters in New York, while Misa watches the scene on television, waiting to kill Near as soon as he exits the building. Near asks the Japanese investigation team to consider that Light may be Kira. He and the remaining SPK members then escape the building by dropping buckets of money out of the windows to distract the protesters. Aware that his team is beginning to doubt his identity, Light e-mails Misa with a new plan. Meanwhile, Aizawa offers Near information about the past investigation that leads Near to conclude that Light is Kira. Aizawa then tells Light that he would like to resume surveillance on Misa and him to help clear their names. Light does not object. Demegawa appears on television soon after, asking Kira's followers to donate money to build a temple to worship Kira. Disgusted that Demegawa is exploiting the situation, Light has Teru Mikami, the new owner of Misa's Death Note whom Light selected based on his appearances in &quot;Kira's Kingdom&quot;, kill the television host. Back at the investigation team headquarters, Aizawa realizes that with both Light and Misa under observation, the new killings cannot be attributed to either of them. "
		)
	,	("Death note",
		 32,
		 "Selection",
		 "Tragic events in Teru Mikami's childhood convince him that God wants him to stand up to evil. As a result, when criminals everywhere begin to die, Mikami believes that this is God's righteous judgment and becomes a frequent guest on &quot;Kiras Kingdom&quot;. After Light gives him a Death Note, Mikami becomes ecstatic and passes judgment on criminals in Lights stead. He chooses a new spokesperson for Kira: Kiyomi Takada, who happens to be one of Lights girlfriends in college. Light realizes that he can use this connection to his advantage and sets up a meeting with Takada, presumably for the benefit of the investigation. While the two meet, Takada receives a call from Mikami and Light reveals himself to Mikami as Kira. They create a ploy to force the investigation team to remove all bugs from the room, after which Light tells Takada that he wants her to be his goddess in the new world. Light then tells the investigation team that he will be pretending to be Takadas boyfriend to catch Kira. Elsewhere, Mello watches Misa, suspecting her to be the second Kira. "
		)
	,	("Death note",
		 33,
		 "Scorn",
		 "Near goes to Japan, allegedly as bait for Kira, and Light silently accepts the challenge. Near ponders on how to beat Light, knowing that the one who is doing his will has shinigami eyes and that the two communicate via Takada. Following Light's instructions, Takada asks Mikami to send her five pages of the Death Note. She tells him that he will continue his work in a fake book made to look like the real one. While walking to a broadcast, Misa runs into Takada and rushes her, jealous that she is not the most popular star. Halle Lidner, who has been sent by Near to act as Takada's bodyguard, stops her then, but Takada meets with Misa for a girl-to-girl talk soon after. Lidner sits in with them. By the end of the conversation, Takada is convinced that Misa is stupid and Lidner reports to Near about the love triangle between Light, Takada and Misa. Elsewhere, SPK member Stephen Gevanni confirms that Mikami is the new Kira, after watching him kill a man by writing something in a notebook. "
		)
	,	("Death note",
		 34,
		 "Vigilance",
		 "After Gevanni's report, Near decides that they must get close to Mikami, but carefully so that the shinigami trailing Mikami will not warn him of their presence. Meanwhile, Aizawa marks several notepads before Light and Takada meet, to determine whether or not they are communicating in secret through written notes. Takada tells Light of her meeting with Misa. Annoyed at the trouble that both women cause him, Light assures her that she is the only one for him. He then writes a script for Takada that makes it sound like she has agreed to help capture Kira. After the meeting, Aizawa's suspicions are confirmed. The SPK picks up Misa then and, when Light contacts Near to tell him that they have lost track of her, Near informs him that he has her. Meanwhile, Gevanni searches Mikami's locker while the man is doing machine flyes and finds the notebook. During a second visit, Gevanni takes photographs of the names written in it. Near determines that the handwriting is Mikami's. Now having everything he needs, Near sets his plan in motion. "
		)
	,	("Death note",
		 35,
		 "Malice",
		 "Mello kidnaps Takada in a daring operation, getting in the way of both Near and Light's plans to set up a meeting between the SPK and the investigation team. Prepared to face such an event, however, Takada kills Mello by writing his name in a piece of the Death Note she managed to secret away. Once Light hears about this, he uses a piece of the Death Note of his own to make her commit suicide. "
		)
	,	("Death note",
		 36,
		 "1.28",
		 "Each having developed a strategy to bring the other down for good, Light and Near finally meet face to face in an abandoned warehouse. Light brings out Mikami to have him write the names of everyone but Light on his Death Note. Meanwhile, Near is confident that the pages of the notebook Mikami is using are fake, confessing that he has tampered with them. All they need to do now is check whose name was not written to find out who the real Kira is. Light struggles to mask his glee as he thinks of how he already knew of Near's actions and that that had been why he had Takada keep the real Death Note while switching Mikami's with a false one. As the seconds before the Death Note's power takes effect count down, Light declares his victory to Near. "
		)
	,	("Death note",
		 37,
		 "New World",
		 "Mikami's Death Note fails to work and Near confesses that he knew about the fake notebook and had actually tampered with the real one. Mikami is restrained and, faced with Near's undeniable evidence, Light breaks down and laughs like a madman. He confesses that he is Kira and attempts to write names down on a piece of the Death Note hidden in his watch. Matsuda keeps him from doing so by shooting him down. Seeing Light writhe on the floor in agony, Mikami kills himself. Wounded, Light escapes in the middle of the commotion. He goes over everything that has happened in a series of flashbacks. As he had promised in the beginning of the series, Ryuk writes down Light's name in his notebook, thinking that this whole experience has been quite fun. Ryuk is shown standing on top of a skyscraper, before Light finally dies of cardiac arrest on a set of stairs, seeing L's figure in front of him. "
		)		
;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("Death note", 0, 1, 8)
	,	("Death note", 0, 2, 8)
	,	("Death note", 0, 3, 8)
	,	("Death note", 0, 4, 13)
	,	("Death note", 2, 1, 37)
;

-- Anime Data
INSERT INTO ANIME(ANIME_TITLE, NUMBER_OF_EPISODES, ANIME_SYNOPSIS, ANIME_DESCRIPTION, COMPANY_NAME, COPYRIGHT) VALUES
		("HighSchool DxD",
		 12,
		 "The story centers around Issei Hyoudou, a perverted high school student who was nearly nearly killed by his first date, later revealed to be a Fallen Angel. He is soon saved by Rias Gremory, a crimson-haired beauty who reveals herself as a Devil of the Gremory Family, and finds out that he himself has been reborn as a Devil made to serve her. The story focuses on the ongoing battle among the Fallen Angels, Angels, and Devils, and Issei's ongoing relationship with Rias, her peerage, alongside other Devils and Angels.",
		 "The story centers around Issei Hyoudou, a perverted high school student who was nearly nearly killed by his first date, later revealed to be a Fallen Angel. He is soon saved by Rias Gremory, a crimson-haired beauty who reveals herself as a Devil of the Gremory Family, and finds out that he himself has been reborn as a Devil made to serve her. The story focuses on the ongoing battle among the Fallen Angels, Angels, and Devils, and Issei's ongoing relationship with Rias, her peerage, alongside other Devils and Angels.",
		 "Madman",
		 "&copy;Tetsuya Yanagisawa, Takao Yoshioka / TNK"
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("HighSchool DxD",
		 4,
		 1,
		 "MA15+ - Strong sexual references, animated nudity and violence",
		 12,
		 "https://www.madman.com.au/catalogue/view/20932"
		) 
	,	("HighSchool DxD",
		 3,
		 1,
		 "MA15+ - Strong sexual references, animated nudity and violence",
		 12,
		 "https://www.madman.com.au/catalogue/view/20931"
		)
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
        ("Highschool DxD",
		 1,
		 "I Got a Girlfriend!",
		 "Issei Hyodo is a high school student who is unpopular with girls at Kuoh Academy. One day, Rias Gremory, the crimson-red haired top idol of the academy and president of the Occult Research Club, discovers Issei and asks her vice-president Akeno Himejima about his identity. As he dreams of having a girlfriend, another girl named Yuma Amano shyly asks Issei out, to his excitement. Shortly afterwards, Yuma asks Issei to die for her sake and reveals herself as Raynare, a fallen angel. After Raynare kills Issei, he sees a vision of Rias. Assuming the incident to be a dream, he resumes his normal life. However, when Issei encounters another fallen angel, Dohnaseek, he is wounded. Just as Dohnaseek is about to finish Issei, Rias intervenes and saves him. The next morning, Issei discovers he and Rias are naked together in his bedroom. Reassuring that the dreams were real, Rias introduces herself as a devil and his new master. "
		)
       ,("Highschool DxD",
		 2,
		 "I'm Done Being Human!",
		 "Rias explains to Issei that she used her magic to heal his wounds as she gets ready for school, and also reveals that she is a virgin. At Kuoh Academy, the school prince Yuto Kiba leads Issei to the Occult Research Club where he meets the popular &quot;mascot&quot; girl Koneko Toujou and the club's vice-president Akeno Himejima. Rias briefs Issei on the current situation with angels, fallen angels, and devils; and the duties assigned to him. After going to his first assignment which involves an otaku, he encounters another fallen angel named Kalawarner, but uses his Sacred Gear to transform his hand into an armored Dragon Arm and defeats her. Shortly afterwards, Rias warns Issei that since he has the Sacred Gear, he will be sought after by the fallen angels."
		)
	,	("Highschool DxD",
		 3,
		 "I Made a Friend!",
		 "Issei befriends a teenage nun Asia Argento but hides his devil identity from her. After Rias warns Issei about the dangers of the Church, the team must battle a stray devil. Rias briefs Issei on the Evil Pieces system where each member of her team has a certain role similar to chess pieces, where Rias is the king, but Issei is the pawn. Issei's next assignment becomes difficult when he must deal with a ruthless exorcist Freed Sellzen. However, Asia, working for Freed, witnesses the incident and attempts to stop Freed from killing Issei. Rias and the other members rescue Issei but leave Asia behind, to his dismay. "
		)
	,	("Highschool DxD",
		 4,
		 "I'm Saving My Friend!",
		 "While on a date with Asia, Issei finds out her past as an excommunicated nun from the Church. Issei vows to be her friend regardless of being a devil, but they are interrupted by Raynare, who captures Asia. Later, Rias explains a special ability that pawns have: Promotion. She suddenly leaves with Akeno, leaving an ambiguous note about the Church as enemy grounds. Issei remembers Raynare's speech about a ritual with Asia tonight and is determined to rescue her. As Issei heads for the Church, Kiba and Koneko follow him having understood Rias's message. They storm into the sanctuary and defeat Freed, however, Issei finds Asia chained to a cross where Raynare is about to complete her ritual. "
		)
	,	("Highschool DxD",
		 5,
		 "I Will Defeat My Ex-girlfriend!",
		 "Raynare removes Asia's sacred gear and puts it into herself, killing Asia. She even releases Asia to Issei, but mentions the price a host pays if their Sacred Gear is removed or destroyed. She is surprised that her superiors were wary of his Sacred Gear as its ability is only able to double the power of its user, especially when Issei is so weak that he is not a threat even with his power doubled. Issei furiously prays to God and Lucifer before the extreme intensity of his emotions unlocks an ability in his Sacred Gear revealing just part of its real potential. In a state of righteous manic rage he is able to use his newfound power to knock out Raynare in a single devastating punch even after she had impaled both of his legs. Rias appears and admonishes Raynare for both underestimating Issei's Sacred Gear and for injuring one of her servants. In a desperate attempt to manipulate him into trusting her again, Raynare changes into her human form and pleads for him to protect her. Angered by Raynare's behavior and with his heart breaking, Issei orders Rias to kill Raynare. Shortly afterwards, Rias revives Asia as a bishop. "
		)
	,	("Highschool DxD",
		 6,
		 "I Work as a Devil!",
		 "After Raynare's demise, new living arrangements are made for Asia, who has been living in the club's room. Meanwhile, Issei begins a new training regimen with Rias to improve his physical fitness. During training, Issei is surprised to find Asia and her boxes. Rias asked Asia her living preferences and she chose Issei's home. Asia also begins attending school where she is placed in Issei's class. She quickly attracts other classmates including jealousy from Matsuda and Motohama. The following night, Issei is assigned another job and is unable to receive a pact. Issei thinks it over during P.E. class and ends up sleeping in the infirmary along with Rias. Noting Issei's lecherous desires, Rias offers her body to him in exchange for a pact. That night, Rias accompanies him on his next job: helping a foreign exchange student named Susan inside a Samurai outfit to retrieve her notebook. She also requests help to attract her love. After the unusual meet up with her love, Issei successfully completes the job. He tries to get his reward from Rias, but loses when the other members arrive. Rias instead gives him a hug, shocking everyone. "
		)
	,	("Highschool DxD",
		 7,
		 "I Get a Familiar!",
		 "Rias decides that it is time for Issei and Asia to have servant familiars. The school's student council visits the club room, and Issei learns that they are another faction of devils. Since only one group is allowed to enter the world of familiars per month, the two groups compete to see who gets to go first. As they compete in a tennis match, what starts as a normal human competitions turns frightful as Rias and Sona use magic to enhance their moves. They end up destroying much of the equipment, leading to a draw. Rias's group later wins in the dodge ball match, allowing them to pick new familiars first. During the search for familiars, they are greeted by Master Familiar Towji. He guides Issei and Asia throughout the forest and shows different creatures they can choose. The group later finds a Sprite Dragon, a familiar difficult to obtain. Suddenly, slime litters the forest and obliterates clothes. Issei wants to make slime as his familiar and uses Asia to protect it. He is knocked out by the Sprite Dragon, who has taken a liking to Asia. In the end, Asia accepts him as a familiar while Rias notes Issei still has ways to go. "
		)
	,	("Highschool DxD",
		 8,
		 "I Pick a Fight!",
		 "Issei dreams that he is marrying Rias, which leads him to get in touch with his inner dragon. After school, Issei encounters Asia in the shower, who confesses a desire to have a deeper relationship with Issei. Later, Rias appears in Issei's bedroom that night looking to lose her virginity. However, her attempt is suddenly interrupted by the arrival of Grayfia Lucifuge, the wife and queen of Rias's brother Sirzechs Lucifer, who initially mocks Issei as a lowborn. At Kuoh Academy, Issei and his group are introduced to Riser Phoenix, a devil who is to be engaged to Rias. When Riser proposes to Rias, she declines. He mocks Issei's dream of having a harem, leading to him having one of her pieces hit Issei in the stomach. In response, the Gremory and the Phoenix clans organize a ratings game. "
		)
	,	("Highschool DxD",
		 9,
		 "I've Begun My Training!",
		 "Issei begins to train in an isolated area under Rias' supervision as they prepare for the rating game Rias agreed to fight with Phoenix in ten days time. There, Issei creates his special move, called Dress Break. "
		)
	,	("Highschool DxD",
		 10,
		 "The Showdown Begins!",
		 "The battle between the Phoenix clan and the Gremory clan begins. Issei uses an embarrassing finishing move but proves his worth. The Gremory team suffers their first loss when a comrade fights against superior numbers of the Phoenix clan. Issei, enraged by the fate of his comrade, challenges the enemy Queen. "
		)
	,	("Highschool DxD",
		 11,
		 "The Acclaimed Battle Continues!",
		 "The Rating Game continues. Both sides endure further losses and Riser has not received a scratch due to the Phoenix family's special ability. Rias concludes the game by making a hard choice. "
		)
	,	("Highschool DxD",
		 12,
		 "I'm Here to Keep My Promise!",
		 "Issei wakes up to find himself passed out in his own bed after the Rating Game. Soon after, Grayfia informs Issei the results of the Rating Game. She gives Issei a magic circle that will allow him to attend the Gremory-Phoenix engagement party with Sirzechs's message that if Issei wants to do something, then to go in and rescue Rias by force. Upon arriving, Issei crashes the party, but is interrupted when Sirzechs comes in and offers to host a one-on-one battle between Riser and Issei to liven things up since he found the Rating Game unsatisfying. Riser and Issei engage in fierce duel that ends with him hitting Riser with holy water. Issei discovers what was on the back of the transport circle Grayfia gave him. Sirzechs discusses his feelings and plans about Rias' forced engagement with Grayfia. Rias, overwhelmed by Issei's feelings and determination, acts on impulse. As a result of the duel between Dragon and Phoenix, some changes are going to occur at Issei's house while Asia and Akeno try to help him deal with the consequences of a choice he made. "
		)

;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("Highschool DxD", 0, 1, 4)
	,	("Highschool DxD", 0, 2, 4)
	,	("Highschool DxD", 0, 3, 4)
;

-- Anime Data
INSERT INTO ANIME(ANIME_TITLE, NUMBER_OF_EPISODES, ANIME_SYNOPSIS, ANIME_DESCRIPTION, COMPANY_NAME, COPYRIGHT) VALUES
		("HighSchool Dxd New",
		 12,
		 "The devilish haremking Issei Hyoudou is back for more outrageous Oppai Battle Entertainment in the scintillating second season of High School DxD! Fans who like their hardcore action spiked with a double dose of fan service won't be able to pry their eyes off all the scorching supernatural schoolgirls waiting for them in Season Two. So what are you waiting for? Plant yourself in front of the boob tube and watch a harem of devil hotties show you how much fun it is to be bad!",
		 "The devilish haremking Issei Hyoudou is back for more outrageous Oppai Battle Entertainment in the scintillating second season of High School DxD!",
		 "Madman",
		 "&copy;Tetsuya Yanagisawa, Takao Yoshioka / TNK"
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("HighSchool Dxd New",
		 4,
		 1,
		 "MA15+ - Strong sexual references and frequent animated nudity",
		 12,
		 "https://www.madman.com.au/catalogue/view/30434"
		)
	,	("HighSchool Dxd New",
		 3,
		 1,
		 "MA15+ - Strong sexual references and frequent animated nudity",
		 12,
		 "https://www.madman.com.au/catalogue/view/30433"
		)
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("HighSchool Dxd New",
		 1,
		 "Another Disquieting Premonition!",
		 "After a hectic morning with Rias and Asia, Issei's Dragon arm awakes forcing Issei to have Akeno remove the Dragon Power. While looking through photos, Kiba finds a Holy Sword among the photos of Issei and his friend while playing at that friend's house. Later, while on the way home after Issei completed a contract with his new client, Issei and his friends are ordered to hunt down a Stray Devil at an abandoned factory. The team manages to defeat the Stray Devil. Kiba is oblivious to Rias' questions about Kiba's actions. Kiba reveals to Issei that he plots revenge against the Holy Sword Excalibur. Later at his house, Issei finds out that Kiba was once part of a project called &quot;The Holy Sword Project&quot; being the only survivor of it. On his way back, Kiba witnesses a priest being killed by Freed being further enraged by the Excalibur Freed was wielding, leading to a battle between the two. Meanwhile, two strangers arrive in Issei's town, one of which holds a copy of the photo in Issei's album depicting Issei playing with her. "
		)
	,	("HighSchool Dxd New",
		 2,
		 "The Holy Sword Is Here!",
		 "Ddraig tells Issei about the &quot;Vanishing Dragon&quot;, Albion. Meanwhile on her way to school with Tsubaki, Sona notices the strangers standing outside the school gate and the Holy Sword that one of them is wielding. Later at the Occult Research Club, Issei finds out about the &quot;Holy Sword Project&quot;, where he was one of the failed products who fled from his death. Heading home, Issei and Asia find the strangers talking to his mother, and to the latter's surprise, one of them is his childhood friend Irina Shidou. The next day Irina and the other stranger, Xenovia, arrive at the Occult Research Club to tell them that they are to retrieve the stolen Excalibur swords without any intervention from the devils. While leaving, Xenovia realizes that Asia has been condemned as a witch and threatens to kill Asia. Enraged, Issei challenges Xenovia and Irina to a duel with Kiba following in pursuit. "
		)
	,	("HighSchool Dxd New",
		 3,
		 "I'll Destroy the Holy Sword!",
		 "Issei and Kiba are overpowered by Xenovia and Irina. Before leaving, Rias asks the two about the Fallen Angel who stole the Excaliburs learning that the one who was responsible was the Fallen Angel Leader, Kokabiel. Back at the Occult Research Club, Kiba leaves the building with extreme frustration over his loss to Xenovia. Issei decides to help Kiba exact his revenge on the Excalibur swords. Coercing Saji into his plans with Koneko's help, the three start to search for Xenovia and Irina, eventually finding them in a street. The trio then form an alliance with the two, helping them to retrieve the Excalibur swords while handing them an Excalibur sword so that Kiba can destroy it. Kiba, touched by Issei and Koneko's action, agrees to accept the help of the two, thanking them for their help. Later at night, Issei meets up with Kiba and the others to start their plan to destroy the Excalibur. Meanwhile, a young man appears beside Issei's client. "
		)
	,	("HighSchool Dxd New",
		 4,
		 "A Strong Enemy Appeared!",
		 "Issei and the others start their operation to search for Freed and the Excalibur, later finding the ex-priest at the abandoned warehouse previously used by Stray Devil Viser. Kiba engages Freed in a one-on-one battle until Issei, Saji and Koneko intervene giving Kiba the advantage. However, Valper Galilei advises Freed to control his Excalibur better, and manages to reverse the situation until the timely arrival of Xenovia and Irina. Valper and Freed flee, forcing Kiba, Xenovia and Irina to chase after the two. However, Rias, Sona, Akeno and Tsubaki intervene and Issei and Saji are punished by their respective masters for taking action without permission. Back at the Hyodo Residence, Asia greets Rias and Issei in a naked apron as Rias decides to change into one as well. The next day, Rias, Akeno and Koneko send their familiars to search for Kiba, Xenovia and Irina throughout the city, finding an injured Irina lying in the outskirts of town. After healing Irina with Asia's help, Tsubaki takes Irina to the Sitri residence for further treatment. Freed reveals that he now has four Excalibur swords with him after stealing Irina's Excalibur Mimic under Kokabiel's orders as part of his plan to start another Great War using all seven Excaliburs. Disappointed that Michael only sent exorcists, Kokabiel decides to target the Devils of Kuoh Academy to force the Satans to take action. After the Fallen Angel leader uses a small attack as a diversion, Issei and the others head back to the school in preparation for their upcoming battle with Kokabiel. Meanwhile at Kuoh Academy, Valper and Freed are shown to be inside a magic circle undergoing an unknown ceremony, with Kiba and Xenovia realizing the situation from afar. "
		)
	,	("HighSchool Dxd New",
		 5,
		 "Decisive Battle at Kuoh Academy!",
		 "Sona and her team form a barrier surrounding the school while Rias and her team prepare for their battle against Kokabiel, Freed and Valper. The battle begins with Kokabiel summoning several Cerberus demons to battle the Gremory Team, which the protagonists successfully defeats with the help of Xenovia. During that time, Valper successfully combines the four Excaliburs while triggering a self-destruct magic circle that will activate in 20 minutes as a stranger looks on from afar. Rias and Akeno then attempt to battle Kokabiel but prove useless against his powers. Meanwhile, Kiba confronts Valper and realizes the truth of the Holy Sword Project. With the help of his friends, Kiba successfully attains his Balance Breaker, and together with Xenovia who summons her Durandal they successfully destroy the Fused Excalibur. Kiba attempts to kill Valper but Kokabiel kills him and reveals the Occult Research Club that Issei can transfer his power to anyone as Issei prepares to transfer his powers to Rias. "
		)
	,	("HighSchool Dxd New",
		 6,
		 "Go! Occult Research Club!",
		 "Issei transfers his boosted powers to Rias, but both Rias and Akeno are overpowered by Kokabiel. Realizing Akeno is the daughter of the Fallen Angel Cadre, Baraqiel, Kokabiel mocks Rias saying that she has a habit of taking in weird people like her brother. Enraged, Issei plans to attack Kokabiel. Kiba, Xenovia and Koneko attack Kokabiel to buy time for Issei to boost his powers, but Kokabiel overpowers them. He then reveals that in the previous Great War, both the Four Great Satans and God were killed, much to Xenovia and Asia's horror. Despite this, Issei states his dream of becoming a Harem King and attacks Kokabiel, reigniting his friends' fighting spirit. However, the barrier surrounding the school field is destroyed by the stranger, calling himself the White Dragon Emperor Albion, he ultimately defeats Kokabiel and negates the self destruct spell on the school, before taking Kokabiel and Freed away from the field. With Kokabiel gone, the academy's student council repairs the school while Kiba vows once more to serve Rias along with her other servants. In the aftermath, Xenovia is reincarnated as a Devil as Rias' Knight after being declared a heretic by the Church and joins the Occult Research Club before reconciling with Asia. Issei later plays a video game with his client, who reveals himself to be Fallen Angel Leader Azazel. "
		)
	,	("HighSchool Dxd New",
		 7,
		 "Summer! Bathing Suits! I'm in Trouble!",
		 "At the Occult Research Club, Issei informs the group that his client is Azazel much to Rias's dismay. The next day, the Occult Research Club is placed in charge of cleaning the pool, but Issei's Dragon arm acts up again requiring Akeno to suck out the Dragon power. Having cleaned the pool, the Occult Research Club fills it and starts swimming. Rias then attempts to seduce Issei by having him apply sunscreen on her back. However, Akeno interrupts and tries to seduce Issei herself, resulting in a battle between the two girls. Fleeing the battle, Issei meets Xenovia who wants to have a child with him but Rias and the other girls intervene. Back at the Occult Research Club, Sirzechs and Grayfia arrive to greet Rias and her peerage. Sirzechs reveals that he has come for Rias' class observation day and to investigate the location for the meeting of the three factions. Sirzechs and Grayfia then head to the Hyoudou Residence to greet Issei's parents and Sirzechs spends the night in Issei's room. The next day, Rias leaves the Hyoudou Residence early to guide Sirzechs and Grayfia while Asia goes to Xenovia's apartment leaving Issei to go to school alone. On his way he encounters the stranger he previously encountered, who reveals himself as Vali Lucifer, the White Dragon Emperor. "
		)
	,	("HighSchool Dxd New",
		 8,
		 "Open House Begins!",
		 "Vali approaches Issei but Kiba and Xenovia intervene; Vali warns them that since they were unable to defeat Kokabiel, they do not have the strength to beat him. Vali asks Issei where he thinks he ranks, in terms of strength, in the Underworld, and tells Issei that he is someone important. Vali then advises Rias to nurture Issei properly before leaving without a fight. Resting at the sickroom after meeting Vali, Issei questions Ddraig on his relationship with Albion; Ddraig explains how the two Heavenly Dragons came to be sealed into their respective Sacred Gears. At Kuoh Academy, Issei is once again put into a comical situation due to Xenovia's lack of common sense. He runs into Rias, Akeno, Sona and Tsubaki discussing the earlier meeting with Vali, and their concern about their upcoming class observation. After finishing their classes, Issei, Rias and Akeno hear some noise about a cosplayer in the gymnasium; heading there, they meet Serafall Leviathan, Sona's older sister and the current Devil King with the title of Leviathan, whose presence and antics embarrass Sona. At the Hyodo Residence, Sirzechs, Issei's and Rias' fathers enjoy a video of Rias' class observation, but Rias gets embarrassed and leaves the room. Issei invites her to his room and the two share an intimate moment until Asia interrupts them followed by Sirzechs, who drops by to tell Rias that recent events and the expansion of her peerage have changed his mind about her ability to control her second Bishop thus giving her his permission to unseal him. "
		)
	,	("HighSchool Dxd New",
		 9,
		 "I Have a Junior!",
		 "The Occult Research Club unseal the locked door in their club house, revealing a boy wearing a female school uniform whom Rias introduces as Gasper Vladi, who accidentally freezes time when Issei touches him. They learn that Gasper possesses the Sacred Gear, Forbidden Balor View, and was sealed due to his inability to control it. Rias, Akeno and Kiba then leave to help in the preparation for the meeting of the Three Factions, leaving the others to train Gasper. During the training, Azazel suddenly arrives at the school yard and gives Saji, Issei and Gasper advice on how to control Gasper's Sacred Gear before leaving. Issei and the others take Gasper to the gymnasium in an attempt to train him to focus his powers, however Gasper once again goes into seclusion after the training. Issei has a conversation with Gasper, managing to get the boy to open up and talk with him, until Kiba, Koneko, Asia and Xenovia arrive. The next day, Issei goes to the shrine with Akeno and meets another new figure who introduces himself as Michael, the leader of the Angels. "
		)
	,	("HighSchool Dxd New",
		 10,
		 "Various Three-way Deadlocks!",
		 "After meeting Michael, Issei receives the Holy Sword, Ascalon, from the Archangel and proceeds assimilate it into his Boosted Gear and Michael leaves shortly afterwards. After Michael leaves, Issei and Akeno discuss Akeno's fallen angel and human heritage. Issei is unfazed by her fallen angel heritage and so deepen his bonds with Akeno, who gives him a lap pillow until a jealous Rias appears and forces Issei to leave with her. Issei then heads back to the school to help Gasper in his training who improves in controlling his powers. On the day of the conference, Rias and her servants go to the meeting room, leaving Koneko and Gasper behind. At the meeting, they meet Azazel and Vali who are representing the Fallen Angels, Michael who represents the Angels and Sirzechs and Serafall who are representing the Devils as the Three Factions starts the meeting. Meanwhile, a group of mysterious people approaches Gasper and Koneko who are standing by at the Occult Research Clubroom. "
		)
	,	("HighSchool Dxd New",
		 11,
		 "The Leaders' Summit Begins!",
		 "During the meeting between the leaders of the Three Factions, Azazel asks both Issei and Vali their opinions about the peace treaty. Issei then asks Michael why Asia was exiled and is told of the current situation in Heaven and both Asia and Xenovia reveal that they are happy with their current lifestyle. Azazel then comments about his subordinate who killed Asia to Issei's irritation. However, time freezes and the members of the Occult Research Club realize that Gasper has been kidnapped. Several Magicians of the Khaos Brigade's Old Satan Faction appear and they ambush the meeting. Issei volunteers to accompany Rias as she goes to rescue Gasper. Vali attacks the Magicians outside and easily kills them. Rias and Issei are transported to the old school building through castling using Rias' unused Rook piece. Before leaving, Azazel gives Issei two bracelets to control his and Gasper's Sacred Gears. Cattleya Leviathan, a General of the Old Satan Faction, arrives and fights the leaders. Azazel battles with Katerea after insulting her. Kiba, Xenovia and Irina also volunteer to help in battling the Magicians while Grayfia is analyzing the magic circle being used by the Magicians. Issei and Rias arrive at the room where Gasper and Koneko are being held captive. Issei lets Gasper drink his blood, allowing Gasper to properly control his powers. Issei then gives him his bracelet and the four of them head out. "
		)
	,	("HighSchool Dxd New",
		 12,
		 "Clash of the Twin Heavenly Dragons!",
		 "The battle between the Magicians and the allied Three Factions continues as Gasper destroys the transportation circle used by the Magicians. Azazel kills Cattleya by impaling her in the head with his Artificial Sacred Gear, the Downfall Dragon Spear, after he severs his left arm. Vali reveals his treachery and laments that Issei is his rival. When he proposes killing Issei's parents to motivate him to become stronger, Issei furiously enters his Balance Breaker and battles Vali. Issei then takes a huge risk by absorbing in the power of the Divine Dividing into his Boosted Gear. Prompted by Azazel's comment Issei's power increases drastically and inflicts damage to Vali. As Vali prepares for a counterattack, Bikou intervenes and flees with Vali. In the aftermath, Issei asks Michael to allow Asia and Xenovia to pray to God without pain. Sometime later, in response to Sirzechs's request to help Issei, Kiba and Gasper master their Sacred Gear, Azazel is fitted with an artificial arm and becomes the new advisor of the Occult Research Club. He also tells them that Sirzechs has ordered the girls in Rias's peerage to move into the Hyodo Residence. As the girls move in, Rias asks Sirzechs to renovate the house. "
		)
;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("HighSchool Dxd New", 0, 1, 4)
	,	("HighSchool Dxd New", 0, 2, 4)
	,	("HighSchool Dxd New", 0, 3, 4)
;

-- Anime Data
INSERT INTO ANIME(ANIME_TITLE, NUMBER_OF_EPISODES, ANIME_SYNOPSIS, ANIME_DESCRIPTION, COMPANY_NAME, COPYRIGHT) VALUES
		("One Punch Man",
		 12,
		 "Saitama only became a hero for fun, but after three years of special training, he finds that he can beat even the mightiest opponents with a single punch. Though he faces new enemies every day, it turns out being devastatingly powerful is actually kind of a bore. Can a hero be too strong?",
		 "Saitama only became a hero for fun, but after three years of special training, he finds that he can beat even the mightiest opponents with a single punch.",
		 "Madman",
		 "&copy;Shingo Natsume, Tomohiro Suzuki, Chinatsu Matsui / Madhouse"
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("One Punch Man",
		 4,
		 1,
		 "M - Animated violence",
		 12,
		 "https://www.madman.com.au/catalogue/view/39063"
		)
	,	("One Punch Man",
		 3,
		 1,
		 "M - Animated violence",
		 12,
		 "https://www.madman.com.au/catalogue/view/35264"
		)
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("One Punch Man",
		 1,
		 "The Strongest Man",
		 "Vaccine Man wreaks havoc in a city. But as he is about to kill a young girl, Saitama arrives and saves her. Saitama has been living a boring life, as he has extraordinary strength in which he can defeat enemies in one punch. He recalls three years ago, when he was leaving a job interview, he had saved a boy with a cleft-chin from Crablante. Back at the present time, he faces The Brain and Brawn Brothers, one of whom is a huge giant, and defeats them easily. One night, he has a dream about a subterranean race who invade and pose a challenge, but when he wakes, he finds that the subterraneans are extremely weak."
		)
	 ,	("One Punch Man",
		 2,
		 "The Lone Cyborg",
		 "Mosquito Girl attacks the city with her swarms which suck the blood out of everyone alive. An android named Genos tries to stop her but is having a difficult time. After dealing with a single pesky mosquito, Saitama sees Genos and Mosquito Girl fighting, and defeats Mosquito Girl. Despite Genos's extremely boring explanation of his past, Saitama agrees to make Genos his apprentice. Some monsters from a group called the House of Evolution try to capture Saitama, but fail. Saitama questions Armored Gorilla about what's going on."
		)
	,	("One Punch Man",
		 3,
		 "The Obsessive Scientist",
		 "Armored Gorilla tells the story of Doctor Genus, a brilliant young scientist with plans to artificially evolve humans, but becomes disillusioned with the world. Dr. Genus eventually discovers the secret to immortality and makes himself young again, clones himself multiple times, and then works on animals and humanoids to create the monsters that make up the House of Evolution. Saitama cuts off the narration for being too long, at which Armored Gorilla summarizes that Genus just wants to capture Saitama for his experiments. Genos destroys Dr. Genus's eight-floor tower, prompting Dr. Genus to unleash his ultimate creation, Carnage Kabuto, who at first is afraid of Saitama's aura of overwhelming power. Kabuto asks Saitama his secret to his strength, at which Saitama happily tells him, Genos, and Dr. Genus that it is a daily regimen of physical exercise and eating right, much to their disbelief. Kabuto attacks Saitama, but when Saitama realizes that today was supposed to be the big supermarket sale, he quickly punches Kabuto into pieces, and leaves with Genos to rush to the sale. Afterwards, Dr. Genus abandons his research. "
		)
	,	("One Punch Man",
		 4,
		 "The Modern Ninja",
		 "The hard-headed criminal Hammerhead and his posse of bald villains called the Paradisers are sick of working and demand free goods for the unemployed. They try to destroy the building of Zeniru, a local business magnate, using modified suits that give the Paradisers super-strength. Saitama is offended that the Paradisers are giving bald people a bad reputation. Bicycle hero Mumen Rider tries to stop the Paradisers, but is defeated. The Paradisers reach Zeniru's home, but Zeniru has hired a ninja named Speed-o'-Sound Sonic, who wipes out the Paradisers in seconds and puts a kunai knife into the back of Hammerhead's skull. Hammerhead escapes and runs into Saitama, who provokes Hammerhead to attack with his suit at full power. But Saitama destroys Hammerhead’s suit, leaving Hammerhead naked. Sonic fights Saitama, thinking the latter is a Paradiser, but when he accidentally plants his crotch on Saitama's fist, he quivers in agony and retreats. That night, Saitama sulks over his lack of recognition as a hero, when Genos suggests they join the Hero Association. "
		)
	,	("One Punch Man",
		 5,
		 "The Ultimate Master",
		 "Saitama and Genos pass an exam for the Heroes Association. While Genos gets a perfect score and is placed in the highest S-Class tier, Saitama is placed in the lowest C-Class tier, having broken every record in the physical portion of the exam, but doing poorly on the non-physical sections. They then attend an orientation seminar from Snakebite Snek, who is annoyed that Saitama does not pay attention to him. Snek tries to teach him a lesson, only to embarrass himself when he is defeated by Saitama who was not even trying. Having received new upgrades, Genos asks Saitama to spar with him and do it seriously. Saitama humors him but as he is about to get serious, he stops his finishing blow and asks him to come get food with him. A-Class Hero Amai Mask meets with Genos to deliver a welcome gift and a warning to take his responsibilities seriously. Genos moves in with Saitama much to the latter's chagrin. "
		)
	,	("One Punch Man",
		 6,
		 "The Terrifying City",
		 "Saitama tries to come up with ideas for mentoring Genos, but when Genos mentions that C-class heroes who are inactive for more than a week are dropped from their registry, he rushes around to look for petty villains around town without much success. Sonic appears to try to settle their alleged rivalry, but Saitama finds him annoying. Tank-Top Tiger reproaches Saitama for his antics and tries to absorb the credit of being a hero when Sonic attacks them and the populace. Saitama realizes Sonic is doing villanous things and swiftly taps him on the back, knocking him out cold, saving the day. Later that day around Saitama's old neighborhood, a mysterious being was seen skulking around frightening the few masses who lived in the desolate Z-City; perturbed at not being sent out to deal with it, Tatsumaki berates the assignment staff. They have already sent out A-Class' Golden Ball and Spring Mustachio out to the scene. In Z-City the two aforementioned heroes are busy patrolling the streets, wondering about a rumor of a pretty dangerous monster who lives in said area. After finding next to nothing on the job, they eventually find signs of said Mysterious Being and chase after it. Running into Kombu Infinity, who also heard rumors of a powerful group of monsters in the city, engaged the duo and easily swats the best efforts of both aside. Realizing they are outmatched, Mustachio dials for reinforcements just before he is swiftly defeated. Upset that his opponents were so weak, Kombu sets out to create the rumor he and his fellow monsters initially heard about; soon after Saitama returns from a market sale, when Kombu notices him as the former relents on not having been able to secure some kombu soup stalk just before the monster attacks him. When next seen, Saitama is just cooking some kombu soup when Genos comes in. Later Tatsumaki is seen berating the assignment staff for not sending her in to fight. In the post-credits, Genos tells Saitama that, while he's in 17th place within the S-class, he's ranked 6th in popularity, much to Saitama's dismay. Genos then starts reading some online comments about him, but a jealous Saitama tells him to stop. "
		)
	,	("One Punch Man",
		 7,
		 "The Ultimate Disciple",
		 "Just before an incident, scientists and astronomers are busy studying the flight pattern of a meteorite just as it passes over the earth. When its course suddenly changes trajectory a mass warning system breaks out that a huge meteor is about to strike City Z. A notice is sent out to all S-Class heroes to intercept the meteor. Genos receives the notice while at home, conversing with Saitama about hero rankings. However, only Genos arrives on the scene, followed by an aged S-Class hero Bang. He tells Genos the meteor evacuation protocols have already begun and that he should clear out before it is too late, Bang himself cannot leave the city due to family honor and personal reasons, and before he could formally introduce himself, Genos has already left. Genos theorizes that it is too late to evacuate, seeing the meteor approaching too fast. His resolutions affirmed when he realized that his master also lives in this city. Another S-Class hero named Metal Knight shows up to test out a new weapon against the meteor but is uninterested in teaming up with another hero to avert the crisis. When his new weapon fails, Genos used his own prototype weapon on the meteor. Despite the overwhelming power displayed, he fails to stop the meteor. Saitama shows up and destroys the meteor with a single punch, impressing Bang and boosting Genos' admiration toward Saitama. However, the meteor shatters into several meteorites and still manages to destroy the city. The next day, Saitama learns that his rank has jumped from 300th to 5th, although he still remains a C-Class hero. Genos theorizes that, despite Saitama's S-Class achievement, people must have believed it was Genos and Metal Knight who had destroyed the meteor. After a quick discussion about threat levels and words of being a hero that inspires Genos, Saitama goes out to look for more crisis to boost his own rank. Much of the city is destroyed but despite that, there are zero casualties reported. Tanktop Tiger appears and believes Saitama has stolen credit for the meteor destruction. Tanktop Tiger calls his brother Tanktop Black Hole, who begins to rally up a mob against Saitama, putting all the blame on him for the city's destruction. Tanktop Tiger attacks Saitama, who was later punched into the sky. Tanktop Blackhole attacks next, and Saitama catches his fist, crushing it. Saitama then moves on to the crowd, who were chanting for his resignation, and he shouts for everyone to shut up. Saitama clarifies that he is being a hero because he wants to and does not need to be appreciated for it. Genos appears and tells Saitama that it is time for them to go home, and speaking internally, despite what the world thinks of Saitama, he knows that his master is the greatest hero of all. In the post-credits, a myriad of creatures located under the sea discuss Saitama's victory over the meteor. "
		)
	,	("One Punch Man",
		 8,
		 "The Deep Sea King",
		 "The episode opens with an octopus-like monster announcing that the Seafolk are coming to the surface to kill all the humans. Saitama is on his way home from shopping and stops by to punch the messenger. Mumen Rider is late to the scene and sees only the destroyed body of the creature, and hears the crowd talking about Saitama. Mumen looks Saitama up on the internet and sees that he is powerful, but opinions are divided on him. At the coast, several large Sea-Folk monsters emerge from the sea, threatening City J. The Class A hero Stinger (rank 11) challenges them with his powerful Bamboo Shoot weapon. Meanwhile, Genos is drying dishes with his rocket hands as Saitama watches a news report about Stinger's battle against the Sea-Folk. They decide to head out to confront the threat. Back at the fight, Stinger takes out the last four Seafolk with a Gigantic Drill Stinger Quadruple Thrust attack, but is then bested by a new monster: Deep Sea King. Saitama, Genos, and Mumen Rider all set off to confront the threat. Genos splits off from Saitama to scout ahead. Various other heroes confront Deep Sea King to no avail, including Lightning Max (class A), Puri-Puri Prisoner (class S), and Sonic (not technically a hero). Sonic fights Sea King to a standstill, but when it starts raining, Sea King unleashes his true form and Sonic is forced to retreat. Meanwhile, Saitama and Mumen Rider meet each other on the way to the fight. Saitama goes off to find Sonic who he sees running naked through the rain. Mumen gets a phone call from Hero Association headquarters and goes to confront Sea King, who has broken into an emergency shelter and is dispatching the heroes there ranging from All Back-Man, Bunbunman, Jet Nice Guy, and Sneck. Saitama returns to where he met Mumen Rider to find a discarded cell phone. The episode ends with Saitama telling the Hero Association he is on his way. "
		)
	,	("One Punch Man",
		 9,
		 "Unyielding Justice",
		 "As Saitama is waiting for the Hero Association to decide whether they want him to help fight the Deep Sea King or not, Genos initiates battle, and seemingly defeats the monster with a massive attack. However, he lets his guard down and gets one of his arms ripped off. He tells the townspeople to run while he distracts the monster, since victory is no longer assured. He seems to be doing a good job, until the Deep Sea King launches a glob of acid at a child, which Genos intercepts, and it melts his bionic body, nearly killing him. In that moment, right before the Sea King would have finished Genos off, Mumen Rider appears and engages the Deep Sea King. He is defeated easily, but refuses to give up. Upon seeing this, the townspeople decide to encourage him, but to no avail. When Mumen Rider is knocked out, he is caught by Saitama, who had been instructed by the Association to provide backup and arrives in that exact moment. After exchanging a few words with the Deep Sea King, he defeats him with a single punch which also stops the rain and is praised by the townspeople. Sonic also reappears with his weapons in a different part of town, but assumes the Sea King must have fled. Back at their apartment, Genos and Saitama get a delivery of fan mail from the Hero Association. Genos is praised, while Saitama gets a hateful letter, calling him a cheat. The episode reverts to a flashback from right after Saitama's victory. The townspeople are ecstatic to have been saved and are impressed by Saitama's swift victory. However, one of them starts badmouthing the other heroes, saying how they must have been frauds, no matter their rank, since they got beaten. His reasoning is that the Deep Sea King could not have been that tough if a Class C hero defeated it in one punch. Upon hearing this, Saitama laughs, and downplays his victory to save the reputations of the other heroes by saying that he got lucky and the job was easy for him, since he came late and the monster had been weakened. He also tells the townspeople to care for the fallen heroes, so he can continue to cash in on their work. The townspeople accept him as nothing but a fraud and thank the defeated heroes for their work. Genos decides not to interfere with Saitama's decision, but promises to intervene if this choice were ever to push Saitama into a corner in the future. The episode jumps back to present time, and Saitama realizes he has another letter - this one only saying &quot;Thank You!&quot;. He then finds a third letter from the Hero Association, telling him he is now 1st Rank C-class, and calling him in to discuss a promotion to B class. Saitama accepts, making him 101st Rank, B-class. The episode jumps to Amai Mask during what seems to be a photo shoot. One of his subordinates tells him that Saitama moved up a rank. Amai Mask seems to not care, as he is disappointed by the work of the A- and S-Rank heroes in the Sea King case. However, he changes his mind when he is told that Saitama was the one to actually defeat the monster. Meanwhile in the hospital, Lightning Mask and Stinger are recuperating when Puri-Puri Prisoner enters wanting to administer &quot;Angel Shots&quot; to the two. They escape, dropping the newspapers they had been reading, and Puri-Puri Prisoner is upset when he sees that he is called an &quot;S-Rank Failure&quot; in the news. The episode ends with Saitama walking home at night with his promotion. He encounters Mumen Rider in a roadside oden shop. Mumen Rider reveals he sent the thank-you letter and pays for Saitama's dinner. In the post-credits, a fortune teller named Madame Shibabawa warns an official from the Hero Association that &quot;the Earth is doomed&quot;. "
		)
	,	("One Punch Man",
		 10,
		 "Unparalleled Peril",
		 "The Ancient King of the Terror Lizard Clan appears and Tatsumaki is sent to deal with him. After a short quarrel, Tatsumaki sends a meteor from outer space to destroy the monster. At Bang's dojo, Bang tells Saitama and Genos, who were called there by Bang to learn some moves, about how his former best student, Garo, went wild and defeated all of his other top students. Suddenly, a Hero Association member comes and informs the heroes that an emergency has been declared and all S Class heroes have been called to a meeting. At the association, Saitama meets Atomic Samurai, an arrogant S Class hero, and the other S Class heroes, Puri-Puri Prisoner, Metal Bat, Tanktop Master, Flashy Flash, Watchdog Man, Superalloy Blackluster, Pig God, Drive Knight, Zombieman, King, Child Emperor, except for Metal Knight and Blast, who are absent. Sitch, a member of the associations, starts the meeting by telling the heroes that the emergency would be perilous and even with their skills, there is no guarantee of survival. Also, the great seer, Madame Shibabawa, had died while becoming agitated and choking on a cough pill because of a coughing fit while predicting the future. Sitch mentions that Shibabawa's predictions have always been 100% accurate, be it monster attacks or natural disasters. Before she died, she left a note, thought to be her greatest prophecy. The note read &quot;The Earth is in trouble&quot;, alarming the heroes. He warns the heroes to prepare for a fight in the next 6 months. Just after he says this, the HQ is attacked by the Skyfolk led by Sky King, who are quickly slain by Melzalgald, a member of an alien race called the Dark Matter Thieves. An alien spacecraft then proceeds to destroy City A, causing a large number of casualties as their alien invasion begins. Just as Melzalgald is about to kill some City A civilians, Iairon, a student of Atomic Samurai, arrives and engages him in battle. Saitama encounters the alien ship and advances towards it, avoiding some projectiles thrown at him and damaging the ship. Meanwhile, Melzalgald proves to be a challenge for Iaian and causes him to lose his left arm before Atomic Samurai intervenes, saving his student from death. Melzalgald, however, regenerates and the heroes' attacks seem to cause no damage to him. Then, Metal Bat, Bang and Puri Puri Prisoner arrives. Puri Puri Prisoner enters Angel style and attacks Melzalgald. Elsewhere, the other S Class heroes discuss how to bring down the ship. As they offer differing views, Genos notes that Saitama has already entered the ship and slain a large number of the aliens. He comments that there is no evil that Saitama is unable to defeat. Saitama encounters Goribas, an alien, bragging how to defeat him. But is slain, as Saitama punches at everything and continues to destroy the ship, wondering where the boss might be. At the end, Boros is seen on his throne. "
		)
	,	("One Punch Man",
		 11,
		 "The Dominator of the Universe",
		 "Geryuganshoop complains about Groribas' defeat as he and Melzargard are the only ELITE fighters left on the ship. Boros walks in and Geryuganshoop informs Lord Boros that the ship is badly damaged by the human intruder but Lord Boros tells him not to fear as the sphere keeping them safe won't allow that to happen. Meanwhile, below the ship, Puri Puri Prisoner's efforts were futile as Melzargard simply regenerates back into his form. Iaian tells the other heroes that it is pointless to keep trying. Melzargard tells his other head to go and contact the ship for a bombardment. As the head flies away, Metal Bat smacks him down. Melzargard and Geryuganshoop telepathically tell each other that both sides are dealing with big trouble as Saitama reaches another door. Atomic Samurai, Puri Puri Prisoner and Bang join forces and attack Melzargard together as Iaian tells them once more that direct hits have no effect on it. He tells them to retreat and think of a better way to handle the situation. Atomic Samurai, Puri Puri Prisoner, Bang and Metal Bat keeps attacking Melzargard telling Iai it is the only thing they know. Melzargard and Genryuganshoop again speak telepathically saying the life forms below are persistently attacking him and requested for a cleansing bombardment. Genryuganshoop is too busy but notifies the artillery crew. Genryuganshoop leaves the conversation and while Melzargard was distracted, Metal Bat finds a marble within Melzargard before he could regenerate thus destroying the marble and part of Melzargard for good. Genryuganshoop tries to lead Saitama out of the ship and Saitama went the opposite direction to find the controls room. He finally finds Genryuganshoop who has incredible telepathic powers that can manipulate everything and anything but in the end Saitama throws a pebble at him that destroys Genryuganshoop. After busting the other heads, the four heroes look up with shell bombardment ready to attack. After it shoots, Tatsumaki appears and stops the bullets in mid air, cursing the other four heroes fighting Melzargard. She then turns the bullets and forces them back onto the ship full force. Mumen Rider helps evacuate a victim to safety, when Stinger and Lightning Max appear wanting to help too. Bang on the other hand finds another marble and crushes it. Angry, Melzargard slaps the concrete along with Bang, who takes a direct hit. He sticks on a building, unconscious. With one more head left, Melzargard threatens to crush Atomic Samurai's head and he retaliates after seeing his comrade in that condition. Saitama finds Boros who scans him for power, saying Saitama is Earth's strongest warrior with limitless energy. Boros treats Saitama with respect and tells him his name and the prophecy that brought the Dominator of the Universe to Earth. Saitama punches Boros after being annoyed with what he heard, telling him he can't attack other planets just to liven up his boring life. Boros' armor used to seal in his immense power breaks apart and his true form emerges. "
		)
	,	("One Punch Man",
		 12,
		 "The Strongest Hero",
		 "Boros continues to fight with Saitama, which leads to Boros losing an arm. The fight continues on, even reaching the point where Saitama finds himself on the moon, but he quickly returns. Meanwhile, Mumen Rider, Stinger, and Lightning Max rescue the last of the City A survivors. Tanktop Master tries to attack the ship by throwing a piece of rubble at it, only for Tatsumaki to throw dozens of pieces of rubble at the ship. The fight between the heroes and Melzargard concludes when Bang recovers and destroys his final marble, killing him. The fight between Saitama and Boros continues and it is revealed that Boros has regenerative powers. Eventually, they are both forced to use their most powerful moves. Saitama emerges victorious, and Boros admits he was not even close to Saitama. After the fight, Drive Knight warns Genos that Metal Knight is his enemy. Amai Mask appears and blames the S-class heroes for the destruction of City A, nearly causing a fight which is interrupted by Metal Knight who emerges to salvage parts of the ship. Meanwhile, Superalloy Blackluster discovers alien survivors whom Amai Mask promptly executes. Genos sees his past self in Amai Mask. Saitama emerges from the ship to find Tornado having a tantrum, and Genos quickly begins an argument with her; Bang interrupts before it can escalate into a fight. The parts Metal Knight salvages from the ship are used to rebuild the hero HQ which takes the place of City A which is wiped off the map. The A and S Class heroes are invited to stay in the newly rebuilt hero HQ. In the post-credits, Saitama destroys Pluton: King of the Underworld with one punch, much to his irritation. "
		)
;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("One Punch Man", 0, 1, 4)
	,	("One Punch Man", 0, 2, 4)
	,	("One Punch Man", 0, 3, 4)
;

-- Anime Data
INSERT INTO ANIME(ANIME_TITLE, NUMBER_OF_EPISODES, ANIME_SYNOPSIS, ANIME_DESCRIPTION, COMPANY_NAME, COPYRIGHT) VALUES
		("Yurikuma Arashi",
		 12,
		 "<p>From Kunihiko Ikuhara, the director of Sailor Moon and Revolutionary Girl Utena, comes a beautifully animated, allegorical tale of love, loss, and bear attacks - Yurikuma Arashi.</p>
		 <p>In a world divided between humans and hyper-intelligent, man-eating bears, Kureha attends an all-girls school and holds onto a simple wish&#8212;to spend the rest of her life with her classmate and soul mate, Sumika. But after a secret rendezvous ends in tragedy, Kureha vows to never back down on her love and put a bullet in any bear she meets.</p>
		 <p>As she plots her revenge, the bear-attack body count begins to rise and two strange girls transfer into Kureha&apos;s class. She doesn&apos;t know it yet, but the girls who call themselves Ginko and Lulu are actually criminal bears in disguise! As they try to win Kureha&apos;s heart , an army of high school girls gears up to go to war with all of bear-kind and anyone else who stands up for love. At this rate, getting the yuri seal of approval from an interdimensional tribunal of cool, beautiful, sexy judges is going to be the least of their troubles.</p>",
		 "In a world divided between humans and hyper-intelligent, man-eating bears, Kureha attends an all-girls school and holds onto a simple wish&#8212;to spend the rest of her life with her classmate and soul mate, Sumika.",
		 "Madman",
		 "&copy; 2015 Ikunigomamonaka/Yurikumanikuru"
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("Yurikuma Arashi",
		 3,
		 1,
		 "M - Sexualised imagery and animated nudity",
		 12,
		 "https://www.madman.com.au/catalogue/view/32025"
		)
	,	("Yurikuma Arashi",
		 4,
		 1,
		 "M - Sexualised imagery and animated nudity",
		 12,
		 "https://www.madman.com.au/catalogue/view/37001"
		)
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("Yurikuma Arashi",
		 1,
		 "Never Back Down On Love",
		 "A long time ago, a far off planet known as Kumaria exploded, resulting in its shards falling upon Earth and causing the bears to attack the humans, resulting in a large wall being erected to separate them from the humans. In the present day, two bears, Ginko Yurishiro and Lulu Yurigasaki, disguise themselves as humans and enrol in Arashigaoka Academy, where Ginko takes an interest in a girl named Kureha Tsubaki, becoming jealous of her relationship with Sumika Izumino. When their favorite lily garden is butchered, the class president Mitsuko Yurizono offers to help Kureha and Sumika, who all become cautious when they are attacked by a brick out of nowhere. The next day, as Sumika mysteriously disappears, Kureha receives an anonymous call asking if her love for Sumika is real, leading Kureha to the rooftop where she is attacked by bears. Meanwhile, Ginko and Lulu undergo a &quot;yuri trial&quot; held by the mysterious Life Judgement Guys of Severance Court, who grant them &quot;yuri approval&quot;, in which they transform into half-bear half-human form and lick nectar from a lily flower growing from Kureha's chest. As Kureha recovers, wondering if what she saw was a dream, Mitsuko discovers Ginko and Lulu in their bear forms eating a girl behind the lily garden."
		)
	,	("Yurikuma Arashi",
		 2,
		 "I Will Never Forgive You",
		 "Sumika is declared dead, much to the shock of Kureha, while Mitsuko remains suspicious of Ginko and Lulu. Later, Ginko and Lulu show up at Kureha's house, where Ginko starts making a move on Kureha until Mitsuko shows up, aiming her gun at Ginko and Lulu. As Mitsuko chases after them, Kureha receives another anonymous call calling her to the rooftop, where another bear &#8212; who is secretly her classmate Konomi Yurikawa &#8212; attacks her, being jealous of Mitsuko's closeness to Kureha. After another yuri trial, during which Ginko and Lulu once again lick nectar from Kureha's lily, Mitsuko shows up to shoot the attacking bear. While Kureha rests from the experience, it is revealed that Mitsuko is actually a bear herself, the one who killed Sumika, and is now targeting Kureha."
		)
	,	("Yurikuma Arashi",
		 3,
		 "Invisible Storm",
		 "Kureha speaks with her teacher, Yurika Hakonaka, who was a friend of her late mother, Reia, stating her worries that there's another bear around. Meanwhile, Mitsuko sways another girl, Eriko Oniyama, into becoming the leader of a group of students known as &quot;The Invisible Storm&quot; to further her schemes to ensnare Kureha. As Kureha becomes determined not to forget her love for Sumika, she receives another summon to the school roof. There, she is confronted by Mitsuko, who reveals her identity as the bear who killed Sumika. With Kureha backed into a corner, Ginko and Lulu undergo yet another yuri trial in order to save her from Mitsuko, giving her the strength to shoot Mitsuko down. Later that night, Ginko and Lulu bring Eriko to the lily garden in order to eat her. "
		)
	,	("Yurikuma Arashi",
		 4,
		 "I Can't Get A Kiss",
		 "The Life Judgement Guys of Severance Court explain how Lulu was once the princess of a kingdom of bears. One day, when the Kumaria meteor shower fell upon Earth, Lulu received a younger brother named Milne who took her place as first in line for the throne. Wanting to be the kingdom's favorite again, Lulu made several attempts to get rid of Milne, only for him to return each time, bringing her a &quot;promise kiss&quot; in the form of a jar of honey, which she would then throw away. One day, however, Milne died after being stung by bees whilst trying to get more honey, which left Lulu unhappy despite getting what she wanted. Several years later, Ginko appeared before Lulu, bringing her the honey that Milne had previously tried to give her and reminding her not to forget what she has lost. Hearing about her mission to cross the Wall of Severance and deliver her love to someone, Lulu decided to help Ginko fulfill her promise kiss and accompanied her on her journey. Back in the present, Kureha rejects Lulu's offer to look after her, stating her only friend is Sumika, while Ginko is seen with a necklace that belonged to Reia."
		)
	,	("Yurikuma Arashi",
		 5,
		 "I Want To Have You All To Myself",
		 "As Kureha continues to reject offers of friendship from Ginko and Lulu, who move into her house, Yurika, who refuses to believe her story that Mitsuko was a bear, tells her about the necklace she once gave to Reia. Later, as Ginko recalls that 11 years ago, she was rescued by a young Kureha, Kureha shoots down another offer of friendship from her classmate, Kaoru Harishima. The next day, Kaoru offers to make things up to Kureha by getting all of her classmates to repair the lily garden for her birthday. However, Ginko and Lulu overhear Kaoru and the Invisible Storm once again plotting against Kureha. After undergoing another yuri approval, Ginko and Lulu chase after Kaoru, but Ginko gets caught by a bear trap that Kaoru had laid out in advance."
		)
	,	("Yurikuma Arashi",
		 6,
		 "The Moon Girl and the Forest Girl",
		 "In a flashback, Sumika is seen writing a letter to be opened by Kureha on her birthday, reflecting on their relationship together and a book that Reia was writing before she died. Having been excluded from the Invisible Storm after not voting for Kureha to be excluded, Sumika was coerced by Kaoru to write a letter to Kureha announcing Kaoru as her new friend to protect her from the Invisible Storm. Back in the present, Lulu helps Ginko escape from Kaoru, who is seen collaborating with a secret partner who had informed her of the bears' identities. The next day, at Kureha's birthday party, Kaoru reveals she had tricked both Kureha and Sumika, setting fire to her flowerbed and throwing Sumika's letter into it. However, Ginko, despite still being injured, risks her life to protect the letter from the fire. Upon reading the letter that Ginko rescued out of love, Kureha finds new meaning in Sumika's words which tell her that the people in front of her are her new friends. At the very end, a flashback shows that Ginko was present when Mitsuko attacked Sumika, and didn't help her."
		)
	,	("Yurikuma Arashi",
		 7,
		 "The Girl That I Forgot",
		 "Kaoru's partner turns out to be a bear, who betrays and kills her. Meanwhile, as Kureha looks after an injured Ginko, she has a strange vision about her, which leads her to recall having a friend that she had completely forgotten about. Kureha tries asking Yurika about it, learning that this friend is the one who inspired Reia's book. Meanwhile, Ginko recalls her past, in which she was an orphaned cub who was drafted into a war against the humans. After being critically injured by a gunshot and abandoned by her fellow bears, she was rescued by a young Kureha, who she called Lady Kumaria, a name also used in Reia's book. As Kureha comes to realise that Ginko was her friend that she had forgotten about, Lulu finds a threatening letter addressed to Ginko describing what crime she had committed."
		)
	,	("Yurikuma Arashi",
		 8,
		 "Bride-in-the-Box",
		 "Twenty years ago, Yurika, revealed to be a bear, was taken in as a cub by a man only known as &quoteHim&quote, who taught her that she must box up her important things lest they become sullied. Eventually, Yurika ended up killing him when he tried to leave her for another unsullied thing. Having lived alone at Arashigaoka Academy since, Yurika was eventually befriended by Reia, becoming close to her and giving her a pendant as a sign of their love. However, she felt betrayed when Reia eventually gave birth to Kureha, and a few years later, Yurika killed and ate Reia after she gave her pendant to Ginko, feeling that Reia had thrown her love away. Back in the present, Kureha, who had heard Reia's pendant was taken by the bear who killed her, is shocked to find Ginko wearing it. The next day, Yurika reveals to Kureha that Ginko and Lulu are bears, claiming they were the ones who killed Reia. Later, the Life Judgement Guys call Kureha, Ginko, and Yurika to the rooftop, where Yurika tries to coerce Kureha into killing Ginko, who denies killing Reia but is willing to be shot if it will satisfy Kureha, thinking that way she will receive Kureha's love. Just as Kureha is about to give up on shooting Ginko, thinking about all the things Ginko has done for her, Lulu appears and tells Kureha about the crime that Ginko had committed concerning Sumika, prompting Kureha to shoot Ginko."
		)
	,	("Yurikuma Arashi",
		 9,
		 "The Future of the Girls",
		 "Mitsuko, who claims to be a ghost of desire, appears before Ginko at a place known as the Door to Friendship. There they recount the events surrounding Sumika's death, in which Ginko had the chance to warn Sumika about Mitsuko's impending attack, but was held back by jealousy after hearing about her relationship with Kureha and let her die. After telling her about how Yurika manipulated Lulu into betraying her and plans to target Kureha, Mitsuko merges herself into Ginko's body, taking control of her. Meanwhile, the Invisible Storm, who have learned that Konomi was a bear and accepted Kureha into their group, suspect that there is another bear among their class. As Kureha, who shot Ginko after Lulu revealed she was Mitsuko's accomplice, is uncertain about whether Ginko was telling the truth about killing Sumika, Yurika impersonates the Life Judgement Guys to summon Kureha to the flowerbed, where she attempts to eat Kureha to fill the emptiness left inside her after eating Reia, only to be shot by the Invisible Storm students. Mistaking her for Reia in her dying breath, Yurika points Kureha towards the missing pages of Reia's picture book that she had stolen previously."
		)
	,	("Yurikuma Arashi",
		 10,
		 "The Door to Friendship",
		 "As the Invisible Storm convert Konomi's body into a cyborg to aid in their bear hunt, Kureha reads the rest of Reia's story, in which the moon girl and forest girl managed to meet and fulfill their love for each other. Later, Lulu comes around to bring Kureha her mother's pendant and explains why Ginko blamed herself for Sumika's death, stating it was because of her own jealousy that she betrayed Ginko. The pendant turns out to be a key which reveals a photo of Kureha, Reia, and Ginko together. As Kureha ponders why she can't remember being friends with Ginko, and whether or not she can forgive her, she and Lulu are forced to go on the run when the Invisible Storm learn Lulu is a bear and go on the hunt for her. Along the way, Lulu explains the nature of the yuri trials to Kureha, explaining that Kureha's memories of her was a price Ginko paid in order to undergo yuri approval. As punishment for revealing the secret behind her transformation, the Life Judgement Guys terminate Lulu's yuri approval, turning her back into a bear, but Kureha nonetheless remains determined to protect her. Recalling the Door of Friendship at the lily garden, which is how she first came to meet Ginko all those years ago, Kureha helps Lulu escape back to the bear world before being caught by the Invisible Storm. "
		)
	,	("Yurikuma Arashi",
		 11,
		 "What We Hope For",
		 "Ginko recalls when she was first met Kureha. When Kureha passed out due to the cold, a mysterious being gave her a lily, encouraging Ginko to take her the rest of the way. As Kureha and Ginko spend their days being friends with each other, Kureha was bullied by her peers for her affinity towards bears. Wanting to protect Kureha, Ginko made a deal to become a human girl in exchange for Kureha's memories of her. After being sent back to the bear world by Reia, Ginko was exiled by her peers for being in love with a human, and so waited until the day she met Lulu and crossed the Wall of Severance with her. Back in the present, the Invisible Storm hold Kureha captive in order to lure out Ginko, who is being driven by Mitsuko's influence to eat Kureha. However, Ginko manages to reject Mitsuko, and thus her desire to eat Kureha, in favor of true love. On the rooftop, Kureha tries to turn Ginko away in order to protect her from snipers, but just as the sniper fires, Lulu steps in to take the hit instead, sacrificing herself to protect Ginko."
		)
	,	("Yurikuma Arashi",
		 12,
		 "Yuri Kuma Arashi",
		 "The Invisible Storm prepare a public execution of Ginko using their beam cannon as a way of punishing Kureha. Kureha, understanding that Ginko was her friend all along, is summoned to Severance Court, remembering that she was the one who requested that Ginko be turned into a human on the condition that she relinquish her love of Ginko by experiencing temporary amnesia in order to prove that her crime of being prideful was false all along. As Kureha approaches Ginko and prepares to give her the promise kiss, Lady Kumaria appears from the heavens and turns out to actually be Sumika, who taught her true love for Ginko was allowing her to withstand the exclusion ceremony. Realizing her true love for Ginko, Kureha calls out to Kumaria, who acknowledges Kureha's love as the true thing and turns her into a bear so that she can confess her love to Ginko. The Invisible Storm attempts to fire upon them, but they escape beyond the Wall of Severance. Having observed what had happened, the manager of the beam cannon, Uchiko, decides to go against the Invisible Storm and becomes friends with the abandoned Konomi. It is shown that Lulu and Milne have reunited in the afterlife, and Lulu explains to Milne the ending of the storybook; then, to her surprise, Milne gave her a kiss on the cheek. Nobody has seen Kureha and Ginko since they have begun their new life together."
		)
;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("Yurikuma Arashi", 0, 1, 4)
	,	("Yurikuma Arashi", 0, 2, 4)
	,	("Yurikuma Arashi", 0, 3, 4)
;

INSERT INTO ANIME(ANIME_TITLE, NUMBER_OF_EPISODES, ANIME_SYNOPSIS, ANIME_DESCRIPTION, COMPANY_NAME, COPYRIGHT) VALUES
		("Canaan",
		 13,
		 "UA: Experimental virus thought to be developed by the CIA, its name taken from the Swahili word for &quot;kill&quot; and &quot;flower&quot;. Exposure to UA usually results in death within 12 hours from severe bleeding. There is no known cure, though clandestine organisations are working on an anti-virus. Survivors of the virus are known as Borners and are left with permanent blood vessel patterns on the skin resembling spidery flowers. Canaan is a war orphan from the Middle East, rescued from the ruins of her war-torn village and raised by an ex-mercenary named Sham. Gifted with synaesthesia (a rare condition in which the body's senses trigger visual patterns), Canaan's life is set for revenge when Sham is murdered by Alphard - the leader of a bio-terrorism organisation known as Snake, who have claimed responsibility for UA attacks on China and Japan. Close to obtaining the only known anti-virus to UA and wishing to profit from its possession, Alphard's only obstacle is a woman from her past known as Canaan... An explosive anime thriller set in the marketplaces and remote countryside of China, Canaan is an incendiary conspiracy story directed by Masahiro Ando (Full Metal Alchemist, Cowboy Bebop, Sword of the Stranger) and animated by P.A. Works (Afro Samurai: Resurrection, Angel Beats!).",
		 "UA: Experimental virus thought to be developed by the CIA, its name taken from the Swahili word for &quot;kill&quot; and &quot;flower&quot;.",
		 "Siren",
		 "Masahiro Ando"
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("Canaan",
		 1,
		 1,
		 "MA15+ - Strong Animated Violence",
		 13,
		 "http://sirenvisual.com.au/index.php/shop/canaan.html"
		)
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("Canaan",
		 1,
		 "Evil, Flood-Colored City",
		 "Maria Ōsawa and Minoru Minorikawa are dispatched to Shanghai from Japan, two years after the events of 428: Shibuya Scramble, to cover the upcoming International Anti-Terrorism Conference in the city with various world leaders coming to attend the meeting. Canaan, a Middle Eastern teenaged mercenary, was in the city as well after meeting with the unknown female contact with information that her rival Alphard Al Sheya was captured and secretly detained in Karachi, Pakistan by covert operators of the CIA's Special Activities Division. When Maria comes to see an unknown man dead with the Ua virus, Canaan saves her from being assassinated by masked gunmen before she defeats the rest of them without alerting and panicking the public with heightened senses in synesthesia. Meanwhile, the CIA's SAD convoy comes under attack from an IED ambush while transporting Alphard in their custody."
		)
	,	("Canaan",
		 2,
		 "Worthless Games",
		 "Liang Qi and Cummings led an airborne attack against the CIA SAD convoy consisting of air-to-surface-missiles and GPMG gunfire in order to free Alphard from their custody. Minoru, in a flashback, remembers that his superiors requested him to train Maria in order to become a professional photographer after surviving the events in Shibuya. While eating dinner in Shanghai, Maria and Minoru are targeted by an unknown old man who resembled the official Minoru saw on television en route to the city. Canaan arrives on the scene to save the two reporters from the Mini-Uzi-wielding man, before she was targeted for death by the man himself. He then dies by electrocution. The two reporters were later kicked out of their hotel room due to the mess created by unknown men. Minoru later contemplated about the mysterious T-shaped purple mark he saw from the old man and a corpse found from the festival he visited a day earlier."
		 )
	,	("Canaan",
		 3,
		 "Trivialities",
		 "Deciding to take a lead in the T-shaped purple mark Minoru saw recently, he and Maria visited a Japanese-themed bar to ask a woman before he is stopped by the establishment's bartender. Meanwhile, Alphard began to make plans for an unknown event while Liang Qi is irritated over Alphard's ignorance for her to attack Canaan right away. Canaan later was able to visit Maria with the help of her synesthesia-based abilities despite that she and Minoru were forced to stay in a run-down apartment. Maria and Canaan later decide to take a tour around Shanghai, the two of them visiting the Bund Sightseeing Tunnel when Canaan was lured away from the tram to check on a supposed trap before running back to see Maria missing. Canaan fights against a young boy who told her that he is a Borner due to his mysterious ability after being infected with the Ua virus, which in case gave him the ability to hide in narrow passages. Canaan killed him with a well-placed shot in the body to obtain the detonator for the explosive placed on Maria's head after she was restrained."
		 )
	,	("Canaan",
		 4,
		 "Lingering Sunset",
		 "Canaan remembers why she wanted to take down Alphard while removing the bullet head from her left arm sustained from being shot in the tunnels of the Bund Sightseeing Tunnel. Maria later has PTSD over the events of her detention and rescue by Canaan, not knowing that Canaan is really an armed mercenary and assassin for real and not the girl she knew from years ago. Alphard, with Liang Qi and Cummings, attend a public function dedicated to the upcoming NBCR International Anti-Terrorism Conference with the selection of the Daedala Corporation, a Private military company that has the Chinese government as its major client to assist Chinese security forces in safeguarding diplomats for the upcoming conference with Cummings as the public head of the company. In a public toilet, Canaan confronts Alphard privately with the latter taunting her for her failure to protect Siam from getting killed years ago. Canaan later flees when Alphard fires her FN Five-Seven USG at the sprinklers. "
		 )
	,	("Canaan",
		 5,
		 "Friends",
		 "Maria stays with a girl named Yunyun in her personal houseboat a day after she wanders off in an alleyway without Canaan. Yunyun is later summoned by Liang Qi with a mission assigned to her. Maria and Minoru later investigate the T-shaped marks with the assistance of Japanese physicians back in Japan to study them and find out what has caused them for themselves. Canaan later meets Yunyun embarrassingly as part of the latter's mission is to get rid of her. Despite pleas from Maria, Canaan and Yunyun continue to face off against each other unsuccessfully with a plan by Yunyun to kill herself and Canaan with dynamite mounted throughout her entire body before Canaan decides to save the girl out of pity for Maria since she is her only friend. Back in Maria and Minoru's rented apartment room, Yunyun confesses to her true state as a Borner, but without any kind of special abilities granted to her by the Ua virus' infection since it merely gave her two appendixes. Minoru later pays him with money to help her be a double agent to both him and the Snakes as his personal informant. "
		 )
	,	("Canaan",
		 6,
		 "Love and Piece",
		 "Minoru later learns of a village in the Kashmir region, where most of its residents were purposely infected by the Ua virus with a few survivors being dubbed as Borners for having mysterious abilities given to them by the virus. Minoru later meets with Hakko, one of the employees of the bar he visited revealed to the reporter his suspicions that she was a Borner. The NBCR Anti-Terrorism Conference was now underway with armed Daedala PMCs protecting the dignitaries in the Shanghai International Conference Hall with armed policemen of the Chinese Ministry of Public Security. Liang Qi later perpetrates the bombing of the hall's interior after the American President concluded his speech. Canaan and Minoru head to the hall themselves to secure Maria themselves after hearing the bombings. Armed Public Security policemen later confronted Daedala contractors when they, later with Alphard, attacked the officers when they were trying to get to the building's central control room. Maria is detained by Daedala forces under Liang Qi's instruction to lure Canaan in and kill her. But remembering the words taught to her by Siam in her youth, Alphard shoots Liang Qi to prevent her from further attacking Maria. Meanwhile, all of the dignitaries were in the underground bunker as planned in case of a terrorist attack in order to be eventually infected by the Ua virus. "
		 )
	,	("Canaan",
		 7,
		 "Gravestones",
		 "The American government convenes an emergency meeting after a dignitary dies from a Ua virus infection. Alphard ignores Liang Qi's anger over her qualms of killing Canaan. Kenji Ōsawa, head of Okashi Pharmaceutical, had planned to send the anti-Ua virus vaccine to Shanghai when he was supposedly killed in a car bomb. This &quot;event&quot; forced the American military to send in B-2 bombers from Guam to bomb the entire Shanghai International Conference Hall in order to purge the Ua virus in flames and prevent in from spreading throughout Shanghai. Canaan infiltrates the hall, rescuing Maria after fending off several Daedala security forces personnel impending her progress. Canaan and Yuri Natsume worked together to hack the B-2's GPS system and let the bombs miss the conference hall to save the dignitaries inside while heavily armed PLA Special Operations Forces troopers escorted Kenji safely at the outskirts of the hall. Alphard and Cummings retreat underground with a handful of Daedala security forces, the former already deciding to abandon Liang Qi to let her fend for herself. When Maria and Canaan emerge outside, Canaan had collapsed due to her exhaustive use of her synesthesia abilities. "
		 )
	,	("Canaan",
		 8,
		 "Voice",
		 "Canaan emerged safe after she collapsed, being told by Maria that she was simply tired. Kenji, in a phone conversation with Minoru, further informs him of the Ua virus and how sometimes people can survive from the virus' infection. The American Vice President later has a tapped phone conversation with Alphard, thanking him for the cooperation she had with him in the nature of ensuring &quot;anti-terrorism&quot; business keeps going for a few more years. During a public concert, Hakko showed off her Borner ability with people having severe headaches without them being aware. It later forced Canaan and Maria to flee as Hakko had nightmares of how she first knew of her ability from being infected with the Ua virus. Minoru later confronts Santana, Hakko's &quot;guardian&quot;, over the nature of the Borners and the Ua virus. Canaan and Maria later go on a long cruise with Santana, Minoru and Hakko in a SUV that took them to the desert regions of China. Maria and Canaan later talked about being together and reaffirming their friendship since it helped them over problems they had such as Canaan's inability to see colors from her synesthesia or from Maria having Canaan by her side all the way, straining the two of them in potential danger. Hakko tries to strangle Canaan in her sleep, remarking to the mercenary that it was her fault. The group later encounters Yunyun, traveling on a bicycle."
		)
	,	("Canaan",
		 9,
		 "Flowers of the Past",
		 "Canaan and the others arrive at the outskirts of an abandoned village, where Santana reveals to everyone that it had been the staging grounds of the Ua virus when a said infestation would have actually occurred. He later resigns from the CIA in disgust when he learns that CIA operatives had disguised themselves as Centers for Disease Control and Prevention personnel with the Snakes under Alphard in order to tests it effectiveness on the villagers, which resulted in the creation of both the Borners and the Unblooms in an effort to create supersoldiers under the &quotFlower Garden Plan.&quot; Alphard later encounters Santana, telling him that she would head to the &quot;Factory&quot;. A Snake chopper under Liang Qi's control ambushed Canaan when she targeted her by firing rockets, temporarily sealing her in rubble with Alphard encountering the mercenary. When Alphard left, she informed the ex-CIA agent that he needs to tell Canaan her real name. As Canaan was about to get out of the rubble, Alphard tells Santana that Canaan's real name was &quot;Despair&quot;."
		)
	,	("Canaan",
		 10,
		 "Loss",
		 "With Santana's assistance, he was able to lead Canaan and the others inside the &quot;Factory&quot;. They were ambushed by Unbloom zombies after being inside, different from the Unblooms Santana had rescued personally after leaving the CIA as they have completely lost all human emotions. Hakko later encounters Liang Qi via TV screen and begins to mock her to come after her. When Hakko returns to the chapel-like room to face Liang Qi, she inadvertently kills Santana with the power of her voice when he had been captured and gagged earlier after being separated. Natsume comes to Canaan and Minoru aid after blasting her way into the facility. Minoru and Canaan encounter a distraught Hakko, who begins shooting randomly, and Minoru attempts to calm her down. Maria and Yunyun enter the &quot;Factory&quot; themselves while wearing mascot head costumes before arriving in the flower gardens. However, Natsume enters the area and encounters the two of them. Seeing that Maria and Yunyun may impede her, Natsume draws out her pistol and aims it at them. "
		 )
	,	("Canaan",
		 11,
		 "See-Saw",
		 "Alphard enters the flower gardens and stops Natsume. Alphard then threatens Maria and Yunyun to leave; they reluctantly obey, and go to meet up with Canaan. Alphard and Natsume are now alone, and it is revealed that Natsume is a secret agent for the Japanese Defense Intelligence Headquarters and was actually trying to obtain data related to the Ua virus. Canaan wakes up Minoru, who had been injured during his attempt to calm Hakko down. They meet up with Maria and Yunyun, who ask where Hakko and Santana is. Canaan decides to go back to the factory one more time, promising to find Hakko. Back in the Factory, Liang Qi grows increasingly unstable as Alphard and Cummings try to deal with her, and ultimately has to be killed after she takes a dose of the Ua virus in a mad bid for Alphard's attention with horrific results due to her not having the necessary genetics for synaesthesia. Meanwhile, a covert American task force known as Task Force 124 is deployed from Afghanistan, with orders to take down the Factory. While the bombers are on their way, Canaan fights off the advance of Delta Force operators already in the Factory while the PLA was deployed to the Factory. She finds a depressed Hakko and a dead Santana, and Hakko tells her to leave her behind and take the medicine she found for Yunyun. Canaan returns to her friends to safely retreat as the factory collapses with Hakko inside. As they mourn Hakko and Santana's deaths, Maria requests to take Canaan's picture, who solemnly replies. "
		 )
	,	("Canaan",
		 12,
		 "The Seasonal Train",
		 "The group is in low spirits in the wake of Hakko and Santana's deaths. Maria, troubled by Canaan's despair, tries to cheer her up, with limited success, and she notices how depressing Canaan looks in the picture she took of Canaan in the previous episode. The next morning, they find themselves stranded when their car breaks down. Minoru volunteers to stay behind to take care of the car while the girls take a train back to Shanghai. However, the train is stopped in a supposed inspection. While Canaan leaves to investigate after hearing gunshots, she is struck by a hallucination of Siam, who tells her to see the truth with her own eyes, while a vision of Hakko blames her for everybody's deaths. Meanwhile, Alphard strolls into the same cabin as Maria and Yunyun while the train was covertly hijacked by Daedala contractors. She convinces Maria to assist her in a decisive match with Canaan, which Maria complies by taking Alphard's picture. Alphard shoots Maria and locks her and Yunyun in a car rigged with a bomb in an effort to get Canaan to fight at her full power. As Canaan and Alphard fight, Alphard continually taunts Canaan by saying she is the reason for Siam's death. Maria, not wanting Canaan to be burdened by her, has Yunyun detach her train car as the bomb counts down. "
		 )
	,	("Canaan",
		13,
		"The Promised Land",
		"As the bomb counts down, Yunyun has second thoughts and runs after the detached carriage to save Maria. The bomb eventually explodes and Canaan reacts, as what presumably is her &quot;true strength&quot; becomes apparent, slowly being able to overpower Alphard. Despite some assistance from the remnants of Alphard's Daedala forces, Canaan was able to defeat her without relying on the attempted bombing on Maria in the Daedala-hijacked train. Canaan tries to save Alphard after she trips and falls down from the top of the train carriage, but Alphard instead opts to free herself from Siam's influence and chooses to amputate her left arm by using Canaan's pistol. Maria wakes up in a hospital and sees Minoru, with whom she discusses her ties with Canaan. Canaan contemplates her friendship with Maria. Maria and Minoru are set to leave Shanghai. Minoru, once again, fails to find a good story, since he decides to keep the story of Canaan out, and he wonders about getting a new job. Maria thinks more on her part in this story as most of the cast go about their separate ways. Some time later, in Bologna, Canaan receives a new assignment, that being to find and kill a woman missing one arm. "
		 );

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("Canaan", 0, 1, 4)
	,	("Canaan", 0, 2, 4)
	,	("Canaan", 0, 3, 5)
;
-- Anime Data
INSERT INTO ANIME(ANIME_TITLE, NUMBER_OF_EPISODES, ANIME_SYNOPSIS, ANIME_DESCRIPTION, COMPANY_NAME, COPYRIGHT) VALUES
		("Mawaru Penguindrum",
		 24,
		 "Takakura Kanba and his twin brother Shoma live together with their younger sister Himari. Their parents are missing and Himari is critically ill. Kanba and Shoma will do anything to make her last days memorable. On a visit to the aquarium, they buy her a cute, yet silly penguin hat. The trip abruptly ends when Himari collapses and dies, but the mysterious spirit that resides in the penguin hat brings her back to life... temporarily, on the condition that they find the &quot;penguindrum.&quot; To help them on their quest, each sibling is accompanied by a penguin that only they can see. Unfortunately, these cute penguins are anything but helpful, in their quest to find the Penguindrum, and change Himari's fate.",
		 "Takakura Kanba and his twin brother Shoma live together with their younger sister Himari. Their parents are missing and Himari is critically ill. Kanba and Shoma will do anything to make her last days memorable. On a visit to the aquarium, they buy her a cute, yet silly penguin hat...",
		 "Siren",
		 ""
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("Mawaru Penguindrum",
		 3,
		 1,
		 "M - Sexual references and animated nudity",
		 24,
		 "http://sirenvisual.com.au/index.php/mawaru-penguindrum-complete-series-box-dvd.html"
		)
	,	("Mawaru Penguindrum",
		 4,
		 1,
		 "M - Sexual references and animated nudity",
		 24,
		 "http://sirenvisual.com.au/index.php/mawaru-penguindrum-complete-series-box-blu-ray.html"
		)
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("Mawaru Penguindrum",
		 1,
		 "The Bell of Fate Tolls",
		 "Three siblings, Shōma, Kanba and Himari Takakura are living together, despite the fact Himari was given only a few months to live by the doctor. The three visit an aquarium to see the penguins, where Shōma buys her a queen penguin hat. However, Himari collapses and later dies in the hospital. As the brothers mourn, they are surprised to see Himari suddenly spring back to life and cured of her condition, possessed by a spirit which has decided to extend her life, though she returns to normal when her penguin hat falls off. The next day, the siblings receive a shipment of frozen things, which are later revealed to be a trio of strange penguins that no one besides them can see. Just then, the hat possesses Himari again, explaining that she has extended her life but in exchange wants the brothers to obtain something known as the Penguin Drum. As Shōma sleeps that night, it appears that Kanba ends up kissing Himari as she sleeps but it can't be certain since the scene cuts before their lips make contact."
		)
	,	("Mawaru Penguindrum",
		 2,
		 "Risky Survival Strategy",
		 "The Penguin Spirit appears again and tells Shōma and Kanba to board a train and find a girl named Ringo Oginome who may possess the Penguindrum. With Ringo attending a girls' school, Shōma and Kanba send in their penguins to follow her. The brothers end up following her to a lingerie store, where they spot her maneuvering round the outside of a building in order to take a photo of something, which she shows to the brother's teacher, Keiju Tabuki. She then follows him home and hides out under his house, where the brothers conclude that she is a stalker, and pulls out a diary which allegedly foretells destined events."
		)
	,	("Mawaru Penguindrum",
		 3,
		 "Then Devour Me Courageously",
		 "As Ringo contemplates making a special curry for Tabuki, Shōma and Kanba, having been reminded about Himari's fate if they don't cooperate, break into Ringo's house to search for the Penguindrum. After just managing to hide from her when she comes back home to prepare her curry, the brothers follow Ringo to Tabuki's house, where she finds another woman living with him. Ringo swaps the curry she was preparing with her own and runs off, where she runs into Himari who invites her to her house, much to the brothers' surprise. After eating together, Ringo returns home and confirms the events laid out in her diary."
		)
	,	("Mawaru Penguindrum",
		 4,
		 "That's Why I Do That",
		 "Episode_SynopsysAsami Kubo, the girl who was pushed down the escalator, is questioned by a woman named Masako Natsume, who then fires a red ball at her head, causing her to remember nothing about the incident. Kanba hears that his uncle is planning to sell their house and goes to see a strange person to obtain the money to buy it. Meanwhile, Shōma and Himari find Ringo, who had a bad day, and invite her back to their place. There, Shōma asks Ringo about her diary, which she claims is a Diary of Fate which describes her future. Both she and Shōma are summoned by the Penguin Hat, who orders Shōma to retrieve the diary, but Ringo breaks free and throws away the hat which lands on a truck, causing Himari to fall dead again. As Kanba goes to retrieve the hat, he recalls what happened 9 years ago when he went with his father into a typhoon when Himari was ill with a fever. After a tough struggle, Kanba manages to retrieve the hat and return it to Himari."
		)
	,	("Mawaru Penguindrum",
		 5,
		 "You & I Are Connected by M",
		 "Kanba goes to see Asami only to find she has forgotten all about him. He tries getting some information out of two other girls, but they are attacked by Natsume's red balls, causing them to lose their memories. Meanwhile, Shoma reluctantly follows Ringo's orders in order to let her have her diary, having him move a lot of stuff over to Tabuki's apartment, but she ends up coming down with a fever. It is revealed that Ringo's late sister, Momoka, used to date Tabuki and Ringo felt that, in order to be accepted by her family, she would have to become Momoka by fulfilling what was written in her diary. Despite her fever, Ringo sneaks off to under Tabuki's house to spend her 'first night' with him, while Natsume is shown to have her own penguin, discussing 'Project M' with someone."
		)
	,	("Mawaru Penguindrum",
		 6,
		 "You & I Are Connected by M",
		 "Kanba goes to see Asami only to find she has forgotten all about him. He tries getting some information out of two other girls, but they are attacked by Natsume's red balls, causing them to lose their memories. Meanwhile, Shoma reluctantly follows Ringo's orders in order to let her have her diary, having him move a lot of stuff over to Tabuki's apartment, but she ends up coming down with a fever. It is revealed that Ringo's late sister, Momoka, used to date Tabuki and Ringo felt that, in order to be accepted by her family, she would have to become Momoka by fulfilling what was written in her diary. Despite her fever, Ringo sneaks off to under Tabuki's house to spend her 'first night' with him, while Natsume is shown to have her own penguin, discussing 'Project M' with someone."
		)
	,	("Mawaru Penguindrum",
		 7,
		 "Tamahomare Girl",
		 "Tabuki invites Ringo to see one of Yuri's plays with him, followed by dinner, where Yuri invites her and Shoma to a party. At the party, Yuri announces that she and Tabuki are engaged, but Ringo remains determined, dragging Shoma to her school to help her make a love potion, which is foiled by Shoma's penguin. Determined to complete her mission, Ringo sneaks into Tabuki's room one night with the intention of getting impregnated by him."
		)
	,	("Mawaru Penguindrum",
		 8,
		 "Even If Your Love is a Lie...",
		 "Ringo attempts to make a move on Tabuki only to find he is not there as his roof had a leak. The next day, Tabuki tells Shoma that he is moving in with Yuri, which does not settle well with Ringo, who later discovers her father consorting with another family. Undeterred, she visits Tabuki's new apartment while Yuri is on tour, using a special cake to drug Tabuki while she pretends to be Yuri in order to have sex with him. However, Shoma manages to regain his consciousness and delay Ringo enough before Yuri returns home. As Shoma tries to stop Ringo from taking things any further, her diary is knocked off and is later ripped in half by a passing motorcyclist when she tries to retrieve it. As the shock leads Ringo to walk into the path of an oncoming car, Shoma manages to push her out of the way but is hit himself."
		)
	,	("Mawaru Penguindrum",
		 9,
		 "The World of Ice",
		 "Himari has a strange dream in which she meets a man named Sanetoshi, who shows her various books containing her memories. In elementary school, she formed a group called Triple-H with her best friends, Hibari and Hikari. When she argued with her mother over buying a wrong ribbon, her mother became scarred from a falling mirror, she and her friends tried to kill a koi for its blood to heal her mother. She left elementary school due to her illness while her friends went on to become idols. Upon waking up after vaguely recollecting a soulmate she once had, Himari hears from Ringo about Shoma's accident."
		)
	,	("Mawaru Penguindrum",
		 10,
		 "Because I Love Him",
		 "Shoma wakes up in hospital with supposedly minor injuries, keeping quiet about what happened between him and Ringo from his siblings. As Ringo explains what happened to her diary to him, Natsume disguises herself as a nurse and kidnaps Shoma, demanding the other half of the diary from Kanba and Ringo in exchange for his life. Deciding to leave the diary half with Ringo, Kanba goes to find Shoma, while Ringo is told to surrender the diary herself. After luring Kanba into a trap and kissing him, Natsume escapes but is confronted by another person in a penguin hat, whom Natsume identifies as Mario."
		)
	,	("Mawaru Penguindrum",
		 11,
		 "You Have Finally Realized It",
		 "Kanba goes to confront Natsume about the memory-erasing balls and why she desires the diary, unaware that she only has half of it. Meanwhile, Ringo is still determined to complete Project M with or without the diary, making a love potion to give to Tabuki, which actually seems to work. As Ringo decides she can not go through with it, Yuri helps her come to the realisation that she is actually in love with Shoma. As Penguin Himari brings Shoma and Ringo into a Survival Strategy meeting, Ringo tells them about the day 16 years ago when Momoka died and she was born, which turns out to be the day Shoma and Kanba were also born."
		)
	,	("Mawaru Penguindrum",
		 12,
		 "The Wheel That Spins Us Round",
		 "Kanba goes home and is called by Sanetoshi claiming that Himari will die once more. Shoma goes into detail of what happened 16 years ago, as Shoma and Kanba's parents were high-ranking members of a religious cult and were responsible for a terrible incident which killed Momoka. Himari still possessed loses her strength and tells Shoma and Ringo to acquire the Penguin Drum and to stop &quot;them&quot;. Himari is then transferred to a hospital and Kanba is called by Shoma. He arrives to find Himari lying dead and tries to once more make a pact to give her his life, but it does not work as she says she must leave to &quot;The Destination of Fate&quot;. Just as Himari seems to be truly dead, Sanetoshi appears. "
		)
	,	("Mawaru Penguindrum",
		 13,
		 "Our Crime & Punishment",
		 "Sanetoshi offers Kanba a special medicine to revive Himari, though mentions there will be a steep price in return. Kanba recalls three years ago when he and Shoma learned about their parents being criminals. Later, Sanetoshi contacts Natsume, who had also made a contract with him to save Mario, telling her who has the other half of Ringo's Diary. Meanwhile, Ringo talks to Tabuki, who helps put her worries to rest."
		)
	,	("Mawaru Penguindrum",
		 14,
		 "Princess of Lies",
		 "Yuri, after breaking off an affair with one of her co-stars, feels a longing for a certain someone. Meanwhile, Shoma is ignoring Ringo, feeling she will never be able to forgive him for what his parents did, and tells her they shouldn't see each other again. As Kanba tries to raise more money to pay for Himari's medicine, he is confronted by Natsume, who questions his feelings for Himari. As Ringo becomes depressed over what happened with Shoma, she is picked up by Yuri, who takes her to a hot spring inn. It is revealed that Yuri was close to Momoka, and even attracted to her, because she was the only person who would call her beautiful, leading to her drugging and raping Ringo in an attempt to make her into Momoka. It is also revealed that Yuri was the motorcyclist who stole half of Ringo's diary some time ago."
		)
	,	("Mawaru Penguindrum",
		 15,
		 "Saving the World",
		 "Yuri holds Ringo into her room that coincidentally is next to a room Shoma is staying with a classmate on a field trip. Shoma rushes to rescue her after figuring this but he trips and falls unconscious after bumping his head. Meanwhile, Yuri reminisces about her father, a famous artist who used to tell her she was ugly and convinced her to let him use his chisel on her as he claimed that by only making her &quot;beautiful&quot; he would be able to love her. Yuri started getting seriously injured by her father and she makes friends with her classmate Momoka who claims that her diary has the power of transferring fates in exchange for a price. Back to the present, Natsume appears before Yuri to steal the half of the diary in her possession and despite seemingly successful, it is revealed that she was tricked by Yuri and left with a forgery. After Shoma awakes, Yuri reveals to him that she has half of the diary and just like Momoka saved her from her abusing father with the power of the diary, Yuri is determined to use it to bring her back to life."
		)
	,	("Mawaru Penguindrum",
		 16,
		 "Immortal Man",
		 "After realizing that she was tricked by Yuri, Masako reminisces about her grandfather, a powerful business tycoon who expelled her father claiming that he was not strong enough to be allowed a place in the Natsume family. After dreaming countless times about having him killed, Masako rejoiced when her grandfather inadvertedly poisoned himself to death by eating ill prepared Fugu. Masako since then assumed control of her family's corporation but was sad that her father had never returned home, until somehow her grandfather's spirit possessed Mario's body and forced her to eat the same poison that killed him to protect her brother, but Sanetoshi appears to save her life. Later, Masako sees Kanba hanging out with the same elusive men who took her father away and Sanetoshi asks Masako to join them in his plan to &quot;put the world back on track&quot; but she promptly refuses."
		)
	,	("Mawaru Penguindrum",
		 17,
		 "Those Who Cannot Be Forgiven",
		 "The Takakura siblings are enjoying Takoyaki together and happy with the news that Himari will soon be released from hospital when the magic hat possesses Himari again for another Survival Strategy meeting with her brothers and insists that their ordeal will not be over until the Penguin-Drum is retrieved. Meanwhile, Yuri and Tabuki reminisces about their childhood days with Momoka and while Yuri is unable to forgive the siblings for their parents' crime, Tabuki tries to dissuade her. In the next day, Himari leaves by herself with Ringo for shopping much to Kanba and Shouma's despair as they are informed that she must take another dose of her medicine before sunset. While the brothers look for Himari, Ringo receives a call from Yuri who invites her and Himari for a meeting. Yuri waits for Himari, but is intercepted by Masako instead, and the two start fighting for the two halves of the diary, while Himari and Ringo are approached by Tabuki, who invites them to a construction site where he claims he will finally bring punishment to the Takakura family."
		)
	,	("Mawaru Penguindrum",
		 18,
		 "So, I Want You to Be Here for My Sake",
		 "Tabuki reminisces about how he injured his own hands in despair of being relinquished by his mother as she only cared about his younger brother who was a much better pianist than him. After Tabuki traps Ringo at an elevator and holds Himari hostage, he phones Kanba demanding to bring his father to him. Kanba arrives alone to meet them, claiming he has no idea where his father is and finds Himari hung over into a construction bucket. Tabuki does not believe him and Ringo decides to call the police, but Kanba asks her to not do it and she calls Shouma instead. Tabuki reveals that Himari's brother is receiving money from his father's organization to pay for her treatment, and remembering about how Momoka had her hand severely injured to save him, Tabuki starts severing the wires holding the bucket one by one, claiming that the only way for Kanba to prevent Himari from falling to her death is by sacrificing his own hand to hold the final wire together when it snaps. Kanba does so and despite his pain, he claims he would never have his sister die. Himari than decides to jump by herself to spare Kanba's life, but Tabuki saves her from the fall after seeing in Kanba the same determination to protect his sister he saw in Momoka when she saved him. Shoma arrives soon later and the siblings reunite in tears while Tabuki makes his leave, meeting Yuri on the way who reprimands him. It is also shown that Yuri's showdown with Masako ended in a draw, as each one still holds a half of the diary."
		)
	,	("Mawaru Penguindrum",
		 19,
		 "My Fated Person",
		 "After the incident at the construction site, Tabuki quit his job and leaves Yuri, while Kanba is praised by his parents for protecting Himari, claiming that once their true objective is reached, they will become together again. Kanba makes use of some money he got from them to throw a party for Himari with Shouma and Ringo to celebrate her return home, while Himari wonders about her conversation with Sanetoshi as she doubts that she will eventually be cured. He also has a conversation with Masako, who reaffirms her intentions to stop his plans. Masako then pays a visit to Himari and demands her to remember about her true past, as she claims Himari is not Kanba's real sister. She approaches her with a modified slingshot designed to restore forgotten memories, but is stopped by Kanba and Shouma who had just returned home. However, Himari manages to remember her past and realize that she indeed is not Kanba and Shouma's sister and it was her soulmate, who is actually Shouma that saved her."
		)
	,	("Mawaru Penguindrum",
		 20,
		 "Thank You for Choosing Me",
		 "Masako decides to leave the Takakuras alone, still not accepting the 'family' they have. As Himari has another conversation with Sanetoshi, Shouma confesses to Ringo that Himari is not actually his blood sister. Years ago, whilst his parents were organising to change the world with their organization, Shouma met the orphaned Himari whilst exploring his condo. Whilst she is initially passive of him, the two grew a friendship over an abandoned kitten they find, up until it ended up being taken away. When Shouma discovered that Himari had headed over to the 'Child Broiler', where unneeded children go to disappear from the world, he rushed over there to rescue her and chose her to become a part of her family (making him believe everything that has happened to Himari up until the present is all his fault). Back in the present, Kanba continues to converse with his parents about what needs to be done to change the world."
		)
	,	("Mawaru Penguindrum",
		 21,
		 "The Door of Fate We Choose",
		 "Ringo is approached by a journalist asking about the Takakura siblings, but she avoids him and warns Himari about him. Later that night, Himari, who was told by the same journalist about how Kanba have been collecting money for her treatment, trails him to the shop where he supposedly meet his parents just to find the place torn down and have a shocking revelation. Shouma is informed by the journalist about Kanba's involvement with the Kiga Group and tries to stop him by force with no success. Meanwhile, Tabuki and Yuri also reach the shop and just like Himari, find the skeletons of the Takakura couple before being attacked by an unknown assailant. Shouma, who finds that Kanba ordered the journalist to be killed in a car accident, and was informed by Sanetoshi that the medicine will not prolong Himari's life for long, informs her that they can't live as a family anymore and sends her to live with his uncle. Later the Kiga group, whose true leader is actually Kanba prepares themselves to make a large scale operation, and Himari, seen standing next to him, claims that she is determined to stop him at the cost of her life."
		)
	,	("Mawaru Penguindrum",
		 22,
		 "Beautiful Casket",
		 "Ringo stumbles on two girls dressed suspiciously standing before the Takakuras' house and finds that they are actually Himari's childhood friends Hibari and Hikari from the Double-H idol duo. They ask her to give Himari a present in return for the scarves she knit for them before leaving. Kanba learned from Sanetoshi that his medicine will not work on Himari anymore (she has built a resistance to it), and that according to him, she can only be saved after he fulfills his group's objective. Himari tries to dissuade him with no success and discovers that his hideout is situated under the aquarium where she first died. She prays for God to have Kanba saved in exchange for her life and falls lifeless on the ground. Yuri calls Ringo and returns her the half of the diary in her possession and stays beside an unconscious Tabuki at the hospital, who was stabbed by the attacker who was revealed to be Yuri's former lover and co-worker. Masako tries to convince Kanba to give up as the police are already aware of his plans and have a warrant on him, but he moves forward ignoring her pleas until they are surrounded, and he puts himself in harm's way to protect her. Injured and unconscious, Kanba is carried away by his comrades while Masako decides to confront the police by herself to cover his escape."
		)
	,	("Mawaru Penguindrum",
		 23,
		 "Fate's Destination",
		 "On the day of the terrorist attack, 16 years before, Sanetoshi is confronted by Momoka who was determined to stop him. Her spirit ends up splitting in two with each half being the penguin hats used by Himari and Mario, and Sanetoshi is divided into the two black rabbits that are always accompanying him. Back to the present, Shouma is informed that Himari's life is at its end and Ringo comforts him while Kanba is taken by Sanetoshi to a gravely injured Masako and brings her from the dead before his eyes. Despite Masako's pleas, Kanba leaves with Sanetoshi to continue his plan, carrying her half of the diary with himself. Shouma sees a vision of Himari asking him to stop Kanba. It seems that Himari kisses Shouma, but their faces are off screen. When Kanba comes to fetch her, Shouma is shot unconscious by him with a penguin bullet. Ringo is called by Kanba to the aquarium and a bomb explodes knocking her out. Sanetoshi watches her struggling to stop her half of the diary from being burned out and after she fails, he has Kanba burn the other half. Shouma wakes up and manages to reach Kanba determined to stop his plans."
		)
	,	("Mawaru Penguindrum",
		 24,
		 "I Love You",
		 "Shouma tries to dissuade Kanba with no success while Ringo also boards the train, claiming she had learned from the present she got from Himari's friends the secret spell contained into the now lost diary. She activates the spell determined to sacrifice herself to save Himari and the others, but Shouma takes the burden to himself, telling her this is a punishment for him and Kanba to bear, and that he loves her. Kanba sacrifices himself to resurrect Masako and Himari for good. The terrorist attack is stopped and both Himari and Ringo are found unconscious with no memories about the brothers or everything that happened. The same occurs for Masako whose brother Mario also fully recovers. While hanging out with Ringo at her house, Himari finds a message left by Kanba and Shouma that tells her they will always love her. She starts crying without knowing the reason why while Shouma and Kanba (in children form) pass the front of her house accompanied by the four penguins talking about fate."
		)
;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("Mawaru Penguindrum", 0, 1, 8)
	,	("Mawaru Penguindrum", 0, 2, 8)
	,	("Mawaru Penguindrum", 0, 3, 8)
;

INSERT INTO ANIME(ANIME_TITLE, NUMBER_OF_EPISODES, ANIME_SYNOPSIS, ANIME_DESCRIPTION, COMPANY_NAME, COPYRIGHT) VALUES
		("Queens Blade 2 The Evil Eye",
		 12,
		 "All of the female warriors intent on participating in the Queen's Blade tournament have now assembled in Gynos, the capital of reigning Queen Aldra.There they are joined by Nyx, a normally-timid woman who possesses both a demonic staff and a serious grudge against Elina, and Nanael, who has been assigned by Heaven to participate in the Queen's Blade herself so that Heaven can ferret out what, exactly, Queen Aldra is really up to.",
		 "All of the female warriors intent on participating in the Queen's Blade tournament have now assembled in Gynos, the capital of reigning Queen Aldra...",
		 "Siren",
		 "Kinji Yoshimoto"
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("Queens Blade 2 The Evil Eye",
		 3,
		 1,
		 "M - Violence, Sexual references and Nudity",
		 12,
		 "http://sirenvisual.com.au/index.php/shop/queen-s-blade-2-the-evil-eye.html"
		)
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("Queens Blade 2 The Evil Eye",
		 1,
		 "Assemble! Queen's Blade",
		 "Nanael is reassigned by the Head Angel to compete in the Queen's Blade as punishment for failing her prior assignment. Heaven suspects something is wrong with Queen Aldra. Everyone is looking for residences in Gainos: Tomoe with Shizuka, Ymir with Cattleya, Alleyne with Nowa, Nanael with Melpha, and Elina with Claudette. Echidna is there as well, and confronts the rogue assassin Irma. Melona tries to take things into her own hands and assassinate Aldra, but is turned to stone by Aldra's power. Nyx, a new contender, is revealed."
		)
	,	("Queens Blade 2 The Evil Eye",
		 2,
		 "Crush the Evil! The Unexpected Battle",
		 "Leina is having trouble finding accommodations until she mentions she is in the Queen's Blade, and the greedy hotel manager rushes to fill her order and ends up rooming her with Echidna. Tomoe and Shizuka meet Melpha, and Tomoe admires her for dressing more appropriately than other competitors. It is revealed that Nyx used to be a maid for the Vance Family, and was treated cruelly by Elina. Aldra wants a new servant to lead the Assassins, and sends a fake letter to lure Risty to her palace. Once there, she awakens the hate in Risty's soul, making Risty her servant. The first match is fought: Tomoe vs Melpha, where Tomoe finds that Melpha uses the lewd &quot;Holy Poses&quot; to fight, giving Tomoe the resolve to defeat her perversion. Another match begins: Elina vs Nyx."
		 )
	,	("Queens Blade 2 The Evil Eye",
		 3,
		 "Flame Burst! Blazing Destinies",
		 "It is revealed that Nyx is enslaved to a tentacle demon lord named Funikura, who has given her magical fire power, yet often molests her with its tentacles. Elina realizes that Nyx is a coward without Funikura, and tricks her into relinquishing it, upon which Nyx surrenders. Risty is revealed as the new leader of the Assassins of the Fang. Aldra turns Funikura to stone, saying that old demons should not wander free. Nowa gets lost in the Gainos marketplace and is almost raped by a gang of street punks who were swiftly beaten by Echidna. Nowa and Alleyne are summoned to fight in a swamp, as are Echidna and Irma. It is then revealed to be a team match: Alleyne and Nowa vs Echidna and Irma."
		 )
	,	("Queens Blade 2 The Evil Eye",
		 4,
		 "Confrontation! The Ties that Call Us Together",
		 "Irma refuses to help Echidna, so Alleyne and Nowa resolve to pick them off one by one. Echidna's past is revealed. Echidna manages to trap Alleyne in a pitcher plant, then to pin Nowa. Alleyne breaks free and takes the initiative against Echidna, but Irma appears, threatening to kill the trapped Nowa and forcing Alleyne to surrender. Leina brings her sword to Cattleya for repair again, while Ymir's attempts to sell weapons go unnoticed in the market. Cattleya states her resolve to reunite her family. The next set of matches begins: Leina vs Ymir and Cattleya vs Airi, the latter being fought in the room where Aldra keeps all of those she has turned to stone."
		 )
	,	("Queens Blade 2 The Evil Eye",
		 5,
		 "Intrigue! Grief in the Royal Palace",
		 "Ymir uses the fact that her bout is being broadcast to advertise the effectiveness of her weapons, especially since Leina is using a Cattleya weapon. Leina emerges victorious, however. Lana is hanging on to Cattleya during her fight with Airi, but actually proves to be helpful as Airi cannot bring herself to kill him. Cattleya is winning when she sees that Owen is frozen inside one of the stones in Aldra's &quot;Palace of Grief&quot; and breaks down crying, conceding defeat. Aldra promises to reunite Cattleya with her husband, and does so by turning her to stone as well. Filled with grief, Lana grabs Cattleya's spear and tries to attack Aldra. Aldra is about to turn him to stone too when Airi rescues him and they escape. They are confronted by Risty and the Assassins of the Fang, but when Risty is about to strike Lana down, she remembers the orphans she used to care for and hesitates, allowing them to escape. Lana keeps following Airi around, and she resolves to care for him in Cattleya's stead. When Cattleya does not return, Ymir asks Leina to allow her to care for her sword from now on. The next match is set: Claudette vs Menace."
		 )
	,	("Queens Blade 2 The Evil Eye",
		 6,
		 "Complications! Changing Premonitions",
		 "Claudette and Menace are fighting in a desert, giving Menace the upper hand. Her sand attacks confuse Claudette, and she uses cursed attacks to drain Claudette's strength. It begins to rain, however, which weakens her sand attacks, and Claudette emerges victorious. Menace is later turned to stone by Aldra, who says that ancient things should stay in the past. The first round is over, with Risty advancing by some unexplained method, and Nanael advancing because her foe (presumably Melona) did not appear. Nanael is dismayed that no one is placing bets on her, and uses all of Melpha's money to place a large bet on herself while in disguise, so as Melpha's roommate, she must subsist on vegetables from her garden. Meanwhile, Risty is pursuing Irma throughout the city. She corners her and is about to kill her when Echidna intervenes and shelters Irma for a while, but Aldra sets the next match so that Irma must fight Risty anyway. Tomoe is also summoned to fight Elina."
		 )
	,	("Queens Blade 2 The Evil Eye",
		 7,
		 "Freeze! Unexpected Situations",
		 "Irma looks for an opening to strike in her fight with Risty, and finds one when Risty starts having flashbacks to her old, righteous self. However, Irma misses in her killing blow, and is defeated instead. Echidna retrieves her afterwards, and the two depart together. Elina shakes Tomoe's resolve by calling her a hypocrite in regards to how she can call herself righteous while killing people. Tomoe tells Elina she has formed a bond with Leina, since they shared food and shelter on their journey, which Elina misinterprets, thinking that Tomoe has slept with Reina. Elina attacks in a frenzy, but Tomoe pulls through victorious. Ymir is pondering how best to augment Leina's sword. The next match is set: Nanael vs Airi in the Palace of Grief. Tomoe returns from her victorious battle to find a note from Shizuka, leading her to a graveyard. Shizuka reveals that she never actually left the Kouma Ninja, and has been posing as Tomoe's friend to lower her guard so she could kill her. Tomoe finally gains the will to fight her friend, and kills her. In dying, Shizuka says that being able to kill her best friend has made Tomoe stronger since these emotional bonds would only hinder her resolve as a warrior."
		 )
	,	("Queens Blade 2 The Evil Eye",
		 8,
		 "Disgrace! The Fighting Angel",
		"Airi and Nanael are both desperate to finish the match quickly, as both are starving, and begin to fight in earnest. Airi weakens Nanael by causing her to spill more of the sacred milk, which spills onto some of the petrified people in the palace. Airi runs out of time because it has been too long since she has consumed vital force and due to her desire not to do so in front of Lana, and Airi disappears. Aldra is visibly disturbed by the spilling of the sacred milk. Lana has lost another guardian, and this time goes to Ymir, deciding to help her fix Leina's sword. Lana reveals Cattleya's fate to Ymir and Leina, and Leina says she will save Cattleya. The sacred milk causes the stone Melona was encased in to crack, and she manages to escape. Nanael is then set against Leina, but Nanael is now weak from having spilled the sacred milk, and with her new sword Leina easily defeats her. Count Vance puts a plot in motion to seize the throne for himself. Melona appears before the defeated Nanael with a proposal to defeat Aldra. The next match is set: Claudette vs. Risty."
		)
	,	("Queens Blade 2 The Evil Eye",
		 9,
		 "True Feelings! The Duel at Castle Vance",
		"Claudette and Risty are fighting in the courtyard of Vance Castle just as Vance's army is leaving in his bid to overthrow Aldra by conventional military force. Claudette is initially victorious, knocking out Risty with a lightning bolt. She tries to dissuade the Count from his attempted overthrow, saying that it will only breed war across the continent, and reveals that Lady Maria, Vance's wife and her adoptive mother, told her to heal Vance's pain if she did not return from the Queen's Blade, and she has been serving loyally to soothe Vance's emotional scars. Vance tries to convince her to serve him again in his bid to overthrow Aldra, but she refuses, and he tells her to leave. Risty then awakens, however, and it is now apparent that she was sent to kill the Count. Claudette manages to stop her, but is eventually defeated herself when Risty collapses a roof on her. As Claudette is teleported back to Gynos, she reconciles with the Count, who then withdraws his army. Aldra calls it a success: though the Count still lives, his coup was thwarted. Claudette warns Leina that Risty has changed. Meanwhile, it is seen that Nyx has found a job as a barmaid, and that Tomoe is training fiercely, now wearing Shizuka's old horned headband. Melona, Nanael, and Melpha discuss the mysterious Aldra, and Melona steals Nanael's sacred milk."
		)
	,	("Queens Blade 2 The Evil Eye",
		 10,
		 "Long-Cherished Desire! A Reason to Fight",
		"Nanael is drinking milk to drown her sorrows at the bar where Nyx works, and Nyx tells her of the rumor about the horned monster seen in the woods. Nanael thinks it might be Melona, and goes to seek her with Melpha. She instead finds Tomoe in a dangerous mood. Elina returns home after Claudette tells her that she is the only one of the three sisters capable of serving Count Vance any more, as neither Claudette nor Leina have the will to. Nanael tries to get Leina to ambush Tomoe in the forest, but then decides to tell her what they know about Aldra so far. Between them, Nanael, Leina, and Ymir determine that Aldra has to be allied with some sort of heavenly creature because the sacred milk actually has a negative impact on the divine (and conversely a positive one on the demonic, which is how it was able to revive Melona). Melona spies on the conversation, posing as Lana. Leina is summoned at last to fight Tomoe, and they battle in the ruins of Tomoe's old shrine in Hinomoto. Tomoe's hair has turned white, and Aldra says that she is driven by the ghosts of her friends and the suffering in her heart. Tomoe says that, for Shizuka's sake, she has become a demon who will win at any cost. A desperate fight begins with Tomoe having the upper hand, utilizing a lot of powerful techniques. Leina eventually recovers and says that she cannot lose either, and that she accepts everything that has happened, including Tomoe's feelings. Tomoe rejects that, replying that one needs to be heartless to be strong. Leina triumphs, and Tomoe claims she finally understands her. Ymir uses the fight as advertising for the sword she re-forged, and sells many cheap knockoffs of it. Tomoe awakens in the Palace of Grief."
		 )
	,	("Queens Blade 2 The Evil Eye",
		 11,
		 "Fierce Duel! The Ultimate Showdown",
		"Tomoe demands to know why Aldra had the Kouma Ninja attack Hinomoto. Aldra says that she has been searching for her sister, and Hinomoto is the only area outside of her rule. She says burning the country to the ground would be worth it to find her sister. Aldra's past is revealed: she and her sister were outcasts for being of mixed demonic descent, and were forced to wander. Her sister mysteriously disappeared one day at the edge of a forest, and Aldra, in desperation, found a spirit without a body. The spirit inhabited Aldra's body in return for giving her great power and eternal youth. Aldra offers Tomoe rule over Hinomoto in exchange for her servitude, promising peace for Hinomoto if her sister is found, but Tomoe rejects her offer, remaining loyal to her Empress. Nanael has mysteriously returned to Heaven, and Leina and Risty finally fight. Leina fends off Risty's aggressive style, and eventually causes her to hesitate when she shows her the lucky coin she gave her. Leina scores a hit and Risty falls. Leina rushes to tend to her, and Risty temporarily breaks free from Aldra's control. Aldra's evil spirit then possesses Risty directly, however, and Risty begins strangling Leina. Leina is about to pass out when Melona appears in Aldra's throne room and coils up her body, shaking her control over Risty. Leina uses the opening to break free and eventually defeats Risty, shattering Aldra's control over her for good. Melona and Aldra fight, with Melona managing to dump what remains of the sacred milk on Aldra, weakening her, but Aldra manages to drive Melona off anyway. The final battle is set to begin: Leina vs Aldra."
		 )
	,	("Queens Blade 2 The Evil Eye",
		 12,
		 "Ambition! The Successor to the Throne",
		"Nanael makes her report to Heaven, where the Head Angel determines that Aldra has made a pact with Delmora, a fallen angel. The final battle begins, with Aldra proving to have overwhelming power. She eventually kicks Leina in the neck, making her collapse. Risty appears at the arena and cheers Leina on, causing her to get back up. Leina shows that she has adopted many of her old foes' techniques as she hits Aldra with Claudette's Thunderclap Strike and Tomoe's Warrior Kick. Just as Leina has the advantage, however, Aldra petrifies her. The crowd jeers, calling her a demon. Meanwhile, Lana has invaded the palace, trying to rescue his parents by himself. He is confronted by a Fang Assassin, but finds Airi's Scythe which still contains some of Airi's spirit. He hurls the scythe at the Assassin, and Airi snags enough of the Assassin's vital force to reconstitute herself. Nanael overhears the struggle and arrives with more sacred milk, freeing Cattleya and Owen. Melona has been hiding in the palace, though now she is tiny, and Menace is also freed. Aldra flies into a rage at the crowd's jeers and petrifies them all except Claudette, Tomoe, and Risty. Even though Leina is petrified, her spirit causes everyone's weapons to glow: even those far away like Nowa and Echidna, showing the bonds she has formed with all of them. Nanael frees Leina with more sacred milk, and she counterattacks. Delmora convinces Aldra to remove the seals on his power, but even with his unsealed power, Leina defeats Aldra, causing Delmora to emerge. It is revealed that Delmora separated Aldra from her sister so that she would despair and seek to use his power for revenge so that he could get her body in return. Nyx sees that some of those petrified have been freed, and finally shows resolve of her own by freeing Funikura herself. Nanael pours more sacred milk on Delmora, then Claudette, Tomoe, and finally Leina attack, defeating him as Leina emerges victorious. Aldra matures to adulthood in an instant since Delmora had given her eternal youth, and Tomoe tells her that she can seek her sister in Hinomoto herself. Soon after, Leina is crowned the new Queen."
		 )
;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("Queens Blade 2 The Evil Eye", 0, 1, 4)
	,	("Queens Blade 2 The Evil Eye", 0, 2, 4)
	,	("Queens Blade 2 The Evil Eye", 0, 3, 4)
;

INSERT INTO ANIME(ANIME_TITLE, NUMBER_OF_EPISODES, ANIME_SYNOPSIS, ANIME_DESCRIPTION, COMPANY_NAME, COPYRIGHT) VALUES
		("Queen's Blade 3: Rebellion",
		 12,
		 "Power corrupts, and it when it appears that the once noble Queen Claudette's ways have turned to oppression and heretical persecution, it's up to a new generation of warriors to step up to the plate armor to bear arms and bare their naked fury in open rebellion! The odds may seem unfairly stacked in favor of the Amazonian ranks of the queen, doubly supported by her power of writ and assassins. But the incredible wits and assets of the dazzling array of daring damsels willing to risk their gorgeous skins and put their lithesome bodies on line against her, might just expose a few unexpected weaknesses in the queen's support! It's the wildest fantasy ever as an unprecedented force of fabulous female fighters. from elven alchemist to half-demon berserker, from an undead pirate captain to a dragon maid, they all come together with the goal of stripping the Queen from her throne in QUEEN'S BLADE: REBELLION! &quot;Quality fan-service!&quot; - Anime News Network",
		 "FIVE OUT OF FIVE REBELS AGREE: It's time for this Queen to go DOWN!",
		 "Siren",
		 "Kinji Yoshimoto"
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("Queen's Blade 3: Rebellion",
		 1,
		 1,
		 "M - Violence, Sexual references and Nudity",
		 12,
		 "http://sirenvisual.com.au/index.php/shop/queen-s-blade-3-rebellion.html"
		)
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("Queen's Blade 3: Rebellion",
		 1,
		 "Warrior of the Resistance",
		 "After Alchemy Strategist Yuit saves her friend Mirim from harassment by the queen's soldiers with the help of her elfen automaton Vante, Ymir shows up at her village the next day trying to procure Vante for the queen's military. Yuit finds an opportunity to escape but is later ambushed by Elina. Just when she almost falls off a cliff, Annelotte appears to rescue her and defeat Elina. However, when she returns home she finds that Mirim has been coerced into joining the queen's army with false promises of money to treat her mother's illness by Ymir. "
		)
	,	("Queen's Blade 3: Rebellion",
		 2,
		 "The Sacred War",
		 "Seeking guidance from the church, Annelotte unwittingly angers the overzealous Inquisitor Sigui and is challenged to a duel. Annelotte must fight for her life as being declared a heretic by Sigui automatically comes with a sentence to be burned alive by holy fire. Fortunately, just when all hope is lost an octopus comes to the rescue. Elsewhere, Iron Strategist Ymir sets her evil plan into motion."
		 )
	,	("Queen's Blade 3: Rebellion",
		 3,
		 "The Moonlight from the Jungle and the Sun",
		"On a mission to clear the mysterious fog that's preventing transportation of life-saving medicine, Annelotte travels to the Calibara forest where she meets Moon Shadow Dancer Luna Luna and fights a giant slimy monster. And yes, there will be tentacles."
		 )
	,	("Queen's Blade 3: Rebellion",
		 4,
		 "The Unstopping Hyper Vibration",
		 "Mirim has been equipped with the Hyper Vibration Armor and armed with the Hyper Vibration Sword &quot;Infinite Slasher&quot; by Ymir, who sends her to fight Annelotte under the queen's order."
		 )
	,	("Queen's Blade 3: Rebellion",
		 5,
		 "The Secret of the Castle at Gainos",
		 "Annelotte sneaks into Gainos Castle with Yuit and Vante to rescue Mirim, but she must get past Dragon Warrior Branwen first."
		 )
	,	("Queen's Blade 3: Rebellion",
		 6,
		 "A Crown of Flowers and the Hidden Power",
		 "Annelotte finally confronts Mirim and her nearly invincible Hyper Vibration Armor, and in the middle of the fierce showdown, Captain Liliana's flying pirate ship suddenly appears in the sky above."
		 )
	,	("Queen's Blade 3: Rebellion",
		 7,
		 "The Flying Pirate Ship",
		 "Vante is captured by Liliana, and Annelotte and Yuit must sneak onboard her flying pirate ship to retrieve Vante. But they are not the only stowaways there."
		 )
	,	("Queen's Blade 3: Rebellion",
		 8,
		 "The Tempted Young Wife",
		 "Ymir recruits Summoner Aldra to join the queen's army. Aldra summons two underworld demons, Belphe and Dogor, to aid in her fight, but they are more interested in finding some tasty humans to feed on. "
		)
	,	("Queen's Blade 3: Rebellion",
		 9,
		 "A Samurai Arrives",
		 "Annelotte accidentally travels to a small village of orphaned children, where she meets the self-proclaimed &quot;Samurai God&quot; Izumi. Realizing that Annelotte is a stronger and more skilled fighter, Izumi asks Annelotte to teach her better swordsmanship. And not a moment too soon, for the underworld demons Belphe and Dogor just appeared in their village to eat the children."		 
		)
	,	("Queen's Blade 3: Rebellion",
		 10,
		 "An Angel, a Trap and the Queen's True Motive",
		 "Annelotte and her band of rebels return to Gainos Castle with the intention of confronting the queen head-on, but Ymir has anticipated their arrival and set a dangerous trap for them."
		 )
	,	("Queen's Blade 3: Rebellion",
		 11,
		 "Wavering Spirit",
		 "Fierce battles rage across the castle as the forces of good clash with the forces of evil. Amidst the climatic showdown, a sinister secret is revealed."
		 )
	,	("Queen's Blade 3: Rebellion",
		 12,
		 "Bonds of the Resistance",
		 "Annelotte finally comes face-to-face with Thundercloud Queen Claudette, and the fate of the continent will be decided by the one who emerges victorious."
		 )
;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("Queen's Blade 3: Rebellion", 0, 1, 4)
	,	("Queen's Blade 3: Rebellion", 0, 2, 4)
	,	("Queen's Blade 3: Rebellion", 0, 3, 4)
;

INSERT INTO ANIME(ANIME_TITLE, NUMBER_OF_EPISODES, ANIME_SYNOPSIS, ANIME_DESCRIPTION, COMPANY_NAME, COPYRIGHT) VALUES
		("Welcome to Irabu's Office",
		 11,
		 "A pro baseball player with the yips, a man with a permanent erection, a hopeless yakuza underboss, an obsessive compulsive university lecturer, a mobile phone addict and an anxious circus performer...Welcome to Irabu's office!",
		 "A pro baseball player with the yips, a man with a permanent erection, a hopeless yakuza underboss, an obsessive compulsive university lecturer, a mobile phone addict and an anxious circus performer...Welcome to Irabu's office!",
		 "Siren",
		 "Kenji Nakamura"
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("Welcome to Irabu's Office",
		 1,
		 1,
		 "M - Mature Themes, Sexual References and Coarse Language",
		 11,
		 "http://sirenvisual.com.au/index.php/shop/welcome-to-irabu-s-office.html"
		)
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("Welcome to Irabu's Office",
		 1,
		 "Flying Trapeze",
		 "Kohei Yamashita is an aerialist who repeatedly misses his partners in his trapeze act. He blames the newly recruited foreign circus artists and grows distant and distrusting of them. Due to the stress of getting his act together for an upcoming performance, he has developed a sleep disorder and anxiety problems. He is a third-generation circus performer after his father and grandfather. As a child, he learned to distance himself from other children because he had to constantly move with the circus. Because of this, he couldn't develop trust in strangers. He realizes that he was the one messing up the stunt after watching a video of his practice. He is represented by a penguin."
		)
	,	("Welcome to Irabu's Office",
		 2,
		 "Keep on Erecting",
		 "Tetsuya Taguchi, public servant at the ward office, has developed an erectile dysfunction (a constantly erect penis) due to emotional issues at work and with his ex-wife. He is represented by a rhino with a dotted horn."		 
		 )
	,	("Welcome to Irabu's Office",
		 3,
		 "Romance Novelist",
		 "Romance novelist Junichi Hoshiyama suffering from OCD and psychogenic induced vomiting. He believes that he has already done the ideas that come to his head for new books. His animal form is a rooster and the scenes of vomiting are overlaid by pink feathers flying through the air."
		 )
	,	("Welcome to Irabu's Office",
		 4,
		 "The Third Base",
		 "Shinichi Bando, a superstar pro-baseball player and third baseman for the Tokyo Yakult Swallows, is troubled by yips as he suddenly can not throw the ball anymore. This problem is brought on by a younger and more popular contender for his position on the team. He appears as a red horse with blue hair after the vitamin shot."
		 )
	,	("Welcome to Irabu's Office",
		 5,
		 "My Father In-Law's..",
		 "Tatsuro Ikeyama is a neurology lecturer with obsessive–compulsive disorder and a compulsion for inappropriate behavior. For example, he fantasizes about dumping the load of a dump truck stopped at a traffic light and swinging on a chandelier at his school reunion. His father-in-law is Dr. Nomura, the faculty head at his university and the head of the university hospital's surgical department. The treatment that Irabu prescribes for Ikeyama includes farting in a crowded elevator, changing the television channel to a baseball game while his extended family is watching opera, and finally, removing his father-in-law's wig in public. The cause of his compulsions is his controlled lifestyle; before he was married, he enjoyed playing pranks and watched baseball instead of opera. After his vitamin shot, Tatsuro appears as a multi-colored chameleon who often turns invisible."
		 )
	,	("Welcome to Irabu's Office",
		 6,
		 "Friends",
		 "Yuta Tsuda is a high school student who suffers from a mobile phone addiction. He panics and suffers withdrawal when he is not on his phone. When he gets his phone confiscated in class, he goes home instantly and asks his mom to get a new one. Irabu starts to text him on his phone after getting one himself. Yuta asks Mayumi for her phone number, but she doesn't have one because she has no friends. After turning up to a Christmas party, Yuta starts to realize that his friends take advantage of him and make fun of him for his mobile addiction. Yuta subsequently starts removing all his contacts out of his SIM card, when Irabu and Mayumi call from the hospital and invite him to a Christmas party at Irabu's office. In this episode, Irabu mostly appears as his &quot;big&quot; form and shortly changes to his &quot;little&quot; form. This is the only episode so far where Irabu doesn't appear in his feminine &quot;middle&quot; form. After the vitamin shot, Yuta turns into a pale blue woodpecker with different colored spots."
		 )
	,	("Welcome to Irabu's Office",
		 7,
		 "Hedgehog",
		 "Seiji Ino is a Yakuza (more specifically: Designated Crime Syndicate - Koi Group Underground) who has an obsessive compulsive fear of edges (belonephobia), which includes knives, forks, needles, some fish, and even table edges. Seiji is known in the criminal world as &quot;the wise seiji&quot;; he shows this by saving a fellow member (his brother) from a rival group through challenging Yoshiyasu's (rival group leader) to Russian Roulette. He almost loses his mind when Irabu gets Mayumi to give him a vitamin shot. His Wife who runs a bar with Seiji puts a deposit on another bar that's owned by Yoshiyasu's syndicate, this causes more friction between the two factions. Irabu suggests that Seiji try sunglasses, as his fear is mainly getting sharp objects in the eye, he tries on some Sunglasses, but eventually purchases Ski Goggles. Seiji and his brother then negotiate the protection arrangements with Kohei from the first episode, with Irabu in tow. Seiji satisfyingly pokes his ski goggles with a pen, until he notices the table's edges. He then has a panic attack and saws off each edge of the table, then has another attack from the saw he used to neutralize the table. At home, Seiji's wife tells him that she's put down the deposit on the bar, in a panic and then logical moment, he decides to meet up with Yoshiyasu at the Restorante Pero's to retrieve the Deposit. Before meeting with his rival, he stops by Irabu General Hospital where Irabu is taking a photo of his Christmas pudding to send to Yuta. Seiji asks Irabu desperately for some medication, but instead Irabu ends up coming to Pero's with Seiji, being introduced as Irabu the Quack from Hiroshima. There, Irabu observes Yoshiyasu's own Obsessive Compulsion, that he uses his knife as a security blanket. Irabu then takes the knife away and holds onto it, allowing for Seiji to open up to Yoshiyasu and retrieve the Deposit. Christmas eve, Seiji shows signs of starting to overcome his Compulsive fear of sharp edges. Seiji appears as a small dog after the vitamin injection."
		 )
	,	("Welcome to Irabu's Office",
		 8,
		 "I Couldn't Sit",
		 "Yoshio Iwamura is a newspaper-magazine journalist, who has a classic case of check obsessive compulsive disorder, commonly fearing he forgot to put out a cigarette or a kettle, or turn the water off. He ends up rushing back to his house to make sure he hasn't flooded or burned down his building. As a treatment, Irabu takes him to a rival hospital (they stole one of his patients, and are corrupt), where Irabu encourages Yoshio to throw rocks at the hospital. Irabu points out the Hospital Director's car and suggests they loosen the tire bolts. After Irabu throws a rock, and after hesitating, Yoshio throws a rock only to break a window, they both then flee. Because of his disorder, Yoshio is moved to another magazine, this time a teen mag, popular with Girls. He is sent to investigate into a man called the &quot;Homeless Poet&quot; who turns out to be a fraud, and uses the article on him to lure girls. Upon finding out Yoshio gets infuriated and tracks him down, the final chase takes Yoshio running with the Homeless Poet's bag, and trying to get the hospital director to stop after worrying that Irabu has loosened the tires. He jumps in front of the car, where the homeless poet tackles him, spreading papers onto the cars windscreen, the director then crashes the car, and medical waste pours out, and upon looking at the papers that came out of the homeless poet's bag, finds out he's using his dead family records to help Illegal immigrants into Japan. Yoshio then does an article on the two Thugs and immediately becomes a famous reporter again. Irabu thanks Yoshio for exposing the corruptness of the rival hospital, and offers to let him meet Bando, Irabu tells Yoshio that his disorder did good, made him famous, and that he'd be ok if someone was home. On his way home, Yoshio finds an add for a share house. After the injection, Yoshio is represented as a raccoon."
		)
	,	("Welcome to Irabu's Office",
		 9,
		 "Gifted Child Actor",
		 "Hiromi Yasukawa is an actor (ex-child actor) who suffers from narcissistic personality disorder. He now only gets roles as extras, but gets kicked out of a role as a student in a drama for smiling constantly during a tense scene. In the past, he was a popular child actor who had his own television show. His agent (who Irabu is hitting on) offers him an audition to a movie that he refuses, because there's a sex scene. He's then a guest on a Japanese live TV show, where they make fun of him for his role in the School Drama where he's smiling during a serious scene, and that his role had the name &quot;Student-A&quot;. Hiromi gets very upset and not knowing what else to do, starts smiling, this brings an awkward silence to the audience. Afterwards, Hiromi's agent tells him that he's going to lose his contract, and her because of his behavior. Hiromi starts to smile, and has a breakdown. Back at his apartment, Hiromi is under his covers crying. Irabu tries to cheer him up, giving him a list of other things he could do instead of acting. After Hiromi refuses, Irabu gives him the sheet for the audition for the movie. Three days later, Hiromi turns up for the Audition wearing causal clothes rather than his usual child actor attire, surprising his agent. The calendar then flashes back to the day after Irabu gives him the audition sheet. Hiromi appears at Irabu's office and the two discuss the movie role. After Irabu gives him another shot, he notices that he doesn't smile when in pain, he rushes off home where he attaches pegs to his nipples. He turns up to the audition with the pain treatment, where he meets Irabu, who plans on auditioning for the part himself. During his audition, Hiromi has a moment of panic when he's reminded about his role on the school drama as Student-A. He rips his shirt off to remove the pegs that are causing him much pain. This turns out good for him, as he realizes he can make fun of himself, and not need to worry about his image. Irabu and Hiromi both don't get the part, although Hiromi is now a successful variety show host, where he uses some of his old Hiro-chan act."
		)
	,	("Welcome to Irabu's Office",
		 10,
		 "Owner",
		 "Mitsuo Tanabe is a successful businessman who owns the Great Japan Newspaper Company, and the Mighty Japan Great Powers Baseball team (the opponent of Tokyo Yakult Swallows in the fourth episode) who suffers from a panic disorder where he gets flashbacks. When he turns up to Irabu's office after the events of the last episode, he is given an injection. Both Irabu and Mayumi are shocked that he hasn't turned into an animal. The calendar goes back to December 17, where Bando has his first problems with his Yips, after the game Mitsuo is confronted by media that ask him questions on an apparent scandal that he has influence over the leader of a political party, and that he's made him postpone tax changes. The flashes from the journalist cameras start to disturb him, and he has flashbacks to the post war Tokyo, and moments afterwards including the construction of the Tokyo Tower, and the first Bullet Train service, as well as moments in the 1960s and 70s, he then faints. His doctor (Dr. Ikeyama from another episode) refers him over to Dr. Irabu. In Irabu's office after giving him an injection, Mayumi notices that a faltering fluorescent light is starting to upset Mitsuo, and she turns it off before he has an attack. Irabu then takes this chance to diagnose him with panic disorder and orders Mayumi to turn off all the lights. Mitsuo starts to have an attack, when a scared Irabu suddenly pounces him and Mayumi turns the lights back on. Irabu comments how he's afraid of the dark and still has a night light. Mitsuo then explains how he has visions of the past, suggesting he has PTSD, and that his Panic Disorder is brought on through his stressful role of Power. Irabu tells Mitsuo that he can wear sunglasses to soften the flashes, but that the best medicine is to retire. Mitsuo strongly disagrees, stating that he still has things to do. Later on, Irabu and Mitsuo go shopping, and he explains to Irabu that Japan is still an immature country as it depends on the US, and that he wants to change that. In the sunglasses shop, Seiji from a past episode has a panic attack while also purchasing glasses. A couple of days later, there is another baseball game, where Bando throws and injures another player; after the game the media confront Mitsuo, and he is outraged that they call Bando a &quot;terrorist&quot;. Again the media start to harass him, and he has another attack. In Mitsuo's office, after suffering an attack with the setting sun, and reading the newspapers reporting on Mitsuo's outburst, Irabu warns him that this continued problem can lead to depression. Mitsuo's aid tells him that he needs to leave for an appointment, Irabu carries him out to his limo where the media hound him again, and again he has a delusion that a dark mass is enveloping his limo. Irabu then offers to drive him in his Porsche Boxster Convertible. Irabu and Mitsuo speed off, outrunning the tabloids on their motorcycles, escaping them. Irabu drives past Shinbashi Station, where Mitsuo has a flashback to World War II when he was a young Soldier of the recovery operation of Tokyo at the end of the war, as well as watching baseball on an old television set in the 1950s. Then while driving past the Tokyo Tower, he flashes back to being a journalist, having a discussion with the workers on a lunch break. Then a N700 Series Shinkansen goes by above them, much to Irabu's inner train-spotter's joy. Then Mitsuo flashing back to watching the first Shinkansen service with his son. Irabu and Mitsuo stop to watch a baseball game, where he has a flashback to meeting his wife at a baseball game in the past. During this moment of peace, he realizes that he's been living in the past and that things have changed greatly already. His flashbacks start to diminish, and he starts to appear in his modern form, instead of him in the past. He has gray hair and glasses. Just as Mitsuo tries to catch the ball Bando has hit after curing his Yips, Irabu abruptly intercepts, and catches it himself. The next day, Mitsuo calls a press conference where he announces his retirement. On his way home, a couple of journalists, including Yoshio Iwamura (who has appeared several times throughout this episode) ask him for advice to become good journalists. Mitsuo accepts and invites the journalists in for a drink. "
		 )
	,	("Welcome to Irabu's Office",
		 11,
		 "Canary",
		 "After the chairman of a newspaper publishing company visits Dr. Irabu complaining of mysterious illnesses, Dr. Irabu does what he does best: injects him with a big dose of vitamins, hoping to see what kind of animal he’ll become. Excep this time, it doesn’t work!"
		 );

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("Welcome to Irabu's Office", 0, 1, 4)
	,	("Welcome to Irabu's Office", 0, 2, 4)
	,	("Welcome to Irabu's Office", 0, 3, 3)
;
INSERT INTO EVENT_DATA (EVENT_TIME, EVENT_TYPE_ID, EVENT_TITLE, EVENT_LOCATION, EVENT_FACEBOOK_ID, EVENT_UNIONE_URL) VALUES
		("2018-01-05 11-30-00", 0, "Summer Sessions", 0, 0, "0")
	,	("2018-01-12 11-30-00", 0, "Summer Sessions", 0, 0, "0")
	,	("2018-01-19 11-30-00", 0, "Summer Sessions", 0, 0, "0")
	
	,	("2018-01-05 16-30-00", 0, "Summer Sessions", 0, 0, "0")
	,	("2018-01-12 16-30-00", 0, "Summer Sessions", 0, 0, "0")
	,	("2018-01-19 16-30-00", 0, "Summer Sessions", 0, 0, "0")
	
	,	("2018-01-05 19-30-00", 0, "Summer After Dark", 0, 0, "0")
	,	("2018-01-12 19-30-00", 0, "Summer After Dark", 0, 0, "0")
	,	("2018-01-19 19-30-00", 0, "Summer After Dark", 0, 0, "0")
	
	,	("2018-01-26 11-30-00", 0, "Summer Sessions", 0, 0, "0")
	,	("2018-02-02 11-30-00", 0, "Summer Sessions", 0, 0, "0")
	,	("2018-02-09 11-30-00", 0, "Summer Sessions", 0, 0, "0")
	
	,	("2018-01-26 16-30-00", 0, "Summer Sessions", 0, 0, "0")
	,	("2018-02-02 16-30-00", 0, "Summer Sessions", 0, 0, "0")
	,	("2018-02-09 16-30-00", 0, "Summer Sessions", 0, 0, "0")
	
	,	("2018-01-26 19-30-00", 0, "Summer After Dark", 0, 0, "0")
	,	("2018-02-02 19-30-00", 0, "Summer After Dark", 0, 0, "0")
	,	("2018-02-09 19-30-00", 0, "Summer After Dark", 0, 0, "0")
	
	,	("2018-01-08 14-30-00", 0, "Summer Showcase", 0, 0, "0")
	
	,	("2018-01-10 10-00-00", 1, "Beach Episode", 2, 0, "0")
	,	("2018-01-17 10-00-00", 1, "Arcade Episode", 1, 0, "0")
	,	("2018-01-31 10-00-00", 1, "Pool Episode", 3, 0, "0")
;

INSERT INTO EVENT_ANIME_DATA (EVENT_TIME, ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER) VALUES
		("2018-01-05 11-30-00", "Mawaru Penguindrum", 0, 1)
	,	("2018-01-12 11-30-00", "Mawaru Penguindrum", 0, 2)
	,	("2018-01-19 11-30-00", "Mawaru Penguindrum", 0, 3)
	
	,	("2018-01-05 16-30-00", "Yurikuma Arashi", 0, 1)
	,	("2018-01-12 16-30-00", "Yurikuma Arashi", 0, 2)
	,	("2018-01-19 16-30-00", "Yurikuma Arashi", 0, 3)
	
	,	("2018-01-05 19-30-00", "Plastic Memories", 0, 1)
	,	("2018-01-12 19-30-00", "Plastic Memories", 0, 2)
	,	("2018-01-19 19-30-00", "Plastic Memories", 0, 3)
	
	,	("2018-01-26 11-30-00", "Assassination Classroom Season 2", 0, 1)
	,	("2018-02-02 11-30-00", "Assassination Classroom Season 2", 0, 2)
	,	("2018-02-09 11-30-00", "Assassination Classroom Season 2", 0, 3)
	
	,	("2018-01-26 16-30-00", "Little Busters Refrain", 0, 1)
	,	("2018-02-02 16-30-00", "Little Busters Refrain", 0, 2)
	,	("2018-02-09 16-30-00", "Little Busters Refrain", 0, 3)
	
	,	("2018-01-26 19-30-00", "Queens Blade 2 The Evil Eye", 0, 1)
	,	("2018-02-02 19-30-00", "Queens Blade 2 The Evil Eye", 0, 2)
	,	("2018-02-09 19-30-00", "Queens Blade 2 The Evil Eye", 0, 3)
	
	,	("2018-01-08 14-30-00", "Vividred Operation", 3, 1)
;

