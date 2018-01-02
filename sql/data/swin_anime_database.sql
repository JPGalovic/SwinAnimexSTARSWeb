-- Clear out Database
DROP TABLE IF EXISTS EVENT_ANIME_DATA;
DROP TABLE IF EXISTS EVENT_GAME_DATA;
DROP TABLE IF EXISTS EVENT_DATA;
DROP TABLE IF EXISTS EVENT_DETAILS;
DROP TABLE IF EXISTS EVENT_LOCATION;
DROP TABLE IF EXISTS EVENT_TYPE;
DROP TABLE IF EXISTS GAME_EVENT_TYPE;
DROP TABLE IF EXISTS GAME_PLATFORM;
DROP TABLE IF EXISTS GAME;
DROP TABLE IF EXISTS PLATFORM;
DROP TABLE IF EXISTS ANIME_SESSION;
DROP TABLE IF EXISTS ANIME_SESSION_TYPE;
DROP TABLE IF EXISTS ANIME_EPISODE;
DROP TABLE IF EXISTS ANIME_VOLUME;
DROP TABLE IF EXISTS ANIME_VOLUME_TYPE;
DROP TABLE IF EXISTS ANIME;
DROP TABLE IF EXISTS CLASSIFICATION;
DROP TABLE IF EXISTS COMPANY;

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
	,	("PG - Mild animated violence")
	,	("PG - Mild sexual references and animated violence")
	,	("PG - Mild sexual references and coarse language")
	,	("PG - Mild themes and animated violence")
	,	("PG - Mild themes and coarse language")
	,	("PG - Mild Themes and infrequent coarse language")
	,	("PG - Mild themes")
	,	("PG - Mild themes, animated violence and coarse language")
	,	("PG - Mild themes, sexual references and coarse language")
	,	("PG - Mild themes, sexual references and infrequent coarse language")
	,	("PG - Mild violence, themes, drug references and coarse language")
;

-- Data for M Classifications
INSERT INTO CLASSIFICATION (CLASSIFICATION) VALUES
		("M - Adult themes")
	,	("M - Animated nudity and sexualised imagery")
	,	("M - Animated science fiction violence")
	,	("M - Animated violence and infrequent coarse language")
	,	("M - Animated violence and sexual references")
	,	("M - Animated violence and supernatural themes")
	,	("M - Animated violence")
	,	("M - Animated violence, sexualised imagery and sexual references")
	,	("M - Coarse language and mature themes")
	,	("M - Coarse language")
	,	("M - Crude humour, sexual references and coarse language")
	,	("M - Fantasy themes and violence")
	,	("M - Infrequent animated violence and sexual references")
	,	("M - Infrequent coarse language")
	,	("M - Mature themes and animated violence")
	,	("M - Mature themes and sexual references")
	,	("M - Mature themes and sexual refernces")
	,	("M - Mature themes")
	,	("M - Mature themes, animated violence and coarse language")
	,	("M - Mature themes, drug references, sexual references and animated violence")
	,	("M - Mature themes, mild violence")
	,	("M - Mature themes, sexual references and coarse language")
	,	("M - Medium level violence")
	,	("M - Moderate violence, drug use")
	,	("M - Nudity")
	,	("M - Sexual references and animated nudity")
	,	("M - Sexual references and sexualised imagery")
	,	("M - Sexual references")
	,	("M - Sexual references, animated violence and nudity")
	,	("M - Sexual themes")
	,	("M - Sexualised imagery and animated nudity")
	,	("M - Sexualised imagery and sexual innuendo")
	,	("M - Supernatural themes and animated violence")
	,	("M - Violence, sexual references and nudity")
;

-- Data for MA15+ Classifications
INSERT INTO CLASSIFICATION (CLASSIFICATION) VALUES
		("MA15+ - Frequent animated nudity and sexualised imagery")
	,	("MA15+ - Strong animated violence and nudity")
	,	("MA15+ - Strong animated violence and sex scenes")
	,	("MA15+ - Strong animated violence and sexual references")
	,	("MA15+ - Strong animated violence")
	,	("MA15+ - Strong coarse language and animated violence")
	,	("MA15+ - Strong sexual innuendo")
	,	("MA15+ - Strong sexual references and frequent animated nudity")
	,	("MA15+ - Strong sexual references, animated nudity and violence")
	,	("MA15+ - Strong sexual themes, frequent animated nudity and sexualised imagery")
	,	("MA15+ - Strong sexual themes, frequent animated nudity, sex and sexual violence")
	,	("MA15+ - Strong sexual themes, references and innuendo, sexualised imagery and coarse language")
	,	("MA15+ - Strong sexual themes, sexual references and animated violence")
	,	("MA15+ - Strong sexualised imagery, crude sexual humour and coarse language")
	,	("MA15+ - Strong supernatural themes and animated violence")
	,	("MA15+ - Strong supernatural themes and violence")
	,	("MA15+ - Strong themes and animated violence")
	,	("MA15+ - Strong themes and bloody violence")
	,	("MA15+ - Strong themes, animated violence, sex scenes and nudity")
	,	("MA15+ - Strong violence")
	,	("MA15+ - Strong violence, drug use")
;

-- Data for R18+ Classifications
INSERT INTO CLASSIFICATION (CLASSIFICATION) VALUES
		("R18+ - High impact sexual themes")
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
;-- Table for Event Type
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
	,	(2, NULL, NULL, "Sorrento Oceach Beach, Ocean Beach Road, Sorrento VIC 3943", -38.345876, 144.727014, 17)
	,	(3, NULL, NULL, "Hawthorn Aquatic &amp; Leasure Center, 1 Grace St, Hawthorn VIC 3122", -37.820791, 145.034434, 17)
	,	(4, "Swinburne Hawthorn", "AS404", "Applied Sciences Building, Burwood Road, Hawthorn Victoria 3122", -37.822571, 145.037619, 17)
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

-- Table for Game Events
CREATE TABLE IF NOT EXISTS EVENT_GAME_DATA (
		EVENT_TIME						DATETIME
	,	GAME_TITLE						VARCHAR(100)
	,	GAME_EVENT_TYPE					INT(11)
	,	PRIMARY KEY						(EVENT_TIME)
	,	FOREIGN KEY						(EVENT_TIME) REFERENCES EVENT_DATA (EVENT_TIME)
	,	FOREIGN KEY						(GAME_TITLE) REFERENCES GAME (GAME_TITLE)
	,	FOREIGN KEY						(GAME_EVENT_TYPE) REFERENCES GAME_EVENT_TYPE (TYPE_ID)
);

