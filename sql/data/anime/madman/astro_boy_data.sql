-- Anime Data
INSERT INTO ANIME(ANIME_TITLE, NUMBER_OF_EPISODES, ANIME_SYNOPSIS, ANIME_DESCRIPTION, COMPANY_NAME, COPYRIGHT) VALUES
		("Title",
		 52,
		 "In the year 2030, a brilliant robotics engineer named Dr. Boynton loses his son Toby in a tragic car accident. Distraught over his death, the dedicated, but heart-broken scientist uses his technical expertise to construct an android in the boy's image. But all was not as he'd hoped, for the scientist soon realised the robot, Astro Boy, could never grow into a human capable of filling the void in his heart.",
		 "In the year 2030, a brilliant robotics engineer named Dr. Boynton loses his son Toby in a tragic car accident. Distraught over his death, the dedicated, but heart-broken scientist uses his technical expertise to construct an android in the boy's image. But all was not as he'd hoped, for the scientist soon realised the robot, Astro Boy, could never grow into a human capable of filling the void in his heart.",
		 "Madman",
		 "1980 Tezuka Productions"
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("Astro Boy (1980) Collection 1",
		 1,
		 1,
		 "PG - Mature themes, Medium Level Violence",
		 25,
		 "https://www.madman.com.au/catalogue/view/12706/astro-boy-1980-collection-1"
		)
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("Astro Boy",
		 1,
		 "The Birth Of Atom",
		 "Doctor Boynton is a robotics engineer struggling for a breakthrough, while his son Toby longs for his affection. One night, a shady criminal, Skunk Kusai, visits his home and offers Dr. Boynton a new circuit known as the Omega Factor, which would allow robots to become far more human-like, to the point of defying all Laws of Robotics. Boynton angrily throws him out of his home. Toby, having overheard their conversation, suggests to his father that he design a new robot that resembles a human boy. Boynton is inspired by this, and creates a new template for this design. However, he neglects his promise to spend time with Toby at an amusement park, hurting Toby's feelings. As Toby leaves the park, he is caught in a traffic collision and is horribly injured, and dies from his wounds in the hospital; before this, he has his father promise him to make the robot in his image and treat it like his own. Overcome with grief, Boynton completes the project, christening the new robot after his deceased son, and brings him to life. However, Skunk has copied the template designs as well, and takes them to a scientist named Walpurgis, who builds a robot he names Atlas. Boynton takes the robot Toby home, teaching him about life and how to live like a little boy. However, some time later Toby becomes paralyzed, his eyes blinking red, and disappears from Boynton's home. Boynton and his colleagues track Toby down using a robot tank, but the tank suddenly goes berzerk with them inside, causing Toby to rush to save his father and his colleagues. Little do they realize that Toby's behavior was caused when Atlas was activated; the two robots had "called" one another. Later, in the hospital, Boynton tells Toby that he is very proud of him, but since he was no longer a secret, the two would have to leave the country for a while. Atlas and Walpurgis' robot maid, Livian, discuss his purpose, with Atlas uncertain of what lies ahead for him. "
		)
	,	("Astro Boy",
		 n,
		 "Atom vs. Atlas",
		 "Dr. Boynton and Toby depart on an ocean liner for America, but Toby is unintentionally destructive, as he doesn't realize his own strength at times. Frustrated, Dr. Boynton has him stay in their cabin while he heads for dinner. However, a couple of guests want to meet Toby, so he has no choice but to bring him along. During the dinner, the guests realize that Toby is a robot, and even though he means no harm, manages to ruin the dinner by tipping the table over, causing a huge mess. Angrily, Boynton rejects Toby on the spot, declaring that he's just a robot and that he has no son. Meanwhile, Skunk Kusai has taken to educating Atlas in crime, teaching him how to rob armored trucks. Atlas, however, destroys the trucks before robbing them. Skunk then tries to teach him how to rob a supermarket, but Atlas, instead of stealing money, makes off with receipts instead. Frustrated with his incompetence, Skunk tells Walpurgis that Atlas is a fool and the Omega Factor has done nothing for him, but Walpurgis counters that Atlas is becoming more humanlike, and mistakes are a human factor in learning. Atlas, meanwhile, is consoled by Livian, who begs him not to follow a life of crime, but Atlas insists that he become more human to impress Walpurgis. Livian tells Atlas that a man must not harm those weaker than he, and even though they are robots, they also identify by gender. Atlas asks if Livian can be like his mother, as she is the only one who truly makes him happy. However, Skunk interrupts their talk to take Atlas on a mission. As Toby considers what Boynton said to him, he is approached by a shady circus owner, Hamegg, who asks if he would like to join the circus now that he had been disowned by Boynton. He takes Toby with him and coerces him into signing a contract, declaring Toby Hamegg's property. Meanwhile, Skunk tells Atlas that he plans to sink the ocean liner and have Atlas go in and steal a haul of gold bars on board. His plan is to create a field of icebergs in the path of the ship to cause it to crash. Setting off explosives, he creates a large flow of icebergs, but Toby manages to destroy the icebergs by breaking them up, saving the ship. He encounters Atlas, who attacks him and nearly destroys him until he recalls Livian's words. In a show of mercy, Atlas leaves Toby on the ship's deck, where he hears Boynton, who feels remorse for what he has done, calling out in desperation for him. However, he is found by Hamegg first, who grabs him and stuffs him in a crate.

Atlas returns to Walpurgis' castle, where he finds that Walpurgis has dismantled Livian as punishment for her accidentally destroying a gargoyle sculpture. In a fit of rage, he attacks Walpurgis, who escapes by car. Atlas chases him, and even though he is severely damaged by missiles from the car, manages to catch him and run him off the road, killing Walpurgis. Atlas returns to the lab and uses Walpurgis' equipment to begin rebuilding his body. "
		)
;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("Astro Boy", 1, 1, 2)
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