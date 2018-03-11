-- Event Data Core, Version 1.2.0, MAR18, JPGalovic
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
	,	(4, "Roleplay Event")
	,	(5, "Tabletop Event")
	,	(6, "Video Game Event")
	,	(7, "Other Event")
;

-- Event Type References:
-- Has Anime Event Data: 0
-- May Have Game Event Data: 4, 5, 6

-- Table for Event Locations
CREATE TABLE IF NOT EXISTS EVENT_LOCATION (
		LOCATION_ID						INT(11)
	,	CAMPUS							VARCHAR(30)
	,	BUILDING						VARCHAR(50)
	,	BLDG							VARCHAR(50)
	,	ROOM							VARCHAR(10)
	,	ADDRESS							VARCHAR(150)
	,	LAT								FLOAT(53)
	,	LNG								FLOAT(53)
	,	ZOOM							INT(11)
	, 	PRIMARY KEY						(LOCATION_ID)
);

-- Data for Event Locations
INSERT INTO EVENT_LOCATION (LOCATION_ID, CAMPUS, BUILDING, BLDG, ROOM, ADDRESS, LAT, LNG, ZOOM) VALUES
-- Default Location
		(0, "Swinburne Hawthorn", null, null, null, "John St, Hawthorn VIC 3122", -37.822097, 145.038946, 17)
		
-- Social Event Locations
	,	(1, null, null, null, null, "Crown Entertainment Complex, 8 Whiteman St, Southbank VIC 3006", -37.824871, 144.958181, 17)
	,	(2, null, null, null, null, "Sorrento Oceach Beach, Ocean Beach Road, Sorrento VIC 3943", -38.345876, 144.727014, 17)
	,	(3, null, null, null, null, "Hawthorn Aquatic &amp; Leisure Center, 1 Grace St, Hawthorn VIC 3122", -37.820791, 145.034434, 17)

-- Swinburne Buildings
	,	(10, "Swinburne Hawthorn", "1 Alfred St", "1A", null, null, -37.821312, 145.036710, 17)
	,	(11, "Swinburne Hawthorn", "6 Luton Lane", "6L", null, null, -37.823123, 145.034180, 17)
	,	(12, "Swinburne Hawthorn", "10 George St", "10G", null, null, -37.822398, 145.041155, 17)
	,	(13, "Swinburne Hawthorn", "21 Wakefield St", "21W", null, null, -37.820553, 145.037500, 17)
	,	(14, "Swinburne Hawthorn", "24 George St", "24G", null, null, -37.822523, 145.041615, 17)
	,	(15, "Swinburne Hawthorn", "32 Park St", "32P", null, null, -37.820231, 145.037879, 17)
	,	(16, "Swinburne Hawthorn", "400 Burwood Rd", "400B", null, null, -0, 0, 17)
	,	(17, "Swinburne Hawthorn", "60 William St", "60W", null, null, -37.822484, 145.039690, 17)
	,	(18, "Swinburne Hawthorn", "Old Administration Building", "AD", null, null, -37.822108, 145.038748, 17)
	,	(19, "Swinburne Hawthorn", "Advanced Manufacturing &amp; Design Center", "ADMC", null, null, -37.822836, 145.039238, 17)
	,	(20, "Swinburne Hawthorn", "Advanced Technologies Center", "ATC", null, null, -37.822650, 145.038374, 17)
	,	(21, "Swinburne Hawthorn", "Applied Sciences Building", "AS", null, null, -37.822569, 145.037458, 17)
	,	(22, "Swinburne Hawthorn", "Arts Building", "AR", null, null, -37.821895, 145.038257, 17)
	,	(23, "Swinburne Hawthorn", "Australian Graduate School of Entrepreneurship", "AGSE", null, null, -37.821347, 145.039471, 17)
	,	(24, "Swinburne Hawthorn", "Aviation Building", "AV", null, null, -37.823183, 145.041905, 17)
	,	(25, "Swinburne Hawthorn", "Business &amp; Arts Building", "BA", null, null, -37.822084, 145.039406, 17)
	,	(26, "Swinburne Hawthorn", "Chemistry Building", "CH", null, null, -37.822656, 145.037855, 17)
	,	(27, "Swinburne Hawthorn", "Engineering Building", "EN", null, null, -37.822232, 145.037801, 17)
	,	(28, "Swinburne Hawthorn", "Engineering - West Building", "EW", null, null, -37.821982, 145.037454, 17)
	,	(29, "Swinburne Hawthorn", "IS Building", "IS", null, null, -37.822889, 145.041926, 17)
	,	(30, "Swinburne Hawthorn", "Library", "LB", null, null, -37.822454, 145.039211, 17)
	,	(31, "Swinburne Hawthorn", "Multi-Deck Car Park", "19W", null, null, -37.820274, 145.037089, 17)
	,	(32, "Swinburne Hawthorn", "Science Annexe", "SA", null, null, -37.822234, 145.037370, 17)
	,	(33, "Swinburne Hawthorn", "SR Building", "SR", null, null, -37.821547, 145.038823, 17)
	,	(34, "Swinburne Hawthorn", "Swinburne Place - South Building", "SPS", null, null, -37.821287, 145.037873, 17)
	,	(35, "Swinburne Hawthorn", "Swinburne Place - West Building", "SPW", null, null, -37.820983, 145.037167, 17)
	,	(36, "Swinburne Hawthorn", "TA Building", "TA", null, null, -37.820942, 145.038965, 17)
	,	(37, "Swinburne Hawthorn", "TB Building", "TB", null, null, -37.821019, 145.039434, 17)
	,	(38, "Swinburne Hawthorn", "TC Building", "TC", null, null, -37.820580, 145.039464, 17)
	,	(39, "Swinburne Hawthorn", "TD Building", "TD", null, null, -37.820500, 145.039075, 17)
	,	(40, "Swinburne Hawthorn", "The George Swinburne Building", "GS", null, null, -37.821353, 145.038488, 17)
	,	(41, "Swinburne Hawthorn", "UN Building", "UN", null, null, -37.822524, 145.038599, 17)
	