-- Anime Data
INSERT INTO ANIME(ANIME_TITLE, NUMBER_OF_EPISODES, ANIME_SYNOPSIS, ANIME_DESCRIPTION, COMPANY_NAME, COPYRIGHT) VALUES
		("Shimoneta: A Boring World Where the Concept of Dirty Jokes Doesn't Exist",
		 12,
		 "In a world where dirty jokes don't exist, where the mere utterance of a ***** word will thrust you into jail, a hero must rise up as a symbol for all things lewd and rude. The mysterious Blue Snow, proudly wearing panties on her face and armed with naughty images and a foul mouth, will bring the art of dirty jokes back! With her erotic terrorist group, SOX, she will press against the stiff authority of the oppressive Decency Squad and step on their hard and overbearing rules. 

		 Tanukichi Okuma is the son of an imprisoned ero-terrorist. Rather than following in his father's footsteps, he plans to stay on the track of morality and wholesomeness. Just like his dream girl, Anna Nishikinomiya, he attends Japan's most moral school. But after an encounter with Blue Snow, his virtuous plans are ****** and he finds himself entangled with SOX. Will the pursuit of smut tarnish what hope he has with the pure Anna, or will he *** around, stimulated by the panty wearing deviant and her filthy mouth?",
		 "In a world where dirty jokes don't exist, where the mere utterance of a ***** word will thrust you into jail, a hero must rise up as a symbol for all things lewd and rude.",
		 "Madman",
		 "&copy; Hirotaka Akagi, Shogakukan/SOX"
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("Shimoneta: A Boring World Where the Concept of Dirty Jokes Doesn't Exist",
		 0,
		 1,
		 "MA15+ - Strong sexual themes, references and innuendo, sexualised imagery and coarse language",
		 12,
		 "https://www.animelab.com/shows/a-boring-world-where-the-concept-of-dirty-jokes-doesnt-exist"
		)
	,	("Shimoneta: A Boring World Where the Concept of Dirty Jokes Doesn't Exist",
		 3,
		 1,
		 "MA15+ - Strong sexual themes, references and innuendo, sexualised imagery and coarse language",
		 12,
		 "https://www.madman.com.au/catalogue/view/34323"
		)
	,	("Shimoneta: A Boring World Where the Concept of Dirty Jokes Doesn't Exist",
		 4,
		 1,
		 "MA15+ - Strong sexual themes, references and innuendo, sexualised imagery and coarse language",
		 12,
		 "https://www.madman.com.au/catalogue/view/38154"
		)
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("Shimoneta: A Boring World Where the Concept of Dirty Jokes Doesn't Exist",
		 1,
		 "Whom Public Order and Morality Serve?",
		 "Tanukichi Okuma heads to school by monorail where he looks forward to reuniting with his crush, Anna. After trying to defuse a tense situation, he finds himself about to be arrested by the moral police when the infamous perverted terrorist Blue Snow appears, spreading lewd leaflets around the train station and threatening to strip naked while Tanukichi escapes in the confusion. Later at school, Tanukichi's troubles continue as a classmate demands he answer how babies are made, and then the Student Council brings him in to ask that he hunt down Blue Snow before her influence spreads to the school. Later that day, he heads to a quiet cafe with Ayame who then ties him to a chair and reveals that she is actually Blue Snow. After being threatened into joining her crusade, Tanukichi helps her execute a plan at school during a student assembly, first spreading more perverted leaflets around the packed gym and then tricking the teachers into running outside while Ayame plays a video of two flies mating while she adds her own sound effects. Meanwhile, Tanukichi disguises himself as Blue Snow and starts drawing a giant asterisk sign on the track with a line painting machine. The entire school, including Tanukichi, finds themselves having trouble dealing with the weird new feelings brought on by this act."
		)
	,	("Shimoneta: A Boring World Where the Concept of Dirty Jokes Doesn't Exist",
		 2,
		 "The Mysteries of Pregnancy",
		 "While the school is recovering from Blue Snow's latest activity, Tanukichi recalls his own past and his connection to Anna, gaining the trust of the Student Council. Ayame then tasks him with copying and spreading increasingly-rare paper inserts with suggestive pornographic material across the school. Anna even hangs one such picture in the Student Council room, unaware of the double-meaning behind it until Tanukichi points it out. Tanukichi crushes on Anna again, but Ayame quietly warns him not to pursue her, as she can be frightening when angry, and that Anna's parents were responsible for the current and potential-future morals laws that have a stranglehold on Japan. Later, Ayame decides to hatch another plot at school during physical exams for the freshmen students. Ayame distracts Anna and Goriki while Tanukichi disguises himself as Blue Snow and attempts to teach some students dirty words by sight. However, Anna catches the disguised Tanukichi before he can finish and chases him around the school, cornering him until Ayame appears as the real Blue Snow with the captured urine samples of the freshmen boys. As Anna and Goriki race after her, Tanukichi takes off his Blue Snow disguise, unaware that an artistic student spotted him from a nearby roof."
		)
	,	("Shimoneta: A Boring World Where the Concept of Dirty Jokes Doesn't Exist",
		 3,
		 "How to Love Someone",
		 "During an award ceremony for Otome Saotome's work, Otome dramatically rips up her certificate on stage and claims she is in a slump. Later, Otome drags Tanukichi out of class and threatens to reveal his connection to Blue Snow unless he helps her resolve a romantic issue. Meanwhile, Anna finds herself dealing with a mysterious stalker leaving threatening messages in her school locker and mailbox. After taking Otome out to dinner, Tanukichi finds out that she is in love with Anna like him after she reveals her name. However, when she threatens to turn him in, Tanukichi claims to be in love with Ayame instead. The next day, Ayame thinks that Otome could be the stalker after Tanukichi tells her about the situation, but Tanukichi thinks it's someone else entirely. At the student council meeting, Ayame schemes to draw the stalker out of hiding by posing as Anna's boyfriend, while Otome decides to watch Anna with Tanukichi by disguising the two of them. As the plan is launched at a public park, Otome reveals how Anna is her sole reason for painting, as she couldn't imagine anyone else after meeting her. Suddenly, multiple stalkers appear and attack the disguised Ayame. Tanukichi leaps out of cover and defends the girls, but one of the thugs manages to briefly knock him out as he inadvertently kisses Anna. Tanukichi tries to excuse himself but falls unconscious as Anna tries to deal with new, unresolved feelings from the kiss."
		)
	,	("Shimoneta: A Boring World Where the Concept of Dirty Jokes Doesn't Exist",
		 4,
		 "The Saying Goes... Love Is Justice",
		 "After spending time in the hospital following the events at the park, Ayame tells him that she has persuaded Otome to join SOX in hopes of making more risque artwork, even finding ways to draw that the PMs can't detect, but Otome still requires Anna as an inspiration. Tanukichi soon returns to school, but Ayame is strangely absent and Anna keeps avoiding him. Later, Ayame talks about her latest plan to reclaim a hidden stash of old pornographic material located on private property in Yotsuga Forest. She can't do it alone, so instead she plans to lure the students from school out to the forest during the weekend. However, her plans are sidelined when Tanukichi is targeted by a stalker and Anna's mother, Sophia, shows up to the school in person to get the students to support her new legislation that would force all students to wear chastity belt-like devices. Running low on options, Ayame decides to have Tanukichi confront his stalker while Otome hides in a closet to draw lewd pictures herself. However, the stalker turns out to be Anna who restrains and attempts to rape Tanukichi while being unable to understand her feelings. After Ayame accidentally interrupts them, Anna flees as Otome begins furiously drawing the scene with her teeth. Later that night, Hyouka confronts Anna in the lobby of her apartment, asking why her science lab was sterilized without asking. Anna responds that it was done out of love, as the more &quot;impure&quot; influences she eliminates, the more she will be rewarded with love, therefore everything she does for love is just."
		)
	,	("Shimoneta: A Boring World Where the Concept of Dirty Jokes Doesn't Exist",
		 5,
		 "For Whom the Dirty Terrorism Benefits?",
		 "Ayame tasks Tanukichi with distributing Otome's new pornographic artwork to the students along with a map to Yotsuga Forest. However, Tanukichi finds himself targeted by an increasingly-obsessive Anna around school, trying to make him drink her &quot;love nectar,&quot; and drink from Tanukichi's. While escaping from Anna, he accidentally drops his bag filled with illegal material in Hyouka's lab and tells Ayame that he can't distribute them with Anna constantly trying to pin him down. On Sunday, the day of the &quot;X Prohibition Law&quot; signature drive, Sophia plans to greet the students of her daughter's academy in person and Ayame plans to quixotically storm the forest against a large force of morality police. Surprisingly, the students all show up at the forest, as Hyouka picked up Tanukichi's material and quietly spread copies around school herself. She manages to distract the police long enough for the female students and SOX to start looking for the hidden stash of porn. However, Anna shows up in person, chasing down Ayame in her Blue Snow disguise. Ayame tosses Tanukichi down into the forest to help him escape from Anna, where he finds the porn stash in a suggestively-shaped cave. However, when he hears Ayame being strangled by Anna, he decides to save her wearing a new disguise he found in the cave. Anna can't understand why the new terrorist gives her similar feelings to Tanukichi, and leaps into the forest in shame. Later that night, Sophia holds a press conference announcing the success of the petition drive, but discovers too late that someone replaced her signed petitions with pornographic artwork, which gets broadcast live around the country and embarrasses her push for the new law."
		)
	,	("Shimoneta: A Boring World Where the Concept of Dirty Jokes Doesn't Exist",
		 6,
		 "Handmade Warmth!",
		 "As Otome's hentai drawings spread around the school, Ayame decides to take the next step and make masturbation aids in the kitchen of the cafe SOX regularly gathers at. Tanukichi is assigned the task of getting Hyouka to develop small vibrators, but upon coming to collect one, a mostly-naked Hyouka attempts to learn about his &quot;cucumber&quot; as payment for her services. While they argue, Anna stops by and starts growing jealous, so Tanukichi quickly hands her a finished vibrating egg without telling her its true purpose to calm her down. The next day, Tanukichi accidentally activates the vibrator with the wireless remote Hyouka gave him, reawakening Anna's lust. Tanukichi tries desperately to escape or find a way to turn off the vibrator, but none of his friends want to help him, and Anna finally traps him inside the Student Council room. Tanukichi discovers that Anna turned the vibrator into a pendant, but is unable to reach it while being pinned down under her. Eventually, the vibrator shorts out as Anna climaxes and Tanukichi manages to escape. Later, Anna overhears Otome make a dirty remark about Tanukichi and starts strangling him while Ayame refuses to help."
		)
	,	("Shimoneta: A Boring World Where the Concept of Dirty Jokes Doesn't Exist",
		 7,
		 "What SOX Created",
		 "SOX forms alliances with other erotic terrorist groups throughout Japan to share various pornographic books with each other. Back at school, the student council discovers that someone has been stealing the underwear of girls and boys throughout the city and crediting SOX with the heists. Tanukichi and Ayame watch a girls' changing room to catch a thief, but when Ayame runs off, Anna appears to sexually assault Tanukichi again. Shortly after that, Tanukichi reunites with Ayame only to find her speaking with Hyouka, and confiscates her yaoi book with characters loosely based off himself and Goriki on the cover. Soon, Goriki manages to round up multiple underwear thieves around school, when a mysterious terrorist calling himself &quot;White Peak&quot; of the group &quot;Gathered Fabric&quot; broadcasts his message across school. Back at the cafe, Ayame declares that SOX must take down White Top before his actions undercut the message of SOX. Later that same night, Tanukichi helps a little girl escape the moral police with the help of Hyouka in exchange for turning a blind eye to her yaoi books. The girl then tries to attack Tanukichi until he reveals that he's a member of SOX. The girl reveals herself to be Kosuri Onigashira, and she desperately wishes to join SOX. Ayame is reluctant to trust her, as Kosuri is daughter of Keisuke, another ero-terrorist who made deals with the moral authorities. However, she decides to let Kosuri become a member of SOX, in part because Kosuri's hairstyle reminds her of a penis head."
		)
	,	("Shimoneta: A Boring World Where the Concept of Dirty Jokes Doesn't Exist",
		 8,
		 "The Devil Blows His Own Trumpet",
		 "Tanukichi wakes up to find Kosuri sleeping next to him and Anna dangerously holding a knife in his doorway. He quickly decides to pretend Kosuri is his little sister, but it backfires as Anna threatens to stab her, cutting a large hole in his floor before leaving. Later at school, Anna's father has sent Oboro Tsukimigusa to become the school's Prefect and take charge of the effort to eliminate impure influences in school. However, unlike the moral authorities, Oboro starts by removing mundane items like basketball hoops and volleyball nets as they may somehow lead boys to immoral thoughts. She also tries to confiscate Hyouka's yaoi manga until Hyouka convinces her that it has useful value. Meanwhile, Ayame plans to have SOX distribute Otome's drawings at other schools. Kosuri decides to take charge of the operation herself while Tanukichi convinces Oboro to white-list toilet paper rolls before Anna has an accident. Later, Kosuri returns to report her mission was completely successful, and fueled by her new success, treats Tanukichi like a slave at home. She explains to Tanukichi that she subverted the other school's student council by using her knowledge of shoujo and romantic manga tropes to play the boys and girls off of each other until they all fell under her control. While Tanukichi detests her methods, he can't bring himself to sell Kosuri out to Ayame. The next day, Ayame privately tells Tanukichi that SOX's actions suffered blowback with the sudden appearance of Oboro and her comrades. On top of dealing with the threats of the moral authorities and the Gathered Fabric faction, SOX must also find a way to sabotage the Prefect system before the government exports it to other schools."
		)
	,	("Shimoneta: A Boring World Where the Concept of Dirty Jokes Doesn't Exist",
		 9,
		 "Do Androids Dream of Electric Masseurs?",
		 "Ayame launches an operation at school to try and sabotage both the school Prefect program and Gathered Fabric at the same time. First, she uses her Blue Snow persona to spread more lewd drawing materials throughout school while Tanukichi will hang his used boxers to try and attract Gathered Fabric, then take out the underpants thieves to show that SOX does not support them. However, Anna and Oboro come through the door instead. Anna again assaults Tanukichi, and he begs for help from Oboro but she offers none, claiming that even though the act may be immoral, she was trained not to interfere if Anna herself acts immorally. Meanwhile, Kosuri gets jealous that she is left out of the action while Otome uses the time to draw more yaoi artwork. Ayame launches the same plan again, as Tanukichi lies in wait for Gathered Fabric to appear. As Tanukichi manages to knock out several Gathered Fabric members, Kosuri meets with Hyouka to help herself, but Hyouka is not swayed by her usual charm. Elsewhere, Tanukichi subdues another panty thief and immediately steps on the crotch of a second person who stumbled into the same room. However, he discovers that person is Oboro, and that she actually has a penis. Oboro explains that she has been trained to serve Anna and her father for years, to the point that her likes, dislikes, even her gender are whatever Anna's family wants them to be. Suddenly, the fire alarm is pulled and the school evacuates. Back at SOX's hideout, Kosuri takes responsibility for the act, but Ayame scolds her for sabotaging the plan with her own stubbornness. As SOX tries to think of their next move, they receive a message written on a pair of panties to meet at a nearby park, where White Peak himself appears."
		)
	,	("Shimoneta: A Boring World Where the Concept of Dirty Jokes Doesn't Exist",
		 10,
		 "Masturbation Quest",
		 "As SOX makes negotiations with White Peak to stop hunting down Gathered Fabric members, Their negotiations fall through as Ayame chastises him for using erotic terrorism as a front for the panty thefts. The next morning as Tanukichi rushes to school on a bus due to the broken monorail, Goriki tells him that somebody cut the monorail's power lines, to which he suspects the antics of Gathered Fabric. While talking to Ayame however, Tanukichi and Goriki's bus becomes hijacked by a Gathered Fabric member. Among the jacked buses, Hyouka, Anna and Oboro, and Otome are in separate buses, with White Peak holding Otome's bus hostage. During his bus jacking, White Peak also hijacks the PM systems and proclaims war and his organization as an affiliate with SOX. As Hyouka is interrupted watching the news, she questions the Gathered Fabric member about panties, to which she is threatened by a gun, in which she identifies is a fake. As a result, the jacker is quickly subdued by the bus passengers, and Hyouka receives praise for her actions, although quickly dismissing their words. Meanwhile in Anna and Oboro's bus, as their jacker is collecting everybody's undergarments, Anna single-handedly beats him down, prompting fearful reactions from the male passengers (except for Oboro). On Tanukichi and Goriki's bus, as Goriki is about to give up his undergarments, he causes everybody to vomit in the bus, including the jacker and even the driver who saw him in women's underwear. As Tanukichi escapes, Ayame finds a leak in White Peak's true identity: Takuma Ichinose. She also finds out that there is a real gun among the fakes, to which Hyouka is monitoring. To apprehend Takuma, Ayame has Kosuri gather white panties and lure out Takuma's bus. Despite Tanukichi using musk panties to mask and protect himself, He is overpowered by Takuma, who becomes empowered (and turned on) by the scent. After Ayame intervenes, he is thrown off by Ayame's own scent infused in her panty mask, which allows Tanukichi to restrain him. Before SOX successfully captures him however, Ayame gets kicked out of the bus by Kosuri, prompting the Decency Squad to chase after her. Kosuri reveals she had switched places with the hostage, and joins Gathered Fabric for the sake of war, to which she points a stun gun at Tanukichi."
		)
	,	("Shimoneta: A Boring World Where the Concept of Dirty Jokes Doesn't Exist",
		 11,
		 "Techno Break",
		 "As Kosuri points her stun gun at Tanukichi, he has no choice but to flee the bus, and he is chased further by the Decency Squad. After Kosuri helps out Takuma, they proceed to take the hostages to Zoshigaoka Academy. After managing to evade the Decency Squad, Tanukichi is approached by Hyouka, who shows him a breaking news story where 39 buses holding 500 hostages are being taken to Zoshigaoka Academy. At the school, the members of Gathered Fabric are making ransom demands with food and drinks as well as new panties, at the cost of provocative images of the students wearing panties on their heads if they fail to comply. As the students put on fresh pairs of panties to mark with their scent, Otome becomes excited at the sight and starts drawing with her mouth, to which she drops her pencil and stumbles across a box of paint. Meanwhile, Ayame and Tanukichi assess the dire situation at hand, to which SOX's blame in this incident will have society see them as criminals, and that the only way to clear SOX's name is to have them capture White Peak, lacking the numbers to do so. As Tanukichi is awkwardly approached again by Hyouka, she explains how people like Anna are brainwashed to believe that anything they do is &quot;righteous&quot; and fall into insanity. Reminded of Anna, Tanukichi devises a risky plan that if successful, can take down Takuma. While Kosuri devises tactics for Gathered Fabric, Takuma reveals that he had no intentions of a revolution or warfare or even wanting to escape. Betrayed, Kosuri tries to immobilize him with her stun gun, which fails due to the wine-stained underwear covering his body from the shock. Later, Otome calls Tanukichi, who manages to escape by drawing 3D perception art of her and the hostages, telling him Takuma's and the other hostages' location. As Tanukichi executes his plan, Takuma is about to receive his third set of panties, until Ayame, Tanukichi, and Anna step in, as well as Goriki and Oboro. Tanukichi reveals that his plan was to get Anna to join forces with SOX, in exchange for his underwear, but has to keep scrubbing the scent off of him so that his cover would not be blown. As Otome helps the students escape using drawings of panties to distract Gathered Fabric members, Ayame and Anna finish off Takuma for good. After Ayame's dirty joke speech to the public, Kosuri returns to SOX, now acknowledging Ayame as her master once more."
		)
	,	("Shimoneta: A Boring World Where the Concept of Dirty Jokes Doesn't Exist",
		 12,
		 "Dirty Jokes Forever!",
		 "The SOX members receive invitations to meet up at a hot springs resort called Health Land in Nukumi, presumably by Sophia Nishikinomiya herself. Tanukichi remembers an artifact passed down to him by his father to be used if he ever travels to Nukumi and decides to take it with him. When they arrive at the resort, they are met by Goriki and Anna who reveal they were invited by Sophia as well. Anna jumps to the thought that her mother reserved the entire resort so that Anna can spend time with Tanukichi, but they all decide to spend time in the baths to wait for Sophia's return. Anna sends Goriki off to fetch something and sexually assaults Tanukichi, but everyone was interrupted by a woman's scream. Everyone finds Sophia's unconscious body in the lockers, where they are confronted by an ero-terrorist called Base Black. Base Black reveals himself to be the one who gathered everyone to the resort and sends them on a brief chase which ends in him retrieving Tanukichi's artifact. Ayame and Tanukichi find him when attempting to fetch their bags for their clothes, which were replaced by black undergarments. He tells that he personally knew Zenjuro and plans to unlock a secret place filled with erotic treasures using the artifact. The others catch up to the scene and Base Black challenges them to a duel for the artifact through Yakyuken. Goriki's loss and subsequent undressing stuns Base Black long enough for Tanukichi to retrieve the artifact, and alongside Ayame are tasked with hiding it deep in the woods while the rest hold off Base Black. They decide to find the treasure instead, but are unable to find an old cable tram to travel up the mountainous area. Hyouka finds them while collecting bugs and helps them locate and power the tram. As Tanukichi and Ayame are riding the tram, Anna appears while climbing the cables to catch up to Tanukichi and causes the floor of the tram to collapse with her falling through. The duo reach an old mansion and explore it, finding a mechanism that the artifact fits through as a wrench. Kosuri and Otome catch up to them and help open the vault containing the treasure - a large number of erotic sculptures and statues. After resealing the vault, the four find Base Black observing them from above, satisfied on how Tanukichi had grown up. The four reunite with Goriki and Anna while Oboro destroys the cable tram. They pledge that one day the treasure will be able to see the world again when the anti-profanity enforcement comes to an end."
		)
;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("Shimoneta: A Boring World Where the Concept of Dirty Jokes Doesn't Exist", 0, 1, 4)
	,	("Shimoneta: A Boring World Where the Concept of Dirty Jokes Doesn't Exist", 0, 2, 4)
	,	("Shimoneta: A Boring World Where the Concept of Dirty Jokes Doesn't Exist", 0, 3, 4)
	,	("Shimoneta: A Boring World Where the Concept of Dirty Jokes Doesn't Exist", 3, 1, 2)
;

-- Anime Data
INSERT INTO ANIME(ANIME_TITLE, NUMBER_OF_EPISODES, ANIME_SYNOPSIS, ANIME_DESCRIPTION, COMPANY_NAME, COPYRIGHT) VALUES
		("Assassination Classroom",
		 22,
		 "Forget about homework and pop quizzes. The students of Class 3E have a far more important assignment: kill their teacher before the end of the year! A tentacle-d sensei that moves at Mach 20 is out to conquer the classroom after destroying seventy percent of the moon. In addition to reading, writing, and arithmetic, the murderous monster behind the lectern will teach his students everything he knows about the assassination game. Should some eager beaver prove to be a quick study in killing, he or she will save Earth from extinction – and collect a hefty reward. But they’d better take some serious notes while class is in session because their slaughtering sensei has eight deadly tentacles just waiting to wreak havoc on humanity!",
		 "Forget about homework and pop quizzes. The students of Class 3E have a far more important assignment: kill their teacher before the end of the year!",
		 "Madman",
		 "&copy;Yusei Matsui/SHUEISHA,ASSASSINATION CLASSROOM Committee"
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("Assassination Classroom",
		 1,
		 1,
		 "M - Animated science fiction violence",
		 11,
		 "https://www.madman.com.au/catalogue/view/31750"
		)
	,	("Assassination Classroom",
		 1,
		 2,
		 "M - Animated violence, sexualised imagery and sexual references",
		 11,
		 "https://www.madman.com.au/catalogue/view/37366"
		)
	,	("Assassination Classroom",
		 2,
		 1,
		 "M - Animated science fiction violence",
		 11,
		 "https://www.madman.com.au/catalogue/view/36536"
		)
	,	("Assassination Classroom",
		 2,
		 2,
		 "M - Animated violence, sexualised imagery and sexual references",
		 11,
		 "https://www.madman.com.au/catalogue/view/37367"
		)
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("Assassination Classroom",
		 1,
		 "Assassination Time",
		 "A tentacled creature of unknown origin destroys over seventy percent of the moon, and he announces that he will destroy the world in one year. Nonetheless, Ministry of Defense government worker Tadaomi Karasuma allows the creature to be the teacher of Kunugigaoka Junior High School's Class 3-E. The students are given weapons specially designed to hurt the creature and are offered a reward of ten billion yen to whoever can assassinate him before graduation. However, none of the students are able to assassinate him due to his Mach 20 speed. Class bully Ryōma Terasaka convinces Nagisa Shiota to wear a grenade filled with pellets. When the creature gets sleepy after assigning the students to write a poem, Terasaka detonates the grenade once Nagisa comes within close range of the creature, but the creature sheds his skin to protect himself and Nagisa from the blast. The creature threatens the other students to refrain from coming up with plans that will harm others. Kaede Kayano names the creature Koro-sensei, seeing him as an &quot;unkillable teacher&quot;."
		)
	,	("Assassination Classroom",
		 2,
		 "Baseball Time",
		 "While Koro-sensei is reading a newspaper, Nagisa encourages Tomohito Sugino to attempt to assassinate Koro-sensei by a pitching a baseball embedded with pellets. However, Koro-sensei easily dodges the baseball and catches it with a baseball glove. Later after lunchtime, Sugino is downhearted when Koro-sensei crushes his dream of being a pro baseball star, but this is due to his wrists and elbows not being as flexible as they should be. Koro-sensei encourages Sugino to focus on his own strengths for future attempts of assassination. The students of Class 3-E fail to kill Koro-sensei, even when he deliberately ties himself to a tree branch. Karasuma joins Class 3-E as the physical education teacher, observing how the class is ridiculed by the other students of the school. Another student due to transfer into the class is informed of his mission. "
		)
	,	("Assassination Classroom",
		 3,
		 "Karma Time",
		 "Karma Akabane transfers into Class 3-E following a suspension, managing to inflict some damage to Koro-sensei by giving a handshake with knife shards cleverly taped to his hand. While the students later take a quiz, Karma steals Koro-sensei's special gelato to get his attention, shooting him with an unloaded gun to catch him off guard. After hearing word from Nagisa that Koro-sensei worships the octopus, Karma leaves a dead octopus on Koro-sensei's desk. However, Koro-sensei cooks it into takoyaki to ridicule Karma. Throughout the day, Koro-sensei manages to anticipate every prank Karma tries to pull. As a last resort, Karma jumps off a cliff with a gun in hand, which would determine if Koro-sensei would risk his life for a student or would destroy his pride as a teacher. However, Koro-sensei manages to save Karma use his tentacles as a giant spiderweb, leading Karma to accept Koro-sensei as a teacher."
		)
	,	("Assassination Classroom",
		 4,
		 "Grown-Up Time",
		 "The students of Class 3-E are introduced to their new foreign language teacher, Irina Jelavić, who is actually a professional Serbian assassin with no interest in teaching the students. After being seduced by her, Nagisa shares all of his notes about Koro-sensei's weak points to Irina. When Koro-sensei returns, Irina ropes him into the storage shed, so that her team of assassins can kill him. However, this fails as a result of using the wrong ammo on purpose and ignoring his keen sense of smell. Later, after the students of Class 3-E rebel against Irina when she refuses to teach them properly, Karasuma shows her how dedicated Koro-sensei is to teaching each of his students and how important education is for assassination. Realizing the error of her ways, Irina begins to earnestly teach her students, helping them learn the art of communication."
		)
	,	("Assassination Classroom",
		 5,
		 "Assembly Time",
		 "Manami Okuda attempts to poison Koro-sensei, but to no effect. She has poor communication skills, but she has a passion for chemistry. Because of this, Koro-sensei offers to help Manami make an effective poison. However, it turns out to be a tonic that transforms him into a speedier liquid form, teaching Manami to improve her communication skills so she can successfully deceive him someday. Later, the students of Class 3-E are forced to travel from their old campus and head to the main campus to endure a school assembly. The students from others classes become envious due to the students of Class 3-E having Karasuma and Irina as cool teachers. Koro-sensei shows his support by disguising himself as a scholar, providing extra copies of handouts previously not given to Class 3-E. Afterwards, Nagisa manages to use his experiences in Class 3-E to handle himself against Nobuta Tanaka and Chōsuke Takada, two bullies from the main campus."
		)
	,	("Assassination Classroom",
		 6,
		 "Test Time",
		 "School principal Gakuhō Asano pays a visit to Class 3-E to greet Koro-sensei. Having noticed how Nagisa stood up to Nobuta and Chōsuke, Gakuhō tells Koro-sensei to adhere to his educational system, which requires Class 3-E to be at its poorest to encourage the other students. Noticing the students of Class 3-E only caring about the bounty reward rather than getting high grades, Koro-sensei issues the ultimatum of leaving and destroying the school, should any of the students fail to score well enough in the midterm exams to rank among the top fifty students. During the midterm exams, the students of Class 3-E use what they learned from Koro-sensei's teaching methods to tackle each question they come across. However, they are stopped in their tracks by questions that Gakuhō had added at the last minute without informing Class 3-E of the changes, resulting in none of the students other than Karma ranking among the top fifty students. Downhearted from underestimating Gakuhō, Koro-sensei receives some encouragement from his class and becomes determined to turn things around for the final exams."
		)
	,	("Assassination Classroom",
		 7,
		 "School Trip Time/1st Period",
		 "The students of Class 3-E prepare for a field trip to Kyoto, which is also being used as a venue to assassinate Koro-sensei. The students are arranged into groups, in which Nagisa, Kaede, Karma, Sugino, Manami and class idol Yukiko Kanzaki agree to be in a group. On the train ride to Kyoto, high school male delinquents steal Yukiko's itinerary noting the group activities. On the next day, the group visits all the assassination landmarks, but they are ambushed by the male delinquents, who kidnap Kaede and Yukiko. Whilst in captivity, Yukiko laments to Kaede about her rebellious acts due to being raised in a strict family. Nagisa, Karma, Sugino and Manami manage to use an extensive guidebook written by Koro-sensei, which provides a thorough procedure for hostage situations, to deduce where Kaede and Yukiko are being held. Koro-sensei arrives to deal with the delinquents, while Nagisa and the others knock out the delinquents with their guidebooks. Following the incident, Yukiko is encouraged by Koro-sensei's words of wisdom, in which those with the will to drive forward will come out strong regardless of situation or status."
		)
	,	("Assassination Classroom",
		 8,
		 "School Trip Time/2nd Period",
		 "While the other groups are accompanying Koro-sensei on a tour of Kyoto, a sniper known as Red Eye is tasked with assassinating him at various spots. However, each of his attempts to shoot him are thwarted by improbable means, and his mission is called off when Nagisa's group gets into trouble with the high school male delinquents. Later that evening, Red Eye is approached by Koro-sensei himself, who treats Red Eye to a meal, thanking him for making the field trip a valuable learning experience for his students due to his assassination efforts. Red Eye, understanding Koro-sensei's morals as a teacher, decides to quit his job in order to explore the world. Back at their hotel, private time among the boys and girls eventually turns into a hunt for Koro-sensei when he eavesdrops on their gossips. Koro-sensei hides from the students, telling Karasuma that the students wanted him to talk about his past love life. As the field trip comes to a close, the world government prepares two special assassins to transfer into Class 3-E."
		)
	,	("Assassination Classroom",
		 9,
		 "Transfer Student Time",
		 "The students of Class 3-E are greeted by their first transfer student, an artificial intelligence from Norway known as the Autonomous Intelligence Fixed Artillery, who uses calculations to assess the best way to shoot Koro-sensei, managing to blow off one of his fingertips with her second barrage of gunfire. However, the students quickly gets sick of her constantly firing her weapons during class, deciding to tape them shut themselves so they can study properly. After class, Koro-sensei makes some modifications to the Autonomous Intelligence Fixed Artillery, giving her a more human personality. The next day, the students appreciate her more and nickname her Ritsu. Later that night, Ritsu's inventors are outraged with the changes and decide to remove all the modifications. However, Ritsu manages to hide her new personality from them before it is deleted, deciding to secretly defy her inventors for the sake of keeping her promise to help her classmates."
		)
	,	("Assassination Classroom",
		 10,
		 "L and R Time",
		 "Irina is caught off guard by retired Russian assassin Lovro Brovski, her former master, who advises her to give up trying to kill Koro-sensei. Instead, Koro-sensei proposes a match between Irina and Lovro to see who will be the first to &quot;kill&quot; Karasuma with a rubber knife, offering Karasuma his own incentive should neither of them win. Despite Lovro's doubts after he fails to &quot;kill&quot; Karasuma himself, Irina manages to use what she has learned targeting Koro-sensei to get close, with Karasuma accepting defeat at her hands and Lovro acknowledging her efforts. Nagisa, Karma and Ritsu later agree to accompany Koro-sensei at Mach 20 speed on a trip to Hawaii to watch the premiere of a new movie, getting a lecture along the way and learning a lot more about Koro-sensei's point of view. On their way back, a man in a white cloak observes alongside a boy, the second transfer student who claims to be Koro-sensei's younger brother."
		)
	,	("Assassination Classroom",
		 11,
		 "Transfer Student Time/2nd Period",
		 "The students of Class 3-E prepare for the arrival of their second transfer student, who is allegedly more powerful than Ritsu. The man in the white cloak named Shiro enters the classroom and introduces the boy named Itona Horibe, who surprises the other students with his relation to Koro-sensei. When Itona faces against Koro-sensei later that day, Koro-sensei is overwhelmed by the fact that Itona possesses tentacles in his hair. While Shiro uses his knowledge of Koro-sensei's weaknesses to give Itona the advantage, Koro-sensei counterattacks with rubber knives to push Itona out of the ring, thereby winning the match. Itona goes berserk after seeing himself as weak, so Shiro knocks him unconscious and carries him out of the classroom. The students interrogate Koro-sensei about his true origins, but he remains tight-lipped, stating that they must continue their mission in order to find the answers that they seek. The students ask Karasuma to teach them more techniques, as they are determined to kill Koro-sensei before anyone else."
		)
	,	("Assassination Classroom",
		 12,
		 "Ball Game Tournament Time",
		 "As a baseball tournament is to be held, the male students of Class 3-E are forced to play an exhibition match against the top players of the boys baseball club. Despite knowing the odds are against them, particularly when pitted against baseball club captain Kazutaka Shindō, Koro-sensei is prompted to coach the students for the match. On the day of the match, the students of Class 3-E use a bunting strategy to load the bases, allowing Sugino to help the team get an early lead. Not willing to let this slide, Gakuhō takes over as the baseball club's coach to put a stop to the bunting strategy, using the power of hypnosis to turn Shindō into a bloodthirsty warrior. With the bases now loaded against Class 3-E, Karma uses previous provocations he made concerning some unfair play to his own advantage, placing himself and class president Yūma Isogai very close to Shindō, who breaks down from trying to swing his baseball bat without hurting them. This allows the students of Class 3-E to win the match. Afterwards, Sugino expresses how he wanted to show off the friends he made in Class 3-E, managing to rekindle his old friendship with Shindō."
		)
	,	("Assassination Classroom",
		 13,
		 "Talent Time",
		 "Karasuma evaluates the progress of the students during their training, but he briefly senses a fearsome aura, like that of a python, coming from Nagisa. Soon after, Karasuma's colleague Akira Takaoka is sent to Class 3-E to take over as the new physical education teacher. He initially uses a lightheaded personality to attract the students, but his true nature as a ruthless and sadistic instructor is soon unveiled. When Karasuma withholds Takaoka from torturing the students any longer, Karasuma is challenged to pick one of his star pupils to use a real knife in a match against Takaoka. Karasuma nominates Nagisa, who uses the assassination skills he learned from Karasuma. Nagisa manages to get the upper hand on Takaoka and wins the match. When Takaoka violently objects to defeat, Karasuma beats him back. Gakuhō arrives to fire Takaoka, and Karasuma returns to his position as the physical education teacher."
		)
	,	("Assassination Classroom",
		 14,
		 "Vision Time",
		 "Koro-sensei takes the students of Class 3-E to their own private pool that he made, but the students are alerted when Koro-sensei's tentacles swell up when soaked in water. Meanwhile, Terasaka becomes irritated when his friends Takuya Muramatsu and Taisei Yoshida are getting along with Koro-sensei. Terasaka agrees to collaborate with Shiro and Itona in their assassination plan, previously dropping a &quot;bug bomb&quot; in the classroom to excrete Koro-sensei's mucus and secretly adding a transmitter in the pool. Then, Terasaka gathers the other students in the pool, using a gun connected to the transmitter as a signal for Shiro and Itona. Instead, the transmitter sets off an explosion and puts the students in danger, forcing Koro-sensei to get his tentacles soaked in order to rescue the students from being swept away. Koro-sensei is left at the mercy of Itona, while Sumire Hara is hanging onto a tree branch nearby. Following Karma's plan, Terasaka uses his shirt still affected by the &quot;bug bomb&quot; to infect Itona, allowing Koro-sensei to rescue Hara whilst the other students splash water to halt Itona. Shiro and Itona are forced to withdraw yet again."
		)
	,	("Assassination Classroom",
		 15,
		 "End-of-Term Time",
		 "With the final exams approaching, Koro-sensei offers an incentive, in which each student who gets the best overall score in their top subject will get to shoot off one of his tentacles during their next assassination attempt. Meanwhile, Shindō informs the students of Class 3-E about Class 3-A's Big Five (Gakushū Asano, Teppei Araki, Ren Sakakibara, Natsuhiko Koyama and Tomoya Seo), who are all determined to take Class 3-E down. When Nagisa, Manami, Yukiko, Isogai and Rio Nakamura go to study in the main campus library, the Big Five proposes a contest, stating whichever class snags the most top spots in the exams can demand anything from the losing class. While Class 3-A sets their sights on making Class 3-E show complete servitude to them, Koro-sensei proposes his own suggestion of what Class 3-E can ask from their opponents. With both classes determined to win, the stage for the end-of-term final exams is set."
		)
	,	("Assassination Classroom",
		 16,
		 "School's Out/1st Term",
		 "The students of Class 3-E and the students of Class 3-A fight against each other to slay the test problems before them, with the students of Class 3-E benefiting from Koro-sensei's unique teaching methods. When the results are revealed, Nakamura scores higher than Tomoya in English; Isogai scores higher than Gakushū in social studies; and Manami scores higher than Koyama in science. Koro-sensei shuns Karma for losing to Gakushū due to studying very little and being overconfident. Terasaka, Yoshida, Muramatsu and Kirara Hazama each earn an additional tentacle for scoring top marks in home economics, resulting in a total of seven tentacles overall. Having won the wager for the contest, the students of Class 3-E decide to use their reward, a summer vacation at an island resort in Okinawa, as the venue for their assassination attempt."
		)
	,	("Assassination Classroom",
		 17,
		 "Island Time",
		 "Prior to their trip, biologist Hinano Kurahashi helps Nagisa, Sugino and Hiroto Maehara hunt for bugs, while pervert Taiga Okajima shows them his own trap laid out for Koro-sensei using a pile of porn magazines. However, Kurahashi becomes fascinated when Koro-sensei spots a rare stag beetle worth a ton of yen. Later, Lovro is called in to help train the students for their island assassination, taking interest in the two top marksmen of the class, Ryūnosuke Chiba and Rinka Hayami. After telling Nagisa about the world's most infamous assassin known only as The Reaper, Lovro decides to teach Nagisa a surefire assassination technique. The students of Class 3-E soon arrive at their island resort, making all the necessary preparations for their assassination. After having dinner, during which Koro-sensei inadvertently uses up his emergency shedding technique to get rid of sunburn, the class begin their assassination attempt aboard an on-sea chapel."
		)
	,	("Assassination Classroom",
		 18,
		 "Action Time",
		 "Koro-sensei is forced to watch an hour-long movie edited and narrated by Kōki Mimura exposing all of Koro-sensei's embarrassing habits, used as a distraction from the chapel slowly filling with water and bloating up his tentacles. Once the students of Class 3-E shoot off the seven tentacles, they surround and block Koro-sensei with a hydraulic cage, allowing Chiba and Hayami to snipe him. However, Koro-sensei activates his ultimate defense, trapping himself in an indestructible crystal sphere, which will last for one day despite his limited movements. As the students lament their failed assassination attempt, many of them suddenly and severely fall ill. This is revealed to be the work of a mysterious third party who had spiked their drinks with a supposedly deadly virus, demanding that the remaining students and teachers bring him the immobilized Koro-sensei in exchange for the antidote. Deciding against the trade-off, Koro-sensei and Ritsu instead come up with a plan to infiltrate the high-security hotel and obtain the antidote."
		)
	,	("Assassination Classroom",
		 19,
		 "Pandemonium Time",
		 "Manami and Kōtarō Takebayashi stay behind to take care of the poisoned students. A team of fifteen healthy students along with Karasuma, Irina and Koro-sensei scale up a mountainside to sneak into the hotel undetected. With the first floor lobby area heavily monitored by bodyguards, Irina uses the art of seduction and her skills in playing the piano to distract the bodyguards, so that the others can reach the next floor. On the third floor central hall, the group comes across their first opponent named Smog, who is responsible for serving the spiked drinks to poison the students with the virus. Smog hits Karasuma with a canister of paralysis gas, but Karasuma still musters up the strength to knock out Smog. On the fifth floor scenic walkway, the group finds their next opponent named Grip. Not intimidated when Grip easily breaks a glass window with his fist, Karma makes up for his failure in the final exams and steps up to fight against Grip."
		)
	,	("Assassination Classroom",
		 20,
		 "Karma Time/2nd Period",
		 "After Karma dodges Grip with his fistful of grabs, Grip hits Karma with a canister of paralysis gas. However, Karma manages to cover his mouth with a handkerchief in time and hits Grip with another canister of paralysis gas, allowing the students to bind up Grip with duct tape and move onward with their mission. In order to unlock the back entrance to the stairs and reach the next floor undetected, Meg Kataoka has the female students dress up Nagisa as a girl, and they all make their way through the sixth floor lounge. A rich guy named Yūji Norita spots Nagisa and tries to impress by buying him a drink. However, when the girls call for Nagisa to leave with them, Yūji tries to stop them by dancing. Yūji ends up accidentally spilling a drink on a guest, prompting Hinata Okano to knock out the guest with a somersault kick before trouble arises. The students move on to the VIP floor, where Terasaka knocks out two bodyguards using some stun guns, obtaining two pistols that are given to Chiba and Hayami. Upon reaching a theater stage, the students face off against their next opponent named Gastro."
		)
	,	("Assassination Classroom",
		 21,
		 "Takaoka Time",
		 "Gastro, who has a keen sense of pinpointing enemy gunfire, turns on all the stage lights, in which the students are forced to hide behind the theater seats. Koro-sensei instructs the students using varying nicknames in order to confuse Gastro about the students' movements, giving Chiba and Hayami the encouragement to rise above their failed assassination and get the drop on Gastro. Koro-sensei deduces that the mastermind is not an assassin, while Nagisa learns that Terasaka secretly has been infected with the virus this whole time. The students finally arrive on the top floor and discover that the mastermind is none other than Takaoka. He takes the antidote concealed in a suitcase and brings the group up to the roof. Wanting revenge for being humiliated during their previous knife fight, Takaoka calls up Nagisa to the heliport for a rematch. Takaoka demands Nagisa to kneel before him and apologize for pulling a cheap trick during their match. Although Nagisa complies with this, Takaoka detonates the antidote right in front of the class. This makes Nagisa pick up a knife in preparation to kill Takaoka."
		)
	,	("Assassination Classroom",
		 22,
		 "Nagisa Time",
		 "Before Nagisa completely gives into his anger, Terasaka throws a stun gun at him, urging him not to become a murderer and think about what is truly important. Despite being heavily beaten by Takaoka, Nagisa uses what he learned from Lovro to perform his secret technique. Nagisa drops the knife and surprises Takaoka with a sudden clap, just before using the stun gun to bring him to his knees. Then, Nagisa shocks Takaoka unconscious after leaving him with a fearsome smile. Smog, Grip and Gastro suddenly arrive and reveal that the virus they created is nothing more than temporary food poisoning, as they did not agree with Takaoka's harsh methods. The next day, the poisoned students recover from their symptoms and Koro-sensei emerges from his crystallized state. The students make the most of the remainder of their vacation before returning to school for the second term of their assassination classroom."
		)
;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("Assassination Classroom", 0, 1, 8)
	,	("Assassination Classroom", 0, 2, 7)
	,	("Assassination Classroom", 0, 3, 7)
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

-- Anime Data
INSERT INTO ANIME(ANIME_TITLE, NUMBER_OF_EPISODES, ANIME_SYNOPSIS, ANIME_DESCRIPTION, COMPANY_NAME, COPYRIGHT) VALUES
		("Battle Girls: Time Paradox",
		 13,
		 "Yoshino Hide (nickname Hideyoshi) is your average, everyday teenager, interested only in fashion, snacks, and her afterschool free time. She's destined to fail her next history test without some sort of miraculous intervention, so she stops by the local shrine to offer up a prayer or two to any deity that might be listening. 

		 Her prayers are interrupted by a mysterious blue light that engulfs her and leaves Hideyoshi stranded in a strange new world that appears to be feudal Japan. All the inhabitants of this world, however, including feudal warlord Oda Nobunaga, are women! Now Hideyoshi finds herself on a quest to gather the pieces of the Crimson Armor and help Nobunaga conquer the land! ",
		 "Yoshino Hide (nickname Hideyoshi) is your average, everyday teenager, interested only in fashion, snacks, and her afterschool free time. She's destined to fail her next history test without some sort of miraculous intervention, so she stops by the local shrine to offer up a prayer or two to any deity that might be listening.",
		 "Madman",
		 "&copy; HEIWA / Sengoku Otome Project"
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("Battle Girls: Time Paradox",
		 0,
		 1,
		 "M - Nudity",
		 13,
		 "https://www.animelab.com/shows/battle-girls-time-paradox"
		)
	,	("Battle Girls: Time Paradox",
		 3,
		 1,
		 "M - Nudity",
		 13,
		 "https://www.madman.com.au/catalogue/view/19768"
		)
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("Battle Girls: Time Paradox",
		 1,
		 "Transfer Maiden",
		 "Yoshino &quot;Hideyoshi&quot; Hide is an average student who has to brush up on her history knowledge for a test in order to avoid summer classes. As she goes to a shrine to pray for her success, she spots a woman performing a strange ritual inside the shrine. When she is spotted, she clumsily stumbles towards the woman and they both disappear. When Hideyoshi comes to, she finds herself in a forest and discovers a blazing village, where a warrior resembling her friend Akemi is fighting against some vandals before a scantily-clad mysterious woman saves her. The two women take Hideyoshi back to their palace, where they introduce themselves as Oda Nobunaga and Akechi Mitsuhide, and become curious about the technology Hideyoshi has. With Hideyoshi seeming to think that she has warped to the Sengoku period, but with historical figures portrayed as women, Hideyoshi attempts to leave to find her way home, but gets lost and is retrieved by Nobunaga. Nobunaga reveals her ambition to gather the pieces of the Crimson Armor, and Hideyoshi innocently agrees to help her. Later, Hideyoshi is approached by a helmet-wearing white puppy named Shiro who, to her surprise, is somehow able to talk."
		)
	,	("Battle Girls: Time Paradox",
		 2,
		 "Confused Maiden",
		 "Hideyoshi, Nobunaga and Mitsuhide head to the village that was burnt down the previous night. With the victims downhearted due to losing their homes, Hideyoshi uses her own unique methods to lift everyone's spirits. Later that day, Hideyoshi speaks with the talking dog she met earlier named Shiro, who tells her she has ended up in the past of an alternate world which doesn't have any men. The next day, Mitsuhide starts training Hideyoshi to become a warrior. Despite losing all of her sparring matches with Mitsuhide, Hideyoshi shows promise fighting with a staff, having previously seen a tv program about Kung Fu, and is made Nobunaga's retainer."
		)
	,	("Battle Girls: Time Paradox",
		 3,
		 "Sky Maiden",
		 "Nobunaga, Hideyoshi and Mitsuhide go to meet with Imagawa Yoshimoto to negotiate for the left leg of the Crimson Armor, along with Tokugawa Ieyasu, who also resembles one of Hideyoshi's high school friends, but Yoshimoto refuses to hand it over. Not wanting to use her forces to obtain, Nobunaga gets an idea from Hideyoshi and settle things via recreation, challenging Yoshimoto to a variety of games. After reaching a tie, the final game involves kite fighting, with Hideyoshi and Ieyasu attached to kites with fireworks attached to them. Hideyoshi's firework doesn't go off thanks to Ieyasu's attacks and Ieyasu goes up instead. Hideyoshi manages to catch her from falling, but then her firework goes off after all. At the end of the day, Yoshimoto admits her loss and gives Nobunaga the armor piece and Hideyoshi is rewarded with some Japanese sweets."
		)
	,	("Battle Girls: Time Paradox",
		 4,
		 "Confrontation Maiden",
		 "Nobunaga, Hideyoshi and Akechi bear witness to a lengthy battle between Uesugi Kenshin and Takeda Shingen, who both possess pieces of the Crimson Armor. As Hideyoshi tries to take a picture with her phone, it gets hit with an electrical discharge from the battle and breaks. Mitsuhide becomes downhearted when her idea to retrieve the armor is rejected by Nobunaga. After running into Ieyasu, Mitsuhide decides to go behind Nobunaga's back to try to obtain the armor for her by turning Kenshin and Shingen against each other, tying up Hideyoshi when she learns of it. After Nobunaga frees Hideyoshi, she punishes her by stealing her glasses before going to meet Kenshin and Shingen herself, challenging them both to a battle for the armor. After Nobunaga defeats Shingen in battle, she agrees to relinquish the armor if she kills her, but Kenshin stands in their way, offering her life to save Shingen. Nobunaga chooses not to kill either of them and accepts both pieces of the armor."
		)
	,	("Battle Girls: Time Paradox",
		 5,
		 "Ghost Story Maiden",
		 "Yoshimoto and Ieyasu invite Nobunaga, Hideyoshi, Mitsuhide, Shingen and Kenshin to go hawk-hunting, in which they use trained hawks to hunt for food. When the hawk goes into a mysterious wood while chasing after a rabbit, the others venture in, where they find Date Masamune sitting round a gathering of dead samurai who are forcing her to tell 100 ghost stories. The others soon learn they can't leave the forest until they tell all 100 stories, which proves to be difficult since none of Nobunaga's stories are scary and Mitsuhide is easily frightened. Being mocked by the others, Hideyoshi gives Nobunaga a story from her time, the performance of which proves to be so scary it puts out all the remaining candles, allowing the dead samurai to pass on and the others to leave. Ieyasu is seen conspiring with her aides, planning to encourage Nobunaga to complete the armor so that she can take it from her."
		)
	,	("Battle Girls: Time Paradox",
		 6,
		 "Memory Maiden",
		 "Mitsuhide recalls the day she first met Nobunaga, who took a liking to her and showed her a world outside of her workaholic life, asking for her help in conquering the land. Meanwhile, Nobunaga takes Hideyoshi through the inspection tunnels, talking about the good luck charm she received from her grandmother, Nobusada. However, as they prepare to head back, Hideyoshi accidentally activates the security system, filling the way back with deadly traps. Meanwhile, Masamune talks with Mitsuhide, before Nobunaga and Hideyoshi manage to escape from the tunnel. It is revealed that Masamune is actually Hideyoshi's teacher, Ms. Date, who travelled back from the present after discovering someone that came out of the shrine and then disappeared."
		)
	,	("Battle Girls: Time Paradox",
		 7,
		 "Drama Maiden",
		 "As Nobunaga and co. put together a play as per Hideyoshi's recommendation, Mitsuhide becomes irritated with Hideyoshi. Having trouble coming up with a script, Hideyoshi ends up adapting one of Yoshimoto's yuri stories. After rehearsals, Hideyoshi is troubled both by Shingen and Kenshin vying for bigger roles and Ieyasu's controversial suggestion for an ending. On the day of the play, after the various script changes pan out, Ieyasu's servant, Hattori Hanzō, ends up setting fire to the stage, trapping Hideyoshi inside, but Nobunaga comes to her rescue. Following the success of the failed play, Masamune informs Nobunaga about the location of the last pieces of the Crimson Armor."
		)
	,	("Battle Girls: Time Paradox",
		 8,
		 "Fever Maiden",
		 "Nobunaga, Hideyoshi and Mitsuhide travel on foot towards Saigoku to negotiate for the remaining armor pieces. Stopping in a town to rest, the villagers show fear towards Nobunaga, believing rumors that she eats children. This turns out to be due to Mitsuhide's attempt to spread word of Nobunaga's kindness, which somehow got scrambled as it was passed along from person to person. After another long hike, they came across a village with a hot spring, which Hideyoshi spends too long in and catches a fever. With her fever worsening, Masamune anonymously donates some modern medicine from her time, claiming it to be from overseas. With Hideyoshi unable to swallow the medicine without water, Nobunaga try giving her some water through mouth to mouth method, which Mitsuhide happens to witness. As Hideyoshi recovers the next morning and the trio arrive in Saigoku, the three owners of the armor keep an eye on them."
		)
	,	("Battle Girls: Time Paradox",
		 9,
		 "Saigoku Maiden",
		 "As Mitsuhide becomes downhearted having mistaken the 'kiss' between Hideyoshi and Nobunaga, the trio are confronted by the three owners of the armor, Chosokabe Motochika, Otomo Sorin and Mori Motonari. However, they are easily restrained by Nobunaga, who tickle tortures them into telling her the location of a chest containing the armor. However, Mitsuhide becomes too focused on her jealousy that she doesn't notice the chest is booby-trapped before handing it to Nobunaga, who barely avoids it. The Saigoku Trio escape and kidnap Hideyoshi, taking her to the top of the mountain and demanding Nobunaga bring the rest of the armor. Nobunaga and Mitsuhide become separated, with Nobunaga facing Motonari while under the effect of an anesthetic, while Mitsuhide faces Motochika and Sorin, who exploit the weaknesses in her confidence. However, they manage to regain their resolve and win their respective battles and gather the remaining armor. As Mitsuhide falls deeper into despair over Nobunaga's preference towards Hideyoshi, Ieyasu and Masamune make plans to claim the armor."
		)
	,	("Battle Girls: Time Paradox",
		 10,
		 "Double Suicide Maiden",
		 "As the trio stop by Honnouji on the way back, Hideyoshi reads up on her history of her world, in which Mitsuhide betrayed and killed Nobunaga. Overhearing Mitsuhide talking to herself about potentially killing Nobunaga, Masamune tells her to test her bonds first and gives her some supposedly strong sake. That night, Mitsuhide ties up Hideyoshi and offers the sake to Nobunaga until she passes out, before setting the inn she is on fire. Before walking into the flames herself, Hideyoshi breaks free and stands before Mitsuhide, telling her that she should face her feelings before heading inside to search for Nobunaga. As Mitsuhide goes in after her, she finds Nobunaga, who stops her from throwing her life away by reminding her how important she is to her. When Mitsuhide stops breathing as a result of taking in too much smoke, Nobunaga performs CPR on her to bring her back. As Hideyoshi continues to search the burning building, she discovers Masamune attempting to steal the Crimson Armor. As she awakens after being saved by her, Hideyoshi comes to realization that Masamune is actually her teacher. As Masamune escapes with the armor, she is confronted by Ieyasu."
		)
	,	("Battle Girls: Time Paradox",
		 11,
		 "Pillaging Maiden",
		 "As Nobunaga, Hideyoshi and Mitsuhide catch up to Masamune, they find her already beaten, the armor taken by Ieyasu who is now attacking Nobunaga's castle. As Nobunaga and Mitsuhide head to the castle, Masamune explains to Hideyoshi how she travelled back in time to obtain the Crimson Armor and allow the Date clan to conquer Japan, inadvertently ending up in the alternate past and bringing Hideyoshi with her. She explains she had encountered a Date clan member from the future, later discovering a jewel that could send her through time and a scroll containing the legend of the Crimson Armor. As Ieyasu sneaks into the castle to try to retrieve the remaining pieces of armor, Masamune warns Hideyoshi that the armor will go out of control if not equipped with the jewel she brought with her. Ieyasu uses her magic to activate the armor, awakening the evil heart inside her."
		)
	,	("Battle Girls: Time Paradox",
		 12,
		 "Warring Maiden",
		 "As Ieyasu becomes possessed by the armor and unleashes her power on the village, Nobunaga asks the other feudal lords for her help in stopping her, with Hideyoshi insisting that they find a way to do it without killing her. Working together, the group combine their attacks to overwhelm Ieyasu, giving Nobunaga the opportunity to break the armor, turning Ieyasu back to normal, albeit with a newfound fondness for Nobunaga."
		)
	,	("Battle Girls: Time Paradox",
		 13,
		 "Sunshine Maiden",
		 "As Nobunaga begins rebuilding her castle, Masamune finds the Crimson Armor amongst the wreckage and becomes swayed by it. As Masamune pleas that she needs to wear the armor to change the world, Nobunaga tells her how her recent experiences taught her that there is more to being a leader than to rule with power. As her friends stand to fight against her should she try, Nobunaga destroys the armor, saying there is no need for it, bringing Masamune back to her senses. Afterward, Masamune tells Hideyoshi that they need to return to their own time. In the epilogue, Hideyoshi stops in front of the temple and spots a dog who reminds her of Shiro. When she confronts the dog, it is none other than Shiro who is elated to Hideyoshi but he can't play with her because of an important mission he has to complete. Hideyoshi begs him to know what he's doing, so he whispers it to her."
		)
;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("Battle Girls: Time Paradox", 0, 1, 4)
	,	("Battle Girls: Time Paradox", 0, 2, 4)
	,	("Battle Girls: Time Paradox", 0, 3, 5)
	,	("Battle Girls: Time Paradox", 3, 1, 2)
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
		("Bikini Warriors",
		 12,
		 "Prepare yourself for an adventure of epic proportions. With warriors so skilled at battling questionable slimes and taming tumescent tentacles, there's no need for all that bulky armor. Brought to you by some of the masters of the female form, Bikini Warriors features character designs by Rei Hiroe (Black Lagoon), Tony Taka, Odanon (Queen's Blade), and Hisasi. 

		 All your favorite RPG classes beginning with the athletic Fighter, elegant Paladin, and enchanting Mage--are busting the min/max barriers for maximum blood loss! Are you equipped? Unsheathe your sword and prepare for battle!",
		 "All your favorite RPG classes beginning with the athletic Fighter, elegant Paladin, and enchanting Mage--are busting the min/max barriers for maximum blood loss! Are you equipped? Unsheathe your sword and prepare for battle!",
		 "Madman",
		 "&copy; HOBBY JAPAN"
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("Bikini Warriors",
		 0,
		 1,
		 "R18+ - High impact sexual themes",
		 12,
		 "https://www.animelab.com/shows/bikini-warriors"
		)
	,	("Bikini Warriors",
		 3,
		 1,
		 "R18+ - High impact sexual themes",
		 12,
		 "https://www.madman.com.au/catalogue/view/34324"
		)
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("Bikini Warriors",
		 1,
		 "It's Not a Bikini If It's Armor",
		 "The heroines are introduced in a story in which they are sold scantily-cut bikini outfits, only to find to their surprise that they actually protect them far better than their old bikini outfits."
		)
	,	("Bikini Warriors",
		 2,
		 "A Quest Needs Money to Rest",
		 "A powerful king intends to hire the Bikini Warriors for a dangerous mission, but when he proves too avaricious and the heroines begin to haggle about their expedition's expenses, they end up bondaged in the king's dungeon."
		)
	,	("Bikini Warriors",
		 3,
		 "Even Heroes Have Needs",
		 "With their funds completely drained, the Bikini Warriors abuse their hero status to strip the townsfolk of their possessions in order to have a comfortable time - only to have that scheme backfire on them in the end."
		)
	,	("Bikini Warriors",
		 4,
		 "A Hero Needs No Reward",
		 "In order to pass through a dangerous dungeon, the Bikini Warriors require a key in the possession of a town's mayor. In order to get that key, the Fighter must submit herself to a number of hazardous - and embarrassing - jobs, only to discover in the end that the &quot;key&quot; is not of a materialistc nature, compelling the Fighter to exact vengeance on her idealistic employer."
		)
	,	("Bikini Warriors",
		 5,
		 "Saving Things That Go Unused",
		 "In order to purchase a magical crystal staff they need to defeat a dangerous dungeon monster, the Bikini Warriors decide to sell all the possessions they think they no longer need, such as their old armor and supply of healing elixirs. However, eventually they find out that doing so was a very bad idea."
		)
	,	("Bikini Warriors",
		 6,
		 "Heroes Overcome the Impossible",
		 "The Bikini Warriors seek out and fight a dangerous woman-hunting monster in the woods, in conjunction with a lot of strategically implemented optical censoring."
		)
	,	("Bikini Warriors",
		 7,
		 "Allies From Taverns May Disappoint",
		 "As the Bikini Warriors search for new members to reinforce their party, they reminisce about the time when the Dark Elf had first joined them, only for her haughtiness producing mixed results for her new teammates."
		)
	,	("Bikini Warriors",
		 8,
		 "Every Journey Finds New Friends",
		 "The Hunter and the Valkyrie are introduced competing to join the Bikini Warriors, only to end up as extremely close friends."
		)
	,	("Bikini Warriors",
		 9,
		 "A Hero Betrayed Has But One Choice",
		 "The Bikini Warriors kill an evil magician, but with his dying curse, the sorcerer takes control of the Mage's body, forcing her to attack her teammates while still remaining conscious about her deeds, but unable to protest her innocence. As a result, the Mage is killed by her misunderstanding fellow warriors."
		)
	,	("Bikini Warriors",
		 10,
		 "You Don't Always Get What You Want or Need",
		 "The Bikini Warriors are delving through a hazardous dungeon, but despite their great expectations of a great reward, all treasure chests they come upon hold nothing but traps. When they finally get the chance to win a great idealistic reward, they promptly blow it in their disappointment."
		)
	,	("Bikini Warriors",
		 11,
		 "A Snare To Trap A Pure Maiden",
		 "This episode deals with the self-sacrificial and closeted lascivious nature of the Paladin, who is willing to marry a lecherous mayor in order to aid her teammate's progress."
		)
	,	("Bikini Warriors",
		 12,
		 "No One Knows The End",
		 "This episode is a non-sequential, trailer-like collection of clips within a world-saving frame story, featuring the Bikini Warriors in several intensive personal moments and the additional company of the Hunter and Valkyrie."
		)
;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("Bikini Warriors", 0, 1, 4)
	,	("Bikini Warriors", 0, 2, 4)
	,	("Bikini Warriors", 0, 3, 4)
	,	("Bikini Warriors", 3, 1, 2)
;

-- Anime Data
INSERT INTO ANIME(ANIME_TITLE, NUMBER_OF_EPISODES, ANIME_SYNOPSIS, ANIME_DESCRIPTION, COMPANY_NAME, COPYRIGHT) VALUES
		("Cowboy Bebop",
		 26,
		 "The modern anime classic that defines cool. Be immersed once again with Spike, Jet and the rest of the crew of the Bebop; the unusually intelligent dog, Ein, computer wunderkind, Ed and the voluptuous, vexing femme fatale, Faye Valentine. They travel around the galaxy in search of wanted criminals one bounty at a time!",
		 "The modern anime classic that defines cool. Be immersed once again with Spike, Jet and the rest of the crew of the Bebop; the unusually intelligent dog, Ein, computer wunderkind, Ed and the voluptuous, vexing femme fatale, Faye Valentine. They travel around the galaxy in search of wanted criminals one bounty at a time!",
		 "Madman",
		 "&copy; SUNRISE"
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("Cowboy Bebop",
		 0,
		 1,
		 "MA15+ - Strong violence, drug use",
		 26,
		 "https://www.animelab.com/shows/cowboy-bebop"
		)
	,	("Cowboy Bebop",
		 2,
		 1,
		 "M - Moderate violence, drug use",
		 13,
		 "https://www.madman.com.au/catalogue/view/19979"
		)
	,	("Cowboy Bebop",
		 2,
		 2,
		 "MA15+ - Strong violence",
		 13,
		 "https://www.madman.com.au/catalogue/view/20865"
		)
	,	("Cowboy Bebop",
		 3,
		 1,
		 "MA15+ - Strong violence, drug use",
		 26,
		 "https://www.madman.com.au/catalogue/view/6315"
		)
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("Cowboy Bebop",
		 1,
		 "Asteroid Blues",
		 "In a flashback, Spike Spiegel is shown waiting near a church holding a bouquet of flowers, before leaving as the church bell rings. As he walks away, images of a gunfight he participated in are shown. In the present, Spike, currently a bounty hunter, and his partner Jet Black head to the Tijuana asteroid colony on their ship, the Bebop, to track down a bounty-head named Asimov Solensan. Asimov is wanted for killing members of his own crime syndicate and for stealing a cache of a dangerous combat drug known as Bloody-Eye. On the colony, Asimov and his girlfriend, Katerina, are ambushed at a bar by his former syndicate while attempting to sell a vial of Bloody-Eye, but Asimov manages to fight his way out by using the drug himself. Spike later encounters Katerina and reveals to her that he is a bounty hunter searching for Asimov; Spike is promptly assaulted by Asimov and is nearly killed before Katerina intervenes. In the confusion, Spike is able to steal Asimov's Bloody-Eye vial before the two leave. Spike later confronts Asimov at a staged drug deal with the stolen vial, but Asimov escapes with Katerina in a ship when the two are interrupted by an attack from Asimov's former syndicate. With Spike giving chase in his own ship, Asimov attempts to take another dose of Bloody-Eye, but a horrified Katerina shoots him before he can. As Spike approaches Asimov's ship, it is destroyed by attacking police cruisers, forcing Spike to pull away. The episode ends with Spike and Jet once again traveling through space on the Bebop. "
		)
	,	("Cowboy Bebop",
		 2,
		 "Stray Dog Strut",
		 "Spike and Jet's next bounty takes them to Mars, where their target, Abdul Hakim, is wanted for stealing a valuable lab animal. To avoid capture, Hakim has had plastic surgery to change his appearance. At a bar, Hakim loses the briefcase containing the animal when it is stolen behind his back. Spike discovers the thief attempting to sell the animal at a pet store and, mistaking him for Hakim, holds him at gunpoint. Spike orders the store owner to open the case, revealing the animal to be a Welsh corgi. As Spike leaves the pet store, the real Hakim appears and attempts to take the dog back; the dog manages to escape, prompting Hakim, Spike, and the group of scientists who had illegally experimented on the dog to give chase. Spike ultimately loses Hakim but gains possession of the dog, whom he brings back to the Bebop. Jet suggests that Spike take the dog for a walk in order to lure Hakim into trying to take it back. However, the scientists activate a dog whistle to find their &quot;data dog&quot;, resulting in the corgi escaping from Spike. Hakim uses a stolen car and manages to grab the dog, while Spike and the scientists pursue him in their ship and truck, respectively. The dog manipulates the car's controls to open the doors and jumps out, causing Spike to reluctantly save it by having it land on top of his ship. Meanwhile, Hakim and the scientists crash their vehicles and are apprehended by the police. It is revealed that a &quot;data dog&quot; is a dog that has its intellect genetically enhanced. The dog, named Ein, is shown to now be living on the Bebop, much to Spike's chagrin."
		)
	,	("Cowboy Bebop",
		 3,
		 "Honky Tonk Women",
		 "With Ein as a new companion, the crew of the Bebop cross paths with Faye Valentine, a wanted fugitive drowning in debt, who ends up being forced to act as a middle-woman for an illegal transaction at a space station casino."
		)
	,	("Cowboy Bebop",
		 4,
		 "Gateway Shuffle",
		 "After gambling away all the money she obtained, Faye ends up getting her hands on a mysterious suitcase while exploring the wreckage of a derelict spaceship. Meanwhile, Spike and Jet pursue a bounty on the leader of the Space Warriors, a group of eco-terrorists armed with a terrifying biological weapon that can transform humans into apes. After once again running into Faye, Spike and Jet attempt to collect the bounty on the terrorists' leader, Twinkle Murdoch. However, faced with the threat by Murdoch's sons of releasing the virus on Ganymede if she isn't released, they cancel the bounty, forcing the Bebop crew to release her. When Murdoch and her sons renege on the deal and launch the virus anyway, Spike and Faye attempt to pursue her through the hyperspace gateway. They succeed in destroying two of the three missiles, but miss the third one, prompting the Ganymede government to shut down the spacegate, stopping the missiles by permanently trapping them in hyperspace. Spike and Faye manage to narrowly escape the gate before it closes, but Murdoch and sons become trapped, followed by a container of the virus that Faye recovered from the suitcase and was subsequently slipped into Murdoch's pocket by Spike to shatter, turning her and all her sons into monkeys. With the bounty lost, Faye decides to stay on the Bebop with Spike and Jet."
		)
	,	("Cowboy Bebop",
		 5,
		 "Ballad of Fallen Angels",
		 "While pursuing the bounty on an executive of the Red Dragon Syndicate, Spike ends up confronting Vicious, an old enemy of his."
		)
	,	("Cowboy Bebop",
		 6,
		 "Sympathy for the Devil",
		 "Spike and Jet chase a dangerous enemy who, despite having the appearance of a little boy, is actually more than eighty years old."
		)
	,	("Cowboy Bebop",
		 7,
		 "Heavy Metal Queen",
		 "The crew of the Bebop chase a bounty named Decker, who is running a load of high explosives. While nursing a hangover at a diner, Spike meets a cargo hauler pilot named V.T., who hates bounty hunters, but ends up lending him a hand."
		)
	,	("Cowboy Bebop",
		 8,
		 "Waltz for Venus",
		 "While the crew hunts down a Venusian mobster, Spike meets Rocco Bonnaro, who is on the run from the same mobster the crew is tracking for stealing a very rare and valuable plant, which he plans to sell to pay for surgery to restore his sister's eyesight."
		)
	,	("Cowboy Bebop",
		 9,
		 "Jamming with Edward",
		 "The crew enlists the help of an elite computer hacker nicknamed &quot;Radical Edward&quot; to help them track down a bounty-head who has been vandalizing Earth's surface with hacked laser satellites. However, when they finally meet Edward face-to-face, the hacker's true identity proves to be a surprise for everybody."
		)
	,	("Cowboy Bebop",
		 10,
		 "Ganymede Elegy",
		 "Jet is even more taciturn than usual as the Bebop lands on Ganymede, his last post before leaving the ISSP and the home of his ex-girlfriend, Alisa, whom he has never quite left behind. Meanwhile, Spike pursues bounty Rhint Celonias, who just happens to be Alisa's new boyfriend"
		)
	,	("Cowboy Bebop",
		 11,
		 "Toys in the Attic",
		 "A strange blob-like creature with a venomous bite infiltrates the Bebop and incapacitates Jet, Faye and Ein. With half the crew out of action, it's up to Spike and Ed to destroy the creature and find out where it came from.

		 This episode makes reference to the movie Alien, with Spike using a motion tracker and a flamethrower and by having the characters slowly attacked by an unknown alien one by one. The scene where Spike ejects the refrigerator into space was inspired by the scene in Aliens, where Ripley gets rid of the Alien queen. The episode's use of &quot;Waltz of the Flowers&quot; from The Nutcracker is reminiscent of the movie 2001: A Space Odyssey's use of well-known classical music."
		)
	,	("Cowboy Bebop",
		 12,
		 "Jupiter Jazz (Part 1)",
		 "Faye cleans out the crew's safe and leaves the Bebop for Callisto. While Jet chases after her, Spike decides to follow up on some clues about the location of his ex-girlfriend Julia, which leads him to another confrontation with Vicious."
		)
	,	("Cowboy Bebop",
		 13,
		 "Jupiter Jazz (Part 2)",
		 "Faye is helped by Gren, a man who holds a grudge against Vicious. After explaining his story to Faye, he chases after Vicious, and when he and Spike end up reaching him at the same time, a three-way battle takes place."
		)
	,	("Cowboy Bebop",
		 14,
		 "Bohemian Rhapsody",
		 "The Bebop crew hunts for Chessmaster Hex, the rumored mastermind behind a series of robberies at hyperspace gate tollbooths. However, while trying to dig up dirt on their target, they unearth some very valuable data regarding the gate accident that devastated Earth fifty years earlier."
		)
	,	("Cowboy Bebop",
		 15,
		 "My Funny Valentine",
		 "Faye ends up meeting an important man from her past, and part of her origin is revealed, including the source of her massive debt."
		)
	,	("Cowboy Bebop",
		 16,
		 "Black Dog Serenade",
		 "An ISSP prison ship has undergone a mechanical malfunction, and has been taken over by the prisoners it was transporting, led by Udai Taxim, the Syndicate assassin who took Jet's arm. Jet's former partner, Fad, enlists him for the retrieval operation, but Fad's motivations might not be as noble as they seem."
		)
	,	("Cowboy Bebop",
		 17,
		 "Mushroom Samba",
		 "The Bebop, out of food and fuel, is sideswiped in a hit-and-run off of Europa and crash-lands on Io. Ed, with Ein by her side, is sent out to procure food, and ends up running across Domino Walker, a bounty-head who is smuggling hallucinogenic mushrooms."
		)
	,	("Cowboy Bebop",
		 18,
		 "Speak Like a Child",
		 "While Faye wastes money betting on horse racing, a package addressed to her arrives on the Bebop containing an old Betamax tape, prompting Spike and Jet to look for an appropriate device to view its contents."
		)
	,	("Cowboy Bebop",
		 19,
		 "Wild Horses",
		 "While Spike takes his mono-racer in for maintenance, Jet and Faye take on a group of pirates who use computer viruses to terrorize cargo ships."
		)
	,	("Cowboy Bebop",
		 20,
		 "Pierrot le Fou",
		 "Spike is targeted by an insane, seemingly indestructible assassin named Mad Pierrot after accidentally witnessing the killer in action."
		)
	,	("Cowboy Bebop",
		 21,
		 "Boogie Woogie Feng Shui",
		 "Jet, spurred on by a cryptic e-mail, tries to find an old acquaintance but discovers only his grave—he disappeared under mysterious circumstances. His daughter, Mei-Fa, an expert in feng shui, asks for his help finding a &quot;sun stone&quot; that can lead them to her father's location."
		)
	,	("Cowboy Bebop",
		 22,
		 "Cowboy Funk",
		 "A terrorist known as the &quot;Teddy Bomber&quot; has been using explosives hidden in teddy bears to bring down high-rise buildings in protest of humanity's excesses. Spike attempts to stop him, but constantly runs afoul of &quot;Cowboy Andy&quot;, a fellow bounty hunter who is far more similar to Spike than either would care to admit."
		)
	,	("Cowboy Bebop",
		 23,
		 "Brain Scratch",
		 "Unbeknownst to the rest of the crew, Faye goes undercover to infiltrate SCRATCH, a cult that believes in achieving eternal life by digitizing the soul and uploading it into the Internet, in order to collect the bounty on the cult's leader, Dr. Londes. Faye soon finds herself in danger, however, and while Spike goes looking for her, Jet and Ed try to track down Dr. Londes themselves."
		)
	,	("Cowboy Bebop",
		 24,
		 "Hard Luck Woman",
		 "While heading to Mars, the Bebop is diverted to Earth (unplanned, of course). After arriving, Faye decides to investigate her past by traveling to the landmarks she sees in the video she recorded as a child, taking Ed along with her. She and Ed manage to find what looks like an orphanage where Ed had stayed at previously, where it is revealed that Ed's father had been looking for her several months back. Faye and Ed manage to find one of the locations in the video, whereupon Faye is surprised by an old schoolmate. Jet and Spike notice a bounty on their computer which looks to be a lucrative payoff. After having returned to the Bebop and dwelling on what has happened, Faye leaves again. Jet and Spike find their bounty, but are interrupted by Ed maneuvering the Bebop by remote control, whereupon it's discovered that their bounty is not only just a measly fifty woolongs (instead of the fifty million they mistakenly thought it was), but is Ed's father. Ed's father asks if she wants to stay with him, but before Ed can answer, he and his assistant see another meteorite strike the Earth's surface in the distance and they hastily and absent-mindedly speed off, leaving Ed behind, dumbfounded. Faye manages to find herself at the bottom of the hill from her old house and runs to the top, like she did when she was younger, only to find ruins where her home used to be. After having briefly seen her father again, Ed decides to leave the Bebop, and Ein leaves with her."
		)
	,	("Cowboy Bebop",
		 25,
		 "The Real Folk Blues (Part 1)",
		 "Left alone by the rest of the crew, Spike and Jet are ambushed by members of the Red Dragon syndicate. They are saved by Lin's brother, Shin, who explains that Vicious has tried to seize control of the organization and was sentenced to death. He also states that all people connected to him are also being hunted down, and Spike rushes to find Julia."
		)
	,	("Cowboy Bebop",
		 26,
		 "The Real Folk Blues (Part 2)",
		 "Reunited, Spike and Julia pick up where they left off in their plans to escape the Red Dragon syndicate, but Julia ends up being shot and killed. Spike returns to the Bebop for a meal with Jet and Faye, and then storms the Red Dragon's headquarters to confront Vicious for one last battle. Shin helps him, but is killed, managing to reveal that if Vicious is killed, Spike will be the new leader of the syndicate. Spike fights his way to the top floor of the Red Dragon syndicate skyscraper, but is badly wounded, and then fights Vicious, getting wounded during the battle. The pair manages to get the other's weapons and they trade, with a brief struggle, in which Spike manages to shoot Vicious in the chest, killing him. As Spike stumbles down a set of stairs and faces the syndicate members that rushed to the scene, he makes a gun with his fingers and says &quot;Bang&quot; before collapsing."
		)
;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("Cowboy Bebop", 0, 1, 8)
	,	("Cowboy Bebop", 0, 2, 9)
	,	("Cowboy Bebop", 0, 3, 9)
	,	("Cowboy Bebop", 3, 1, 2)
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
		("Deadman Wonderland",
		 12,
		 "Ganta is the only survivor after a mysterious man in red slaughters a classroom full of teenagers. He's framed for the carnage, sentenced to die, and locked away in the most twisted prison ever built: Deadman Wonderland. Then it gets worse. 

		 At Deadman Wonderland, convicts are forced into brutal death matches for the amusement of the masses, the cheers of the crowd drowning out the screams of the dismembered. Even when Ganta befriends Shiro, an unusual female inmate, his dark fate crushes all hope - until he discovers a strange ability to wield his spilled blood as a weapon. Ganta learns his new skill might be related to the murderous man in red and uncovers disturbing secrets that could expose those who stole his freedom. He's determined to see justice served - but first he'll have to fight for his life in a prison that holds a million ways to die.",
		 "At Deadman Wonderland, convicts are forced into brutal death matches for the amusement of the masses, the cheers of the crowd drowning out the screams of the dismembered.",
		 "Madman",
		 "&copy; 2010 Jinsei Kataoka, Kazuma Kondou/Kadokawashoten/Deadman Wonder Land Ward G."
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("Deadman Wonderland",
		 0,
		 1,
		 "MA15+ - Strong coarse language and animated violence",
		 12,
		 "https://www.animelab.com/shows/deadman-wonderland"
		)
	,	("Deadman Wonderland",
		 3,
		 1,
		 "MA15+ - Strong coarse language and animated violence",
		 12,
		 "https://www.madman.com.au/catalogue/view/15613"
		)
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("Deadman Wonderland",
		 1,
		 "Death Row Inmate",
		 "As Ganta Igarashi and his classmates plan for a class trip to Deadman Wonderland, a privately owned prison that also serves as an amusement park, a mysterious &quot;Red Man&quot; appears, killing his entire class and thrusting a red stone into Ganta's chest. Being the only survivor out of the entire class, Ganta is charged with mass murder and, due to the overwhelming and doctored evidence against him with no way to prove his innocence, he is sentenced to death and sent to Deadman Wonderland's prison. As some of the higher ups plot to kill Ganta in an &quot;accident&quot;, Ganta meets a strange white-haired girl named Shiro, who manages to read his heart and understand him. When a bunch of bullies start attacking Ganta and Shiro, an explosion causes a large object to fall towards Ganta. However, Ganta's desire to keep living so he can kill the Red Man activates the powers that were implanted in him, allowing him to control his blood to save himself as well as Shiro."
		)
	,	("Deadman Wonderland",
		 2,
		 "Antidote (Candy)",
		 "Ganta learns from a fellow inmate, Yō Takami, that in order to have a decent meal in the prison, he needs to earn &quot;cast points&quot;. He learns of a &quot;dog race&quot; in which he can win a big prize, which he and Shiro decide to enter. In the locker room, they encounter a fierce inmate named Kazumasa Kouzuji who drives fear into the others until Makina, the prison warden, silences him. Ganta soon learns that in order to avoid being killed by a poison, he needs to eat an antidote known as &quot;candy&quot;, which was secretly stolen from his bag by Yō the other day. Ganta realizes that in order to survive, he needs to win the race in order to purchase a new one, but he soon learns the course is littered with actual death traps. Thanks in part to Shiro's innocent manner, Ganta and Shiro make it to the final stage against Kasumasa, where they have to hold onto a ball and avoid falling into a spike pit. Ganta decides to stand up to Kazumasa, who eventually falls to his death. In the closing moments of the round, Ganta is forced to sacrifice the ball, and the prize money, in order to keep Shiro from falling and keep their promise of eating the runner up prize together. "
		)
	,	("Deadman Wonderland",
		 3,
		 "G Block",
		 "Put in charge of observing him by the promoter Tsunenaga Tamaki, Yō gives Ganta a piece of candy so he can keep living, unaware that Yō is putting him in his debt. Meanwhile, the Red Man, now known as the Wretched Egg, breaks loose and appears before Ganta. Then, Ganta tries attacking the Wretched Egg using his own abilities, but the Wretched Egg escapes not long before Ganta falls unconscious. After waking up, Ganta hears from the other witnesses that they keep the Wretched Egg locked up in the G-Block of the prison, so he and Shiro head towards there. Deeming him dangerous, Makina puts the facility on lock-down and sends a fierce security robot after Ganta. As it approaches them, Ganta and Yō follow Shiro into a secret passage leading to the G-Block. As Shiro confronts the robot, it is destroyed by the arrival of another inmate with the same powers as Ganta."
		)
	,	("Deadman Wonderland",
		 4,
		 "Crow Claw",
		 "Believing him to be the Red Man, Ganta attacks the strange inmate known as Senji Kiyomasa, but falls at a disadvantage against the blades Senji can form with his blood. After learning the nature of his power called the Branch of Sin, Ganta launches a counterattack. Ganta soon realizes that Senji is not the Wretched Egg, but one of several &quot;deadmen&quot; with the Branch of Sin. Senji tries to attack Ganta again, but finds himself weak against Shiro before a special unit appears, tranquilizing Ganta and Senji and taking Shiro and Yō to an empty corridor. As Ganta is examined, he comes face to face with Tamaki who reveals he rigged Ganta's jury verdict to get him sent to Deadman Wonderland before revealing Ganta will face off against Senji in a battle the next day, tempting him with the prospect of coming face to face with the Wretched Egg. As Ganta is tortured with footage of what a &quot;carnival corpse&quot; entails, Makina decides to confront the chief director concerning the mysteries of G-Block."
		)
	,	("Deadman Wonderland",
		 5,
		 "Carrion Festival (Carnival Corpse)",
		 "Makina is halted by Chan and En, bodyguards of the chief director, preventing her from entering his office. Ganta is thrust into his carnival corpse match with Senji and is at a disadvantage as his projectiles use too much blood and cause him to develop anemia. As he becomes helpless, he recalls memories of Shiro and manages to stand back up, using the environment to get a hit on Senji. After escaping from the corridor, Shiro and Yō head towards G-Block after Yō hears the whereabouts of a woman he is searching for. After Ganta recovers from his victory, he is horrified to find that Senji is forced to have one of his eyes removed as a result of losing. As Yō uses Shiro as a diversion so he can escape on his own, he bears witness to her true destructive ability, as she herself has the Branch of Sin."
		)
	,	("Deadman Wonderland",
		 6,
		 "Hummingbird",
		 "As Shiro falls unconscious and is picked up by Chan and En while Yō continues his way to G-Block, Ganta meets a girl named Minatsuki Takami, another deadman who had killed her abusive father. Ganta offers to help Minatsuki escape, but soon learns she is his opponent in the next carnival corpse match. When the match begins, Minatsuki's personality changes completely and attacks with her whip-like Branch of Sin, revealing she had manipulated him into taking an injury prior to the match. However, Yō appears, revealing Minatsuki to be his little sister, saying that he plans to gain enough cast points to buy her freedom before entering the arena. Minatsuki tries to manipulate Yō against Ganta, but he turns on her instead, having learned the truth behind his father's death. Minatsuki captures Yō and uses him as a human shield against Ganta, revealing she has shown hatred ever since her mother left her for dead during the Red Hole incident. Ganta manages to disable one of her whips and free Yō, before knocking her out with a headbutt, winning the match."
		)
	,	("Deadman Wonderland",
		 7,
		 "Original Sin (Wretched Egg)",
		 "After a strange quake occurs during which Yō rushes to keep Minatsuki from harm, Ganta starts to remember things about Shiro, who is revealed to be the Wretched Egg. As Ganta recalls his childhood with Shiro, Yō cannot bring himself to mention what he had seen her do. As Yō goes to recover the casts that were stolen from him, he learns from Tamaki that casts cannot be used to reduce the sentences on G-Block inmates and is attacked by Azuma Genkaku, part of an anti-deadman force known as the Undertakers. Meanwhile, Ganta meets Nagi Kengamine and Karako Koshio, members of a deadman prison gang known as Scar Chain wanting to destroy Deadman Wonderland. Nagi and Karako invite Ganta to join their gang. As Minatsuki goes through her penalty game, Nagi arranges it so that she only loses her hair. Just then, Genkaku appears and attacks Ganta and the others."
		)
	,	("Deadman Wonderland",
		 8,
		 "Chains of Freedom (Scar Chain)",
		 "Ganta is saved by the arrival of Shiro, who is back under control by the lullaby, to which Genkaku decides to retreat. Afterwards, Ganta is introduced to the other members of Scar Chain, who oppose the prison and are plotting to expose Deadman Wonderland's secrets on inspection week. Makina also plans to take advantage of to find out what secrets are being hidden from her. However, Ganta becomes a little distrustful when his claims of his Branch of Sin being stopped by Genkaku differ from what the security cameras show and takes his leave. Ganta later learns from Senji about how Genkaku killed Nagi's wife, also hearing from Nagi about how each member of Scar Chain has their own ideas of freedom. As Ganta promises to take Shiro on a Ferris wheel when they escape someday, it is shown that one of Scar Chain's members named Bundō Rokuro is a double agent for the Undertakers. Ganta decides to join Scar Chain, who begin their operation to leak information about the deadmen to the outside world. As Nagi and Rokuro go to the security room, Ganta and the others are chased by an acid spewing robot, to which Karako opts to stay behind to save the others."
		)
	,	("Deadman Wonderland",
		 9,
		 "Pro-oxidant (Worm Eater)",
		 "After recalling the time she joined Scar Chain, Karako defends herself from the acid spewing robot and destroys it, falling down with it. Meanwhile, Nagi is betrayed by Rokuro and confronted by an Undertaker named Hibana Daida, who uses a special weapon to neutralize his Branch of Sin. As Hibana starts slicing off bits of Nagi's flesh, he provokes her into chopping off his arm by mentioning of her abusive mother, giving him the opportunity to activate the elevator Ganta's group needs to take. However, Ganta's group is confronted by Genkaku and his men, leaving only Ganta and a few others left alive to carry the chip containing the information. While bleeding to death, Nagi makes a call to the hideout, which is heard by Shiro who catches up to Ganta and throws the chip into a fire."
		)
	,	("Deadman Wonderland",
		 10,
		 "Caretaker (Undertaker)",
		 "Ganta becomes angry at Shiro for throwing away the data chip, telling her he never wants to see her again and proceeded to punch her. Meanwhile, Makina investigates Tamaki's office, overhearing a conversation between him and the defense secretary concerning the deadmen. As Karako and the others discuss their next plan, Rokuro appears and reveals the data chip was actually a bomb he had made before announcing that the group is being held hostage unless Nagi agrees to become an Undertaker. As Rokuro decides to execute Ganta first, Senji appears on the scene, managing to fight back against the Undertakers using sonic blasts. As Shiro laments her situation with Ganta, she meets Toto Sakigami, the one who told her about the bomb."
		)
	,	("Deadman Wonderland",
		 11,
		 "GIG of Despair",
		 "Detesting his weak self, Ganta asks Senji to teach him how to use his Branch of Sin to fight. Meanwhile, Karako attempts to infiltrate the Undertakers by disguising herself as a guard. As Toto appears before Ganta and Senji during their training session, Shiro, who gets drunk off of liquor sweets, appears before Genkaku, who also discovers Karako. Just as Ganta manages to produce a blood bullet that can break the sound barrier, Genkaku announces his capturing of Shiro and Karako. Despite being low on blood, Ganta rushes to where Genkaku is keeping them, but is confronted by Nagi, who had been mentally broken by Genkaku and turned into a raging demon."
		)
	,	("Deadman Wonderland",
		 12,
		 "Relief (Grateful Dead)",
		 "As Nagi goes on a rampage on all the guards, Ganta stands to protect Shiro, taking all of his punches and trying to reason with him. Then, as Nagi starts to come to his senses thanks to the bell Karako wears reminding him of his friends, Karako is suddenly stabbed by Genkaku. Nagi stands to protect his friends but is shot by Genkaku, who begins killing the other guards, while Ganta starts being poisoned due to not having any candy in a while. Hibana tries to escape but is killed by Toto, who had managed to obtain Senji's abilities after drinking his blood. As Shiro enters the Wretched Egg mode, the stone in Ganta's chest glows and blasts a powerful shot, with Nagi holding Genkaku in place as they are both mortally wounded. Before dying, Nagi gives Ganta his last piece of candy. As Karako and some others escape, Ganta decides to stay behind so he can protect his friends. Toto becomes fascinated with Ganta's Branch of Sin, eager to know how it tastes. At the end of the episode Shiro sings a lullaby to Ganta, who remarks that he last heard the lullaby just before his classroom was attacked by the Red Man."
		)
;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("Deadman Wonderland", 0, 1, 4)
	,	("Deadman Wonderland", 0, 2, 4)
	,	("Deadman Wonderland", 0, 3, 4)
	,	("Deadman Wonderland", 3, 1, 2)
;-- Anime Data
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
		("Food Wars",
		 24,
		 "Souma is a teenage chef who is always looking for the perfect flavours and combinations in his art -- the art of cooking. So when his father suddenly closes down the family diner, his hopes of someday owning a diner fade away. But Souma's dad has bigger plans for him and enrols him in a cut throat culinary school to prove his worth. Will he make the cut, or will his pot boil over? Find out in Food Wars!",
		 "Souma is a teenage chef who is always looking for the perfect flavours and combinations in his art -- the art of cooking. So when his father suddenly closes down the family diner, his hopes of someday owning a diner fade away.",
		 "Madman",
		 "&copy;Yuto Tsukuda, Shun Saeki / Shueisha, Food Wars! Shokugeki no Soma Committee"
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("Food Wars",
		 4,
		 1,
		 "M - Sexualised imagery and sexual innuendo",
		 24,
		 "https://www.madman.com.au/catalogue/view/39915"
		)
	,	("Food Wars",
		 3,
		 1,
		 "M - Sexualised imagery and sexual innuendo",
		 24,
		 "https://www.madman.com.au/catalogue/view/35262"
		)
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("Food Wars",
		 1,
		 "An Endless Wasteland",
		 "Soma Yukihira has been working at his father Joichiro's diner since a young age, establishing an interest in cooking and vowing to beat his father some day, for Joichiro has been beating him hollow everytime during their cooking battles. One day while his father is away, Yaeko Minegasaki, an urban life planner, arrives and threatens to demolish the restaurant to build a luxury hotel in its place, spoiling all the meat in the pantry to try and get the diner to close down. Remembering Soma's promise to always satisfy every customer that comes to dine, Yaeko orders him to make her a tasty meat dish to her satisfaction, and if he does she will never disturb him again. In response to the setback, Soma gathers his wits and uses potatoes and bacon bought while shopping to create an imitation roast pork dish, which Yaeko greatly enjoys and fulfills her portion of the deal. Despite the restaurant being saved, Joichiro decides to close it down for three years, opting to travel (and cook) abroad, sending Soma to the prestigious Totsuki Culinary Academy to take the entrance exam and study cooking there as part of the high school division."
		)
	,	("Food Wars",
		 2,
		 "God Tongue",
		 "Upon arriving there, Soma is shocked by the grandness of the school building, the greatness of the school campus, and how famous Totsuki actually is, being one of the top culinary schools in the world. Soma also meets many other chefs, all of whom are descendants of gourmet chefs or heirs to high-class food businesses, who have likewise come to take the entrance exam and transfer in. Due to his background as a low-class diner chef, Soma is looked down on until most of the participants flee upon hearing that Erina Nakiri, a legendary food genius with the most selective palate known to mankind (nicknamed 'The God Tongue') will be their examiner. For fun, Erina changes the course of the exam and orders Soma to cook an egg dish to satisfy her instead. He conjures an ordinary-looking rice with seasoning, only to show it's true chicken flavour and egg saltiness enveloped inside. Despite being overwhelmingly impressed with his dish, Erina fails him, having taken an immediate dislike to his nonchalant and perceived cocky attitude, and feeling that her pride would be threatened if she allowed a person of his social standing to be admitted. Later in the day, her grandfather Senzaemon, the director of the school, tastes Soma's dish and is impressed, laughing and crumpling up his rejected application, implicitly overruling Erina's decision. "
		)
	,	("Food Wars",
		 3,
		 "That Chef Never Smiles",
		 "At the entrance ceremony, Soma is introduced as the only student who managed to transfer into Totsuki's high school division, and he declares that he will become the top student at Totsuki, instantly earning the ire of the entire student body with his nonchalant attitude towards the school and its reputation. He is then paired up with meek girl Megumi Tadokoro, who has the worst grades among the first-years and is one E grade away from expulsion. Soma's first class consists of making Beef Bourguignon to satisfy the French teacher Roland Chapelle, known as &quot;The Chef that Never Smiles&quot; due to his notoriously strict grading. Megumi is determined to follow the recipe to earn a passing grade, but encounters a setback when two other students sabotages their dish by throwing in lots of salt. Luckily, Soma comes through by using honey to quickly tenderize the meat. The class is astonished when Chapelle smiles for the first time upon trying Soma and Megumi's dish, and proclaims that his only regret is he cannot give them a grade higher than an A. The two saboteurs, having been distracted by Chapelle smiling, accidentally burn their own dish and receive a failing grade. Meanwhile, Erina is told about Soma's success in Chapelle's class and furiously vows to get him expelled. "
		)
	,	("Food Wars",
		 4,
		 "The Madonna of the Polar Star",
		 "Soma is sent to Polar Star Dormitory, a dormitory for students whose home is further away from the school. He is greeted by Fumio Daimidō, the caretaker, and is required to cook a dish that satisfies her in order to become a resident. Not knowing that he was supposed to provide his own ingredients, Soma nevertheless conjures a mackerel burger meal using leftover ingredients in the kitchen, which impresses Fumio greatly. Now a Polar Star Dormitory resident, Soma meets the other residents: first-year Yūki Yoshino who specialises in wild game, her best friend and fellow first-year Ryōko Sakaki who specializes in fermentation and alcoholic beverages, quiet first-year Shun Ibusaki who specialises in smoked food, first-year nerd Zenji Marui, bickering freshmans Daigo Aoki and Shōji Satō, enthusiastic second-year Satoshi Isshiki, as well as Megumi. During a welcoming party, Soma is further introduced to the academy's inner workings, such as the Elite Ten, the highest decision-making body in the school other than the school director himself, which consists of ten exceptionally talented students, the 10th seat being Erina while the 7th seat being Satoshi. Satoshi decides to challenge Soma to a cookoff. Satoshi presents his peppered mackerel dish and Soma is shocked by the elevated quality of Satoshi's cooking."
		)
	,	("Food Wars",
		 5,
		 "The Ice Queen and the Spring Storm",
		 "Soma presents his dish, mackerel onigiri chazuke using seaweed tea. Everybody is impressed, and the cookoff is declared a draw. Having his sights set on becoming a member on the Elite Ten, he challenges Satoshi for his spot only to find out that it can only be obtained through a high-stakes cooking duel called a Shokugeki, and Soma has nothing of value to wager that is of equivalent value to his Elite Ten membership. Meanwhile, Erina challenges the Chanko Research Society president Kiyoshi Godabayashi to a Shokugeki for the rights to his clubroom, which she wins with ease. She then has his clubroom demolished in order to make room for a new wing for her personal cooking facilities."
		)
	,	("Food Wars",
		 6,
		 "The Meat Invader",
		 "Megumi helps Soma to look for a club to join and stumble upon the Don Research Society, which is being targeted for disbandment by Erina for her expansion project. Ikumi Mito, one of Erina's enforcers known as &quot;The Meat Master&quot;, challenges the club president Kanichi Konishi, telling him that no matter what he cooks his dish will never beat her A5 grade meat. Seeing the events unfold, Soma volunteers to partake in the Shokugeki in Kanichi's place, with the challenge being to cook a donburi dish with meat as the main ingredient. The terms for the contest are that if Soma wins, the club stays with increased funding and Ikumi must join, but if Ikumi wins, the club disbands and Soma will be expelled. In preparing for the Shokugeki, Soma makes numerous donburi dishes through research and modifies them with the realization that the club's budget is limited. Soma settles on the Chaliapin steak, while Ikumi, heir to a massive meat packaging business, contacts her family to deliver the best cut of A5 grade beef available."
		)
	,	("Food Wars",
		 7,
		 "A Quiet Don, An Eloquent Don",
		 "At the Shokugeki, Ikumi wows the audience with her A5 grade beef, while Soma is mocked for using discount supermarket beef. Ikumi completes her A5 Japanese Beef Roti Don first, with the judges being extremely impressed with the taste and quality of her beef. Soon after, Soma presents his Chaliapin Steak Don to the judges, who, after initially refusing to taste it, try his dish and are unable to stop eating, resulting in a unanimous win for Soma. Soma addresses Ikumi's dish, pointing out that she misunderstood the concept of donburi by placing too much emphasis on the beef and not the donburi as a whole, as the judges were too full from eating the beef to finish the rice. With Soma's victory, Ikumi has her personal kitchen taken away from her by Erina but develops a crush on Soma after he calls her by her nickname &quotNikumi&quot;. Ikumi joins Don RS and is immediately outraged and embarrassed to learn Soma did not join the club with her, as he had only visited Don RS in the first place to research donburi recipes to add to his restaurants menu."
		)
	,	("Food Wars",
		 8,
		 "The Concerto of Inspiration and Imagination",
		 "The first year students at Totsuki Academy go to a training camp as their first major challenge during which about half of the first year students usually receive a failing grade and are expelled. The students are given various challenges with alumni from the school brought in to be judges. The first challenge for Soma's group, that includes Megumi and the Aldini twins Takumi and Isami, is to make a dish that can be served at a Japanese restaurant using ingredients gathered from nature in the area surrounding the kitchen with former Second Seat Hinako Inui judging their dishes. Takumi, heir to his family restaurant in Tuscany, &quot;Tratoria Aldini&quot;, challenges Soma to a duel to see who can cook the better dish as they both specialize in diner-style dishes. Most of the students gather fish while the Aldini twins find a duck for their dish. They are the first to complete their dish and Inui passes them."
		)
	,	("Food Wars",
		 9,
		 "The Breading to Adorn the Mountains",
		 "Having come up with ideas for their dish, Soma makes a list of ingredients for he and Megumi to gather. Soma takes Inui's kaki peanuts on the understanding that any ingredient found in the area can be used. Soma and Megumi gather ingredients and arrive with 15 minutes left and they make the Char Okakiage using the peanuts as a crust for the fish. Inui expresses her satisfaction and passes Soma and Megumi, but she does not declare a winner between Takumi and Soma as she is ordered to depart immediately. Takumi leaves vowing to challenge Soma to a Shokugeki should they meet again. The students return to the hotel where they are ordered to each cook 50 servings of a steak dinner to serve to the Bodybuilding, Football and Wrestling Clubs with no chance to rest after having spent all day cooking, and with the risk of immediate expulsion unless all 50 servings are cooked within 1 hour. Soma finishes quickly and heads to the public bath where he runs into Erina, having just finished her own bath."
		)
	,	("Food Wars",
		 10,
		 "The Heavenly Recette",
		 "Soma apologizes for knocking Erina over, but Erina refuses his help thinking that she is letting her guard down. Soma meets alumnus and Totsuki Resort head chef Gin Dojima in the bath, who is surprised to see that Soma finished so quickly. Dojima wishes Soma good luck as Takumi Aldini enters the bath, with Aldini shocked to see Soma having casual conversation with a legend like Dojima. The next day, Soma and Megumi are assigned the task of making the Nine Vegetable Terrine, but this time individually instead of as partners. Alumnus Kojiro Shinomiya, who will be judging the dishes, tells the students to think of each other as enemies. In the mad rush to claim the best ingredients, the unassertive Megumi is pushed aside and finds only bad heads of cauliflower remaining by the time she reaches the table. Thinking about what Soma would do in such a situation, Megumi uses wine vinegar to preserve the color and enhance the seasoning of the cauliflower. Shinomiya passes Soma, but fails Megumi for making unauthorized changes to the recipe. Soma defends Megumi fearlessly in the face of the intimidating Shinomiya, angering the latter, who reveals that he intentionally provided a limited number of good cauliflower heads to limit the number of students who could pass. A furious Soma challenges Shinomiya to a Shokugeki to get Megumi's expulsion rescinded."
		)
	,	("Food Wars",
		 11,
		 "The Magician from the East",
		 "Shinomiya initially refuses Soma's challenge, however Dojima and Inui were passing by and pressured him into accepting the challenge. Thus, Soma and Megumi battle Shinomiya in an unofficial Shokugeki under the condition that Megumi is the lead chef as this Shokugeki is designed to prove Megumi's worthiness as a chef. While Shinomiya makes his dish, Megumi becomes tense at the sight of his dish. Soma tells her to relax and to focus on making something that's representative of herself and not what Shinomiya is doing. Shinomiya presents his dish first, the Chou farci, and the judges give overwhelming praise to the dish. However Dojima is not satisfied by the dish as it was not from one of his specialties. Megumi then presents her dish, the Rainbow Terrine. "
		)
	,	("Food Wars",
		 12,
		 "The Memory of a Dish",
		 "Megumi manages to impress the judges with her Rainbow Terrine, which emphasises the maturity of vegetables. However, when it comes down to voting, all three judges vote for Shinomiya's dish based on the difference between their skill. Just then, Dojima gives his own vote towards Megumi's dish, stating that Shinomiya has allowed his cooking to become stale, his status as a world famous chef having prevented him from developing his skills any further. This is revealed in flashbacks to be related to how his climb to fame involved making sure his dishes were totally by the book with no tolerance for any kind of changes to an established recipe. When Shinomiya tries Megumi's dish for himself, he comes to understand how her dish was geared towards the needs of those eating it and puts in his own vote for Megumi. With Inui also casting her vote for Megumi, the Shokugeki ends in a tie, with Shinomiya revoking Megumi's expulsion. As Megumi returns back to her concerned friends, Soma laments what is technically his very first defeat."
		)
	,	("Food Wars",
		 13,
		 "The Eggs Before Dawn",
		 "Before the students have a chance to sleep for the night, Dojima announces his next task, in which the students must prepare a buffet-style egg dish to be served at breakfast early next morning. With everyone spending the night trying to come up with a recipe, Soma decides on a soufflé omelette, which is met with silent criticism from some of the other students. As breakfast comes the next day, it is revealed the judges will consist of the hotel's guests and staff, with students needing to hand out 200 servings of their dish in order to pass. While many of the students including Erina, Megumi, and Takumi all manage to impress with their dishes, Soma struggles to serve his dish to anyone."
		)
	,	("Food Wars",
		 14,
		 "Metamorphosis",
		 "Due to the specific timing required for his soufflé omelette, Soma struggles to get any customers to try his dish before they end up deflating. With half an hour left in the challenge, Soma calmly analyzes the situtation and changes his approach, cooking in front of his customers in order to attract a crowd while also delivering the dish in its peak condition. Optimizing his preparation time to cook his omelettes as quickly as possible, Soma manages to complete his 200 servings goal with merely seconds to spare. Afterwards, Soma is introduced to Erina's cousin, Alice Nakiri, who considers both Soma and Erina her rivals. Following another task a few hours later, Dojima treats all the surviving students with a banquet to celebrate the end of the training camp, while withholding information about the next event: the Autumn Selection."
		)
	,	("Food Wars",
		 15,
		 "The Man Called Demon",
		 "As the students make their way home, Shinomiya decides to return to France to make his restaurant the best in Paris, while the other alumni explain how the training camp also serves as a recruitment ground to determine potential for future employment. Going back for his headband, Soma ends up missing his bus and has to hitch a ride back to school with Erina, who explains about the Autumn Festival while hiding the fact that she, along with Dojima, are shown to have fond memories of Joichiro. Returning to the Polar Star Dormitory, Soma is surprised to see Joichiro, who is revealed to be an alumnus and former member of the Elite Ten who went by the name Jouchirou Saiba. As Joichiro treats the returning residents to a meal, Fumio explains that Joichiro and Dojima were once fellow Polar Star residents who were responsible for many of the luxuries the dorm has. Later that night, Joichiro tells Soma about his campus memories, filling him with more determination. The next morning, Joichiro decides to have a cooking contest against Soma."
		)
	,	("Food Wars",
		 16,
		 "The Chef Who's Crossed A Thousand Leagues",
		 "With Fumio, Megumi, and Satoshi winding up as judges, Soma and Joichiro are challenged to use ingredients from the kitchen to make a light yet energizing breakfast dish that will wake them up. Soma presents an apple risotto, which provides a crisp taste which changes with the addition of black pepper. Joichiro, on the other hand, presents the unusual choice of ramen which, despite its heavy appearance, turns out to be a mellow and warming vegetarian dish, providing powerful flavor without meat or fish. The judges unanimously vote Joichiro's dish the winner, though Soma's dish also receives some praise. As Jouichirou takes his leave, he leaves a message recommending Soma visit the Yukihira Diner during the holiday."
		)
	,	("Food Wars",
		 17,
		 "The Seductive Karaage",
		 "Arriving back home, Soma temporarily re-opens Yukihira Diner to serve his loyal customers, including his childhood friend, Mayu Kurase, who has a crush on him. He learns that the Sumire Shopping District has been doing poor business lately due to the arrival of a popular karaage chain shop, Mozuya. Wanting to help revive the shopping district, Soma decides to come up with a competing karaage recipe, calling in Ikumi as his meat expert while Mayu winds up as his taste tester (due to the efforts of mutual friend Aki Koganei to set Mayu up with Soma). The three do some recon at Mozuya, where they find its CEO Kinu Nakamozu to be a spiteful woman, before beginning work on a karaage recipe of their own. As Soma takes up Mayu's suggestion to use their shopping district location to their advantage, it is revealed that the figure behind Mozuya's success is one of the Elite Ten."
		)
	,	("Food Wars",
		 18,
		 "The Karaage of Youth",
		 "Noting that the shopping district focuses more on walk-and-eat food, as opposed to Mozuya's packaged approach, Soma shifts his focus towards creating a karaage that can be enjoyed straight out of the fryer. Opting to go with chicken thigh meat with a chilli-based marinade, Soma gets inspiration from a bento shop owner and decides to serve his karaage in rice flour wraps with salad, providing enhanced flavor, portability, and appeal all at once. This brings a large amount of business, which in turns helps the rest of the shopping district come back to life, with Nakamozu having no choice but to admit defeat. Afterwards, Soma puts Mayu in charge of helping with the karaage's sales, having noted her good qualities. Returning to the academy, Soma is brought before Mozuya's puppetmaster, Etsuya Eizan, the ninth seat of the Elite Ten, who informs him that he has been chosen for the Autumn Elections."
		)
	,	("Food Wars",
		 19,
		 "The Chosen One",
		 "The contestants and rules for the Autumn Elections are announced, in which the sixty selected contestants are split into two groups which they must top in order to advance to the tournament phase. Meanwhile, Megumi is approached by a girl named Miyoko Hojo, who was interested in her shokugeki with Shinomiya but becomes disappointed when she hears she was helped by Soma. After learning the first dish of the elections is a curry dish, Soma and Megumi pay a visit to Jun Shiomi, an instructor and former Polar Star alumna who specializes in curry and spices, along with her assistant Akira Hayama, who is also in the elections. Using Jun's theories on spices, Akira demonstrates how preparing the same ingredients of a curry dish in different ways can yield drastically different results. Becoming wowed by the powerful flavors of Akira's curry, Soma becomes determined to beat him with an even better curry dish at the preliminaries. "
		)
	,	("Food Wars",
		 20,
		 "The Dragon Lies Down and Ascends the Skies",
		 "With the challenge of creating a curry dish set, many of the contestants set off to visit their families and study up on spices during the remainder of the summer while Soma stays at the dorms to try out various combinations. The Autumn Election preliminaries soon arrive, with only the top four from each group able to make it through to the tournament phase. As each of the contestants start bringing out each of their unique methods, Soma appears to have fallen asleep. "
		)
	,	("Food Wars",
		 21,
		 "The Unknown Known",
		 "Soma awakens from his nap at the exact moment he senses his spice and vegetable infused rice is cooked to perfection. Meanwhile, Megumi brings out a monkfish for her dish, having learnt how to butcher it in order to help her family. With the cooking period over, the judging soon begins with a harsh panel of judges hitting most of the students with low scores. In Group B, Nao Sadatsuka, a somewhat creepy girl with an obsession with Erina, presents an extremely pungent laksa dish made using kusaya that secretly carries a delicious flavor under its strong odor, scoring 84 points as a result. Meanwhile, Erina's secretary and childhood friend Hisako Arato, who Nao has a rivalry with, presents a mutton curry made using medicinal cuisine which undoes the cursive effects of Nao's curry, scoring 92 points. "
		)
	,	("Food Wars",
		 22,
		 "The One Who Surpasses the Ordinary",
		 "Miyoko scores 87 points with her pineapple-fragranced cha-han while Yuki gets 86 points for her wild game curry. Afterwards, the Aldini brothers face off against each other, with Isami presenting a curry calzone that scores 87 points while Takumi presents a curry pasta dish using tamari soy sauce and cheese filled pasta that scores 90 points. Alice then presents her deconstructed curry dish that leaves the judges bewildered, earning 95 points and taking the lead. Finally, Megumi presents her dish, monkfish dobu-jiru, which emphasises the taste of her hometown, earning her 88 points and landing her a spot in the next round alongside Alice, Hisako, and Takumi."
		)
	,	("Food Wars",
		 23,
		 "The Competition of the Blossoming Individuals",
		 "Back in Group A, contestants are struggling to score as one of the main judges, Natsume Sendawara, keeps giving out zero scores. This streak soon breaks when Ryo Kurokiba, Alice's aide, presents a lobster curry made using a cognac base, earning 93 points. Next, Ikumi presents a Dongpo pork curry, using what she had learned from her Shokugeki with Soma to impress the judges with a complete dish and earning score of 86. Afterwards, Ryoko presents a Dal curry made with charcoal-grilled natto and soy sauce rice malt, also scoring 86, while both Marui and Ibusaki earn 88 points with their white potage curry udon and smoked curry respectively. Akira soon presents his dish, an unconventional dish that soon turns out to be a fragrance bomb."
		)
	,	("Food Wars",
		 24,
		 "The Banquet of Warriors",
		 "Akira's dish, which on top of its powerful fragrance also uses the power of holy basil and yogurt, earns a score of 94 from the judges, two of which gave him a perfect 20. Finally, Soma presents his own fragrance bomb, combining his past two failures into a curry risotto omurice containing a mango chutney that deepens the flavor. The dish earns Soma 93 points, landing him second place behind Akira, though it is noted by the crowd that despite Akira receiving a higher score overall three of the five judges ranked Soma's dish higher than Akira's, with the implication being that in a Shokugeki, this would have given Soma the victory. As the contestants hold an afterparty celebrating and lamenting their victories and losses in the preliminaries, Soma becomes determined to improve his cooking finesse."
		)
;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("Food Wars", 0, 1, 4)
	,	("Food Wars", 0, 2, 4)
	,	("Food Wars", 0, 3, 4)
	,	("Food Wars", 0, 4, 4)
	,	("Food Wars", 0, 5, 4)
	,	("Food Wars", 0, 6, 4)
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
		("Magical Warfare",
		 12,
		 "In this modern magic action story, Takeshi Nanase is an ordinary high school boy who has a somewhat dark past. However, one day, he comes across a girl named Mui Aiba, in a uniform he has never seen before, collapsed on the school campus. This encounters changes Takeshi's destiny completely. Mui tells Takeshi that she is a magician, and she apologizes, for she turned Takeshi into a magician, too. What Takeshi once knew as one world is actually two - the world where magicians live and the world where humans live.",
		 "In this modern magic action story, Takeshi Nanase is an ordinary high school boy who has a somewhat dark past.",
		 "Madman",
		 "&copy;Hisashi Suzuki/PUBLISHED BY KADOKAWA CORPORATION MEDIAFACTORY/SUBARU Magic School Project"
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("Magical Warfare",
		 0,
		 1,
		 "M - Animated violence and sexual references",
		 12,
		 "https://www.animelab.com/shows/magical-warfare"
		)
	,	("Magical Warfare",
		 3,
		 1,
		 "M - Animated violence and sexual references",
		 12,
		 "https://www.madman.com.au/catalogue/view/33119/magical-warfare-series-collection"
		)
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("Magical Warfare",
		 1,
		 "Midsummer Magical Girl",
		 "Takeshi Nanase is an ordinary high school boy who has a somewhat dark past. One day, he comes across a girl named Mui Aiba, in a uniform he has never seen before, collapsed on the school campus. This encounter changes Takeshi's destiny completely. Mui tells Takeshi that she is a magician, and she apologizes, for she turned Takeshi into a magician, too. What Takeshi once knew as one world is actually two — the world where magicians live and the world where humans live."
		)
	,	("Magical Warfare",
		 2,
		 "Another World",
		 ""
		)
	,	("Magical Warfare",
		 3,
		 "The Magic Academy and Love Fortunes",
		 ""
		)
	,	("Magical Warfare",
		 4,
		 "Mui and Tsuganashi of the Ruined World",
		 ""
		)
	,	("Magical Warfare",
		 5,
		 "Magic Tests and Winter Vacation",
		 ""
		)
	,	("Magical Warfare",
		 6,
		 "Battle and Recovery",
		 ""
		)
	,	("Magical Warfare",
		 7,
		 "The Magic Sword's Secret",
		 "After the return of Tsuganashi Aiba, Takeshi keeps having nightmares during his sleep. That nightmares are caused by someone that used magic. In order to end the nightmare, he has to explore his dream and settle things with this magic user."
		)
	,	("Magical Warfare",
		 8,
		 "Wizard Brace's Darkness",
		 "It's now April, and Subaru Magic Academy bustles with activity welcoming its new students. Among them are Ida's younger sister Futaba. Due to an unfortunate little incident between the Ida siblings, Futaba has become a magician as well. Also among the new students is Takeshi's younger brother Gekkō."
		)
	,	("Magical Warfare",
		 9,
		 "Prelude to Destruction",
		 "Ryuusenji Kazuma, the leader of the Ghost Trailers, had fallen into endless slumber after the previous Great War. Now that he has awoken once again, the curtain rises upon the Second Great Magic War."
		)
	,	("Magical Warfare",
		 10,
		 "Vanishing Boundaries",
		 "After revealing that he is a Ghost Trailer, Gekkō takes Kurumi and Twilight away from Takeshi. The badly wounded Takeshi is rescued by Kisaki Ena and her companions from the Community known as &quot;Camelot.&quot;"
		)
	,	("Magical Warfare",
		 11,
		 "The Battle of Pendragon",
		 "Takeshi continues training at Camelot in order to rescue Kurumi. Meanwhile, at the Ghost Trailers' headquarters, Kurumi confronts Gekkō. Taking advantage of a moment's carelessness, Kurumi manages to escape her prison."
		)
	,	("Magical Warfare",
		 12,
		 "Gone From This World",
		 "Takeshi heads home and finds Gekkō, wielding a modified Twilight dripping blood, exiting the house. He fears the worst, given his precognitive dream (that Gekkō kills their mother) and demands that Gekkō let him pass. Gekkō informs Takeshi that the accident was actually an assassination attempt arranged by their mother. Unwilling to believe that, a fight between the brothers ensues with Takeshi now able to fight with Gekkō on even terms thanks to his mother's training. He is on the verge of gaining the upper hand when Gekkō resorts to subterfuge to get Takeshi to drop his guard. Meanwhile, Kurumi has been searching the battlefield for Takeshi. She finds him just as Gekkō is about to stab him and interposes herself at the last second, saving Takeshi, to the horror of both brothers. This galvanizes Takeshi and he starts fighting his brother in earnest. The engagement becomes so intense that their powers start to go out of control. Momoka appears and shoots a magical &quot;bomb&quot; towards both of them, causing them to disappear from the battlefield. Kazuma is shown in Takeshi's house. He has healed Yōko and after calling her mother, he takes a picture of Isoshima from his pocket - that same picture of her that Takeshi has. The focus then shifts to a just-awakened Takeshi who finds himself on the Academy grounds, but they are strangely untouched by recent events. His mother and one of his teachers appear, only the teacher is calling her Sensei and Takeshi realizes that something is off. A nearby poster indicates that the year is 1998 - 16 years in the past. He then encounters other people he has met including Momoko, Washizu, Tsukiomi and Kazuma who appear to be friends. To his further surprise, Gekkō runs up to the group while Takeshi sits on a bench trying to make sense of everything. The group walks past Takeshi and Gekkō menacingly greets him."
		)
;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("Magical Warfare", 0, 1, 4)
	,	("Magical Warfare", 0, 2, 4)
	,	("Magical Warfare", 0, 3, 4)
	,	("Magical Warfare", 3, 1, 2)
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
		("Pandora in the Crimson Shell",
		 12,
		 "From Shirow Masamune, the creator of Ghost in the Shell, comes a lighthearted story of two cyborg girls who fight to save their home. Nene Nanakorobi is your typical girl next door except for that fact that she's a rare type of full-body cyborg. She's thrilled to finally meet another cyborg named Clarion and hopes they’ll be best friends. This is the beginning of their adventures together.",
		 "From Shirow Masamune, the creator of Ghost in the Shell, comes a lighthearted story of two cyborg girls who fight to save their home. Nene Nanakorobi is your typical girl next door except for that fact that she's a rare type of full-body cyborg.",
		 "Madman",
		 "&copy;Shirow Masamune, Koushi Rikudou / KADOKAWA, Benipan"
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("Pandora in the Crimson Shell",
		 3,
		 1,
		 "MA15+ - Strong sexual innuendo",
		 13,
		 "https://www.madman.com.au/catalogue/view/35729"
		)
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("Pandora in the Crimson Shell",
		 1,
		 "Adepter",
		 "In an age of advanced technology, a cyborg named Nene Nanakorobi meets an inventor named Uzal Delilah and her cyborg pet, Clarion, on their way to Cenancle Island. Shortly after the girls arrive on the island, the city comes under attack by an army of robots controlled by a group of rebels who despise Uzal. In order to battle against them, Uzal gives Nene authority to use the Pandora Device inside of Clarion, updating her operating system to temporarily give her the skill to use a gun. After the robots are stopped, Uzal brings Nene to her laboratory where she gives Nene an optical camouflage for when she uses the Pandora Device, before the rebels ask for Uzal's help in stopping a robot that had gone berserk. "
		)
	,	("Pandora in the Crimson Shell",
		 2,
		 "Geofront",
		 "Nene and Clarion are tasked with stopping BUER, a giant boring robot belonging to Uzal's company that went berserk after her underlings tried to use it against her. After the underlings trick BUER into firing its laser cannon, Clarion aims to reach its main console while Nene acts as her bodyguard. However, a large piece of rubble interrupts Clarion before she complete her mission, so she instead operates some smaller robots to allow Nene to reach the console and shut BUER down. With forces approaching on the laboratory, Uzal detaches BUER's Central Nervous Unit before having Nene and the others escape from the lab as it self-destructs, leaving Clarion in Nene's care. Upon reaching the surface, Nene and the others find themselves surrounded by Cenancle's Defense Force."
		)
	,	("Pandora in the Crimson Shell",
		 3,
		 "Terrarium",
		 "Thanks to Uzal's efforts, Nene and Clarion are treated like rescued hostages and are escorted to the residence of Nene's aunt, Takumi Korobase, who is acquaintances with Uzal. Later, as Takumi takes a dangerous interest in Clarion's ears, Nene manages to see through a simulation Takumi had placed them in when they arrived and stop her. The next day, Nene and Clarion are approached by one of Uzal's underlings, Bunny, who asks for BUER's authentication key in order to help her comrades. As Bunny delivers the key to a mysterious man named Ian Kurtz, who plans to use it for his own gain, Clarion digs up BUER's central nervous unit. "
		)
	,	("Pandora in the Crimson Shell",
		 4,
		 "Kitchen Drudge",
		 "After Nene manages to enrol in a prestigious online school, Takumi, wanting to have some time alone to examine BUER, sends Nene and Clarion to observe some of her companies as part of her homework. With the companies being too aware of Takumi's status to provide any useful information, Nene goes to a charity event where a TV reporter named Prosperina allows her to observe her work. When some thugs suddenly show up and start wrecking the place, Nene and Clarion step up against them, encouraging the other volunteers to stand up against them too. With most of the food ruined by the attack, Nene uses the Pandora Device to learn cooking skills and cook up some replacement meals."
		)
	,	("Pandora in the Crimson Shell",
		 5,
		 "System Down",
		 "While pondering if it is right to keep borrowing Clarion's power to achieve world peace, Nene meets an old woman named Anna who is adjusting to a robotic arm. Just then, a network disturbance occurs across the entire island, causing almost all of its systems and transportation to shut down. Nene and Clarion soon come across a man named Robert, who helps out everyone they comes across and manages to stop a pair of thieves, before coming across Anna, whose life is in danger because of the disturbance affecting her artificial organs. Using the Pandora Device, Nene becomes a paramedic to treat Anna's symptoms and take her to the hospital. After the network is restored, Nene is thanked by Anna for saving her, while Robert, who is part of the island's defense force, is given a task by Kurtz. "
		)
	,	("Pandora in the Crimson Shell",
		 6,
		 "Central Nervous Unit",
		 "Nene goes in for a medical checkup at hospital, where a girl named Amy Gilliam is also visiting to have a new leg installed, only to find her cat Lean has sneaked in as well. While searching for Lean, Amy comes across BUER, who joins her in her search. The two are soon found by Nene and Clarion while Anna manages to find Leon and reunite her with Amy. When Amy rips her dress before her appointment, Nene uses the Pandora Device to become a couturier and sew it back together, allowing her to go to her appointment with a smile. When they return to the park, they find it has been completely torn down, with its residents evacuated by the CDF. As they pass by Kurtz, Clarion is cautious of a cyborg following behind him. "
		)
	,	("Pandora in the Crimson Shell",
		 7,
		 "Puppeteer",
		 "A family of robot thieves known as the Chicken Brothers catch Clarion off guard and capture Nene. As Clarion tracks the thieves down to their hideout, Nene comes across all the other androids the thieves had taken and, upon reuniting with Clarion, uses the Pandora Device to take control of them and stop the thieves. "
		)
	,	("Pandora in the Crimson Shell",
		 8,
		 "Inferno",
		 "Nene and Clarion go to the Herme's department store, where government chairman Janus North is serving as manager-for-a-day. Following another network disturbance, North and his secretary become stuck in an elevator with Nene and Clarion. The group manage to find their way out of the elevator, only to discover a fire has broken out across the entire department store. Wanting to help North and the secretary escape, Nene uses her Pandora Device skills to create a fireproof cart and lead them to the emergency stairs. Spotting a boy still trapped in the fire, Nene goes back to rescue him despite Clarion's warnings, using what little oxygen she has to keep him alive. Putting Nene's wishes over her own common sense, Clarion manages to catch up to her and get both Nene and the boy out safely. "
		)
	,	("Pandora in the Crimson Shell",
		 9,
		 "Assault",
		 "The fire at the department store is revealed to have been caused by a laser fired from BUER's body after Kurtz tries to hack into it. Deducing this herself and deciding not to get Nene involved, Clarion approaches Takumi about BUER going out of control again and borrows some of her robots for an assault on Uzal's base in order to stop it. Making her way past Bunny and her robot defenses, Clarion soon comes up against Kurtz' cyborg bodyguard, Fear. "
		)
	,	("Pandora in the Crimson Shell",
		 10,
		 "Fear",
		 "Nene wakes up to find Clarion has gone, leaving behind a note saying not to involved, and begins feeling lonely without her around. Meanwhile, Robert receives a confidential message from Uzal warning him about Kurtz' plans to use BUER. As Nene struggles to try and do things by herself, she receives some helpful advice from Robert before learning from BUER about what Clarion is actually involved in. Meanwhile, Clarion brings out her strongest weapons against Fear, who is revealed to be an android, but is caught off guard when it targets Bunny. Wanting to help Clarion, Nene sneaks out with BUER's help to go and find her. "
		)
	,	("Pandora in the Crimson Shell",
		 11,
		 "Ghost Urn",
		 "Nene infiltrates the base, where she gets mistaken for a dummy robot and temporarily shut down by Kurtz. While BUER follows Kurtz, Nene finds herself in the disposal area with Bunny, who tasks her with diving into the base's system and finding a way out before they are disposed of. Remembering when she started out moving her cyborg, Nene manages to move about freely in cyberspace and unlock the emergency hatch. While Bunny heads off to save her allies, BUER attempts to stop Kurtz from hacking his main body only to be thwarted by Takumi's own hacking attempts. As Nene reaches the central room and is confronted by Fear, she is aided by the arrival of Clarion, who managed to survive Fear's attack. Wanting to help Clarion protect the island, Nene uses the Pandora Device and joins Clarion is facing up against Fear. "
		)
	,	("Pandora in the Crimson Shell",
		 12,
		 "Elpis",
		 "Nene uses her ability to support Clarion as she fights against Fear, allowing her to destroy it. Meanwhile, BUER's defenses are taken down by Takumi, allowing Kurtz to activate it. Instead of gaining control, however, Kurtz is shocked to find that all he has done is leaked BUER's collection of panty shots across the world. As BUER goes on a rampage out of pure embarrassment, Uzal gets in contact with Nene, stating that BUER must be stopped by using Clarion to activate his self-destruct system. Not wanting to lose Clarion, Nene chooses a riskier alternative, going inside of BUER and managing to calm him down. After Uzal sinks BUER's body and seals off the geofront, Nene and Clarion resume their everyday life of seeking world peace together. "
		)
;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("Pandora in the Crimson Shell", 0, 1, 4)
	,	("Pandora in the Crimson Shell", 0, 2, 4)
	,	("Pandora in the Crimson Shell", 0, 3, 4)
;
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
-- Anime Data
INSERT INTO ANIME(ANIME_TITLE, NUMBER_OF_EPISODES, ANIME_SYNOPSIS, ANIME_DESCRIPTION, COMPANY_NAME, COPYRIGHT) VALUES
		("School-Live!",
		 12,
		 "Why would anyone form a School Living Club? Could four girls, their advisor, and a puppy really love their school so much that they'd want to live in it? Or is there another reason, something that lurks behind the facade of their comfortable existence? Something that waits outside their school’s doors. Something that has already robbed one girl of her sanity? While the others try to come to grips with a dark new reality, the rest of the world falls to ruin at the hands of a ravenous force, and insanity may be the last hope for survival. Shocks, heartbreak and stunning revelations await as the as the twisted tale unfolds in SCHOOL-LIVE!",
		 "Why would anyone form a School Living Club? Could four girls, their advisor, and a puppy really love their school so much that they'd want to live in it? Or is there another reason, something that lurks behind the facade of their comfortable existence?",
		 "Madman",
		 "&copy;Nitroplus / Norimitsu Kaihou, Sadoru Chiba, Houbunsha / Gakkougurashi Production Committee"
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("School-Live!",
		 4,
		 1,
		 "MA15+ - Strong supernatural themes and animated violence",
		 12,
		 "https://www.madman.com.au/catalogue/view/39916"
		)
	,	("School-Live!",
		 3,
		 1,
		 "MA15+ - Strong supernatural themes and animated violence",
		 12,
		 "https://www.madman.com.au/catalogue/view/34317"
		)
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("School-Live!",
		 1,
		 "Beginning",
		 "Yuki Takeya is a cheerful high school girl who lives at school and spends time with the School Living Club alongside fellow members Kurumi Ebisuzawa, Yuri Wakasa, and Miki Naoki, and their advisor, Megumi Sakura. During classes, Yuki and Miki chase after their pet dog, Taromaru, who decides to go wandering off on his own, eventually tracking him down. Later on, as Miki accompanies Yuki as she retrieves her bag from class, it is revealed that Yuki's view of a rosy school life with her fellow classmates is all in her head. In reality, she and the other members of the School Living Club are the only survivors of their school following a zombie outbreak. "
		)
	,	("School-Live!",
		 2,
		 "Memories",
		 "Kurumi recalls an upperclassman that she had a crush on before he became a zombie. As Kurumi scouts the school for any wandering zombies, she is shocked to see one of them was once the upperclassman's girlfriend, which she is forced to kill. Later, Yuki suggests that everyone go on a test of courage through the school, which the others use as a motive to obtain supplies. While exploring the library, Yuki comes close to encountering a zombie, but is calmed down by Megumi and encouraged to hide while the others lure it away and finish it off, with Yuki remaining unaware. "
		)
	,	("School-Live!",
		 3,
		 "That Time",
		 "Writing in her diary, Megumi recalls the events of the day everything changed. Going through what should've been a normal day of school, Megumi helps Yuki with a make-up test while giving Kurumi some love advice. After discovering some disturbing texts from her mother about the situation outside, Megumi takes Yuki to the rooftops, where Yuri had been attending the garden. There, Megumi learns about the zombie attack, with Kurumi and her injured upperclassman also making their way up to the rooftop. As the others are forced to barricade the door from approaching zombies, Kurumi is attacked by her zombified upperclassman and is forced to kill him in front of Yuki. Back in the present, Yuki suggests everyone participate in a camping trip during a power outage, with everyone feeling thankful for everything Megumi has done for them. "
		)
	,	("School-Live!",
		 4,
		 "Outing",
		 "Miki recalls her experiences of the incident, in which she and her friend, Kei Shido, along with Taromaru, were at a shopping mall when the outbreak occurred. As the three spend the following weeks hiding out in the mall's upper offices, Kei eventually grows tired of being inside all of the time and sets off outside, leaving Miki and Taromaru by themselves. Meanwhile, Yuki proposes to the club that they go on a school outing. As the girls take Megumi's car and make their way towards the mall, Miki discovers that Taromaru has gone missing too. "
		)
	,	("School-Live!",
		 5,
		 "Meeting",
		 "Yuki and the others arrive at the shopping mall, exploring the place for supplies while taking care to avoid zombies. While visiting the supermarket section, Kurumi comes across Taromaru, who the group decide to take with them. As the girls end up disturbing a large group of zombies and are forced to retreat, Miki hears their cries and goes off in search of them. Just as the girls start to head back to the school, Yuki manages to hear Miki as she becomes cornered by zombies, allowing the girls to come to her rescue in the nick of time. "
		)
	,	("School-Live!",
		 6,
		 "Welcome",
		 "Given a tour of the school by Yuki upon waking up, Miki quickly comes to learn about her delusions, including the fact that the existence of Megumi is also one of them. Later, Yuri and Kurumi later explain to Miki how the real Megumi, who founded the School Living Club with Yuri, sacrificed herself in order to protect her students from the zombies, the shock of which left Yuki with the delusion that Megumi and the other students are still alive. Asked by the others to play along with this act, Miki reluctantly takes part in a sports meet with everyone, where she learns a little about how Yuki's way of thinking helps everyone. Wanting to understand more, Miki decides to become a trial member of the School Living Club. "
		)
	,	("School-Live!",
		 7,
		 "A Letter",
		 "Back in the present, as Yuki's delusion starts to show signs of cracking, Miki grows concerned that letting things continue this way is doing Yuki more harm than good. Later, Yuki manages to find a stationery set among Megumi's belongings, which the club decide to use to write letters to send outside, while Miki finds a key, which she gives to Yuri for safekeeping. The next day, the girls send off their letters on balloons, with Miki writing one for Kei. "
		)
	,	("School-Live!",
		 8,
		 "Future",
		 "After Yuki and Kurumi give Taromaru a much-needed bath, the girls discuss their plans after they graduate while Yuri recalls the day, she and Megumi started the School Living Club. Later that night, Miki becomes curious about the school's excessive facilities that has allowed them to survive and joins Yuri in searching the staff room for whatever Megumi's key unlocks. With Yuki's help, they find a hidden safe containing an emergency manual, which reveals the school was involved with a biological weapon and was constructed as a safe house in the event of an outbreak. "
		)
	,	("School-Live!",
		 9,
		 "Holiday",
		 "As the girls further inspect the manual, learning of a shelter hidden in the school's basement, Yuki ropes everyone into cleaning the school's water tank to use as a swimming pool. While the girls take their minds off of things by swimming and having water fights, Miki finds herself able to grow closer to Taromaru, who was cold to her before. Afterwards, Yuki gives Miki some advice that if she enjoys herself, she will surely meet Kei again. Later that night, Taromaru breaks free from his leash and goes down into the basement, where he comes across a familiar looking zombie. "
		)
	,	("School-Live!",
		 10,
		 "Rainy Day",
		 "Upon discovering that Taromaru has gone missing, the girls go off in search for him. Following his tracks down to the basement, Kurumi finds Taromaru, only to find he had become infected. Managing to lock Taromaru up, Kurumi enters the underground shelter only to discover that the zombie who bit him is none other than Megumi herself, becoming bitten by her when she hesitates to attack her. As the girls struggle over what to do as Kurumi's condition worsens, Miki learns of an antidote located in the shelter and decides to go to the basement, but is soon overcome with grief over Taromaru. Meanwhile, as zombies start making their way inside the school, Yuki begins to remember something. "
		)
	,	("School-Live!",
		 11,
		 "Scar",
		 "With zombies spreading across the school, Yuki rushes over to Miki's aid, giving her the encouragement she needs to go off in search of the antidote. Meanwhile, a thunderstorm strikes the school's power generator, cutting the school's power, while Yuri comes close to killing Kurumi before she completely turns, but can't bring herself to do it. Down in the basement, Miki comes face to face with Megumi, assuring her that the others are doing fine before putting her to rest. Miki manages to find the antidote, only to become cornered by zombies alerted by the backup power's alerts. Meanwhile, Yuki, who gradually remembers what really happened, is guided by her version of Megumi towards the broadcasting room, finally coming to terms with Megumi's death. "
		)
	,	("School-Live!",
		 12,
		 "Graduation",
		 "Arriving at the broadcasting room, Yuki is cornered by zombies but is saved by Taromaru, who had instinctively come to her rescue. Realising that the zombies still retain their residual memories, Yuki manages to send all the zombie students away by telling them to go home, allowing Miki to deliver the antidote. Although the antidote manages to cure Kurumi of her condition, Taromaru is left weak from being infected for so long and passes away in Miki's arms. After giving Taromaru a proper burial alongside Megumi, the girls learn that the reason he went down to the basement was to search for another puppy that was somewhere in the school. With the school no longer habitable due to the damage done to the electricity, the girls decide to head towards a university marked on a map by Megumi, holding a graduation ceremony to bid their farewells to the school. As the girls set off on their &quot;graduation trip&quot;, another girl elsewhere comes across one of their letters. "
		)
;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("School-Live!", 0, 1, 4)
	,	("School-Live!", 0, 2, 4)
	,	("School-Live!", 0, 3, 4)
;
-- Anime Data
INSERT INTO ANIME(ANIME_TITLE, NUMBER_OF_EPISODES, ANIME_SYNOPSIS, ANIME_DESCRIPTION, COMPANY_NAME, COPYRIGHT) VALUES
		("Three Leaves, Three Colors",
		 12,
		 "Yoko Nishikawa lived a life of privilege until her father’s company went under. From princess to pauper, she faces life with a non-existent budget and is stuck eating bread crusts. Alone and distraught, everything changes when glutton Futaba and scary class rep Teru stumble into her life—literally. Together, they’ll discover a new friendship and survive the day-to-day trials of being in high school.",
		 "Yoko Nishikawa lived a life of privilege until her father’s company went under. From princess to pauper, she faces life with a non-existent budget and is stuck eating bread crusts.",
		 "Madman",
		 "&copy;Â&copy 2016 arai-cherry / Houbunsha, Three leaves, three colors Project"
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("Three Leaves, Three Colors",
		 3,
		 1,
		 "PG - Mild themes",
		 12,
		 "https://www.madman.com.au/catalogue/view/36925"
		)
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("Three Leaves, Three Colors",
		 1,
		 "These Are Bread Crusts",
		 "While on lunch break, Odagiri Futaba, who decides to take a shortcut to her classroom, and Hayama, who is chasing a cat, stumble upon Nishikawa Yoko eating alone. When Futaba asks Yoko what's on her hand, she immediately says that they are bread crusts. Then, the three of them end up having lunch together and introduce themselves. Futaba asks Yoko whether she has no friends, where she replies that Futaba is too direct in asking it. That night, Yoko tries to deep fry the break crusts."
		)
	,	("Three Leaves, Three Colors",
		 2,
		 "Nothing Good for You is Tasty",
		 "While lunch, Hayama offers Yoko her rolled egg, which the latter refuse. Futaba asks both of them being so polite to each other, and they should call each other by using nicknames. Suddenly, a cat appears out of nowhere, which makes Hayama shows her soft side for animals. She tells them that she has a pet cat named 'Beelzebub' at home, which she nicknamed 'Bel'."
		)
	,	("Three Leaves, Three Colors",
		 3,
		 "A Taste of Maid",
		 "When Yoko goes to school, it is revealed that Yamaji always inspects whether she locked properly after she goes out. A week later, Futaba reveals that she is running out of money due to her accidentally use her allowance to eat the expensive grilled sea urchin. When Futaba decided she probably should work part-time, Yoko plans to do the same as well, while asking what should be a good place for her to work."
		)
	,	("Three Leaves, Three Colors",
		 4,
		 "Actually, This Is What I Live For",
		 "When Yoko-sama invited her friends to her home, they all play pretend to be a married woman, wife of a chairman and wife of a real estate magnate, as Yamaji tells Futaba and Teru a tale from Yoko's childhood. In Futaba's case, it is revealed that she has been a walking black hole since she was in primary school, eating a loaf of bread (with jam) for snacks. When they ask about Teru's past, she tells them that Santa didn't give her none of what she wanted back then (either a white tiger, a puma, a snow leopard or a sabre-toothed cat). Suspecting it is because she has been a bad girl, she vows to be a good girl and study hard, even though it is all just for show. Both Futaba and Sonobe are initially jealous of Teru who has a good older sister, but retract their statement after seeing her act in the present."
		)
	,	("Three Leaves, Three Colors",
		 5,
		 "Your Birthmarks Have Faded",
		 "During a very hot day in summer, Futaba comes to Teru's house, shouting &quot;Teru-chan, let's play!&quot; until she comes out angry and points out that she should just ring the chime. After annoyed by hearing that Futaba just come to play Old Maid with her, Teru suggests that they go to somewhere cooler. In a restaurant named Jonafull, as the three friends sit down, Yoko-sama dozes off, and hit her head quite hard on the table. They learn that Yoko is exhausted from working."
		)
	,	("Three Leaves, Three Colors",
		 6,
		 "Veggies, Meat, Meat, Meat, Meat, Meat, Meat, and Fish",
		 "During August, Yoko, Futaba and Teru arrive at the beach... not to play, but to work with Sonobe by managing her beach hut, Himitsu no Hanazono (秘密の花園, literally Secret Garden), Beach Hut Version. (Not) surprisingly, Yoko-sama don't know what a beach hut is, and Sonobe's attempt on explaining it to her end in failure. An overprotective Yamaji brings along a metal bat, with the intention of swinging it to anyone who stare at Yoko-sama."
		)
	,	("Three Leaves, Three Colors",
		 7,
		 "Ten Yen Short",
		 "Autumn has arrived, as Yoko, Futaba and Teru return home from school. Futaba only thinks about food, and says that it is an autumn of eating, while adding that she can eat five times as much in autumn. They meet with a blue-haired boy, who shouts &quot;Odagiri Futaba!&quot;, and runs before anyone can say anything else."
		)
	,	("Three Leaves, Three Colors",
		 8,
		 "You've Got Them Hooked",
		 "In a Cat Cafe named &quot;Nekonimashi&quot; (猫にまし), Serina is playing with the cats there happily. Suddenly, a new customer enters, and Teru sits besides Serina. Both of them are surprised to see each other there. The story then flashbacks to that morning. Kou asks Teru to go out with her, and when she points to Nekonimashi, Teru reveals that she has a coupon to there already, which is the reason of Serina's encounter with Teru."
		)
	,	("Three Leaves, Three Colors",
		 9,
		 "Curry Tastes Better on the Second Day",
		 "It is the time for Cultural Festival. Class 1-3 students are thinking of an event to do, and Futaba suggests curry shop. When they ask about costumes, Sonobe Shino appears out of nowhere and suggests that they just use school uniforms, and make the theme to be &quot;ordinary curry made by high school girls&quot;, before disappearing without anyone else but Asako, Serina, Futaba and Teru notices her real identity."
		)
	,	("Three Leaves, Three Colors",
		 10,
		 "A Day to Gorge on Chicken and Cake",
		 "It's almost Christmas season. Yoko claims that it is the season for her heating bill to be high, since it is cold. Yamaji, who happens to be passing flyers, hearing that Yoko is going to cut cost by being in a blanket, says that he will buy a heater for Yoko-sama. The three leaves ignore him and walk away."
		)
	,	("Three Leaves, Three Colors",
		 11,
		 "A Day to Gorge on Chocolate",
		 "It's almost the season for Valentine Day. Yoko claims that it is the season that she want winter to end so that she can save on heating bills. Teru points out that they seems to have this conversation before. Futaba claims that Valentine Day is the day to gorge on chocolate, while Yoko disagrees, and Teru once again feel a déjà vu."
		)
	,	("Three Leaves, Three Colors",
		 12,
		 "I Am Graduating from Bread Crusts",
		 "Yoko goes to school, as Odagiri Futaba greets her with &quot;Yoko-san&quot; (and wears a green katyusha), which Yoko feels very weird. Teru lazily greets them as well (and she doesn't wear any spectacles), and Futaba calls her &quot;Teru-san&quot; (too polite of a namecall), as Yoko feels weird and weirder. Yoko thought that it was all an act, as Futaba points out that Yoko is acting weird."
		)
;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("Three Leaves, Three Colors", 0, 1, 4)
	,	("Three Leaves, Three Colors", 0, 2, 4)
	,	("Three Leaves, Three Colors", 0, 3, 4)
;
-- Anime Data
INSERT INTO ANIME(ANIME_TITLE, NUMBER_OF_EPISODES, ANIME_SYNOPSIS, ANIME_DESCRIPTION, COMPANY_NAME, COPYRIGHT) VALUES
		("Vividred Operation",
		 12,
		 "On an artificial island, Akane Isshiki, an innocent 14-year-old girl, lives a simple but happy life with her level-headed little sister Momo and their genius inventor grandfather. On clear days just over the water, everyone on the island can see the revolutionary invention that solved all the world's energy problems, the Manifestation Engine. Thanks to the Manifestation Engine, the peaceful days that everyone had dreamed of had arrived. But suddenly, a mysterious enemy called the &quot;Alone&quot; appear out of nowhere aiming to attack the Manifestation Engine, jeopardising their quiet way of life. Equipped with incredibly powerful Palette Suits designed by her grandfather, Akane and her friends must rise up together in this desperate situation. Their friendship is the only hope to save the world.",
		 "On an artificial island, Akane Isshiki, an innocent 14-year-old girl, lives a simple but happy life with her level-headed little sister Momo and their genius inventor grandfather.",
		 "Madman",
		 "&copy vividred project, MBS"
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("Vividred Operation",
		 0,
		 1,
		 "M - Animated nudity and sexualised imagery",
		 12,
		 "https://www.animelab.com/shows/vividred-operation"
		)
	,	("Vividred Operation",
		 3,
		 1,
		 "M - Animated nudity and sexualised imagery",
		 12,
		 "https://www.madman.com.au/catalogue/view/20950"
		)
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("Vividred Operation",
		 1,
		 "The First Operation",
		 "In the near-future, the world's energy problems have been solved thanks to a scientific invention known as the Manifestation Engine which creates energy from the sky. On the island of Izu Oshima, Akane Isshiki is living a simple life with her sister, Momo, and her grandfather and creator of the engine, Kenjirou. As Akane eagerly awaits the arrival of her classmate, Aoi Futaba, who is traveling to the nearby Blue Island for treatment, she and Momo hear an explosion coming from their home and discover that Kenjirou has somehow switched bodies with a stuffed otter doll as the result of an experiment. Undeterred by his new form, Kenjirou gives Akane his latest invention, a strange key known as an Operation Key. She is informed that this is the key to accessing the Vivid System, which is the only thing that can fight against an alien race known as the Alone. Meanwhile, an Alone (Four Legged) is seen attacking Blue Island, where the Manifestation Engine is stored. As Aoi's transport craft is hit and crash lands on a ledge, Akane and Kenjirou rush to their location, but Akane is soon struck by her fear of heights that she gained due to a traumatic incident that occurred seven years ago. When Aoi starts to fall towards the sea, Akane overcomes her fear and dives after her. Her key soon glows and she is able to activate the Vivid System, granting her a suit called the Pallet Suit which prevents her and Aoi from falling. Kenjirou explains that this system is for Akane and Aoi to fight against the Alone."
		)
	,	("Vividred Operation",
		 2,
		 "Moment of Resonance",
		 "As Kenjirou instructs Akane and Aoi to undergo 'docking', Aoi receives her own Operation Key, allowing her to also transform using the Vivid System. Receiving weapons to go along with their new abilities, Akane and Aoi begin fighting against the Alone whilst protecting the innocent. Meanwhile, Kenjirou contacts the head of the Manifestation Engine's management bureau, Yuuri Shijō, in order to gain military support in assisting the girls in fighting the Alone. After knocking out the Alone's core and temporarily stopping its movement, Akane and Aoi attempt the Docking Operation, but it fails due to Aoi subconsciously rejecting the fusion in fear of having Akane read her memory. As Aoi worries about this, she thinks back to when she first became friends with Akane, who gave her a tomato on their first meeting. Meanwhile, a mysterious girl fires a glowing arrow into the Alone, bringing it back to life and changing it into a more powerful form. As the girls find their attacks ineffective against the Alone's new form, Aoi confesses to Akane that she actually hates tomatoes, which she didn't want her to learn through the docking. Akane tells her that she already knew about that, but admired her perseverance to eat them regardless and assures her they are best friends. Reconfirming their friendship, Akane and Aoi perform the Docking Operation, fusing together to become Vivid Blue and combining their strengths to destroy the Alone. The next day, as Akane, Aoi and Momo discover their school has been obliterated as a result of the battle, Mizuha Amagi, an officer for the National Defense Force, informs them they will be transferred to a new school."
		)
	,	("Vividred Operation",
		 3,
		 "True Strength",
		 "Akane, Aoi and Momo begin their first day at New Oshima Academy. En route to school, Akane's bike breaks down, forcing her to use the Vivid System in an effort to arrive on time. She ends up meeting kendo club member Wakaba Saegusa, who becomes shocked when Akane counters her sudden attack. After Akane and Aoi officially transfer into Wakaba's class, Wakaba chases after Akane demanding a rematch until she ends up bumping into Momo, deciding to take her to the nurse's office. As Wakaba and Momo get acquainted, Akane overhears how Wakaba wanted a rematch to prove she's the strongest. After her father tells her to consider what 'true strength' is, Wakaba formally challenges Akane to a serious kendo match, which reminds Wakaba of how fun kendo used to be for her. Just then, their match is interrupted by the appearance of a serpent-like Alone (Dragon). As Wakaba comes to realise what true strength is from watching Akane and Aoi fight, she asks to fight alongside them, allowing her to acquire her own Operation Key. As the mysterious girl powers up the Alone again, Akane and Wakaba dock to become Vivid Green and defeat the Alone."
		)
	,	("Vividred Operation",
		 4,
		 "Promise",
		 "Akane, Aoi and Wakaba's latest fight against an Alone (Hermit Crab) is observed by Himawari Shinomiya, a girl who spends her days confined to her room and participates in classes through a camera. Following the battle, Wakaba starts training Akane and Aoi so they can safely dock in battle. As the girls attend gym class, Himawari spots Kenjirou through her robot's camera as he investigates who's been hacking access to files on the Alone, before it is smashed by a wayward baseball hit by Akane. The girls go to Himawari's apartment to apologize, where Himawari asks to inspect Kenjirou, which Akane passes off as a stuffed toy named Uso. Noticing Himawari's interest for factories, the girls dress her up and take her to see one of them. Just then, the factory they are visiting is attacked by the Alone from the previous day, which had undergone an evolution. As the girls transform to defeat it, Himawari heads to the plant to shut it down, but soon gets caught up in a cave-in. Recalling how she was betrayed by her previous friend, which led to her to become a shut-in, Himawari is rescued by Akane, who kept her promise to come back for her. Touched by this, Himawari gains an Operation Key, joining the girls in their fight. After the mysterious girl powers up the Alone again, Akane docks with Himawari to become Vivid Yellow and defeats the Alone. Following the battle, Himawari decides to start attending classes before asking Kenjirou for his autograph."
		)
	,	("Vividred Operation",
		 5,
		 "Another Key",
		 "Akane tries to get to know her quiet classmate, Rei Kuroki, unaware that she is the one assisting the Alone. As Akane decides to follow Rei after school, she sees her save a child from a falling piece of construction. As Rei returns home, she is visited by a crow, who punishes her for saving the child via a mark on her neck, reminding her of her mission. That night, Rei goes on a mission to destroy the Manifestation Engine by herself, but is forced to abort when she is discovered by patrol robots. The next morning, Akane finds her washed up on the shore and takes her back to her place to help her recover. As Rei panics when she realises she has dropped a key precious to her, Akane is called into action as an Alone (Box) appears. Meanwhile Rei, who was promised by the crow that she would able to restore the world she came from and bring back her parents if she assisted the Alone, prepares to fire another arrow, but falls unconscious before she can do so. Returned to Akane's place again, Rei feels relieved when she is reunited with her key, which Akane and her friends helped search for, although she declines Akane's offer of being friends. Afterwards, Akane goes to the hospital to visit her mother, Mashiro, who assures her that Rei will open up to her someday."
		)
	,	("Vividred Operation",
		 6,
		 "The Story of How Kenjirou Tries to Intensify the Friendship Power of Akane and Friends Which Results in Something Unbelievable",
		 "Whilst Akane's class goes on a summer school field trip to Shikine Island, they are requested by Mizuha to turn in their Operation Keys for the duration of the trip. Unbeknownst to the girls, this is part of an experiment by Kenjirou to increase their 'friendship power'. To this end, he 'kidnaps' Rei and puts on a phony Alone alert, leading the girls towards an obstacle course of his design, filled with all sorts of traps. Not considered in his plan, however, was Rei escaping from her custody and assisting the girls in a not-so-subtle disguise. Not wanting to be deterred, Kenjirou brings out a large mech to confront the girls, but it is defeated thanks to the combined efforts of Akane and Rei. Afterwards, Momo gets Kenjirou to apologize for his deceit whilst the others thank Rei for her help."
		)
	,	("Vividred Operation",
		 7,
		 "Unrelenting Wish",
		 "After defeating an Alone (Lantern), Akane continues to struggle with her studies due to a lack of sleep. Mizuha tells her that she must do well on her next test or risk losing her part-time job. Upon deciding to help her out with a study session, Aoi, Wakaba and Himawari try to get Rei to join them, but she keeps refusing. Later that night, after receiving another harsh reminder of her objective from the crow, Rei learns about Akane's link with the Manifestation Engine's inventor. Learning this, Rei decides to accompany the others on their study session with Akane. Whilst investigating her home to find something of use, Rei comes across the fridge where Kenjirou's body is being preserved, though the gang are quick to cover this up. As Rei learns to grow accustomed to the others, she takes her leave when she is reminded of a certain wish. Just then, an electro-magnetic Alone (Pincushion) appears over Tokyo, shorting out every electrical device it passes by. Akane manages to destroy most of it with Vivid Yellow, but a fragment is hit by one of Rei's arrows, causing it to change form drastically (transforming into Cocoon) and launch an attack at Akane, shorting out her Pallet Suit's power and sending her plummeting towards the sea."
		)
	,	("Vividred Operation",
		 8,
		 "More Vivid Than Today",
		 "Akane is taken into intensive care whilst the Alone that attacked her wraps itself onto the Tokyo Skytree. Despite their wishes to stay by Akane's side, Aoi and the others are sent home to rest up. Discovering Akane's Naked Rang which hadn't disappeared when she lost her transformation, Aoi believes that Akane is still fighting. Whilst discussing how to fight against the Alone, they find their options limited since the girls are unable to dock without Akane, forcing the military to consider more drastic means. Later, Aoi runs into Rei, who tells her how forgiving Akane is to others. Strengthening their resolve to help Akane as much as they can, Aoi and the others decide to fight against the Alone, taking Akane's Naked Rang with them. Their plan to stop it before hatches is thwarted after Rei once again powers it up. As the Alone prepares to fire at Wakaba and Himawari, Akane's Naked Rang suddenly activates, giving Aoi a boost and allowing her to defeat the Alone. Akane soon makes a quick recovery from her injuries, much to the relief of Aoi and her friends."
		)
	,	("Vividred Operation",
		 9,
		 "Sunny with some Fluffiness",
		 "Wakaba decides to take Himawari shopping with her, putting her in a cute dress that starts attracting a lot of attention. When they are approached by a photographer wanting to photograph Himawari for a fashion magazine, Wakaba pushes her to give it a try, despite her lack of interest. When the photos get some good feedback, with the editors wanting her to go pro, Himawari gets upset at Wakaba when she books a shoot for a day when she promised to take her to see a factory. Himawari decides to attend the photo shoot on the condition that Wakaba be her servant for the day. However, she becomes panicked when she learns that the photographers changed her hairpins that Wakaba gave her whilst she was sleeping and starts searching the ocean for them. Thankfully, Wakaba had kept them safe for her and manages to return them to her. Just then, they are called in to fight an Alone (Seahorse) planning to charge into the Manifestation Engine from outside the Earth's atmosphere. Working together, Wakaba and Himawari manage to hold off the Alone's attacks long enough for Akane and Aoi to defeat it with Vivid Blue. After the battle, Himawari makes plans to have Wakaba hang out with her for a whole day whilst Rei, who was unable to power up the Alone in time, becomes more desperate."
		)
	,	("Vividred Operation",
		 10,
		 "Light and Shadow",
		 "Rei decides to gamble on acting after the arrival of the next Alone. Meanwhile, owing to Himawari's analysis skills, Kenjirou figures out the source of the Alone's power-ups. The next morning, Rei goes to Akane's place to apologize for her behavior the other day and is invited to have dinner with her and Momo. Meanwhile, Kenjirou tells Yuuri about how the Alone are linked to the accident that occurred seven years ago. Rei enjoys the evening as she has dinner, takes a bath and spends the night, and hears from Akane as to why she wanted to become her friend, making a promise that they'll stay friends. The next day, after Rei goes off on her own and Akane and the others are informed of a strategy to pinpoint the source of the arrows, another Alone (Bacteriophage) appears, which Rei powers up with another arrow. Before she can fire anymore however, she is located by security droids and is forced to retreat, allowing Akane and Wakaba destroy the Alone. As Rei becomes cornered, she is discovered by Akane, both becoming shocked upon learning each other's identities. Jumping to the conclusion that Akane knew her identity from the start, Rei feels betrayed by Akane, believing her wishes of friendship to be a lie, before she is captured by the military."
		)
	,	("Vividred Operation",
		 11,
		 "Feelings I Want to Convey",
		 "Rei is put under high security and Akane and the others are forbidden to talk with her, while Kenjirou deduces that she is from another world. Wanting to see Rei again and learn the true story, Aoi and the others decide to break into the facility where Rei is being held. Reaching the holding cell, Akane conveys her feelings to Rei, pushing through with her desire to get to know her better. As Rei eventually accepts Akane's feelings, the crow appears before them, revealing herself to represent the Alone. Rei reveals her world was destroyed by Manifestation energy, being told by the crow that she could bring it back if she destroyed the Manifestation Engine. The crow mentions that Rei served as a beacon to the Alone, who would've stopped coming if she was killed, but Kenjirou had protested about that, opting instead to simply keep her from being detected and avoiding a pitfall set up during the test of the Alone. However, the Alone decide no world should wield Manifestation Energy but themselves. Attacking the others, the crow reveals the Alone had no intention of reviving Rei's world before devouring her, absorbing her remaining arrows to evolve into her most powerful form, the most powerful Alone (Fallen Angel)."
		)
	,	("Vividred Operation",
		 12,
		 "Vividred Operation",
		 "While the crow begins rampaging with her new-found power, Kenjirou deduces that Rei is still alive within the center of the Alone she has become. With the crow taking off to head towards the Manifestation Engine, Akane finds Rei's key, which she believes may hold the key to their victory. The crow arrives at Blue Island and starts draining energy from the Manifestation Engine, causing blackouts all over the world. Akane and the others soon arrive at the scene, with each girl giving their remaining suit power to help Akane break into the crow. Akane manages to reach Rei and together they dock to become Vivid Red, allowing them to overcome the crow's power and destroy her. After the battle, the mysterious being Kenjirou saw seven years ago appears, revealing Rei's world has been restored. Promising that they'll see each other again, Rei leaves Akane her scarf before heading back to her home. Some time after life returns to normal, Akane once again sees Rei."
		)
;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("Vividred Operation", 0, 1, 4)
	,	("Vividred Operation", 0, 2, 4)
	,	("Vividred Operation", 0, 3, 4)
	,	("Vividred Operation", 3, 1, 2)
;-- Anime Data
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
		("Muv-Luv Alternative Total Eclipse",
		 24,
		 "Having fought with a hostile alien race known as BETA since 1967 humanity is at their last line of defence known as a Tactical Surface Fighter. For two pilots – Yui Takamura of the Imperial Royal Guards of Japan and Yuuya Bridges of the US Army – are about to be apart of Project Prominence, a last ditch effort to overcome these vicious creatures.",
		 "Having fought with a hostile alien race known as BETA since 1967 humanity is at their last line of defence known as a Tactical Surface Fighter.",
		 "hanabee",
		 ""
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("Muv-Luv Alternative Total Eclipse",
		 4,
		 1,
		 "MA15+ - Strong animated violence and nudity",
		 24,
		 "https://hanabee.com.au/products/boxset-muv-luv-total-eclipse-blu-ray"
		)
	,	("Muv-Luv Alternative Total Eclipse",
		 3,
		 1,
		 "MA15+ - Strong animated violence and nudity",
		 24,
		 "https://hanabee.com.au/products/boxset-muv-luv-total-eclipse"
		)
		
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("Muv-Luv Alternative Total Eclipse",
		 1,
		 "The Imperial Capital Burns - Part One",
		 "In 1967, humanity discovers a hostile alien race called the BETA on the Moon. Despite their attempts to stop them, the BETA makes landfall on Earth in 1973, which leads to a long, grueling 30-year war where the BETA conquers half the Eurasian continent while humanity can only stall them. In 1998, Yui Takamura is a student of the Kyoto Royal Guard Academy where she studies to become an Imperial Guard TSF pilot along with her friends Aki Iwami, Izumi Noto, Shimako Kai and her rival turn friend Kazusa Yamashiro. As the Asian front lines turn dire, Yui's uncle Eiji Iwaya meets with Yuuhi Koubuin of the Shogunate family over a new weapon that might help turn the tide against the BETA. As Yui and her friends improve themselves in TSF combat training, the Korea peninsula is overrun by the BETA. As the Korean front falls and the BETA invades the Japanese isles, Yui and her fellow cadets are ordered to assist the Japanese army in defending the capital of Kyoto. "
		)
	,	("Muv-Luv Alternative Total Eclipse",
		 2,
		 "The Imperial Capital Burns - Part Two",
		 "Despite help by the US Navy, the Japanese forces cannot stop the BETAs due to their numbers, forcing the military to perform scorched earth tactics on Kyoto to destroy them. When their supply base has been overrun by the BETA, Yui's unit are ordered to retreat but her teammates are killed one by one including her friends; Aki is smashed by a Destroyer-Class BETA, Shinmako is shot down by a Laser-Class BETA, Izumi and Kazusa TSFs crash where they are eaten by Soldier-Class BETAs. As Yui is about to suffer the same fate as Kazusa and Izumi, she is rescued by a Takemikazuchi TSF who easily kills the BETAs before she falls unconscious. Yui later awakes, upon learning Kyoto fell and many lives were lost, she mourns for her friends. Three years later, Yui, now a Lieutenant in the Japanese Imperial Guard, heads to Alaska. "
		)
	,	("Muv-Luv Alternative Total Eclipse",
		 3,
		 "Verdant Yukon",
		 "US test pilot Yuuya Bridges and his engineer friend Vincent Lowell transfers to Yukon, Alaska to be part of the United Nation's international test corp Project PROMINENCE, which aims to test and experiment new TSF technology. Yuuya and Vincent join the Argos Test Flight, which aims to develop a new TSF for Japan. After getting to know the members of Argos Flight, the Turkish commander Ibrahim Doğulu, test pilots Nepali Tarisa Manandal, Italian Valerio Giacosa and Sweden's Stella Bremer and Development Chief Yui, Tarisa refuses to accept Yuuya as the new leader of Argos Flight due to the fact he has never fought in the front lines unlike the rest of them. To settle things, Yuuya proposes a two on two TSF duel between him and Stella against Tarisa and Valerio. To make things fair, he allows Tarisa to pilot the advance F-15･ACTV TSF while the rest pilot the F-15E TSF. Yuuya uses his tactical genius and teamwork with Stella to defeat Valerio and Tarisa which the latter finally accepts him. Later, Yuuya encounters Yui and is angered when she didn't find his duel impressive but disappointing. "
		)
	,	("Muv-Luv Alternative Total Eclipse",
		 4,
		 "A Flock of Hazy Moon",
		 "Tensions grow between Yuuya and Yui over their countries different combat doctrine and Yui commenting over his Japanese heritage which Yuuya doesn't like as he hates Japanese people due to racism he suffered as a child. Ordered to fly a Japanese Zuikaku TSF with the rest of Argos Flight in a virtual simulation battle against the BETA, Yuuya is unable to get used to the Zuikaku's controls and is unable to keep up with his seasoned teammates in fighting. After another heated argument with Yui, Yuuya meets Inia Sestina, a Soviet Russian pilot from the Idar Test Flight and one of the &quot;Scarlet Twins&quot;. Inia befriends Yuuya and invites him to see her teddy bear Misha at the Soviet sector of the base. However, this gets Yuuya into trouble when Inia's co-pilot, Cryska Barchenowa has Yuuya apprehended, believing he is a Japanese spy. As he is about to be tortured by Soviet interrogators, Yuuya is ordered to be released thanks to Yui's intervention. Inia stills wants to be friends with Yuuya despite Cryska telling her to stay away from him. The next day, Yuuya begins piloting the Type-94 Shiranui TSF. "
		)
	,	("Muv-Luv Alternative Total Eclipse",
		 5,
		 "The Right Stuff",
		 "Still disappointed by Yuuya's performance on piloting Japanese TSFs, Yui gives some advice to him that he shouldn't force the TSF to do things his way but understand it like the proverb &quot;A man and his horse are one&quot;. Vincent suggest he should listen to it since he and Yui are not so different; both having a cold attitude but a kind side which they are too stubborn to show. As Argos Flight heads towards their next destination, they suddenly encounter Yui piloting a Takemikazuchi TSF and duels against them. After defeating everyone by melee combat, Yui fights against Yuuya. Finally understanding what Yui told him, Yuuya manages to better pilot the Shiranui to disarm Yui. As his teammates congratulate him, Yui is proud of Yuuya's results. "
		)
	,	("Muv-Luv Alternative Total Eclipse",
		 6,
		 "Ultramarine",
		 "The Argos Flight and Idar Flight crews head to the West Indies to gather test flight data in tropical regions while having R & R at the resorts and participating in a PR photo shoot to raise morale. At first the vacation goes fine until Inia and Tarisa almost start a fight until the resort's commander suggest they settle things in a paddleboat race tomorrow. Yui and Cryska team up when Cryska suddenly faints. Yuuya swims over to help them but a storm suddenly comes, which the three are forced to seek refuge in a cave on a nearby island. As Yuuya heads to check their boat, Cryska, wondering why Inia is interested with Yuuya, asks Yui what is her relationship with him, much to the latter's shock."
		)
	,	("Muv-Luv Alternative Total Eclipse",
		 7,
		 "Wanderer's Whereabouts",
		 "Yui is unable to answer Cryska why her partner Inia likes being with Yuuya and suggests she should ask him himself. Yuuya returns to the ladies, informing them that their boat was swept away by the storm. As Yuuya and Cryska heads out to figure out where they are, Cryska faints and is about to fall before Yuuya catches her. Cryska reveals she has a fear being near the ocean hence her recent fainting spells. However, Yui arrives mistakenly thinking Yuuya and Cryska are hugging, which makes her jealous. As all three of them are back in the cave, Cryska asks why Yuuya doesn't like being called a Japanese. Yuuya tells Cryska with Yui listening that it is due to his Japanese father; his father left his American mother before he was born and never came back which angered his maternal grandfather to believe the Japanese are scum that shouldn't be trusted. Rescue finally arrives for the three when Inia, Tarisa, Valerio and Stella find them in their TSFs. For troubling everyone, the resort's commander has Yui, Cryska and Inia participate in a swimsuit photo-shoot for the troops while the Argos crew bothers Yuuya if anything happen between him and Yui."
		)
	,	("Muv-Luv Alternative Total Eclipse",
		 8,
		 "Far East Battle Lines",
		 "Project PROMINENCE heads to the Kamchatka front lines to gather test flight data in cold regions and their first live battle data with the BETA along with Yui being pressured by both the UN and Japanese government to test her uncle's new weapon, the EML-99X rapid-fire railgun. The Argos crew notices Yuuya and Yui are now more friendlier with each other and support it. Yui shows Yuuya the railgun and tells him to abandon it and escape to safety should something bad happens during the test and destroy it to prevent other nations from copying it but he assures her that both he and railgun will come back. As he heads back to his quarters, he discovers Cryska and Inia being ganged up by a group of young Soviet pilots. The pilots express their hatred for Russians like Cryska and Inia due to the fact when the Soviet Union fell to the BETA, the Russians were the first to get refuge in Alaska while they, the Georgians and Kazakhs, were left behind and were forced to fight the BETA themselves. Cryska is unable to defend Inia due to a serious headache. When one of the pilots attempts to rape Inia, Yuuya attacks him. The pilots are about to surround Yuuya when their commanding officer orders them to stand down and leave. The next day, Ibrahim briefs the Argos, Idar and Bao-Feng Flight crews on where they will be doing their tests during an upcoming BETA invasion and introduces the woman who's battalion will be protecting them, Lieutenant Colonel Fikatsia Latrova of the Zhar Battalion, the officer who saved Yuuya, Cryska and Inia."
		)
	,	("Muv-Luv Alternative Total Eclipse",
		 9,
		 "Falling Tears",
		 "Latrova tells the UN Flight crews to do their tests while her battalion protects them and not to interfere with her job. Cryska, now better but seemingly having no memory of the events of yesterday, tortures one of the Zhar Battalion pilots who attacked them and warns them to stay away from her and Inia or she will kill them. On the day of the test, Yuuya is nervous since this will be his first real battle, no making things better with the Zhar pilots mocking him but the rest of Argos crew ensures they will protect while he tests the railgun. As the BETA invades the coast, Yui realize something is wrong when she notices there is not enough ground forces protecting the Flight crews. Yui asks her Soviet counterpart to call for reinforcements, unaware that reinforcements won't come as the Soviet higher ups wants the railgun test to fail even at the cost of Latrova's battalion. Realizing they will be overrun soon, Yuuya convinces Latrova to order everyone to fall back so he has the clear to fire the railgun, which she does after realizing what her superior's plan in sacrificing her pilots. With everyone falling back, Yuuya fires the railgun which destroys all of the invading BETA forces. As everyone celebrates, Yui tells Yuuya that she's glad he's safe and tells him to return to base."
		)
	,	("Muv-Luv Alternative Total Eclipse",
		 10,
		 "Premonition",
		 "Yuuya is given a heroes welcome at the Kamchatka base but the Zhar pilots don't see him as one when they were the ones doing the fighting. Realizing they are right, Yuuya asks Yui for a TSF melee combat in the next TSF test. As he's put on standby, Yuuya encounters Latrova, who thanks him for saving their lives and gives him some advice before her second in command, Natasha Ivanova, fetches her. With the railgun being in repairs and his TSF still under maintenance, Yui decides she will take over Yuuya in the next live battle test. However, the President of the company contracted to build Japan's newest TSF insist Yuuya being in the next test. Latrova briefs her pilots, who she considers like her children as she hopes to find her son before her superiors give the Zhar Battalion their next mission. As the UN Flight crews and Zhar Battalion does another sortie against the BETA, which they find it strange they are fighting the remnants of the last attack. Much to everyone's shock, the BETA have another force coming underground which arrives near the Kamchatka base."
		)
	,	("Muv-Luv Alternative Total Eclipse",
		 11,
		 "BETA Offensive",
		 "As the BETA travel to the base, the Soviet commander tells all but the Soviet TSFs to retreat to an area further than usual, with the intention of using the Soviet forces to buy time. With respect to this, the commander issues that all personnel in the base evacuate, leaving everything behind. Lt. Dahl and Yui confirm their suspicions that the evacuation is all but a ploy for the Soviet to get their hands on the Type 99. Yui evades Soviet troops and plans to blow up the Type 99. The Soviets altered the self-destruct code, rendering it incapable of being blown up. Suddenly, some BETA have already reached the base."
		)
	,	("Muv-Luv Alternative Total Eclipse",
		 12,
		 "The End of the Fight to the Death",
		 "Yui is trapped in the abandoned supply base, and she plans to lure the BETA to the cannon's core module, taking her with it. Meanwhile the Soviet command, actively jamming all radio communications from the UN command, is joyous at the prospect of obtaining the type 99. The BETA infiltrates the hangar and nearly kill Yui when Yuuya and Stella arrive timely and saves her. Yui continues her plan to blow up the Type 99. Simultaneously, the main BETA force arrive and are heading toward them. "
		)
	,	("Muv-Luv Alternative Total Eclipse",
		 13,
		 "The Value of Choice",
		 "Yuuya uses the Type 94 to destroy the Type 99. Disobeying Yui's request, he destroys all but its core module, which will make reconstructing it again easier. The Soviet command, aware that they are trying to salvage the cannon, orders the base to be completely blown up by bombers. In their escape, the Type 94's arm, carrying the module, was bitten off. Yuuya, carrying Yui inside his TSF, can't fight for the reason that Yui will hurt herself as she is not wearing a fortified suit. Yuuya transfers Yui to Stella's TSF due to his fear that the TSF has already sustained heavy damage. Yuuya and Stella use the base's runway for takeoff. However only Stella was able to takeoff as Yuuya's TSF is already too damage. Yuuya decides to stay and fight till his last."
		)
	,	("Muv-Luv Alternative Total Eclipse",
		 14,
		 "A Pilot's Honour",
		 "Yuuya's TSF is already critically damaged and is no longer able to fly. Before he is finished off, the Zhar Battalion arrives timely and save him. The bombers arrive and start blowing up the base, but the unexpected arrival of laser-class BETAs wipe them out. With Yuuya's TSF unable to fly, Lt. Latrova orders her battalion to escort him to safety, while the rest will attempt to flank the laser-class BETAs. An unknown and very powerful TSF is detected approaching them from the rear, and Latrova stays back to confront it. The mysterious TSF intercepts and kills her. In Alaska, the UN force mourns Yuuya's death, with Yui mourning the most. In a miracle, Yuuya's TSF appears in the horizon, walking in its damaged state. Fast forward, and the XFJ project unveils its newest creation, the XFJ-01a, Shiranui Second. Vincent tells Yuuya that the whole Zhar battalion was annihilated, but not after defeating the laser-class and the remaining BETA. They were named The Heroes of the Russian Federation."
		)
	,	("Muv-Luv Alternative Total Eclipse",
		 15,
		 "Hot-on-heels Cross",
		 "In order to promote solidarity between nations, a military exercise called the Blue Flag was held, much to Yuuya and Yui's disgust. Meanwhile a party is held to celebrate the return of the Argos test flight. Yui cooks up a homemade meal for Yuuya, making him remember on how his mother used to make it. Out of the blue, Cui Yifei of the United Chinese Front appears and compliments Yuuya for his humility while also expressing her romantic interest. The next day, Cryska finds Yuuya in hopes that he knows where Inia is. She smiles (for the first time in the series) and tells him Inia likes him. They spend all night searching for Inia to no avail. That night, Yuuya sees his old flight mate and partner, Leo Kuze, who express his desire to best him."
		)
	,	("Muv-Luv Alternative Total Eclipse",
		 16,
		 "Pale Blue Flame",
		 "After meeting with Yuuya again, Leo expresses intent on ending Project XFJ by beating it with supposedly superior American technology. Leo and his girlfriend Sharon Heim visit a bar where they meet Vincent once more. Vincent tells him that Yuuya has changed for the better, but Leo blocks him off saying that he has not forgotten what Yuuya did to him years back. In the morning of Blue Flag exercises, Idar Flight is pitted against Slechtvalk Flight. In what appears to be unbelievable, the Scarlet twins destroy the whole flight within ten minutes, a colossal feat. In the afternoon, Argos test flight is pitted against Bao Feng test flight, where the former is outmatched by the teamwork of the latter. Knowing that Cui wants him to fight her one-on-one, Yuuya subjects to it. Initially being outmatched by the Chinese TSF's brute force, Yuuya uses the Type 94 2's more agile movements to turn the tide and win the match. In another scene, the twins are shown to be submerged inside a tank due to their slightly unsatisfactory performance. "
		)
	,	("Muv-Luv Alternative Total Eclipse",
		 17,
		 "Dark Recollection",
		 "While submerged in the tank, Cryska reminisces on her lonely childhood, how she met Inia, and their first meeting with Lt. Jerry Sandek. The Blue Flag exercises are in full swing, and the USA's Infinity flight demonstrates its Raptor with its advanced stealth technology against Bao Feng flight, and the latter is easily defeated within 4 minutes. After the fight, Yuuya meets the Scarlet Twins where he finds out that both twins share similar feelings for Yuuya, and Cryska wants to find out why. Yuuya tells him it might be because they share the same stubborn and perfectionist personality and she agrees. Their talk is disturbed by Cui while Yui sees everything and runs away with jealousy. Later that night Yuuya finds Yui in a bar and he asks her for Japanese sword-fighting lessons. Leo interrupts them and threatens Yuuya to tell him about his military history, which the latter punches him for. A bar fight ensues and the MP arrive, forcing them to escape. "
		)
	,	("Muv-Luv Alternative Total Eclipse",
		 18,
		 "The Sound of Twisted Wings",
		 "In 2000, Yuuya and his team are testing the F-22 Raptor. Yuuya strives to push the Raptor to the limit, which gets their Squad leader killed by accident. This is revealed to be the reason Leo bears a grudge on Yuuya. Yuuya reveals this to Inia, and she tells him that no one should blame anyone in an accident. That night Vincent, who won the bet of Argos winning their first fight, treats everyone for drinks. Yuuya chats with Natalie, the bartender, about his friends. While going to the bar, Yui meets Cui and the latter tells her to forget about Yuuya as she will never understand him. Cryska and Inia meet with Sandek who reveals that he has plans for Yuuya. "
		)
	,	("Muv-Luv Alternative Total Eclipse",
		 19,
		 "Deep Green",
		 "To quell the increasing rivalries between the nations competing in Blue Flag, the high ranking officers involved in the Prominence project decide to send the test pilots on a wilderness backpacking trip. While walking towards their objective, Argos, Idar, Bao Feng, and Infinity converge on a hot spring. They have dinner together and enjoy the spring. While relaxing, VG and Vincent get beaten up by Lt. Blazer, Inia and Cryska meet Yuuya on the hot pool naked, and Cui continues her rivalry with Yui. "
		)
	,	("Muv-Luv Alternative Total Eclipse",
		 20,
		 "The World Bares its Fangs",
		 "Cui offers Argos flight to a practice fight to prepare for their upcoming fight with Infinity in exchange for a date with Yuuya. Mysterious men posing as contractors arrive at the base, disguising as the military. Upon infiltrating, they kill a huge number of military personnel and wrest control of several TSFs. In addition, they capture all the top officials and cut off all communications, prompting Yuuya to return to the base. Yui barely survives the attach and meet Cryska. The mysterious men announce themselves as the Refugee Liberation Front. Natalie, revealing herself as one of the RLF, confront Yuuya, Cui, and Tarissa and announce their plans on changing the world. As she was about to mention something about the US's secret research, she is killed by one of her own for revealing too much. Yuuya creates a diversion and the trio escape. "
		)
	,	("Muv-Luv Alternative Total Eclipse",
		 21,
		 "The Future Tears Open",
		 "The RLF take control of an underground research facility that is trying to breed BETAs. Argos test flight, Cryska, and Cui, being uncaptured, attempts to retake the base using the remaining TSF. Meanwhile, the RLF have achieved full control of the base. Sandek escapes and they pilot to the Soviet base for resupply. Lt. Dahl, who stayed at the commander center to send a distress call, meets some RLF members who plead him to fight their cost. Idar Test Flight is destroyed by the RFL TSF, and only Inia escapes thanks to Infinity test flight. The remaining TSF rushes to regroup in an area, but are intercepted by RLF TSFs, led by Ozlem Saner. "
		)
	,	("Muv-Luv Alternative Total Eclipse",
		 22,
		 "Untainted Revenge",
		 "Badly outnumbered, Yuuya volunteers to fight all 24 TSFs himself to buy time for the rest of Argos to escape. While he destroys many of them, he is soon surrounded; he is however saved by the timely intervention of Inia. The rest of them return, citing that they saw and followed Inia. With the tables turned, Ozlem executes a suicide attack. Mariem, one of the RLF, confronts Dahl and pleads that he join them; when she receives news of her sister's death, she tries to kill Dahl but fails. The RLF announces to the world and announces their demands. In addition, they announce to the whole world of the US secret BETA research facility (where they released all the BETA) and the Red shift, a last ditch plan that incorporates Hydrogen bombs buried beneath Alaska to create a new defense line in case of a BETA invasion. However this will mean the mass extermination of all Soviet citizens leaving near the area. Yuuya plans to steal weapons from a Soviet patrol base, citing guerrilla reasons. Major Christopher, the head of the RLF invasion, initiates his own plan. "
		)
	,	("Muv-Luv Alternative Total Eclipse",
		 23,
		 "The Victory Song of the Dead",
		 "The remaining pilots refuel and restock at the patrol station. They will attempt to get communications back online to give the US and USSR a visual of the BETA invasion. Returning to the base, they are confronted by the RLF led by Christopher and a chase ensues, with the team attempting to stop the BETA. Major Christopher reveals himself to be an Allegiant, a group of people who worship the BETA as gods, and refuses to help in the BETA attack. Seeing that they were used, the remaining RLF commit suicide to maintain their dignity. Leo and Sharon join the fight. In a desperate effort, Sandek gives the order for the Scarlet twins to activate Prafka, a state of mind that greatly heightens their piloting skills. The twins wake up in a shared unconscious, and Cryska wonders what happened to their bodies. "
		)
	,	("Muv-Luv Alternative Total Eclipse",
		 24,
		 "White Darkness",
		 "As the twins activate their Prafka, Christopher activates an unknown device in an attempt to gain control of them. Instead of gaining control, it drives the twins berserk and they crush Christopher. Under some heavy hypnosis, the twins go on a rampage and mistakes everyone as the enemy. It dismantles Tarisa's TSF, and nearly defeats Yui. Sandek informs Yuuya that for some reason he is the only one that can stop them, lest the twins will destroy everything in sight. Seeking to give the twins what everyone around him has given him, he drops his weapon and allow the twins to impale him. The impaling shocks the twins back to reality. The blade misses Yuuya by mere centimeters and he is shown unscathed. Lt. Dahl with some Soviet special forces retake command of the HQ. The master, the mysterious leader of the RLF, acknowledges the plan's failure and sets his eyes on Japan. With the invasion repelled, the rest of the world is calling for an investigation of the Red Shift. Yui is sent back to Japan, with the possibility of the XFJ Project cancelled. Yui tells Dahl she will return to Yukon. Infinity test leaves for the US. Yuuya sees Yui, and they give their final salutes to each other. As Yui leaves, Cryska finds her and tells her of her romantic feelings toward Yuuya, which Yui replies that they will be rivals in love. "
		)
;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("Muv-Luv Alternative Total Eclipse", 0, 1, 8)
	,	("Muv-Luv Alternative Total Eclipse", 0, 2, 8)
	,	("Muv-Luv Alternative Total Eclipse", 0, 3, 8)
;
-- Anime Data
INSERT INTO ANIME(ANIME_TITLE, NUMBER_OF_EPISODES, ANIME_SYNOPSIS, ANIME_DESCRIPTION, COMPANY_NAME, COPYRIGHT) VALUES
		("Is it wrong to try to pick up girls in a dungeon",
		 13,
		 "It's a tale of adventure in the depths of darkness! Bell Cranel is an adventurer and the lone member to the Goddess Hestia's Familia in the bustling city of Orario. Trying to make ends meet and hoping to strike fortune he delves under the cities labyrinth known as the Dungeon to battle the legions of monsters lurking beneath.",
		 "It's a tale of adventure in the depths of darkness! Bell Cranel is an adventurer and the lone member to the Goddess Hestia's Familia in the bustling city of Orario.",
		 "Hanabee",
		 "&copy; J.C.Staff"
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("Is it wrong to try to pick up girls in a dungeon",
		 4,
		 1,
		 "MA15+ - Strong animated violence and sexual references",
		 13,
		 "https://hanabee.com.au/products/is-it-wrong-to-try-to-pick-up-girls-in-a-dungeon-blu-ray"
		)
	,	("Is it wrong to try to pick up girls in a dungeon",
		 3,
		 1,
		 "MA15+ - Strong animated violence and sexual references",
		 13,
		 "https://hanabee.com.au/products/is-it-wrong-to-try-to-pick-up-girls-in-a-dungeon"
		)
		
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("Is it wrong to try to pick up girls in a dungeon",
		 1,
		 "Adventurer (Bell Cranel)",
		 "Gods who created the Universe descended from Heaven to live among humans on the condition they swore to never again use their godly powers. The Gods only remaining power is the Blessing, which they grant to humans to level up their powers (Similar to how characters level up in video games). These humans, known as Familia, become that Gods family. Bell Cranel, the only Familia of the Goddess, Hestia, is almost killed by a Minotaur. He is saved by Ais Wallenstein, Familia of the Goddess Loki, and falls in love with her. Hestia realises he has gained the magical skill Learis Freese, which will raise his level rapidly based on the strength of his feelings as he fights, but decides to keep it secret as it makes him very valuable and other Gods may try to acquire him. The next day, after more adventuring, Bells stats rises dramatically. Bell plans on talking to Ais but he overhears another Familia talking about how he embarrassed himself fighting the Minotaur. Realising how pathetic he must seem compared to Ais he re-enters the dungeon, desperately slaying as many monsters as he can and returns to Hestia in the morning, beaten and bleeding."
		)
	,	("Is it wrong to try to pick up girls in a dungeon",
		 2,
		 "Monster Festival (Monsterphilia)",
		 "Hestia continues to keep Learis Freese secret from Bell, passing off his improvement as the result of hard work, and announces she will be gone for several days. Hestia seeks out the God of Smiths, Hephaistos and begs her to forge a weapon for Bell. After hours of grovelling in the Dogeza position Hestia convinces Hephaistos to forge a weapon, on condition Hestia pays for it no matter how many centuries it takes. Hephaistos forge an enchanted Tantō for Bell. Bell is asked by the maids of the Hostess of Fertility Pub to return a purse to Syr, a waitress with a crush on Bell, who got so excited about the festival she forgot it. An unnamed Goddess contacts Loki trying to locate a Familia she intends on acquiring, the description of whom matches Bell perfectly. Hestia locates Bell and insists they go on a romantic date. The unnamed Goddess releases a captured albino gorilla monster, ordering it to capture Bell. It corners Hestia and Bell, who attacks it with his original knife only for it to shatter. Desperate to protect Hestia he locks her on the other side of a metal gate and prepares to fight the gorilla unarmed."
		)
	,	("Is it wrong to try to pick up girls in a dungeon",
		 3,
		 "The Blade of a God (Hestia Knife)",
		 "Separating himself from Hestia in order to protect her, Bell confronts a monster in the streets with no chance to win, until Hestia returns with the weapon she ordered for him, the &quot;Hestia Knife&quot; and he makes a comeback. "
		)
	,	("Is it wrong to try to pick up girls in a dungeon",
		 4,
		 "The Weak (Supporter)",
		 "After Eina took Bell to the city so Bell can get some new armor, Bell meets a supporter, Liliruca Arde, who offers herself to be his partner, unaware of her true intentions."
		)
	,	("Is it wrong to try to pick up girls in a dungeon",
		 5,
		 "Magic Book (Grimoire)",
		 "Bell comes across a magic book that grants him a powerful, new spell and collapses while testing it out in the dungeon, just to be rescued by Ais again. Meanwhile, Liliruca decides that the time to end her partnership with Bell is at hand."
		)
	,	("Is it wrong to try to pick up girls in a dungeon",
		 6,
		 "Reason (Liliruca Arde)",
		 "Liliruca sets a trap for Bell, stealing his knife in the occasion. However, she is captured and left for dead by a group of thugs, and despite her betrayal, Bell arrives in the nick of time to protect her. "
		)
	,	("Is it wrong to try to pick up girls in a dungeon",
		 7,
		 "Sword Princess (Ais Wallenstein)",
		 "Now with Liliruca as his partner for good, Bell finally has a proper meeting with Ais and starts training under her, much to Hestia's jealousy when she finds out."
		)
	,	("Is it wrong to try to pick up girls in a dungeon",
		 8,
		 "Wanting To Be A Hero (Argonaut)",
		 "After finishing his training with Ais, Bell is attacked by a powerful minotaur but instead of running away, he decides to confront the beast by himself in order to buy time for Lily to get away. Ais arrived later to help him but was refused by Bell who wishes to become stronger."
		)
	,	("Is it wrong to try to pick up girls in a dungeon",
		 9,
		 "Blacksmith (Welf Crozzo)",
		 "Bell's victory against the Minotaur earns him quite the reputation among the other adventures for being the quickest adventurer who gets to level 2 overtaking Ais Wallenstein's record. He later befriends Welf Crozzo, a young blacksmith who is also a level 2 adventurer who wishes to join his party. "
		)
	,	("Is it wrong to try to pick up girls in a dungeon",
		 10,
		 "Procession of Monsters (Pass Parade)",
		 "Just when Bell's new party start exploring the intermediate floors of the dungeon, they was forced into a dire situation when a party used them as decoy to escape from monster train. Ended up missing, Hestia assembles a rescue party to search for them. "
		)
	,	("Is it wrong to try to pick up girls in a dungeon",
		 11,
		 "Labyrinth Utopia (Under Resort)",
		 "With their last ounces of strength, Bell and friends reach the safe area in the eighteenth floor, where they are rescued and treated by Ais and her guild, who are returning to the surface after finishing their expedition. Hestia arrives later and reunite with him. "
		)
	,	("Is it wrong to try to pick up girls in a dungeon",
		 12,
		 "Malice (Show)",
		 "Bell and the others prepare themselves to return to the surface when a group of rogue adventurers, envious of Bell's fame, kidnap Hestia in order to set a trap for him. "
		)
	,	("Is it wrong to try to pick up girls in a dungeon",
		 13,
		 "The Story of a Familia (Familia Myth)",
		 "A powerful monster appears in the 18th floor without warning, leading Bell and the other adventurers to fight for their lives against it."
		)
;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("Is it wrong to try to pick up girls in a dungeon", 0, 1, 4)
	,	("Is it wrong to try to pick up girls in a dungeon", 0, 2, 4)
	,	("Is it wrong to try to pick up girls in a dungeon", 0, 3, 5)
;-- Anime Data
INSERT INTO ANIME(ANIME_TITLE, NUMBER_OF_EPISODES, ANIME_SYNOPSIS, ANIME_DESCRIPTION, COMPANY_NAME, COPYRIGHT) VALUES
		("The irregular at magic high school",
		 26,
		 "Off the back of the Nine Schools Competition comes the Thesis Competition, an event to flaunt the intelligence of the students representing the nine major schools. Whilst Tatsuya gets recruited to help present a study on Gravity Control-type magic, there's trouble brewing in the host city.",
		 "Off the back of the Nine Schools Competition comes the Thesis Competition, an event to flaunt the intelligence of the students representing the nine major schools.",
		 "Hanabee",
		 ""
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("The irregular at magic high school",
		 1,
		 1,
		 "MA15+ - Strong animated violence",
		 7,
		 "https://hanabee.com.au/products/irregular-at-magic-high-school-part-1"
		)
	,	("The irregular at magic high school",
		 1,
		 2,
		 "MA15+ - Strong animated violence",
		 11,
		 "https://hanabee.com.au/products/irregular-at-magic-high-school-part-2"
		)
	,	("The irregular at magic high school",
		 1,
		 3,
		 "MA15+ - Strong animated violence",
		 8,
		 "https://hanabee.com.au/products/irregular-at-magic-high-school-part-3"
		)
	,	("The irregular at magic high school",
		 2,
		 1,
		 "MA15+ - Strong animated violence",
		 7,
		 "https://hanabee.com.au/products/irregular-at-magic-high-school-part-1-blu-ray"
		)
	,	("The irregular at magic high school",
		 2,
		 2,
		 "MA15+ - Strong animated violence",
		 11,
		 "https://hanabee.com.au/products/irregular-at-magic-high-school-part-2-blu-ray"
		)
	,	("The irregular at magic high school",
		 2,
		 3,
		 "MA15+ - Strong animated violence",
		 8,
		 "https://hanabee.com.au/products/irregular-at-magic-high-school-part-3-blu-ray"
		)
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("The irregular at magic high school",
		 1,
		 "Enrollment Part I",
		 "In 2095, Tatsuya Shiba and his sister Miyuki enroll at the First Private Magic University Affiliated High School, but due to the difference in their grades in the practical exam, Miyuki is placed in the Course 1 curriculum with the other students who have demonstrated high magical skills, (informally known as &quot;Blooms&quot;) while Tatsuya, on the other hand, having scored poorly on the practical exam is assigned to the Course 2 curriculum (insultingly called &quot;Weeds&quot; by Course 1 students) even though he placed first in the theoretical exam. Tatsuya becomes acquainted with several Course 2 students including Erika Chiba, Leo Saijo and Mizuki Shibata. The chasm between the Weeds and Blooms leads to a confrontation when a number of Miyuki's classmates object to her hanging around with her brother and his new friends. Violence seems imminent but the magic sequence is disrupted by the student council president as she arrives with the chairman of the disciplinary committee."
		)
	,	("The irregular at magic high school",
		 2,
		 "Enrollment Part II",
		 "Tatsuya's skills and wits have earned him and his sister the scrutiny of Mayumi Saegusa, Student Council president and Mari Watanabe, leader of the Public Morals Committee. Mayumi invites Miyuki to join the Student Council as the first year representative but she initially declines and puts her brother's name forward. Upon learning that by school regulation, year representatives must be Course 1 students, she accepts. Not wanting to waste his talents, Mari proposes that Tatsuya be the Student Council's nominee for a vacant position on the Public Morals Committee, which President Saegusa agrees to. At a meeting later that day, Student Council vice-president Hanzo Gyoubushoujo Hattori opposes Tatsuya's nomination which prompts Miyuki to defend him. Hanzo reprimands her for her seeming bias towards her brother which causes Tatsuya to challenge him to a magic duel. Tatsuya easily defeats Hanzo, much to the surprise of the Student Council. "
		)
	,	("The irregular at magic high school",
		 3,
		 "Enrollment Part III",
		 "The Council cannot reconcile Tatsuya's flawless victory in his duel with Hanzo with his poor showing in the practical exam. Once he regains consciousness, Hanzo tacitly withdraws his objection to Tatsuya's nomination by apologizing to Miyuki. Mari introduces Tatsuya to the other members of the Public Morals Committee, who note the fact that he's a Course 2 student, but warmly welcome him on learning of his victory over the previously undefeated Hanzo. To his dismay, Mari informs Tatsuya that Shun Morisaki, the Course 1 student who started the altercation on their first day, is also joining the Committee on a faculty recommendation. His first taste of action involves a confrontation between the kendo club and kenjutsu club. The head of the kenjutsu club, who combines magic with swordplay, forces Sayaka Mibu, a member of the kendo club and Weed, to spar. When he loses, he uses magic in a follow-up attack, in contravention of the rules. Tatsuya steps in and arrests him but is assaulted by the rest of the kenjutsu club who refuse to acknowledge his authority just because he is a Weed. "
		)
	,	("The irregular at magic high school",
		 4,
		 "Enrollment Part IV",
		 "Tatsuya is approached by Sayaka Mibu, who wants his cooperation in a plan to put an end to the discrimination between the Blooms and Weeds at the school. He refrains from giving an immediate answer. His suspicions that she is being manipulated by someone else with ulterior motives are aroused when she is unable to give him proper answers to his questions. "
		)
	,	("The irregular at magic high school",
		 5,
		 "Enrollment Part V",
		 "Tatsuya rejects Sayaka's offer and a group of Weeds led by her lock themselves in the broadcast room, creating a commotion at school. Mayumi elects to listen to their demands and discuss them in front of the student body. Debating the school's position by herself, she is about to arrange a compromise with the Weeds when the school gets suddenly attacked by terrorists. "
		)
	,	("The irregular at magic high school",
		 6,
		 "Enrollment Part VI",
		 "The Student Council and Public Morals Committee defeat the terrorists and find out that the attack was merely a cover for an information raid on the school's computer library. Tatsuya and his friends are tasked with countering the raid. They defeat the terrorists, including Sayaka, and take them into custody. After learning of Sayaka's reasons for cooperating with Blanche, the terrorist organization behind the attack, Tatsuya decides to attack the enemy hideout in order to help clear her name and strike back at them for using her and invading the school. "
		)
	,	("The irregular at magic high school",
		 7,
		 "Enrollment Part VII",
		 "Tatsuya and his friends storm Blanche's hideout where they confront the group's leader, who confirms that he had manipulated Sayaka's memory to attack the school. Despite a number of traps, the students are able to subdue the terrorists with no apparent injuries. After Sayaka is discharged from the hospital, Tatsuya and Miyuki's normal school life moves on. "
		)
	,	("The irregular at magic high school",
		 8,
		 "Nine Schools Competition Part I",
		 "The inter-school sporting event known as the &quot:Nine Schools Competition&quot; is just around the corner, and Tatsuya, in recognition of his superior magic-tuning skills, is named to the engineering squad, over the objections of a number of Course 1 students. After school, Tatsuya surprises his sister when presents her with a magic tool he developed that allows a person to fly, a feat that no one has never done before. "
		)
	,	("The irregular at magic high school",
		 9,
		 "Nine Schools Competition Part II",
		 "Tatsuya and Miyuki pay a visit to Four Leaves Technology, where Tatsuya unveils his flying CAD to Ushiyama, the other half of the genius magic engineer Taurus Silver. After a brief encounter with their father, the siblings set out for the Competition, but on the way there, a traffic accident occurs, putting the students in danger. "
		)
	,	("The irregular at magic high school",
		 10,
		 "Nine Schools Competition Part III",
		 "Tatsuya, Miyuki, and Katsuto Jyumonji act to prevent the car from ramming into the bus. From traces that he is able to find, Tatsuya speculates that the incident was set up to look like a traffic accident but was instead a suicide attack. On arriving at their hotel, Tatsuya and Miyuki are surprised to find Erika and Mizuki present. The event opens with a banquet where the students from the nine competing schools mingle, unaware that unknown enemies are about to turn the competition topsy-turvy."
		)
	,	("The irregular at magic high school",
		 11,
		 "Nine Schools Competition Part IV",
		 "The Nine Schools Competition begins and Tatsuya puts his tuning skills into practice in order to help his teammates performance, while staying on watch for further disturbances. "
		)
	,	("The irregular at magic high school",
		 12,
		 "Nine Schools Competition Part V",
		 "One of Tatsuya's team member Mari Watanabe is involved in a serious accident during the competition and the other students increase their vigilance after Saegusa, Mayumi, and Tatsuya reveal that she was actually a victim of sabotage. "
		)
	,	("The irregular at magic high school",
		 13,
		 "Nine Schools Competition Part VI",
		 "The &quot;No Head Dragon&quot;, an criminal syndicate is eager to interfere in the competition for the sake of their profits and the First High School is their main target. Meanwhile, the students under Tatsuya's care are doing better than expected in their events, drawing the attention of those who still can't acknowledge his talent just because he is a Course 2 student as well as First High School's main rivals from Third High School. "
		)
	,	("The irregular at magic high school",
		 14,
		 "Nine Schools Competition Part VII",
		 "The Nine Schools Competition proceeds without further incident until the 1st High School Monolith Code's junior participants get seriously injured due to foul play. Appointed by Mayumi, Tatsuya is requested to compete and agrees to it after Juumonji's persuasion. "
		)
	,	("The irregular at magic high school",
		 15,
		 "Nine Schools Competition Part VIII",
		 "Tatsuya enters the competition with his friends Leonhard Saijo and Mikihiko Yoshida in the &quot;Monolith Code&quot; event. While watching out for No Head Dragon's interference, Tatsuya proceeds to win the match using his strategies and they smoothly reach the final match against the 3rd High school's geniuses Red prince Masaki and Cardinal George. "
		)
	,	("The irregular at magic high school",
		 16,
		 "Nine Schools Competition Part IX",
		 "Tatsuya and Masaki's teams face off in the final match. Despite knowing that with the rules standing, Masaki's abilities surpass his, Tatsuya confronts him head on, resulting in a spectacular duel. Making a critical mistake, Masaki breaks the rules by accidentally using a lethal attack on Tatsuya. Tatsuya takes the brunt of the attack and is seriously wounded. However, he uses his self-restoration to recover his injuries and while Masaki's still in trance, Tatsuya incapacitates him with a point-blank range magic. Meanwhile, Mikihiko faces off against Cardinal George in a lengthy duel, Mikihiko finally defeats George, but is on the verge of losing to the third member of Masaki's team, when Leo manages to deliver the final blow, allowing First High to win the match. "
		)
	,	("The irregular at magic high school",
		 17,
		 "Nine Schools Competition Part X",
		 "Desperate with the recent developments, No Head Dragon start interfering with the competition directly, risking the lives of the players. A 1st high Mirage Bat participant ends up in an accident which causes physical trauma and consequently loses her magical abilities. Tatsuya remains vigilant to stop further accident and snaps when Miyuki's CAD is sabotaged in front of his eyes. After resolving the problem, Miyuki's Mirage Bat event starts and she has a hard time maintaining the leads. Miyuki requests her brother's permission to use Taurus Silver's fly magic sequence and wins the event with no critical mistakes. "
		)
	,	("The irregular at magic high school",
		 18,
		 "Nine Schools Competition Part XI",
		 "During Miyuki's event victory celebration, Tatsuya snipes the meeting of the No Head Dragon high-ranking members by casting his diassembly magic from an adjacent building. After learning the name of the organization's head, Richard Sun, Tatsuya proceeds to kill everyone present at the meeting, mostly influenced by his feelings for his sister. On the next day, the competition ends with Jyumonji single-handedly winning the Monolith Code event, confirming the championship for First High School. After Mayumi and Jyumonji discuss the long-term effects that Tatsuya's victory over Masaki (the probable future head of the Ten Master Clans) as the reputation of the Ten Master Clans could be tarnished, Tatsuya is asked by Jyumonji to join the Ten Master Clans by marrying Mayumi or one of her sisters. "
		)
	,	("The irregular at magic high school",
		 19,
		 "Yokohama Disturbance Part I",
		 "Following his feats in the Nine Schools Competition, Tatsuya is scouted to participate in another important event, the &quot;Magic Thesis Competition&quot and his team has only eleven days left to produce the applicable material before the deadline. Back at home, Tatsuya and Miyuki have an encounter with their step mother, who enlists Tatsuya's help to replicate an elusive relic that can change the history of magic forever, but a new group of enemies appear, intending to steal it. "
		)
	,	("The irregular at magic high school",
		 20,
		 "Yokohama Disturbance Part II",
		 "While gathering the necessary material for the thesis, Tatsuya and his friends start their own investigation on those who are stalking him and was trying to hack him + his Four Leaves company. "
		)
	,	("The irregular at magic high school",
		 21,
		 "Yokohama Disturbance Part III",
		 "The Magic Thesis Competition team meets continued success in developing their project, though Erika, Mikihiko, and Leo apprehend a fleeing student, Chiaki Hirakawa, who is revealed to be working as a spy against the First High team. Chiaki admits to working against Tatsuya personally, passionately believing that he is responsible for Kobayakawa's accident during the Mirage Bat event of the Nine Schools Competition. Erika and Leo take a day off together to train Leo how to use lethal magic, with Erika believing that the conflict will more likely escalate to kill or be killed. Mikihiko chases after an embarrassed Mizuki, unintentionally bumping into an ominous figure dressed in a First High student uniform. "
		)
	,	("The irregular at magic high school",
		 22,
		 "Yokohama Disturbance Part IV",
		 "Lu Gonghu's attempt to remove Chiaki is thwarted by Watanabe and Naotsugu Chiba. Mr. Zhou visits Chiaki and appears to cast a memory alteration magic so that she will forget about his involvement with her. Saegusa, Watanabe, and Tatsuya go to the detention facility and elicit a confession from Sekimoto on his intention (and unsuccessful attempt) to steal the Magic Thesis project data and locate the relic. Lu Gonghu appears again, apparently to silence Sekimoto, but is defeated by the three and taken into custody."
		)
	,	("The irregular at magic high school",
		 23,
		 "Yokohama Disturbance Part V",
		 "Chen Xiangshan appeals to Mr. Zhou for help freeing Lu Gonghu. Under condition that Chen promises to avoid Chinatown during his operation, Lu Gonghu is broken out. Ichihara visits Chioda and manipulates her to hold onto her feelings of bitterness for Tatsuya, believing that her capabilities will be important for 1st High future. Further questioning revealed that Sekimoto was operating against the Magic Thesis team under mind control by an adversary organization. At the convention, Juumonji elects to increase security and have all Joint Security Force members wear a bulletproof vest. The First High Magic Thesis team successfully delivers their presentation. Cardinal George congratulates Tatsuya backstage and claims that his school will defeat them. Before they can begin their presentation however, the convention center is attacked. "
		)
	,	("The irregular at magic high school",
		 24,
		 "Yokohama Disturbance Part VI",
		 "The conventional joint defense forces engage the assaulting teams but are bogged down by slow progress with evacuating the students, but discover that the attack is being launched from an unidentified disguised ship anchored in the harbor. Armed assailants assault the main hall, but are easily countered by Tatsuya after he inspires the other students to fight back. Cardinal George confronts Tatsuya on using a top-secret technique used by STARS called Molecular Divider, but Tatsuya ignores him, saying that he doesn't have time to explain himself. Asuza casts a charm to calm everyone in the hall, and the evacuation begins to an underground shelter via an emergency underground tunnel. Tatsuya's group lead the counterattack against the main terrorist force attacking the convention center. Shizuku uses her family's privilege to take the group to a VIP conference room so they can use the network to get a better idea on what's going on outside, then meet with the rest of the First High student council members in the green room to discuss their next move. The group deciphers the enemy's motive to be to raid the Magic Association's main database. Just as the group decides to evacuate to the shelter with everyone else, Major Kazama and Fujibayashi arrive and dispatches new orders to Tatsuya, revealing to everyone's great surprise that he is a JSDF special operative. Major Kazama tells everyone that this is confidential information, and his status must remain secret. Miyuki unlocks the seals on Tatsuya's powers and sends him to answer the JSDF's call to defend the city."
		)
	,	("The irregular at magic high school",
		 25,
		 "Yokohama Disturbance Part VII",
		 "Crimson Prince brutally kills the terrorists while his allies prepare a bus for their escape aboveground. Meanwhile, evacuation underground continues through the tunnels despite resistance, Mr. Tsuzura prevents a collapsed ceiling causes by Great Asian Alliance's war machines. Mayumi and Shizuku call their fathers to send helicopters to evacuate the personnels who were unable to reach the bunker, and everyone is extracted. Tatsuya takes to the skies in the flight suit, which R&D had improved beyond his own design, and begins by destroying the attackers' recon drones. The battle for the city continues, with notable First High members and Crimson Prince fighting back the attackers. In another group, while they were escaping, an ambush attack causes Kirihara's leg to be blown off and Kei pierced by shrapnel while protecting their girlfriend. Miyuki arrives, eliminating the attackers and calls for Tatsuya, who uses his magic to restore both Kirihara and Kei before departing to support another area. "
		)
	,	("The irregular at magic high school",
		 26,
		 "Yokohama Disturbance Part VIII",
		 "The episode starts with Tatsuya and other airborne comrades obliterating an enemy mechanized battalion. Some enemy soldiers recognize him as Mahesvara, a demon from 3 years ago who appears for revenge when his sister and mother was critically injured. Meanwhile, Jummonji leads the magicians from Magic Branch Association charasmatically, resulting in the enemy retreating. The Crimson Prince reaches the Chinatown of Zhou Gongjin and demands that he surrender the escapees, to which Zhou agrees and assures The Prince that he had also been victimized. The scene then moves to the Saegusa helicopter. The students in the helicopter are very curious about Tatsuya's magic, which healed Kei and Kirihara's wounds. Miyuki explains Tatsuya's magic Regrowth, as well as its price: the user has to endure the same pain as the person healed, in a condensed form. Later, they defeat Lu Gong-Hu and his employer at the branch of Magic Association building. The battle proceeds with the airborne troops and the magicians led by Jummonji, sandwiching the enemy from 2 sides, successfully obliterating most of the enemies. Some manage to escape to the camouflaged ship, though. Later, Major Kazama authorizes Tatsuya to activate Strategic Class Magic, Material Burst, which converts mass into energy. Tatsuya uses Material Burst on the retreating Great Asian Alliance's navy, completely annihilating them. Furthermore, he also casts Material Burst onto the Great Asian Alliance departing Navy battalions and their harbor using satellite view and ends the war before it even begin. The event is referred to as 'Scorched Halloween', the day where magic is recognized as the strongest weapon and magicians begin their era of glory and suffering. The episode ends, with Maya Yotsuba inviting Kazama and the Shiba siblings to visit her on the same day, while Tatsuya hugs Miyuki, on his return. "
		)
;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("The irregular at magic high school", 0, 1, 8)
	,	("The irregular at magic high school", 0, 2, 9)
	,	("The irregular at magic high school", 0, 3, 9)
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
INSERT INTO ANIME(ANIME_TITLE, NUMBER_OF_EPISODES, ANIME_SYNOPSIS, ANIME_DESCRIPTION, COMPANY_NAME, COPYRIGHT) VALUES
		("Tokyo Magnitude 8.0",
		 11,
		 "Imagine if an earthquake as powerful as magnitude 8.0 struck Tokyo, the capital city of Japan, today... Who would we think about and what should we do at that moment? This is a tremendous human drama that portrays the connections and human bonds in the most extreme situations.",
		 "Imagine if an earthquake as powerful as magnitude 8.0 struck Tokyo, the capital city of Japan, today... Who would we think about and what should we do at that moment? This is a tremendous human drama that portrays the connections and human bonds in the most extreme situations.",
		 "Siren",
		 "Masaki Tachibana"
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("Tokyo Magnitude 8.0",
		 1,
		 1,
		 "PG - Mild Themes and infrequent coarse language",
		 11,
		 "http://sirenvisual.com.au/index.php/shop/tokyo-magnitude-8-0-dvd.html"
		),
		("Tokyo Magnitude 8.0",
		 2,
		 1,
		 "PG - Mild Themes and infrequent coarse language",
		 11,
		 "http://sirenvisual.com.au/index.php/shop/tokyo-magnitude-8-0-blu-ray.html"
		)
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("Tokyo Magnitude 8.0",
		 1,
		 "Odaiba Stinks",
		 "Mirai Onozawa and her younger brother Yūki are visiting a robot exposition at Odaiba, Tokyo, when a massive earthquake strikes the city."
		)
	,	("Tokyo Magnitude 8.0",
		 2,
		 "The World is Broken",
		 "After the earthquake Mirai looks desperately for Yūki inside a collapsing building along with Mari Kusakabe, a female motorcycle courier who offered to help her."
		 )
	,	("Tokyo Magnitude 8.0",
		 3,
		 "Burning Bridge",
		 "Mirai, Yūki and Mari decide to reach their homes together, but just after starting their journey, they find that there are far more dangers in the collapsing city than they imagined."
		 )
	,	("Tokyo Magnitude 8.0",
		 4,
		 "The Promise Between the Three",
		 "Having finally left Odaiba, the trio finds a place to gather supplies and prepare themselves for their long walk, but after having a discussion, Mirai and Yūki stray away from Mari and end up in serious trouble."
		 )
	,	("Tokyo Magnitude 8.0",
		 5,
		 "The School is Wailing",
		 "The group takes shelter at her school's premises during the night, but their stay there becomes far from peaceful as they are constantly plagued by aftershocks and depressed by the sight of those who lost their relatives to the earthquake."
		 )
	,	("Tokyo Magnitude 8.0",
		 6,
		 "Choice to Abandon",
		 "The group reaches Mari's workplace, where she loses consciousness because of anemia. During that time the kids are suddenly frightened by Aya, a colleague of Mari, who noisily enters the building carrying a baseball bat."
		 )
	,	("Tokyo Magnitude 8.0",
		 7,
		 "Summer's Dusk",
		 "Rescue robots fill the scene, fascinating Yūki and leading him to meet a new friend, who shares his interest and is the same age as Mirai. However the journey so far seems to have taken its toll on Yūki." 
		 )
	,	("Tokyo Magnitude 8.0",
		 8,
		 "Pure White Morning",
		 "Yūki collapses suddenly and is taken to the hospital."
		)
	,	("Tokyo Magnitude 8.0",
		 9,
		 "Farewell Today",
		 "Mari finally reaches her home to find it was destroyed. Mirai and Yūki learn that residents are being cared for at a nearby elementary school. There, they find two unknown bodies that Mari believes are her mother and daughter, and mourns their deaths. However, Yūki believes they are still alive and with his sister, helps finds Mari's daughter at another school. After reuniting with her daughter, Mari finds her mother at a local hospital. Mirai and Yūki leave to continue their search for their parents. Mirai leaves Mari a note to thank her for all she did for them, stating that she hopes they will meet again. Confused and surprised, Mari says &quot;Yūki and I?&quot;"
		)
	,	("Tokyo Magnitude 8.0",
		 10,
		 "Mirai, You Know...",
		 "While on a truck going towards their hometown, Yūki tries to talk to Mirai about his death, but she tells him to quit talking nonsense as it would make her furious, very worried and very upset within shame of sadness if he died. In their home town, Mirai runs into a friend some school who tells her that her parents are staying at one of the school shelters, and that her father was hospitalized from an injury. Yūki runs off when Mirai runs into his best friend Itsuki. Itsuki takes her to her parents, but finds that her mom has gone back to the house to get clothes for her father. Outside, they see the marronier Yūki and Itsuki had planted before the earthquake. Itsuki and Mirai return to his house to get a journal he wanted to give Yūki, while Yūki continues to avoid being seen by Itsuki. Half the house collapses while they are there. At the end of the episode, Yūki finally is able to tell Mirai that he died at the hospital earlier."
		 )
	,	("Tokyo Magnitude 8.0",
		 11,
		 "Dear Yūki...",
		 "Mirai and Yūki return home where Mirai is reunited with her parents and Yūki's spirit leaves. One month later, Tokyo is continuing to recover from the earthquake. Mari visits Mirai who returns her cell phone and Yūki's backpack. Mirai finds an email from Yūki that he sent before his death from Mari's phone saying that he hoped he could get a phone too so they could talk even when they were apart. Mirai gives her mother the present Yūki had purchased for her for the birthday. While watering the tree Yūki planted, Mirai resolves to move on with her life, knowing that Yūki will always be in her heart."
		 );

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("Tokyo Magnitude 8.0", 0, 1, 4)
	,	("Tokyo Magnitude 8.0", 0, 2, 4)
	,	("Tokyo Magnitude 8.0", 0, 3, 3)
;
INSERT INTO ANIME(ANIME_TITLE, NUMBER_OF_EPISODES, ANIME_SYNOPSIS, ANIME_DESCRIPTION, COMPANY_NAME, COPYRIGHT) VALUES
		("Blassreiter",
		 24,
		 "Giant, biomechanical creatures of origins unknown are terrorizing the city. Labelled as Demoniacs, the creatures appear rabid and unpredictable, killing and maiming anything in their path. The town’s citizens are terrified, the media demands answers.",
		 "Somewhere in Germany in the not-too-distant future all hell is breaking loose...",
		 "Siren",
		 "Ichiro Itano"
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("Blassreiter",
		 1,
		 1,
		 "MA15+ - Strong animated violence",
		 24,
		 "http://sirenvisual.com.au/index.php/shop/blassreiter-complete-series.html"
		)
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("Blassreiter",
		 1,
		 "Prelude to Despair",
		 "During a motorcycle race in Germany, a Demoniac attacks German policeman stationed at the race track before taking control of an ambulance and attacking several competitors. Motorcycle star Gerd Frentzen faces off against the Demoniac before armed XAT officers cordon the area. An unknown being in a blue Blassreiter form appears and kills the Demoniac. In the process, Gerd is injured and paralyzed from his waist down. Gerd is disillusioned when he discovers that he is being dropped from the team and Igor will take his place. Some time later, a mysterious doctor, Beatrice Grese, offers Gerd an experimental drug. During an XAT-led operation to track down a Demoniac hiding in an industrial complex, a Blassreiter appears and destroys the Demoniac. XAT officers Hermann Saltza and Amanda Werner are shocked to see the Blassreiter transform into Gerd who has fully recovered his ability to walk. Beatrice Grese seems satisfied with the results of her experiment with Gerd. "
		)
	,	("Blassreiter",
		 2,
		 "The Price of Glory",
		 "XAT begins to conduct surveillance on Gerd after discovering that he has Blassreiter powers, despite being popular with the German public and his elimination of Demoniacs. Gerd heads back to meet his former girlfriend Jill Hoffmann, but sees her in the arms of his manager Matthew Grant who says that he'd been planning to drop Gerd from the team even before his accident. Enraged, Gerd transforms into his Blassreiter form and almost strangles Jill before Grant stabs Gerd and the XAT officers arrive. Gerd flees on his motorcycle, but is pursued by the blue Blassreiter. He escapes and is then chased by Hermann, however, due to the lack of control over his Blassreiter power, Gerd crashes off a cliff and his motorcycle is destroyed in an explosion."
		 )
	,	("Blassreiter",
		 3,
		 "The Infection Spreads",
		 "Despite efforts to locate Gerd's possible corpse, the XAT only find his ruined motorcycle. As a precaution, XAT isolate Jill and Matthew after their contact with Gerd's Blassreiter form and continue the search for the blue Blassreiter who is declared a high priority target by Wolf Göring. Meanwhile Amanda's brother Malek is being bullied by older boys, but Joseph Jobson comes to his aid. Matthew turns into a Demoniac from exposure to Gerd's blood when he stabbed Gerd at Jill's house. The blue Blassreiter, Joseph Jobson, pursues him, but they are both hit by XAT rockets. Matthew goes back to Jill's house, where he becomes a Blassreiter, but Joseph Jobson again attacks Matthew and this time he finally destroys him."
		 )
	,	("Blassreiter",
		 4,
		 "Under Siege",
		 "XAT is mobilized into action when multiple Demoniacs appear in several town blocks and attack armed policeman. Joseph intervenes in his Blassreiter form and chases down the Demoniacs but some XAT operatives hold him responsible for massacring policemen when they arrive late on the scene. His actions in protecting a citizen and consequent wounding cause Amanda Werner to question whether Joseph is really XAT's enemy. Jill's condition from contact with Gerd's blood becomes worse, forcing Wolf to have her heavily sedated. Meanwhile Malek is beaten up by his friend Johann who is also pressured by the bullies. Gerd survived his crash and is seen killing a motorcycle-possessed Demoniac out on the highway. However he has confusing visions and problems managing his Blassreiter form."
		 )
	,	("Blassreiter",
		 5,
		 "The Disdained",
		 "Igor takes his motorcycle onto the track for late night practice when Gerd appears and they race each other. When Igor tries to run Gerd off the track he crashes. Later, on TV, he accuses Gerd of trying to kill him. Meanwhile Malek finds the injured Joseph and treats his wound. Jill is being transferred under XAT escort as precaution against an attack from Gerd, when she turns into a Demoniac and attacks the escort team. Gerd confronts and kills the Demoniac Jill, while under the eye of the media, and in his confusion, he takes out the media chopper flying overhead and retaliates when the XAT forces attack him. Hermann finally reaches through to him and Gerd returns to his human form. When Hermann gives Gerd the fan letter Malek wrote to him, Gerd angrily takes off, knowing that he isn't the hero that some people think he is any more."
		 )
	,	("Blassreiter",
		 6,
		 "The Song that Pities the Demon",
		 "Joseph confronts Gerd, both in their Blassreiter forms, but after Joseph reveals his human form, Gerd asks Joseph to do him a small favor. At home, Amanda is about to confront Malek about his frequent absences from school when Hermann arrives and asks Malek to go with him and help reason with his idol, Gerd. Hermann and Malek meet Gerd and the two motorcycle racers decide to race for old times, watched by Joseph. During the race Gerd imagines that Hermann is a Demoniac and forces him to crash. As Gerd succumbs to the demonic side of the Blassreiter form, seeing everyone as Demoniacs, Joseph appears and kills Gerd, fulfilling the promise he made to end his life should he no longer control his Blassreiter powers."
		 )
	,	("Blassreiter",
		 7,
		 "At the End of Hatred",
		 "Johann, Malek's friend, commits suicide, feeling guilty over attacking Malek to avoid being beaten by the bullies himself. Beatrice Grese delivers a video to the XAT revealing Joseph's human face. Malek begins to lose faith in god for the unfair treatment of Johann and his family and doesn't believe Amanda's promise to protect him. Meanwhile, the principal from Malek's school bribes Johann's mother to keep things quiet to preserve the establishment's reputation. While the police and XAT are on the hunt to capture Joseph, Beatrice appears to Malek and offers him the same pill she gave to Gerd that cured his paraplegia but also created his Blassreiter form."
		 )
	,	("Blassreiter",
		 8,
		 "Weak no Longer",
		 "Wolf is told by Beatrice that he came in contact with Demoniac blood and is going to become an Amalgam too. Beatrice also reveals the evolutionary process of the Demoniacs, how the infection spreads and the threat that Joseph Jobson poses to her plans. After taking the pill from Beatrice, Malek develops Blassreiter powers and kills his school bullies. Joseph detects Malek's actions so he rides to the school and tries to reason with Malek who is fighting the XAT forces. Malek attacks instead, then Joseph is wounded when he defends Malek from a .50 caliber sniper shot from Bradley &quot;Brad&quot; Guildford. After realizing that the Demoniac is Malek, Amanda shields him with her own body enabling Malek to escape from XAT, taking the wounded Joseph with him."
		)
	,	("Blassreiter",
		 9,
		 "The Price and the Meaning of Power",
		 "Wolf takes Amanda off active duty due to her relationship with Malek, referred to as Yellow. Amanda thinks back to when she adopted Malek and how she was unable to protect him. She breaks orders and tries to find Malek with Hermann. Malek and Joseph are hiding in an old church with Joseph badly wounded when they are found by Magwald Xargin. He attacks and nearly kills both of them without even changing to his Demoniac form. Amanda and Hermann arrive just after Xargin leaves and Malek regains consciousness long enough for him to tell Amanda that he regrets killing the delinquents. Joseph and Hermann are both shaken when they see Malek lose consciousness again."
		)
	,	("Blassreiter",
		 10,
		 "Inside the Conspiracy",
		 "Malek and Joseph are held in an experimental facility at the XAT, Joseph slowly self-repairing, but Malek still in a coma. Alvin &quot;Al&quot; Lutz and Brad tell Hermann and Amanda that they believe the Demoniacs are the result of human weapons research. With the help of a technician, Hermann and Amanda try to analyze Joseph and discover confidential information about Blassreiters. Victor Stachus then has Amanda and Hermann taken into custody fearing that the information will get out. Meanwhile, Amalgams are detected and while fighting them, Al and Brad see the new anti-Amalgum Paladin machines piloted by Geige, Senger and Clavier. As he recovers, Joseph has nightmarish visions of past events. While Wolf is having sex with Beatrice, he asks if he too will become a monster to be hunted and killed, but she says that it is up to him. She shows him her vision of the future, dominated by Demoniacs."
		 )
	,	("Blassreiter",
		 11,
		 "Prelude to Apocolypse",
		 "Victor is informed of Wolf's condition, and that a virus is circulating through the XAT. Al and Brad inspect the new Paladin machines and Brad encounters his old squad member, Clavier. A mysterious outbreak of Amalgams has the Paladin-equipped XAT officers dispatched to a public swimming pool. Later, infected XAT personnel turn into Amalgams and begin to take over XAT headquarters, cutting off communications with the outside world, while Al and Brad free Hermann and Amanda. Clavier and Senger head back to headquarters and are ambushed by Amalgams when they arrive, but Blue emerges and attacks the Amalgams. The surviving XAT operatives are devastated when Wolf reveals that he was instrumental in the infection of XAT staff and the Amalgam outbreak in the city. Beatrice confronts Joseph and tells him that even the Bundeswehr wouldn't be able to defeat Amalgams. Mei-Fong reports back to Victor that most of XAT are dead, forcing Victor to disband the organization while the &quot;Three Knights&quot; are assembled."
		 )
	,	("Blassreiter",
		12,
		"Judgement Day",
		"The remaining XAT troops realize that they are probably infected from drinking contaminated water, except for Hermann and Amanda who were incarcerated. They decide break out and head for the heliport. Wolf announces that all XAT staff are infected and to kill them on sight. Meanwhile Beatrice defeats Joseph, but Xargin arrives and sends her on another mission. Only a few XAT troops make it to the helipad and are confronted by Wolf who and reveals his true purpose and his Blassreiter form. Hermann and Amanda manage to escape in a helicopter, thanks to the remaining XAT troops sacrificing themselves. As they leave, Mei-Fong on board an airborne mecha drops a bomb that destroys XAT headquarters and part of the city to prevent further Amalgam contamination. As their Aérospatiale Puma chopper was damaged during the bomb blast, Hermann gets Amanda to eject before it crashes to the ground and explodes with him still inside."
		)
	,	("Blassreiter",
		13,
		"Distant Memories",
		"Amanda and Joseph take refuge in an abandoned church several miles from the deserted city where he grew up. Joseph tells Amanda that he was an orphaned Outsider, a class considered inferior in German society. He endured hardship and experienced discrimination from the upper class due to his heritage, but protected and helped care for the younger children. He even accepted blame for mischievous deeds done by wealthy local children to protect the orphanage. When he was 15 years old, a flood hit the nearby town and the church's priest died while assisting and sheltering refugees. Joseph was distraught at the death of the priest and what he saw as abandonment by God, but was amazed when a young Xargin arrived with humanitarian assistance."
		)
	,	("Blassreiter",
		14,
		"A Saintly Decision",
		"Joseph continues his story, telling Amanda how while Xargin helped people at the church, it was torched by anti-Outsider rioters and Xargin was burned. When visiting Xargin in hospital, Joseph met Sasha who recognised his rosary and told Joseph that they were siblings separated at birth. At the time, Sasha was carrying out bio-engineering research at the university with nanomachines to overcome disease. To help the immigrant refugees displaced by the flood, Xargin and Joseph broke into the university for medicine, but were caught by the guards. Sasha negotiated with director Victor Stachus to have them released. After Sasha's apparent death by anti-Outsider hooligans and the deaths of Outsider children due to lack of medicine, Joseph learned that Victor was using her research to create living weapons. Angry at all the suffering, Xargin used Sasha's research to become a Blassreiter to end suffering in the world. When Joseph was injured trying to stop him, Xargin dropped some of his blood into Joseph's mouth, making him a Blassreiter. Back in the present, Amanda and Joseph are standing in the graveyard then two machines appear, piloted by Mei-Fong and Sasha, who is alive but looks different."
		)
	,	("Blassreiter",
		15,
		"The Millenary Knights of God",
		"Amanda and Joseph are taken into custody by Mei-Fong and Sasha who are working for a paramilitary organization called Zwölf, known as the Knight Templars in the Middle Ages. Commander Victor Stachus watches as Amanda undergoes Zwölf training while Joseph undergoes surgery to release his latent Blassreiter powers. Amanda learns that Victor and Mei-Fong were loaned to XAT to help fight the Amalgums. Meanwhile, the three Apocalypse Knights are launched by Zwölf after the Bundeswehr and German police couldn't contain the rise of Demoniac outbreaks. Using a particle canon they destroy almost everything and everyone within the targeted radius, then land to finish the task manually. Amanda realizes that, although Zwölf has the solution to destroying the Amalgams, he was also the responsible for their creation. Meanwhile, Wolf tries to make Al, Brad and Lene into Blassreiters by applying transfusions of his own blood."
		)
	,	("Blassreiter",
		16,
		"Reunion",
		"Amanda learns from Sacha the background to the Zwölf human weapons program. Hermann, now a Demoniac converted by Beatrice, infiltrates the Zwölf castle to rescue Amanda, but she refuses to leave. Meanwhile, Wolf leads a Demoniac force to attack the Zeppelin Air Base in order to draw the Apocalypse Knights into a trap. Above the airbase, Demoniac-manned Eurofighter Typhoons are used to intercept the Knights with Beatrice closing from the opposite direction. Hermann turns to his Blassreiter form and escapes with the 666, an experimental motorcycle, killing Zwölf defense personnel in his wake. Amanda pursues him in her XAT Paladin."
		)
	,	("Blassreiter",
		17,
		"Bellow of the Beast",
		"The Apocalypse Knights take on the Demoniac Eurofighter Typhoons and Beatrice and manage to destroy most of the airbase and escape. Meanwhile Amanda confronts Hermann in his Blassreiter form and helps him realize what he is supposed to be fighting for. While the Apocalypse Knights repair the damage and re-engage Beatrice the remaining Demoniac Eurofighter Typhoons, Hermann and Amanda head toward the airbase, to face off against Wolf and his Amalgam cadre that survived the blast."
		)
	,	("Blassreiter",
		18,
		"The Fourth Apocalypse",
		"Amanda and Hermann engage Wolf and his Amalgam cadre until Joseph arrives, but he loses control, attacking both friend and foe and the Apocalypse Knights retreat. At the United Nations, the ambassadors are concerned about the inability of German security forces to handle the Amalgams. They agree to take control of the country themselves and send in UN peacekeepers to eliminate the Amalgams. Victor tells the members of the German government that he will continue his own battle to save humankind. While trying to locate Hermann, Amanda encounters a young Blassreiter named Snow."
		)
	,	("Blassreiter",
		19,
		"Quondam Affections",
		"Snow tells Amanda about her connection with Joseph and goes to talk him out of his berserk state. Hermann and Amanda confront Wolf and the remaining Amalgam cadre at the former besieged XAT Headquarters. At some personal cost and pain, Snow confronts Joseph and helps him regain his humanity. Wolf is almost defeated when a sniper Amalgam Al shoots at the two surviving XAT officers, but seeing his name on Amanda's Paladin brings Al back to his senses and he shoots Wolf instead. Amanda and Hermann then destroy Wolf for good. Afterwards, Al kills himself because he didn't feel that coming back to life was normal."
		)
	,	("Blassreiter",
		20,
		"Legion from the Netherworld",
		"A horde of 30,000 Demoniacs head towards Zwölf under the command of Xargin with Beatrice alongside. Victor decides to send Joseph out alone to delay their advance towards Zwölf headquarters. Meanwhile Amanda and Herman gain entry to Zwölf castle in an attempt to rescue Malek. Joseph walks out to meet Xargin and Beatrice, and Beatrice attacks to prove her worth to Xargin. Changing to their Blassreiter forms, they engage in a fierce battle. Joseph wounds Beatrice is about to end her life when Xargin stops Joseph and easily subdues him despite the enhancements ordered by Victor. Xargin enters the castle and meets Sacha."
		)
	,	("Blassreiter",
		21,
		"Phantom Rider",
		"Armed Zwölf defense personnel are mobilized to ward off the Demoniac invasion on Victor's orders. Amanda and Hermann search for Malek within the complex, and find him through a clue left by Shido. Sasha challenges Xargin, but cannot kill him and Xargin proceeds to the main server room. Amanda and Hermann leave with Malek, pick up the unconscious Joseph as they depart and take refuge in a small compound managed by a nun and friend of Shido. Victor heads down to the server room to secure computer data during the invasion, but Xargin reaches the room, and casually defeats him by integrating him into the computer system."
		)
	,	("Blassreiter",
		22,
		"Drifting Hearts",
		"Sasha hands Amanda the Isis data, which contains the information about anti-nanomachines needed to defeat Xargin's Demoniac forces. Beatrice finds out about Isis, even after the data was deleted at Zwölf. Hermann finds Beatrice and attacks her but she is too powerful, and after defeating him, she goes for Amanda. Hermann calls to Malek who revives from his coma and attacks Beatrice to give Hermann time to fatally wound her before he is defeated. As Hermann dies, he is glad that Malek accepts him as an older brother. Meanwhile, United States Air Force B-2 Spirit bombers are deployed as part of the UN's mission to eliminate the Demoniacs in German soil."
		)
	,	("Blassreiter",
		23,
		"Scorched Earth",
		"Sasha, Mei-Fong and Shido work together to intercept the United States Air Force B-2 Spirit bombers and F-35A fighters and prevent them from conducting a bombing sweep of Germany to clear out all Demoniacs. At Zwölf headquarters, Victor regains consciousness and begins to merge with the electronic systems. Shido, promising that he will not let the United States do to Germany what it did to Japan, (declares &quot;no more Nagasakis, no more Hiroshimas&quot;) and sacrifices himself by destroying his Sword Rider unit, defeating the last F-35As. Sasha and her Bow Rider shoot down the remaining missile, but Mei-Fong detects ICBMs being fired from a Space weapon. Malek leaves to meet Xargin alone and the two engage each other in their Blassreiter forms. Malek is no match for Xargin and is easily defeated. Joseph, now recovered, arrives and sends Malek back to headquarters with Elea on the GARM motorcycle. After swallowing the Isis pill, Joseph prepares to confront Xargin and the two men prepare to engage one another in their Blassreiter forms."
		)
	,	("Blassreiter",
		24,
		"Promised Land",
		"Joseph and Xargin engage each other in their Blassreiter forms. Elea convinces Victor to help the only remaining Zwölf personnel, Sasha and Mei-Fong, to counter the ICBMs being fired towards Germany. Although they succeed in intercepting the ICBM attack on Germany, Sasha dies when her Bow Rider explodes from overheating after firing the long range canon and Mei-Fong is killed after engaging a spacecraft above the Earth. Victor finally dies as power to Zwölf headquarters is terminated. Xargin beats Joseph who lapses into unconsciousness. However, first Hermann and then Gerd assist him with their powers by merging with his body, but it is not enough and Xargin still defeats him. As Joseph dies, the Isis anti-nanomachines are released with its particles killing Xargin and immobilizing the Demoniacs. Five years after the events of Blassreiter, Germany has been rebuilt and the federal government reformed a new XAT. Amanda accepts a position as Captain of the Guerrilla Squad and work with Malek to protect people who have turned into Amalgams with the ability to turn to Blassreiters but who now suffer persecution."
		)
;
	
INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("Blassreiter", 0, 1, 8)
	,	("Blassreiter", 0, 2, 8)
	,	("Blassreiter", 0, 3, 8)
;
INSERT INTO ANIME(ANIME_TITLE, NUMBER_OF_EPISODES, ANIME_SYNOPSIS, ANIME_DESCRIPTION, COMPANY_NAME, COPYRIGHT) VALUES
		("Ghost Hound",
		 22,
		 "In the small town of Suiten, three boys discover they can transfer their souls to a parallel world. Each had traumatic childhood experiences… Taro Komori – haunted by the death of his sister. Makoto Ogami – traumatised by his father’s suicide. Masayuki Nakajima - tormented by the suicide of a classmate he once bullied. Together they attempt to unravel the mysteries of their outer-body experiences and gain new perspectives on their unusual lives as they grow towards adulthood and attempt to reconcile with the darkness of their collective past. When ‘ghosts’ from their unseen world manifest in their apparent ‘reality’, their lives reveal further mystery... Ghost Hound is the story of seemingly mismatched children struggling to find the truth that has been absent from their lives - from the remnants of their damaged past, to overcoming rural isolation, the ennui of adolescence and the mysteries of their seemingly paranormal childhood. A unique and strangely immersive piece of anime carrying an eerie, dream-like atmosphere with ethereal psychedelic animation reminiscent of similar work on last year’s Genius Party compilations. The experimental soundtrack lifts the intent and tone of the series and firmly establishes Ghost Hound as a work of the avant-garde.",
		 "In the small town of Suiten, three boys discover they can transfer their souls to a parallel world. Each had traumatic childhood experiences…",
		 "Siren",
		 "Ryūtarō Nakamura"
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("Ghost Hound",
		 1,
		 1,
		 "M - Medium level violence",
		 22,
		 "http://sirenvisual.com.au/index.php/shop/horror/ghost-hound-complete-series.html"
		)
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("Ghost Hound",
		 1,
		 "Lucid Dream",
		 "Tarō Komori tries to find the connection between his dreams and the traumatic event involving him and his older sister, Mizuka Komori, eleven years ago. He receives a new therapist, and the transfer student Masayuki Nakajima begins to move in on him and Makoto Ōgami."
		)
	,	("Ghost Hound",
		 2,
		 "E.M.D.R.: Eye Movement Desensitization and Reprocessing",
		 "Masayuki reveals the timeline of the kidnapping incident and theorises that there is a connection between the case and Makoto's father's death. Tarō begins E.M.D.R. therapy, which dredges up memories previously hidden."
		 )
	,	("Ghost Hound",
		 3,
		 "Phobia Exposure",
		 "Masayuki invites Tarō and Makoto to travel to the old hospital, where Tarō and Mizuka were hidden when they were kidnapped. The journey reveals many things about the three boys' pasts."
		 )
	,	("Ghost Hound",
		 4,
		 "Altered States of Consciousness",
		 "The three boys continue to explore the hospital, and more history regarding Masayuki and Makoto is revealed. Eventually, the three discover that there is something very unnatural about the hospital."
		 )
	,	("Ghost Hound",
		 5,
		 "O.B.E.: Out of Body Experience",
		 "The three learn more about astral projection and the hidden realm from Makoto, due to his knowledge from the religious group his family owns. Tarō's parents, Ryōya and Miki Komori, talk with Atsushi Hirata, his psychologist, and the three boys later meet each other in the hidden realm again."
		 )
	,	("Ghost Hound",
		 6,
		 "Brain Homunculus",
		 "Makoto looks through his father's desk and remembers the past, and Masayuki attempts his own version of phobia exposure. After meeting the old traveler Genma Saruta in his O.B.E, Tarō tries to find him the next day, and suffers a sudden narcoleptic attack on his way back. "
		 )
	,	("Ghost Hound",
		 7,
		 "L.T.P.: Long Term Potentiation",
		 "Tarō is in hospital after hitting his head on the steps near the shrine. He is visited by Masayuki and the two receive an extensive information session on the brain from Hirata and Reika Ōtori. Makoto confronts Motoi Yazaki about his parents."
		 )
	,	("Ghost Hound",
		 8,
		 "Revolution of th e Limbic System",
		 "Hirata discusses the potential reasons for Tarō's memory loss. Tarō encounters the ghost of an extinct animal and enters a dimensional rift. Hirata goes through a supernatural experience."
		)
	,	("Ghost Hound",
		 9,
		 "Existential Ghosts",
		 "Four teenagers are attacked by a black humanoid ghost near the old abandoned building where the kidnapper was run over and killed. Later, the three protagonists investigate the area in their state of O.B.E., and the spirit turns its sights on them."
		)
	,	("Ghost Hound",
		 10,
		 "Affordance/T.F.T.:Thought Field Therapy",
		 "Masayuki helps Michio Hoshino who is bullied. Later on he mentions the concept of O.B.E. to Michio. Tarō and Masayuki start asking questions about the mountain. Meanwhile, Makoto figures out that he can transform in his state of O.B.E., after witnessing Tarō and Masayuki doing the same during their previous investigation. The shinto priest Takahito Komagusu meets Saruta who hints that there are two other people besides him on the mountain."		 
		 )
	,	("Ghost Hound",
		 11,
		 "Syntax Error",
		 "A body was found floating in the dam. The so-called curse was brought up and the three protagonists learn about the story of the first four high schoolers who went to the abandoned hospital."
		 )
	,	("Ghost Hound",
		12,
		 "Homeostasis Synchronization",
		 "Takahito is called to Miyako Komagusu's school. Later, he meets and starts consulting with Hirata about Miyako. Hirata is starting to suspect that the area has something to do with the supernatural occurrences. Meanwhile Tarō sees Miyako being possessed firsthand."
		)
	,	("Ghost Hound",
		13,
		"For the Snark was a Boojum, you see.",
		"Tarō had a long O.B.E. sequence where he sees Miyako in bed with fever and meets Masato Kaibara as the Snark in the hidden realm. He goes with Masayuki, Makoto, and Michio to her house. When he mentions what Miyako said in her possessed state, Takahito becomes afraid and tells them to leave. At the bottom of the shrine steps is Noriko Kabata, the handmaiden of Himeko Ōgami, Makoto's grandmother. "
		)
	,	("Ghost Hound",
		14,
		"Emergence Matrix",
		"Takahito takes Miyako to Hirata for therapy, and Miyako later goes into her possessed state. On the way back to the shrine, Tarō, Masayuki, Makoto, Michio, Miyako, and Takahito all meet Kabata. She grabs Miyako and says that Miyako is the next miko. Miyako then goes into a trance again, and Makoto furiously curses Himeko. He runs back to his house and finds Himeko dead."
		)
	,	("Ghost Hound",
		15,
		"Toward an Abandoned City",
		"Makoto and Tarō go to Kurata for various reasons. They visit Kei Yakushi's house, and Tarō apologizes to Kei for messing up the yeast brewery process. Masayuki and Michio catch the reporter Seiichi Suzuki whose been snooping around. He was sent to investigate the biotech research facility for industry leaks. While listening to Tarō's recorded dreams, Hirata goes through Tarō's experience in the hospital."		
		)
	,	("Ghost Hound",
		16,
		"Hopeful Monster",
		"At Kurata, Tarō and Makoto meet Sanae Ōgami, Makoto's mother, and Makoto makes a failed attempt at killing her. Tarō recognizes Sanae's lover, Masato, as the Snark. Meanwhile, Masayuki discovers spirits in the biotech research facility in an O.B.E. He sees his dad speaking with Reika about his research but then he is suddenly attacked by some spirit monsters, known as hopeful monsters, by Reika's biotech laboratory assistant."
		)
	,	("Ghost Hound",
		17,
		"Implicate Order",
		"Saruta notices that the spirits are afraid of something. He warns Takahito that there people out for Miyako's powers. Tarō tells Miyako that he thinks that she is the reincarnation of Mizuka, to which really upsets Miyako. Makoto still has not returned. Suzuki notices there is a suspicious group of men around the Ōgami household."
		)
	,	("Ghost Hound",
		18,
		"Holographic Paradigm",
		"Suzuki talks with his superior about the links with the Ōgami religious group, child kidnappings, and illegal organ donations with the biotech research facility. Miyako meets Kabata, and Takahito was found bleeding on the shrine steps. The truth about the death of Makoto's father and the kidnapping of Tarō comes to light."
		)
	,	("Ghost Hound",
		19,
		"Negentropy",
		"Makoto rescues Sanae from a house fire, however Masato dies in the process. She had just woken up from a coma but her memory has regressed. Takahito is in an ICU, but Miyako does not recognize Masayuki and Tarō. Kei reminisces about Masato and how she loved him from afar. Makoto reconciles with his mother."
		)
	,	("Ghost Hound",
		20,
		"Shaman's District",
		"The Ōgami religious group is allowed to have care of Miyako. Biotech research has been published ahead in other countries ahead of the research of Yasuhiro Nakajima, Masayuki's father. Makoto talks with Suzuki and finds links with the Ōgami religious group with an underground group. Tarō goes to the hidden realm to find Yasuhiro. Reika's assistant releases mutants, used from Yasuhiro's research, into the dam. People are coming down from the mountain to the Ōgami house."
		)
	,	("Ghost Hound",
		21,
		"Stochastic Resonance",
		"Makoto is staying at Tarō's house and Ryōya gives Makoto the guitar that was originally owned by Makoto's father. Takahito wakes up, but he was threatened. Hirata and Reika meet up with Tarō, Masayuki, Makoto, Michio, Suzuki, and Saruta at the shrine. Tarō vows to save Miyako."
		)
	,	("Ghost Hound",
		22,
		"Passage",
		"Makoto and Masayuki help devise a plan to allow Tarō to enter the shrine where Miyako is being held as the leader of the Ōgami religious group. Only women and girls are allowed to enter, so the boys plan on dressing Tarō up as a young female so that he may enter and rescue Miyako. Hirata and Reika also assist in carrying out the plan."
		)
;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("Ghost Hound", 0, 1, 8)
	,	("Ghost Hound", 0, 2, 8)
	,	("Ghost Hound", 0, 3, 6)
;
INSERT INTO ANIME(ANIME_TITLE, NUMBER_OF_EPISODES, ANIME_SYNOPSIS, ANIME_DESCRIPTION, COMPANY_NAME, COPYRIGHT) VALUES
		("Un-Go",
		 11,
		 "He pursues his job as the &quot;Last Great Detective&quot;. Others call him the &quot;Defeated Detective&quot;. What's certain is that he's Shinjurou Yuuki, a young man with a passion for mysteries and a talent for solving them which has made him the target of dark forces now stirrin within the sinister underworld of a near future Tokyo. That could prove lethal, given that not even the other &quot;good guys&quot;, including the police, are exactly on Shinjouro's side. Fortunately Yuuki's not completely on his own, and with the aid of his uniquely talented associate Inga, he's ready to cut a swath through the veils of secrecy that have been laid before him. Get ready for mind against matter and a lot of cloak and dagger as the ultimate battle of clue and deduction begins in UN-GO!",
		 "He pursues his job as the &quot;Last Great Detective&quot;. Others call him the &quot;Defeated Detective&quot;. What's certain is that he's Shinjurou Yuuki, a young man with a passion for mysteries and a talent for solving them which has made him the target of dark forces now stirrin within the sinister underworld of a near future Tokyo.",
		 "Siren",
		 "Seiji Mizushima"
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("Un-Go",
		 1,
		 1,
		 "M - Animated violence and sexual references",
		 11,
		 "http://sirenvisual.com.au/index.php/shop/un-go.html"
		)
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("Un-Go",
		 1,
		 "Murder at the Ball",
		 "Kaoru Kanou, a corporate president who is under suspicion for arrest, holds a ballroom event. Among the invitees are detective Shinjuurou Yuuki; his strange partner, Inga; and Rie, the daughter of JJ Systems Chairman Rinroku Kaishou. During the event, Kanou walks onto the podium to profess his innocence, and falls dead just as he walks into the spotlight. Koyama finds that Kanou was murdered by a knife in his back. Kanou's wife blames the government for killing him, blaming a female SP officer, who was found shot dead in an elevator, for the assassination. However, Shinjuurou debunks this, questioning why the SP officer had her jacket next to her and a bullet in her chest. After deducing that Kanou's wife was the killer, Inga asks her, &quot;What was your husband to you?&quot; Compelled to answer, Kanou's wife states that Kanou was a hero for supporting Japan during the war. Not wanting to let the government arrest him, Kanou's wife killed the SP officer, impersonated her, and killed Kanou to ensure that he would die as a hero."
		)
	,	("Un-Go",
		 2,
		 "Pitiless Song",
		 "A wealthy woman named Hisako Osada is found murdered in a briefcase that was delivered to her home. While the police suspect Hisako's lover to be the culprit, her daughter, An, believes someone else is behind the murder and calls on Shinjuurou to investigate. Their investigation leads them to look into an idol group Hisako managed named Yonagahime 3+1, one of its members of which, Eri, was allegedly killed in a terrorist attack. Inga uses her powers on one of Yonagahime's members, who reveals that Eri never existed and was just used by Hisako to skyrocket the band's popularity during the war. After analyzing Eri's vocal data, Shinjuurou deduces the culprit to be An, who wasn't allowed to publicly sing due to her vocal data being used for Eri."
		 )
	,	("Un-Go",
		 3,
		 "Masked Mansion",
		 "Rie calls on Shinjuurou and Inga to accept a request from Mitsuko Sasa, whose adopted brother Kazamori caught on fire and died, allegedly related to a curse from her father, Komamori, who died in a similar manner seven years ago. As Izumi's group conducts their own investigations on the cause of Kazamori's death, Inga uses her powers to reveal that Kazamori not human. Shinjuurou prompts Kazamori to show &quot;himself&quot;, revealing that &quot;he&quot; is actually a computer program."
		 )
	,	("Un-Go",
		 4,
		 "House, Unmasked",
		 "Kazamori is revealed to be an R.A.I., one of the last created by Komamori before they were outlawed. As Kazamori is accused of killing the corpse that was assumed to be him, Shinjuurou and Inga download Kazamori into a panda toy before he is taken into custody. After discovering that the corpse was Dr. Taku, and that the Dr. Taku who was injured was a robot puppet, Shinjuurou and others soon discover the culprit is Komamori. He'd faked his death using the body of the real Dr. Taku so that his R.A.I. wouldn't be used by the JSDF. After Komamori is arrested by Izumi, Kazamori moves her consciousness to her main body."
		 )
	,	("Un-Go",
		 5,
		 "The Phantom Statue",
		 "At the unveiling of a statue created in memory of three youths who sacrificed themselves to dispose of a bomb in a press conference, two people who were snuck in to try and unveil a purported scam behind the story are found murdered inside the statue. Shinjuurou initially suspects the statue's commissioner, Hakuro Shimada, as the murderer, but Inga's question proves his innocence. After a brief depression and a pep talk from Kazamori, Shinjuurou deduces the culprit to be the statue's creator, Youko, who killed the men before they were transported, before later revealing the location of gold bricks that Hakuro had hidden."
		 )
	,	("Un-Go",
		 6,
		 "The Code Too Simple",
		 "Shinjuurou is approached by Yajima, an old friend of Rinroku, who found a piece of manuscript in a book given to him by an inmate while he was in prison. After discovering Yajima's wife Takiko's fingerprints on the paper, Shinjuurou informs Rie, who investigates how the book relates to Rinroku. Shinjuurou later hears from Yajima about how his children disappeared and his wife went blind, allegedly having an affair with Rinroku. Shinjuurou looks at all the books Rinroku bought from the Yajima family, finding more hidden codes which are revealed to be from Yajima's children. As it turns out, Rinroku had helped the children and placed them in child care to avoid Takiko's neglect, and they are soon reunited with Yajima. Afterward, Shinjuurou confronts the prisoner who gave Yajima the book, learning something shocking."
		 )
	,	("Un-Go",
		 7,
		 "Daydream",
		 "As the prisoner explains how he is 'a novelist who writes in reality', a strange being accompanying him traps Shinjuurou in a vision where he is a cameraman shooting a film about a war that never happened. As Shinjuurou becomes curious about whether the director is involved with one of the actresses, he gets the nagging feeling that there's a mystery to be solved. As Shinjuurou loses grip on this reality, he discovers the director has been killed and believes himself to be the culprit."
		 )
	,	("Un-Go",
		 8,
		 "The King of Paradise",
		 "After determining that Shinjuurou had been imprisoned, Rie accompanies Izumi to the prison, where they are both put under the novelist's spell and become characters in his 'novel' alongside Shinjuurou. As Inga determines this is the work of a deity known as Bettenou, Kazamori manages to make use of a pair of taser handcuffs to snap Shinjuurou back to reality. Shinjuurou investigates into the real murder, determining the culprit to be one of the 'actresses', who killed the 'director', who was actually a security guard trying to help her escape, because she believed she was being cut from the movie. Meanwhile, Inga gets the truth out of the novelist while Bettenou disappears."
		)
	,	("Un-Go",
		 9,
		 "Rinroku Kaishou's Crime",
		 "As Shinjuurou wonders where Bettenou has disappeared to, a hacking group known as Full Circle is spreading leaks of Rinroku's company and lifestyle. As Rinroku makes an appearance on television show along with various people from rival companies, an explosion occurs when he exits the room, hospitalizing everyone including Rinroku, while another Rinroku appears at Rie's house. As Rie asks Shinjuurou to prove Rinroku's innocence the next day, Inga comes face to face with Bettenou. After Shinjuurou hears about the second Rinroku from Rie, he deduces that this is the work of Bettenou and believes Rinroku to be the one using her. He gets help from a rookie Diet member to have the hospitalized Rinroku provide a testimony on the leaks."
		)
	,	("Un-Go",
		 10,
		 "Rinroku Kaisho's Funeral",
		 "As Rinroku is interviewed via a live video feed, Shinjuurou has Rie tell everyone about the Rinroku that appeared in her home at the time of the explosion. To Shinjuurou's surprise, Inga is called in as a witness to question Izumi, forcing her to reveal secrets about Rinroku's involvement in illegal software used prior to the war. As the hospitalized Rinroku is discharged, he is killed in a car explosion. After speaking with Rie, Shinjuurou suspects something is amiss and manages to learn more about Bettenou from the novelist, further founding his theory that Rinroku used Bettenou's power to fake his death."
		 )
	,	("Un-Go",
		 11,
		 "I'm Just Searching",
		 "Shinjuurou, along with Rie, Izumi and some others, receive strange invitations supposedly sent by Rinroku. They are brought together at a table where they are presented with weapons, Shinjuurou believes that the imposter Rinroku was the one who appeared at Rie's home, deducing that the Diet member and Rinroku's bodyguard caused the explosion. It is at this point that Rinroku himself seemingly appears with Inga, only for Shinjuurou to deduce that he is actually Izumi's assistant, Hayami Seigen, using Bettenou's power, with the real Rinroku having disguised himself amongst the attendees, having previously faked his death. After a fierce battle, Inga defeats Bettenou and devours her. After the incident, Shinjuurou begins telling his story to Rie, including the origin of Inga's current body."
		 )
;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("Un-Go", 0, 1, 4)
	,	("Un-Go", 0, 2, 4)
	,	("Un-Go", 0, 3, 3)
;
INSERT INTO ANIME(ANIME_TITLE, NUMBER_OF_EPISODES, ANIME_SYNOPSIS, ANIME_DESCRIPTION, COMPANY_NAME, COPYRIGHT) VALUES
		("Nadia: The Secret of Blue Water",
		 39,
		 "The World's Fair, Paris, 1889: a young inventor crosses paths with an enigmatic girl and her pet lion. Suddenly they find themselves pursued by villainous trio intent upon stealing the magical Blue Water... Thus begins an epic adventure inspired by Jules Verne's masterpiece 20,000 Leagues Under the Sea. Join Nadia and Jean as they travel the high seas in search of Nadia's homeland and her past, their only clue the mysterious jewel Nadia wears. Can they unravel the Secret of the Blue Water before it is too late? Discover Nadia, Secret of Blue Water and find out for yourself!",
		 "Remember when anime was painted with ink and blood/sweat/tears? We do. It ruled. This is a sterling example...",
		 "Siren",
		 "Hideki Anno"
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("Nadia: The Secret of Blue Water",
		 1,
		 1,
		 "M - Mature themes, mild violence",
		 39,
		 "http://sirenvisual.com.au/index.php/nadia-secret-of-blue-water.html"
		)
	,	("Nadia: The Secret of Blue Water",
		 2,
		 1,
		 "M - Mature themes, mild violence",
		 39,
		 "http://sirenvisual.com.au/index.php/nadia-secret-of-blue-water-complete-series-blu-ray.html"
		)
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("Nadia: The Secret of Blue Water",
		 1,
		 "The Girl at the Eiffel Tower",
		 "It is the first day of the Paris World Exposition in 1889. 14-year-old Jean Rocque Raltique, a brilliant young inventor, arrives at the fair to participate in a flying contest with his uncle. He is distracted, however, when he notices a 14-year-old mysterious dark-skinned girl pass by on a bicycle. Jean follows the girl, known as Nadia, to the Eiffel Tower and tries to make friends with her, but she acts cold and aloof. Just then, three bandits -- 28-year-old Grandis Granva, a fiery-tempered woman and her two 27-year-old sidekicks, vain, arrogant Sanson, and pudgy, nerdy Hanson -- appear and attempt to kidnap Nadia, but she escapes. Jean later finds Nadia performing at a circus across town and is instantly smitten with her performance. At the end of the show, the Grandis gang appear and take Nadia from her (unsympathetic) ringmaster through bribery and pretending to be her sister. After a wild chase, Jean rescues Nadia and earns her trust. Learning she has no place to go, he decides to take his new friend to his home in Le Havre."
		 )
	,	("Nadia: The Secret of Blue Water",
		 2,
		 "The Little Fugitives",
		 "Using one of his inventions -- a boat that can shift into an automatic hydrofoil ship -- Jean successfully makes another escape from the Grandis gang, who are pursuing the pair in their multi-purpose tank, the Gratan. He takes Nadia to his aunt's house in Le Havre, but his grumpy, dour Auntie refuses to take Nadia in. Jean decides to take Nadia to his workshop in Le Havre, and she spends the night there. All the while, Jean learns from Nadia that she wishes to return to the country where she was born. Unfortunately, she has no idea where it is, but her pet lion King suspects it might be in Africa. Jean decides to take Nadia there himself using his all-new aircraft, and they make yet another escape from the Grandis gang. They do not get far, however, when the plane engine falters and the crafts plummets into the ocean."
		 )
	,	("Nadia: The Secret of Blue Water",
		 3,
		 "The Riddle of the Giant Sea Monsters",
		 "Jean, Nadia, and King are rescued from the ocean by a passing American battleship called the Abraham. Its captain, Melville, and his first mate Holland, are on the trail of a supposed &quot;sea monster&quot; responsible for sinking countless ships in the Pacific Ocean. Jean is intrigued to be aboard the vessel, but Nadia is gravely suspicious. While on the ship, they also meet Ayerton Grenavan, a flamboyant &quot;scientist&quot; who claims to be funding the pursuit. That night, the Abraham is attacked by a mysterious and dangerous presence. A torpedo finally strikes the Abraham, causing Jean, Nadia, King, and their aircraft to be thrown overboard into the ocean again."
		 )
	,	("Nadia: The Secret of Blue Water",
		 4,
		 "Natutilus, The Fantastic Submarine",
		 "Adrift on the ocean, Jean, Nadia, and King are once again rescued by another vessel — a mysterious submarine commanded by Captain Nemo and his first officer, Electra. The children are kept aboard the submarine for three days while Nemo and his command crew pursue an enemy submarine (the same &quot;sea monster&quot; that wrecked the Abraham). Eventually, Jean, Nadia, and King are released from the submarine and they set off into the sky on Jean's newly revamped aircraft. Before leaving, the children learn that the submarine is known as the Nautilus."
		 )
	,	("Nadia: The Secret of Blue Water",
		 5,
		 "Marie's Island",
		 "While airborne, Jean, Nadia, and King are shot down from the skies and crash-land onto an unfamiliar island. There, they rescue a 4-year-old lonely little girl named Marie, who tells them that her parents have been shot down by a murderous army of masked soldiers. Soon the children are forced to flee from the same soldiers. Marie takes her new &quot;guardians&quot; to a secluded cave containing blankets and supplies. That night, Jean and Nadia bury Marie's fallen parents and tearfully confess to the latter that her parents are dead. Meanwhile, the Grandis gang, having washed up on the island themselves, are taken captive by the soldiers and taken to a shadowy base where they are questioned by the soldiers' commander about the Blue Water, Nadia's pendant."
		 )
	,	("Nadia: The Secret of Blue Water",
		 6,
		 "Infiltration of the Secret Base",
		 "Investigating the island, Jean discovers a trail of power lines leading to a power plant situated in a deep crater at the center of the island. He also witnesses an escaping villager brutally killed by the pursuing soldiers. The next day, Marie and King wander outside the cave to collect flowers (Jean and Nadia debating about their next move -- should they rescue the people on the island or not?) and are captured by the soldiers. Jean and Nadia follow them to the crater and find themselves in a complex of factories, where the villagers are forced to work as slaves. They also recognize the &quot;sea monster&quot; as another submarine, known as the Garfish, operated by the soldiers' ruthless ringleader, Gargoyle. While Gargoyle investigates a powerful artifact needed to complete his secret weapon, Nadia's Blue Water is accidentally set off, forcing the children to escape from the factories. To save Jean from being killed, Nadia gives him the Blue Water and turns herself in. Jean promises to rescue her."
		 )
	,	("Nadia: The Secret of Blue Water",
		 7,
		 "The Tower of Babel",
		 "Captured by the soldiers (also known as the Neo Atlanteans), Nadia is taken before Gargoyle, who implies that he has known Nadia since she was a baby. He demands his captive to reveal the whereabouts of the Blue Water. When Nadia refuses to obey, Gargoyle threatens to kill both Marie and King. With no choice, Nadia reluctantly admits that Jean has it. The soldiers begin to search the complex for Jean, while the Grandis gang decides to escape. Both sides inadvertently come across each other when they board a freight train bound for Gargoyle's castle. Gargoyle tours Nadia around the compound and introduces its center — a spiral tower known as Babel, which can obliterate anything in its path. That evening he forces Nadia to witness the tower's awesome powers as it demolishes an island in the distance. Out at sea, Captain Nemo sees the same explosion and declares that Gargoyle has &quot;finally released the great abomination.&quot;"
		 )
	,	("Nadia: The Secret of Blue Water",
		 8,
		 "Mission to Rescue Nadia",
		 "In an unexpected turn of events, Jean joins forces with the Grandis gang to infiltrate the compound and rescue Nadia. They almost succeed… until Gargoyle's submarine, Garfish corners them at the intake point. Just when it all looks hopeless, the Nautilus rises from the ocean and attacks the Garfish, allowing the companions to make their escape. In the end, Gargoyle attempts to fight back using the Tower of Babel… but it demolishes his compound instead. The islanders are freed, but Gargoyle makes his getaway on a dirigible."
		 )
	,	("Nadia: The Secret of Blue Water",
		 9,
		 "Nemo's Secret",
		 "The companions are taken aboard the Nautilus by Captain Nemo in gratitude for their bravery against Gargoyle, and to repair the damage the Gratan has taken. Jean and Hanson are thrilled to be aboard the Nautilus because they are intrigued by its technology and wonders, but nobody shares their enthusiasm. Grandis catches a cold and is treated by the doctor. When Captain Nemo and Electra stop by medical bay to check on the sick patient, Grandis falls hopelessly in love with Nemo… much to the dismay of Sanson and Hanson. Later, Nemo crosses paths with Nadia for the first time and acts quite surprised when he sees her… and her Blue Water. It turns out that Nemo happens to have a Blue Water of his own -- a larger one with a missing indent."
		 )
	,	("Nadia: The Secret of Blue Water",
		 10,
		 "A Crowning Performance by the Gratan",
		 "The Nautilus pursues Gargoyle through the LeMar Straits until it runs into a dangerous trap. The submarine is surrounded on all sides by a field of mines, which can be triggered should the underwater current shifts or if the submarine dares to move. In a race against time, Grandis, Sanson, and Hanson propose to use their Gratan to take out three of the mines so that the Nautilus can safely escape from Gargoyle's trap. However, Sanson knocks Grandis out, fearing for her safety. He and Hanson set aboard the Gratan and begin their mission, but the tank begins to malfunction. Jean, who has sneaked aboard the tank, helps the pair as best as he can, but soon the Gratan's underwater camera shatters, leaving the Gratan blind. With Grandis communicating from the Nautilus bridge, the trio barely manages to succeed and save the submarine from a deadly fate."
		 )
	,	("Nadia: The Secret of Blue Water",
		 11,
		 "New Recruits for the Nautilus",
		 "Jean, Nadia, and the others are appointed as apprentice crew members aboard the Nautilus, each assigned to a different position. Jean, Sanson, and Hanson are given lessons by Sonar Officer Eiko Villan about the Nautilus, Marie and King are schooled by Electra (much to the little girl's infuriation), while Grandis and Nadia work in the rather extraordinary kitchen. Grandis tries to impress Nemo by cooking a (rather ugly) platter of fish, but things don't go as she expects. Later, King snatches Grandis' own dinner and there is a wild chase which results with King ending up in the Nautilus's forbidden engine room. When Jean retrieves him, Nemo explains that the Nautilus is powered by a particle annihilation engine that could potentially take them up to the stars… but also destroy the world if used improperly."
		 )
	,	("Nadia: The Secret of Blue Water",
		 12,
		 "Grandis and Her First Love",
		 "The Nautilus stops by an island for shore leave to take on new supplies. Humorous complications ensue as Jean accidentally stumbles into Nadia changing into her swimsuit (but they later go on a walk on the beach), Grandis and Electra get into a jealous rivalry for Nemo's love, while Nemo remains oblivious. While Jean goes off on a hunting expedition with Sanson and the others, Nadia bonds with Grandis as the latter explains about a tragic past. As a child, Grandis had grown into a wealthy family and was courted by a handsome man who turned out to be a swindler. She subsequently became obsessed with jewels, which explains why she was chasing after Nadia's Blue Water. But now that she has met Captain Nemo, she no longer sees Nadia's jewel as valuable. That night, the hunting party returns and Sanson throws down the main catch -- a murdered baby deer. Nadia is quite upset about this and leaves the camp."
		 )
	,	("Nadia: The Secret of Blue Water",
		 13,
		 "Run, Marie, Run!",
		 "Nadia is still angry with everyone over eating the deer, turning a deaf ear to Jean's attempts to reason with her. When Marie innocently states that she &quot;made a grave for the baby deer&quot;, Nadia gives the little girl a nasty stare. Marie backs off. Together with King, Marie frolics around the island until she gets hopelessly lost -- and far away from camp. They soon discover that Neo-Atlanteans are also at the island and are chased. Marie and King become separated during this adventure. Pursued by a monstrous robotic giant with a mechanical claw, Marie is rescued by Sanson and they struggle to outrun the giant. After a thrilling chase on a mine cart, the pair barely returns to camp unscathed. The walker crashes after them and its pilot emerges from the cockpit, threatening to kill everyone. When the soldier almost shoots Nadia, Nemo takes his revolver and takes him down. Nadia is furious with Nemo for doing so, despite the latter insisting that a soldier was aiming at her."
		 )
	,	("Nadia: The Secret of Blue Water",
		 14,
		 "The Valley of Dynicthus",
		 "As the Nautilus resumes its pursuit of Gargoyle, both Marie and Nadia become seriously ill from a tropical fever that will claim their lives in two days time if they are not cured. The only hope for a cure is in the depths of Reef 64. Alarmed to learn that Nadia is in danger, Nemo decides to change course, much to Electra's infuriation. Accompanied by Nemo, Jean, Sanson, Hanson, and King set off into a dangerous trek through the underwater domain of Reef 64. They find the herb in a cave situation on the opposite side of a cliff face. On their way back, however, they are attacked by a monstrous eel called a &quot;Dinicthys.&quot; Jean and King bravely attempt to draw the Dinicthys away from their position by throwing their diving suits' lights into a void. Thanks to help from Nemo, they succeed, and the girls are cured."
		 )
	,	("Nadia: The Secret of Blue Water",
		 15,
		 "The Nautilus Faces Its Biggest Crisis",
		 "Several days later, the Nautilus falls into an even deadlier trap. First, mines drift into the submarine's intakes and disrupt its engines. Then torpedoes narrowly miss the submarine. A Garfish rams into its side, only to have its nose crippled, and the submarine drifts away, exploding. When the Nautilus attempts to surface, it is surrounded by the American fleet, commanded by vengeful Captain Melville, who has received an anonymous tip that the submarine is responsible for sinking the ships. (Naturally, the &quot;source&quot; of this information is Gargoyle.) The subsequent damage causes the Nautilus to drift to the bottom of the ocean. Because the American fleet wants to see them destroyed, the Nautilus is forced to stay underwater until the fleet departs. Prior to this, a genial sailor named Ensign Fait gives Jean a bouquet of manmade flowers to offer as a present to Nadia, but she rudely turns it down (it reminds her of the flowers from Gargoyle's garden). In the aftermath of the attack, Fait is trapped inside an engine room poisoned by leaking gas, but Nemo orders the room sealed off so as to prevent further damage. Jean is crushed beyond grief as he painfully listens to his new friend die."
		 )
	,	("Nadia: The Secret of Blue Water",
		 16,
		 "The Mystery of the Lost Continent",
		 "To honor their fallen comrades, the Nautilus sets course for the underwater graveyard of Atlantis. On the way, Nadia begins to question everything that has happened and wonders why she was chosen to wield the Blue Water. Jean learns from Sonar Officer Eiko that the latter was a survivor on a French ship which was sunk by the Garfish. The boy is traumatically shocked when he adds that its captain is none other than his missing father. As the coffins are prepared for burial, Jean wanders off alone and throws away his wrench, deciding that he no longer wishes to invent if technology is so dangerous. Nadia is sad to see him so gloomy and tries to cheer him up. She succeeds by reminding him of the promise he made to her when they were in France. The episode ends when Fait and his comrades are laid to rest in the soil, with Nadia crying on Jean's shoulder."
		 )
	,	("Nadia: The Secret of Blue Water",
		 17,
		 "Jean's New Invention",
		 "Jean feels like the Nautilus crew is treating him like a kid and becomes eager to grow up. However, Nemo refuses to make him a crew member, while Electra, and the Grandis gang discourage him even further. Jean is at a loss, until Nadia offers that she has interest in flying again… &quot;only in a craft built by Jean.&quot; Inspired, Jean decides to build another aircraft. He aspires to do so all by himself without the help of any grown-ups… a task that he finds more difficult than he anticipated when he can't get an engine to work. Even so, he refuses help from Hanson, straining his friendship with the latter. Later, however, Jean has a change of heart and decides to ask Hanson for help on making the finest aircraft he can. The aircraft is completed, and Jean takes Nadia on a joyous flight above the clouds. In doing so, he manages to impress Nadia and reassure her that he will get her to Africa someday."
		 )
	,	("Nadia: The Secret of Blue Water",
		 18,
		 "Nautilus vs. Nautilus",
		 "To repair the damage caused by the last attack from Gargoyle, Captain Nemo orders the Nautilus to set sail for Antarctica. The passengers are mortified by the thought, especially Sanson, who goes into an exaggerated tirade on what an unstably icy place Antarctica really is. Jean, however, is quite excited by the idea of traveling to a new place. When the submarine arrives at Antarctica, an ancient &quot;shellfish&quot; squid latches onto the Nautilus and threatens to destroy it. The Nautilus attempts to get rid of it by ramming into an iceberg, to no avail. They finally succeed in losing their menace by steering toward an explosive underwater volcano. Unable to endure the excruciating heat, the shellfish lets go and drifts away. The Nautilus then travels through a tunnel to its subterranean base. "
		 )
	,	("Nadia: The Secret of Blue Water",
		 19,
		 "Nemo's Best Friend",
		 "While repairs are made to the Nautilus, Nemo takes Jean and Nadia on a tour of his base. They discover wondrous sights -- a massive world tree, frozen dinosaurs, &quot;moving&quot; walkways, and a chamber filled with penguins. But the most spectacular sight of all is a massive (and ancient) whale named Irion, who happens to be close friends with Nemo. When Nadia speaks to the whale, he reveals that the latter will soon find her father… as well as her own brother. The children then witness a breathtaking aurora on the surface of Antarctica with Captain Nemo. The episode ends with Jean sharing his newest invention with Nadia and Marie -- a machine that creates ice cream, using the ice from Antarctica."
		 )
	,	("Nadia: The Secret of Blue Water",
		 20,
		 "Jean Makes a Mistake",
		 "Jean constructs another invention -- a miniature glider powered by a rocket for take off from the Nautilus's deck. Unfortunately, during the test flight, the engine backfires and the glider spirals out of control, finally exploding in the sky. The crew panics, fearing that Gargoyle will probably discover them because of this incident. Sure enough, they are proven right, because Nemo and the others are forced to take down more Garfish submarines. Afterwards, Nemo warns Jean to be more careful with his inventions. Nadia is infuriated to see Jean take Nemo's reprimand without the slightest impulse to stand up for himself, but she goes too far in trying to stand up for him and is slapped by Nemo, especially when she insults him and his crew. Furthermore, Nadia's burgeoning jealousy over Jean's friendship with Electra intensifies… until she finally learns from the latter that she is in no danger of losing Jean. Electra only considers Jean like a little brother she once lost years ago to an attack by an evil man. Nadia recognizes the murderer as Gargoyle, and begins to realize the error of her misjudgment."
		 )
	,	("Nadia: The Secret of Blue Water",
		 21,
		 "Farewell Nautilus",
		 "Trapped in the Kermodec Trench by Gargoyle, the Nautilus barely survives a torpedo assault by six Garfish. Nemo retaliates with a torpedo attack that demolishes the fleet. But Gargoyle springs his newest ace: a super-charged, magnetic weapon called &quot;SeaNet Beam Gun.&quot; With excruciating power it literally drags the Nautilus out of the ocean and draws it inexorably toward Gargoyle's Neo-Atlantean battleship in the sky. Then the Nautilus takes devastating damage from the battleship's &quot;atomic vibrator&quot;, which all but compromises the submarine's power. Electra suggests self-destructing the Nautilus so as to take them all down with Gargoyle, but Grandis objects, stating that the &quot;real&quot; reason she's doing so is because she &quot;wants to die with Captain Nemo because you know he will never love you!&quot; The Grandis gang pretends to make a getaway in the Gratan but actually perform another heroic rescue by compromising the battleship's missile tube by blasting one of its annihilation bombs just before it hits the Nautilus. Furthermore, Jean rescues Nadia (again) when the latter unwisely tries to surrender herself to Gargoyle (in order to stop the fighting) by using his spare glider. Then the Nautilus engineers manually launch their last missile, which destroys Gargoyle's deadly weapon. The compromised submarine splashes into the ocean and disappears underwater into a whirlpool. Gargoyle, knowing Nemo is doomed, orders another Garfish fleet to finish them off for good."
		 )
	,	("Nadia: The Secret of Blue Water",
		 22,
		 "Electra the Traitor",
		 "To save themselves from being totally destroyed by the remaining Garfish fleet, the Nautilus severs its combat block from the main unit, which self-destructs, taking the enemy submarines with it. To save the children, Nemo relocates them to his personal cabin, warning that they will be jettisoned from the doomed Nautilus. Returning to the bridge, Nemo is confronted at gunpoint by Electra, who shoots his arm. Trapped in the cabin, Jean and Nadia listen in shock as Electra describes her tragic past. Thirteen years ago in the kingdom of Tartessos, Nemo's wife, the Queen, was killed in an attack by ruthless rebels led by Gargoyle and his puppet liege, Emperor Neo. Gargoyle attempted to unlock the Tower of Babel's ancient power, but Nemo put a stop to it by removing the Blue Water from its control device. The tower self-destructed and washed away all of Tartessos in seven days. Electra also lost her parents and little brother. Two nights later she was rescued by Nemo. She gradually fell in love with him… until she learned that the latter was responsible for the destruction of Tartessos and the deaths of the innocent people who lived there. Despite her grudge, however, Electra remained loyal to Nemo in mutual understanding of his goal to take down Neo-Atlantis. However, she admits that she was also jealous of Nadia, fearing that the latter would &quot;steal Nemo's heart&quot; away. It is at this point that Nadia realizes that Nemo is actually her father, much to her shock, and she begins to regret the way she treated him. Angry that Nemo has supposedly &quot;gone back to being an ordinary father&quot; and not sacrificing himself to stop Gargoyle, Electra has lost control and attempts to shoot Nemo again. But Nemo admits that he is merely fighting to atone for his sins and that he couldn't self-destruct the Nautilus because he cares about Electra and doesn't want to her to suffer the same fate. Ashamed and humiliated, Electra attempts to shoot herself, but Nemo stops her. He then releases the children from the crippled Nautilus, saying &quot;Live, Nadia! Live!&quot; "
		 )
	,	("Nadia: The Secret of Blue Water",
		 23,
		 "Young Drifters",
		 "Jean, Nadia, Marie, and King are shipwrecked and washed ashore on a beach that turns out to be a deserted island. After much discussion, they decide to stay and make it their home. "
		 )
	,	("Nadia: The Secret of Blue Water",
		 24,
		 "Lincoln Island",
		 "Nadia rudely awakens Jean and Marie and takes charge, naming their new home &quot;Lincoln Island&quot; after the president of the same name. Then she abandons them and declares to “live with nature in the forest.” Unfortunately, surviving against nature without the benefits of Jean’s technology proves to be much more difficult than she expects. Indeed, her only method of finding food is to steal rations the children have taken from Nemo's cabin. Nadia almost drowns when she attempts to reclaim a hologram from Nemo's cabin, but Jean and Marie rescue her. Nadia is furious at both of them, however, because they have caught fish (she would rather have been saved by them). Marie calls Nadia out for her stubbornness, declaring they all would have starved to death otherwise."
		 )
	,	("Nadia: The Secret of Blue Water",
		 25,
		 "The First Kiss",
		 "Because Nadia has stolen food from their camp, all they have left to eat is meat. Nadia refuses to cooperate and declares instead to starve. Later she becomes desperate and finds a can of spinach. Unfortunately the spinach is rotten and Nadia falls ill. Searching for a cure, Jean ends up in a cave where he becomes stoned by hallucinogenic mushrooms, causing him to fall into a trance. Later, Nadia gives Jean his first real kiss — not realizing that he is too delirious (as a result of the aforementioned mushrooms) to know about it."
		 )
	,	("Nadia: The Secret of Blue Water",
		 26,
		 "King, the Lonely Lion",
		 "Nadia spends a whole day being romantic with Jean, culminating with another kiss under the stars -- until Jean thinks it's their first time, much to her infuriation. Jealous of the attention Nadia is giving Jean, King runs away (especially after Marie abuses him). When Jean sets off to find him, he steps off a cliff and falls to the ground, and has an extensive dream sequence in which he is unveiling invention after invention before an adoring Nadia and Marie. Among his inventions are a gravity bomb and another highly advanced flying machine (straight out of Thunderbirds). "
		 )
	,	("Nadia: The Secret of Blue Water",
		 27,
		 "The Island of the Witch",
		 "A typhoon strikes Lincoln Island, and King is blown away into the night. In the aftermath of the storm, the children are surprised to discover a floating island drifting to their shore. When they explore the island -- which turns out to be a rather bizarre tropical paradise of trees of every sort, desert dunes, and shifting weathers, the children spot both King as well as Ayerton, who tells them crazy stories about the island and reveals he ended up ashore when the American Navy sunk the Nautilus. He warns them that there is a deep mystery at the heart of the island."
		 )
	,	("Nadia: The Secret of Blue Water",
		 28,
		 "The Floating Island",
		 "A giant appears out of nowhere and terrorizes the companions… which turns out to be the Gratan disguised in cloth, and sure enough, Grandis, Sanson, and Hanson are there. The children decide to stay with their friends and are soon living together like a family. Nadia even tries to cook for Jean (perhaps to make amends for all the trouble she caused him)."
		 )
	,	("Nadia: The Secret of Blue Water",
		 29,
		 "King vs. King",
		 "Sanson and Hanson get into an argument that turns into a race between two mechanical lions resembling King. In between this, Nadia finally reveals why she dislikes eating meat so much: years ago when she was in the circus, her friend Smoky, a goat, was taken away because he was too old to do anymore labor. The subsequent incident caused Nadia to understand what animals say. She adds that seeing people eat meat is like watching a friend being murdered."
		 )
	,	("Nadia: The Secret of Blue Water",
		 30,
		 "Labyrinth in the Earth",
		 "Four months later, the Gratan has finally been repaired and the companions will soon set off for Africa. But first the balloon must be repaired. While Ayerton tries to seduce Grandis, Jean and Nadia make a remarkable discovery about their island home: there is an underground factory which resembles their former subaquatic home. While exploring, Nadia falls into a trance and mysteriously disappears behind a wall, leaving her clothes in Jean's hands."
		 )
	,	("Nadia: The Secret of Blue Water",
		 31,
		 "Farewell Red Noah",
		 "Trapped in a strange void, Nadia comes into contact with a mysterious voice who tells her that she is actually aboard Red Noah, a satellite city that descended to the depths of the ocean 2,400,000 years ago. Communicating with the mysterious identity, Nadia learns that she is, in fact, an heir to the throne of the Atlantis… and that she is not a human being. Furthermore, her real birthplace turns out to be Old Tartessos, the ancient kingdom Atlantis that was destroyed thirteen years ago. After learning about the history of her people, Nadia is told that she will be taken to the underwater kingdom of Atlantis to &quot;guide the lost souls toward its restoration.&quot; The island begins to collapse and crumble, and the companions are forced to flee. But Jean stays behind and bravely returns to the same place where Nadia disappeared moments earlier, calling her name. Nadia realizes that Jean is more important to her than the Blue Water and is forced to admit it to the mysterious voice. Nadia is released, but warned that she cannot escape from her destiny, which is to rule over Atlantis, or use the power of the Blue Water to become a &quot;god&quot; or &quot;devil.&quot; Nadia is overjoyed to see Jean and tearfully embraces him. The pair flee the cave and are almost swallowed up by the sinking island, but the Gratan comes to their rescue. Reunited, the companions watch as the island disappears into the ocean for good."
		 )
	,	("Nadia: The Secret of Blue Water",
		 32,
		 "Nadia's Love...?",
		 "The Gratan crash-lands into a tribal village, and the companions are captured… until one of its citizens recognizes both Nadia and her Blue Water. Nadia seems intrigued… that is, until she discovers that the warrior (who knows about Tartessos) is engaged to a bulky, strong warrior woman."
		 )
	,	("Nadia: The Secret of Blue Water",
		 33,
		 "King's Rescue",
		 "King is captured by Grandis' ex-fiance, and the companions form a rescue operation to free him."
		 )
	,	("Nadia: The Secret of Blue Water",
		 34,
		 "My Darling Nadia",
		 "Most of this episode is a &quot;clip show&quot; featuring &quot;image songs&quot; accompanied by clips from the previous thirty-three episodes while Sanson suggests Jean to write a love song for Nadia. "
		 )
	,	("Nadia: The Secret of Blue Water",
		 35,
		"The Secret of Blue Water",
		"Finally, the companions arrive at Tartessos, the ancient kingdom of Atlantis submerged to the bottom of a crater lake thirteen years ago. Exploring its ruins, Nadia reveals to the companions that they are, in truth, aboard Blue Noah, one of three &quot;Noah's Arc&quot; vessels that descended to the ocean thousands of years ago. The other two are Red Noah and Atlantis, respectively. During their exploration, Nadia reveals her identity as a princess of Atlantis and the dangers of the Blue Water. Whoever wields the pendant, it turns out, can either become god or devil… and destroy the world in a fit of rage. She also reveals that she doesn't want to have anything to do with her destiny and feels like she is a horrible person who brings nothing but misery to everyone. Impulsively, Nadia attempts suicide by stepping off the top of a tall tower. A few moments later she awakens to find herself on solid ground. Jean reveals that the Blue Water lit up during Nadia's fall and slowed her descent. Nadia laments that she cannot escape her fate after all. Everyone is shocked and traumatized by Nadia's latest actions, but Jean pacifies the situation by telling Nadia he loves her regardless of who she is, and forgives her past mistakes. Nadia is deeply touched by Jean's honesty, and learns that they have, in fact, arrived on her 15th birthday. "
		 )
	,	("Nadia: The Secret of Blue Water",
		 36,
		 "The New Nautilus",
		 "Gargoyle's Neo Atlantean battleships have trailed the companions to Tartessos. Nadia surrenders herself and the Blue Water to Gargoyle… but not before making the latter promise to spare her friends. Gargoyle goes back on his word anyway and orders his battleships to attack the companions. Jean and the others try to flee in the Gratan until they find themselves falling inexorably into a bottomless shaft. Just then, a mysterious force field snags the tank in mid-air and lands them safely on the ground. Their rescuer turns out to be none other than Electra, who informs them that Captain Nemo is still alive and well. She takes the companions aboard New Nautilus, a super-charged massive battleship with powerful electromagnetic turrets. However, the confrontation between Nemo and Gargoyle does not go well, and results with the captain reluctantly surrendering his own Blue Water to his enemy. Gargoyle then destroys Tartessos with a powerful blast and takes Nadia into the skies. "
		 )
	,	("Nadia: The Secret of Blue Water",
		 37,
		 "Emperor Neo",
		 "Nadia is brought aboard Red Noah again, this time as it hovers in the sky, dwarfing even Gargoyle's battleships. There Gargoyle shows Nadia the ancient history of Atlantis, including an experimental massive &quot;human&quot; called Adam, and failed creations hovering in jars. She also meets Emperor Neo, who turns out to be none other than her long-lost brother -- a mechanical puppet under Gargoyle's control. Meanwhile, the New Nautilus has survived the destruction of Tartessos and sets off to fight back. Neo threatens the people around the world to surrender England, but just as the weapon fires, the New Nautilus intervenes, and the two crafts are face to face. "
		 )
	,	("Nadia: The Secret of Blue Water",
		 38,
		 "...To the Sky",
		 "Both Red Noah and New Nautilus exchange laser fire and turret blasts in the sky. The subsequent battle causes much damage to the streets of Paris, destroying the Eiffel Tower. Eventually both crafts elevate to outer space. However, New Nautilus cannot take down Red Noah because the latter's powerful force field is still intact. Breaching a hole in Red Noah 's defenses, the Nautilus sends the Gratan into Red Noah. Grandis, Sanson, and Hanson traverse through the spaceship's corridors, cutting holes in the bulkheads with the tank's newly installed laser turrets. After a long chase they discover Red Noah 's power plant and sacrifice the Gratan to take down Red Noah 's barrier. New Nautilus breaches Red Noah, and Nemo, Electra, and Jean confront Gargoyle in a massive, observatory like chamber. Standing on pedestals more than two meters wide and a hundred meters above the floor, the trio is horrified to discover that Nadia is now under Gargoyle's control. "
		 )
	,	("Nadia: The Secret of Blue Water",
		 39,
		 "Successor to the Stars",
		 "Both Neo and Nadia shoot Nemo, wounding him. Electra radios the New Nautilus to blast through the throne room. The subsequent explosion compromises Gargoyle's hold on Neo, who recognizes his father. Using his powers, Neo returns the Blue Waters to their rightful owners and approaches Nadia in order to break the crown that is controlling her mind. Just when he reaches the throne, however, he freezes -- Gargoyle has unplugged his source of energy. Using all his will, Neo breaks through and succeeds in freeing his sister. In doing so, he sacrifices himself. Then Gargoyle tortures Electra with deadly volts and causes Jean to fall to his death. The New Nautilus breaches the throne room and blasts at Gargoyle. Nemo gives Nadia his own Blue Water and explains that she can revive Jean if she prays to the Blue Water. With encouragement from Grandis and Electra, Nadia combines both Blue Waters, and its powers form a sphere of light. Ignoring Nemo's warning that only an Atlantean can withstand the power of the Blue Water, Gargoyle staggers toward the sphere and touches it… and his own being literally turns into salt and disintegrates -- he was a human being all along. Nadia successfully brings Jean back to life. Nemo then sacrifices himself to destroy Red Noah as the companions return to Earth aboard an all new submarine spaceship. 12 years later in 1902, a 17-year-old Marie talks about how the companions have gone their separate ways: Grandis is single, Hanson a wealthy businessman, Electra a mother, and Jean and Nadia are happily married. Meanwhile, Marie has married Sanson and is expecting her firstborn child."
		 )
;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("Nadia: The Secret of Blue Water", 1, 1, 8)
	,	("Nadia: The Secret of Blue Water", 1, 2, 8)
	,	("Nadia: The Secret of Blue Water", 1, 3, 8)
	,	("Nadia: The Secret of Blue Water", 1, 4, 15)
;
-- Summer A
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
;

-- Summer Showcase A
INSERT INTO EVENT_DATA (EVENT_TIME, EVENT_TYPE_ID, EVENT_TITLE, EVENT_LOCATION, EVENT_FACEBOOK_ID, EVENT_UNIONE_URL) VALUES
		("2018-01-08 14-30-00", 0, "Summer Showcase", 0, 0, "0")
	,	("2018-01-08 15-30-00", 0, "Summer Showcase", 0, 0, "0")
	
	,	("2018-01-15 14-30-00", 0, "Summer Showcase", 0, 0, "0")
	,	("2018-01-15 15-30-00", 0, "Summer Showcase", 0, 0, "0")
;

INSERT INTO EVENT_ANIME_DATA (EVENT_TIME, ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER) VALUES	
		("2018-01-08 14-30-00", "Vividred Operation", 3, 1)
	,	("2018-01-08 15-30-00", "Magical Warfare", 3, 1)
	
	,	("2018-01-15 14-30-00", "Cowboy Bebop", 3, 1)
	,	("2018-01-15 15-30-00", "Deadman Wonderland", 3, 1)
;

-- Summer B
INSERT INTO EVENT_DATA (EVENT_TIME, EVENT_TYPE_ID, EVENT_TITLE, EVENT_LOCATION, EVENT_FACEBOOK_ID, EVENT_UNIONE_URL) VALUES
		("2018-01-26 11-30-00", 0, "Summer Sessions", 0, 0, "0")
	,	("2018-02-02 11-30-00", 0, "Summer Sessions", 0, 0, "0")
	,	("2018-02-09 11-30-00", 0, "Summer Sessions", 0, 0, "0")
	
	,	("2018-01-26 16-30-00", 0, "Summer Sessions", 0, 0, "0")
	,	("2018-02-02 16-30-00", 0, "Summer Sessions", 0, 0, "0")
	,	("2018-02-09 16-30-00", 0, "Summer Sessions", 0, 0, "0")
	
	,	("2018-01-26 19-30-00", 0, "Summer After Dark", 0, 0, "0")
	,	("2018-02-02 19-30-00", 0, "Summer After Dark", 0, 0, "0")
	,	("2018-02-09 19-30-00", 0, "Summer After Dark", 0, 0, "0")
;

INSERT INTO EVENT_ANIME_DATA (EVENT_TIME, ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER) VALUES
		("2018-01-26 11-30-00", "Assassination Classroom Season 2", 0, 1)
	,	("2018-02-02 11-30-00", "Assassination Classroom Season 2", 0, 2)
	,	("2018-02-09 11-30-00", "Assassination Classroom Season 2", 0, 3)
	
	,	("2018-01-26 16-30-00", "Little Busters Refrain", 0, 1)
	,	("2018-02-02 16-30-00", "Little Busters Refrain", 0, 2)
	,	("2018-02-09 16-30-00", "Little Busters Refrain", 0, 3)
	
	,	("2018-01-26 19-30-00", "Queens Blade 2 The Evil Eye", 0, 1)
	,	("2018-02-02 19-30-00", "Queens Blade 2 The Evil Eye", 0, 2)
	,	("2018-02-09 19-30-00", "Queens Blade 2 The Evil Eye", 0, 3)
;

-- Summer Showcase B
INSERT INTO EVENT_DATA (EVENT_TIME, EVENT_TYPE_ID, EVENT_TITLE, EVENT_LOCATION, EVENT_FACEBOOK_ID, EVENT_UNIONE_URL) VALUES
		("2018-01-22 14-30-00", 0, "Summer Showcase", 0, 0, "0")
	,	("2018-01-22 15-30-00", 0, "Summer Showcase", 0, 0, "0")
	
	,	("2018-01-29 14-30-00", 0, "Summer Showcase", 0, 0, "0")
	,	("2018-01-29 15-30-00", 0, "Summer Showcase", 0, 0, "0")
	
	,	("2018-02-05 14-30-00", 0, "Summer Showcase", 0, 0, "0")
	,	("2018-02-05 15-30-00", 0, "Summer Showcase", 0, 0, "0")
;
	
INSERT INTO EVENT_ANIME_DATA (EVENT_TIME, ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER) VALUES
		("2018-01-22 14-30-00", "Shimoneta: A Boring World Where the Concept of Dirty Jokes Doesn't Exist", 3, 1)
	,	("2018-01-22 15-30-00", "Battle Girls: Time Paradox", 3, 1)

	,	("2018-01-29 14-30-00", "Bikini Warriors", 3, 1)
-- 	,	("2018-01-29 15-30-00", "", 3, 1)

-- 	,	("2018-02-05 14-30-00", "", 3, 1)
-- 	,	("2018-02-05 15-30-00", "", 3, 1)
;
	
-- Summer Episodes
INSERT INTO EVENT_DATA (EVENT_TIME, EVENT_TYPE_ID, EVENT_TITLE, EVENT_LOCATION, EVENT_FACEBOOK_ID, EVENT_UNIONE_URL) VALUES
		("2018-01-10 10-00-00", 1, "Beach Episode", 2, 0, "0")
	,	("2018-01-17 10-00-00", 1, "Arcade Episode", 1, 0, "0")
	,	("2018-01-31 10-00-00", 1, "Pool Episode", 3, 0, "0")
;

-- A
INSERT INTO EVENT_DATA (EVENT_TIME, EVENT_TYPE_ID, EVENT_TITLE, EVENT_LOCATION, EVENT_FACEBOOK_ID, EVENT_UNIONE_URL) VALUES
		("2018-03-02 11-30-00", 0, "Screening Sessions", 0, 0, "0")
	,	("2018-03-09 11-30-00", 0, "Screening Sessions", 0, 0, "0")
	,	("2018-03-16 11-30-00", 0, "Screening Sessions", 0, 0, "0")
	
	,	("2018-03-02 16-30-00", 0, "Screening Sessions", 0, 0, "0")
	,	("2018-03-09 16-30-00", 0, "Screening Sessions", 0, 0, "0")
	,	("2018-03-16 16-30-00", 0, "Screening Sessions", 0, 0, "0")
	
	,	("2018-03-02 19-30-00", 0, "Screening Sessions", 0, 0, "0")
	,	("2018-03-09 19-30-00", 0, "Screening Sessions", 0, 0, "0")
	,	("2018-03-16 19-30-00", 0, "Screening Sessions", 0, 0, "0")
;

INSERT INTO EVENT_ANIME_DATA (EVENT_TIME, ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER) VALUES
		("2018-03-02 11-30-00", "Muv-Luv Alternative Total Eclipse", 0, 1)
	,	("2018-03-09 11-30-00", "Muv-Luv Alternative Total Eclipse", 0, 2)
	,	("2018-03-16 11-30-00", "Muv-Luv Alternative Total Eclipse", 0, 3)
	
	,	("2018-03-02 16-30-00", "Canaan", 0, 1)
	,	("2018-03-09 16-30-00", "Canaan", 0, 2)
	,	("2018-03-16 16-30-00", "Canaan", 0, 3)
	
	,	("2018-03-02 19-30-00", "Danganronpa", 0, 1)
	,	("2018-03-09 19-30-00", "Danganronpa", 0, 2)
	,	("2018-03-16 19-30-00", "Danganronpa", 0, 3)
;

-- A Showcase