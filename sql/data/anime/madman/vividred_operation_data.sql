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
;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("Vividred Operation", 3, 1, 2)
;