-- Specific Rooms
	,	(18108, "Swinburne Hawthorn", "Old Administration Building", "AD", "AD108", null, -37.822108, 145.038748, 17)
	
	,	(21404, "Swinburne Hawthorn", "Applied Sciences Building", "AS", "AS404", null, -37.822569, 145.037458, 17)
	
	,	(25702, "Swinburne Hawthorn", "Business &amp; Arts Building", "BA", "BA702", null, -37.822084, 145.039406, 17)
	
	,	(27213, "Swinburne Hawthorn", "Engineering Building", "EN", "EN213", null, -37.822232, 145.037801, 17)
	
	,	(36212, "Swinburne Hawthorn", "TA Building", "TA", "TA212", null, -37.820942, 145.038965, 17)
	
	,	(37220, "Swinburne Hawthorn", "TB Building", "TB", "TB220", null, -37.821019, 145.039434, 17)
	
	,	(39317, "Swinburne Hawthorn", "TD Building", "TD", "TD317", null, -37.820500, 145.039075, 17)
	
	,	(40217, "Swinburne Hawthorn", "The George Swinburne Building", "GS", "GS217", null, -37.821353, 145.038488, 17)
	
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
		 null
		)
	,	("Summer After Dark",
		 "Extra Summer Screening Session, only for out most dedicated members.",
		 "Come along, pay your fee and scan your membership card.",
		 "After Dark Sessions are run as an extra event for members, condition of entry is that a gold coin donation is made."
		)
	,	("Summer Showcase",
		 "Summer Edition of our Showcase Screenings, each week showing the first episode of anime available to watch now!",
		 "Event is open to all, just come along and scan your membership card as you enter.",
		 null
		)
	,	("Screening Sessions",
		 "Our regular screening sessions, brining you smash hit series shown in full over a three week period.",
		 "Event is open to all, just come along and scan your membership card as you enter.",
		 null
		)
	,	("SwinAnime x STARS After Dark",
		 "Extra Screening Sessions, only for our most dedicated members",
		 "Come along, pay your fee and scan your membership card.",
		 "After Dark Sessions are run as an extra event for members, condition of entry is that a gold coin donation is made."
		)
	,	("SwinAnime x STARS Showcase",
		 "Showcase Screenings, each week showing the first episode of anime available to watch now!",
	 	 "Event is open to all, just come along and scan your membership card as you enter.",
	 	 null
		)
	,	("Winter Sessions",
		 "Our Winter Screenings bring unique and special series for our most dedicated members.",
		 "Event is open to all, just come along and scan your membership card as you enter.",
		 null
		)
	,	("Winter After Dark",
		 "Extra Winter Screening Session, only for out most dedicated members.",
		 "Come along, pay your fee and scan your membership card.",
		 "After Dark Sessions are run as an extra event for members, condition of entry is that a gold coin donation is made."
		)
	,	("Winter Showcase",
		 "Winter Edition of our Showcase Screenings, each week showing the first episode of anime available to watch now!",
		 "Event is open to all, just come along and scan your membership card as you enter.",
		 null
		)
	,	("LANime Overnight Marathon",
		 "Overnight Marathon and LAN gaming, only for our most dedicated members!",
		 "Come along from Friday Night, Present your Premium Membership Card and chip in for Snacks and Drinks",
		 "As part of event everyone in attendance chips in $5 that goes directly towards the purchase of Snacks and Drinks for the event."
		)
;

-- Social Event Details
INSERT INTO EVENT_DETAILS (EVENT_TITLE, EVENT_DESCRIPTION, MEETUP_INSTRUCTIONS, TICKETS) VALUES	
		("Beach Episode",
		 "Our Annual trip to the beach, fun with friends, building sand castles, have a swim or a surf, maybe even smash a melon or two.",
		 "Meet at Frankston Train Station for start of event, catching 788 bus to Sorrento. <br>Note: Sorrento is in zone 4, so miki fares are $3.36 concession or $6.72 full fare.",
		 "Event is free to attend, however generally we all pitch in on getting snacks and drinks for the group."
		)
	,	("Arcade Episode",
		 "Play some arcade games, have some fun.",
		 "Meet at Southern Cross Station (Spenser Street), Catching tram 12, 96 or 109 to Crown Casino.",
		 "Event is free to attend, paying what you can afford to play, recommended budget is $20-$40"
		)
	,	("Pool Episode",
		 "Our annual trip to the pool, swimming, swimming, swimming...",
		 "Meet at Glenferrie Station, walk across road to pool.",
		 "Event is free to attend, entry to pool is free for current swinburne students."
		)
;

-- Tabletop Event Details
INSERT INTO EVENT_DETAILS (EVENT_TITLE, EVENT_DESCRIPTION, MEETUP_INSTRUCTIONS, TICKETS) VALUES
		("Tabletop Tonight",
		 "Every week! Our exclusive Tabletop Experience! Join us for new games and exciting classics.",
		 "Simply come along to the Clubroom, as advertised, present your membership card and pick a game to play!",
		 null
		)
	,	("The Dice Must Flow",
		 "Evey month join us for our Marathon Extravaganza! Play Longer, Play Harder!",
		 "Simply come along to the Clubroom, as advertised, present your membership card and pick a game to play!",
		 null
		)
;


-- Roleplay Event Details
INSERT INTO EVENT_DETAILS (EVENT_TITLE, EVENT_DESCRIPTION, MEETUP_INSTRUCTIONS, TICKETS) VALUES
		("Adventurers Anonymous",
		 "Are you tied of adventuring alone, with no one around to have your back? Are you tired not having team mates to give you support? Come along to our Adventurers Anonymous meeting where our supportive groups we will help you find your way, and you can help other Adventurers find their's",
		 "Simply come along to the Clubroom, as advertised, present your membership card and pick a game to play!",
		 null
		)
;

-- Workshop Event Details
INSERT INTO EVENT_DETAILS (EVENT_TITLE, EVENT_DESCRIPTION, MEETUP_INSTRUCTIONS, TICKETS) VALUES
		("GM Skill's Workshop",
		 "Do you want to learn to run your own adventure? Are you keen to become a Game Master? Then join us in these Exclusive Skill's Workshops! Running Each Month!",
		 "Workshop Events are open only to Current Premium and Associate Members, come along to the event room and join in the activities, free members are welcome to upgrade to Premium Membership on the spot",
		 null
		)
		
	,	("Scene Planning and Blocking Workshop",
		 "The first step in producing animation is to plan and block out the scenes, in this workshop we go over both classic and modern methods.",
		 "Workshop Events are open only to Current Premium and Associate Members, come along to the event room and join in the activities, free members are welcome to upgrade to Premium Membership on the spot",
		 null
		)
	,	("Drawing Workshop",
		 "Now that our project is planned out, its time to start with designing our characters, sets and drawing key-frames for our animation! This workshop will help to develop your hand drawing skills as well as introduce you to methods for vectoring and digital software.",
		 "Workshop Events are open only to Current Premium and Associate Members, come along to the event room and join in the activities, free members are welcome to upgrade to Premium Membership on the spot",
		 null
		)
	,	("Animation Workshop",
		 "The next step is to actually create the slides for the animation, using both traditional and modern techniques, by hand and digital!",
		 "Workshop Events are open only to Current Premium and Associate Members, come along to the event room and join in the activities, free members are welcome to upgrade to Premium Membership on the spot",
		 null
		)
	,	("Voice Acting Workshop",
		 "Next, give the animation a voice, in this workshop we explore techniques used by classic animation to give your characters a voice.",
		 "Workshop Events are open only to Current Premium and Associate Members, come along to the event room and join in the activities, free members are welcome to upgrade to Premium Membership on the spot",
		 null
		)
	,	("Music and Sound Effects Workshop",
		 "Finally, the addition of music and production of sound effects in both the modern and traditional manner, thus completing our project!",
		 "Workshop Events are open only to Current Premium and Associate Members, come along to the event room and join in the activities, free members are welcome to upgrade to Premium Membership on the spot",
		 null
		)
;

-- General Meeting Details
INSERT INTO EVENT_DETAILS (EVENT_TITLE, EVENT_DESCRIPTION, MEETUP_INSTRUCTIONS, TICKETS) VALUES
		("Annual General Meeting",
		 "This is the big one, All members are asked to attend and help elect our Committee for Next Year!",
		 "Open to all current students, please come along to the advertised clubroom and take a seat.",
		 null
		)
	,	("Semester General Meeting",
		 "This meeting is for us to introduce ourselves, and inform you of what the club will be doing this semester!",
		 "Open to all members, please come along to the advertised clubroom and take a seat.",
		 null
		)
	,	("Member News and Planing Meeting",
		 "This is where you can have your say, let us know what you want to see from your club, and we'll let you know whats coming up over the next couple of weeks",
		 "",
		 null
		)
;

-- Other Event Details
INSERT INTO EVENT_DETAILS (EVENT_TITLE, EVENT_DESCRIPTION, MEETUP_INSTRUCTIONS, TICKETS) VALUES
		("Conquest: Easter Games Convention",
		 "Conquest is Melbourne's Easter Games Convention",
		 "Held at Swinburne's ATC building, Come along and play some games with us!",
		 "Tickets can be brought from Conquest's website, https://www.conquest.asn.au/"
		)
	,	("May the forth be with you",
		 "May the forth be with you, always. Every year May the 4th marks International Geek Day, celebrating everything geek and nerd!",
		 "Come and find us, and join in the festivities",
		 null
		)
	,	("Animaga Expo",
		 "Animaga Expo celebrates everything, Anime Manga and Games! come and join us in the fun!",
		 "Held at the Royal Exhibition Building.",
		 "Tickets can be brought from Animaga's website, http://www.animaga.com.au/"
		)
;

-- Table for Basic Event Data
CREATE TABLE IF NOT EXISTS EVENT_DATA (
		EVENT_TIME						DATETIME
	,	EVENT_TYPE_ID					INT(11)
	,	EVENT_TITLE						VARCHAR(250)
	,	EVENT_SUBTITLE					VARCHAR(250)
	,	EVENT_LOCATION					INT(11)
	,	EVENT_FACEBOOK_ID				VARCHAR(20)
	,	EVENT_UNIONE_URL				VARCHAR(250)
	,	PRIMARY KEY						(EVENT_TIME)
	,	FOREIGN KEY						(EVENT_TYPE_ID) REFERENCES EVENT_TYPE (EVENT_TYPE_ID)
	,	FOREIGN KEY						(EVENT_LOCATION) REFERENCES EVENT_LOCATION (LOCATION_ID)
	,	FOREIGN KEY						(EVENT_TITLE) REFERENCES EVENT_DETAILS (EVENT_TITLE)
);

-- Linking Table for Staff Shifts
CREATE TABLE IF NOT EXISTS EVENT_STAFF_DATA (
		EVENT_TIME						DATETIME
	,	STAFF_NAME						VARCHAR(200)
	,	SHIFT_START						DATETIME
	,	SHIFT_END						DATETIME
	,	SHIFT_LENGTH					INT(1)
	,	PRIMARY KEY						(EVENT_TIME,STAFF_NAME,SHIFT_START)
	,	FOREIGN KEY						(EVENT_TIME) REFERENCES EVENT_DATA (EVENT_TIME)
	,	FOREIGN KEY						(STAFF_NAME) REFERENCES STAFF (STAFF_NAME)
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

