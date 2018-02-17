-- Anime Data
INSERT INTO ANIME(ANIME_TITLE, NUMBER_OF_EPISODES, ANIME_SYNOPSIS, ANIME_DESCRIPTION, COMPANY_NAME, COPYRIGHT) VALUES
		("Title",
		 n,
		 "Usagi Tsukino is a cheerful 14-year-old schoolgirl who often finds herself in unwanted trouble. One day, she saves a talking cat named Luna from some mean kids, and her life is changed forever. Luna gives Usagi a magic brooch that transforms her into Sailor Moon, defender of love and justice! Now Usagi must work with Luna to find the other Sailor Guardians and the Moon Princess, whose Legendary Silver Crystal is Earth's only hope against the dark forces of the evil Queen Beryl!",
		 "Usagi Tsukino is a cheerful 14-year-old schoolgirl who often finds herself in unwanted trouble. One day, she saves a talking cat named Luna from some mean kids, and her life is changed forever. Luna gives Usagi a magic brooch that transforms her into Sailor Moon, defender of love and justice! Now Usagi must work with Luna to find the other Sailor Guardians and the Moon Princess, whose Legendary Silver Crystal is Earth's only hope against the dark forces of the evil Queen Beryl!",
		 "Madman Entertainment",
		 "Copyright"
		)
;

INSERT INTO ANIME_VOLUME(ANIME_TITLE, VOLUME_TYPE_ID, VOLUME_NUMBER, CLASSIFICATION, NUMBER_OF_EPISODES, PURCHACE_URL) VALUES
		("Sailor Moon",
		 1,
		 1,
		 "PG - Mild supernatural themes and animated violence",
		 6,
		 "URL"
		)
	,	("Title",
		 2,
		 2,
		 "Classification",
		 x,
		 "URL"
		)
	,	("Title",
		 3,
		 3,
		 "Classification",
		 x,
		 "URL"
		)
	,	("Title",
		 4,
		 4,
		 "Classification",
		 x,
		 "URL"
		)
	,	("Title",
		 5,
		 5,
		 "Classification",
		 x,
		 "URL"
		)		
;

INSERT INTO ANIME_EPISODE(ANIME_TITLE, EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS) VALUES
		("Sailor Moon",
		 1,
		 "The Crybaby: Usagi's Beautiful Transformation",
		 "As the series begins as a slapstick comedy, a 14-year-old underachieving sailor-suited schoolgirl Usagi Tsukino saves a cat from being attacked by a group of little boys while on her way to school. After school, she and her friend Naru Osaka visit a local jewelry store owned by her mother. On her way home, Usagi encounters Mamoru Chiba and meets up with Motoki Furuhata. Upon returning to her home, Naru's mother reveals herself to be the youma Morga and captures her. The cat Usagi encountered earlier reveals herself as Luna and tells Usagi to search for the princess and destroy evil. Usagi transforms into Sailor Moon and, after hearing Naru in distress, confronts Morga, who intends to steal human energy by using the cursed jewelry on the girls. The youma tricks the brainwashed girls into attacking Usagi but a stranger wearing a tuxedo intervenes. Usagi weakens Morga with her screams, allowing her to use the Moon Tiara Action technique on Morga, killing her and restoring the girls to normal. Before departing, the stranger reveals himself to be Tuxedo Mask."
		)
	,	("Sailor Moon",
		 2,
		 "Punishment Awaits: the House of Fortune Is the Monster Mansion",
		 "Having failed his previous mission, Jadeite informs Queen Beryl, the leader of the Dark Kingdom, that he is using another plan, this time involving fortune telling. Meanwhile, Usagi's classmate Umino Gurio is smitten with her. After confessing that he wants to go on a date, Naru has him consult a fortune teller but he decides to go to the House of Fortune. Luna tells Usagi to go to a fortune teller, in an attempt to check that Motoki is an admirer of her but decides to go to the House of Fortune. However, Umino and some of the other students are hypnotized by the tarot cards and cause trouble at school the next day. Realizing that the students were being hypnotized from the House of Fortune, Luna and Usagi infiltrate the house and encounter Balm, a youma disguised as the fortune teller. Balm orders her hypnotized subjects to attack Usagi, but Tuxedo Mask distracts her and, with his encouragement, Usagi kills Balm, returning the customers to normal. "
		)
	,	("Sailor Moon",
		 3,
		 "The Mysterious Sleeping Sickness: Protect the Girls in Love",
		 "Homeroom teacher Haruna Sakurada and Naru submit love-letters to a late-night radio show. When they fall into a coma-like sleep, Usagi must investigate the radio station undercover."
		)
	,	("Sailor Moon",
		 4,
		 "Learn How to Be Skinny from Usagi",
		 "Usagi gains a couple of pounds and starts to obsess about her weight. Jadeite starts a health club to drain energy out of people. Usagi and her friends sign up after seeing how much weight Ms. Haruna has lost. Usagi discovers tanks in the basement which are sucking the life energy out of her friends. "
		)
	,	("Sailor Moon",
		 5,
		 "Scent of a Monster: Chanela Will Steal Your Love",
		 "Usagi wants her family to accept Luna as a "pet", but Shingo is afraid of cats. At a pet shop, he discovers a hypnotic creature called a Chanela and loses all interest in anything else. "
		)
	,	("Sailor Moon",
		 6,
		 "Protect the Melody of Love: Usagi Plays Cupid",
		 "Jadeite creates a cassette tape that can drain life energy, but the youma he gives it to promptly loses it. It ends up in the possession of a jazz pianist, and Usagi must disguise herself as an adult to protect him. "
		)
	,	("Sailor Moon",
		 7,
		 "So You Want to Be a Superstar",
		 "By making a youma possess a human celebrity, Jadeite draws a huge crowd of would-be superstars. Usagi tries to juggle her duties as Sailor Moon with her desire to be popular and famous. "
		)
	,	("Sailor Moon",
		 8,
		 "The Girl Genius Is a Monster: The Brainwashing Cram School of Horror",
		 "Luna senses a strange aura around Usagi's genius classmate, Ami Mizuno, and thinks she might be a Dark Kingdom spy. Usagi befriends the girl and is not so sure. But she understands later that Ami Mizuno is a Guardian as Sailor Moon and their duties are the same. "
		)
	,	("Sailor Moon",
		 9,
		 "Usagi's Disaster: Beware of the Clock of Confusion",
		 "Jadeite's new plan is to make humans work harder to increase their energy output. Usagi's mom buys a new clock for her that drains her energy; Ami, now awakened as Sailor Mercury, helps Luna investigate. "
		)
	,	("Sailor Moon",
		 10,
		 "The Cursed Bus: Enter Mars, the Guardian of Fire",
		 "Loaded buses are disappearing near Hikawa Shrine, and most of Usagi's peers suspect that Rei Hino, a mysterious shrine miko with strange psychic abilities, has something to do with it. Luna wonders if she might be the moon princess. "
		)
	,	("Sailor Moon",
		 11,
		 "Usagi vs. Rei: Nightmare in Dream Land",
		 "Queen Beryl is increasingly furious with Jadeite for his repeated failures; he starts up a theme park, but the general public notices the large number of disappearances. Usagi and Rei, who is now Sailor Mars, begin their combative friendship."
		)
	,	("Sailor Moon",
		 12,
		 "I Want a Boyfriend: The Luxury Cruise Ship Is a Trap",
		 "One of Queen Beryl's youma offers to help Jadeite with his wicked plans. Rei wins tickets on a luxury cruise ship and, since she has no boyfriend, asks Ami to accompany her. A jealous Usagi sneaks aboard after them. "
		)
	,	("Sailor Moon",
		 13,
		 "Girls Unite: The End of Jadeite",
		 "Usagi continues to be romantically infatuated with both Motoki Furuhata and Tuxedo Mask. Threatened with death should he fail again, Jadeite confronts the Sailor Guardians at an airport. "
		)
	,	("Sailor Moon",
		 14,
		 "A New Enemy Appears: Nephrite's Evil Crest",
		 "Nephrite takes over as Beryl's main energy gatherer. He plans to gather more strength and power from individual humans at their strongest, rather than from groups, and starts by targeting Naru's childhood friend, a tennis player."
		)
	,	("Sailor Moon",
		 15,
		 "Usagi's Panic: Rei's First Date",
		 "Usagi finally learns Mamoru's name, and, to her aggravation (and supposed jealousy), Rei decides to date him. Meanwhile, Nephrite targets the caretaker of a park, and Rei suggests a similarity between Mamoru and Tuxedo Mask."
		)
	,	("Sailor Moon",
		 16,
		 "A Girl's Dream: Usagi Becomes a Bride",
		 "Usagi's home economics teacher is getting married, and she and Rei become obsessed with a contest for handmade wedding dresses. Nephrite implants a youma in some fabric purchased by the bride-to-be."
		)
	,	("Sailor Moon",
		 17,
		 "Usagi's a Model: The Flash of the Monster Camera",
		 "A student from Rei's school is an expert photographer. She and others try to become models to attract fame and fortune, but the boy and his camera are under the influence of the Dark Kingdom."
		)
	,	("Sailor Moon",
		 18,
		 "Shingo's Love: The Grieving Doll",
		 "Zoisite suggests that Nephrite needs his help, but the later refuses, angering Queen Beryl. Shingo's friend is targeted for her ability to make beautiful dolls. Sailor Moon becomes an increasingly popular super-heroine. "
		)
	,	("Sailor Moon",
		 19,
		 "Usagi's Joy: A Love Letter from Tuxedo Mask",
		 "Nephrite takes advantage of Sailor Moon's romantic attraction to Tuxedo Mask by sending love letters to Usagi and her classmates. Naru falls in love with him in his civilian disguise, allowing him to drain a large amount of her life-force energy. "
		)
	,	("Sailor Moon",
		 20,
		 "The Summer, the Beach, Youth and Ghosts",
		 "Usagi and her friends go to the beach, where they stay in a hotel run by people who look like film monsters. There, they encounter a ghostly presence and a little girl with psychic powers."
		)	
	,	("Sailor Moon",
		 21,
		 "Protect the Children's Dreams: Friendship Through Anime",
		 "Nephrite targets one of the animators of an upcoming Sailor V film, who is driven by jealousy of her best friend. The Guardians investigate, but Usagi and Rei are distracted by the excitement of the anime studio. "
		)
	,	("Sailor Moon",
		 22,
		 "Romance Under the Moon: Usagi's First Kiss",
		 "Luna and Beryl wonder if a visiting princess could be the one the Guardians have been looking for. Mamoru dreams he is Tuxedo Mask and a girl is asking him for the Silver Crystal. At the ball, Usagi accidentally drinks wine and experiences her first kiss by Tuxedo Mask. "
		)
	,	("Sailor Moon",
		 23,
		 "Wish Upon a Star: Naru's First Love",
		 "Nephrite creates a crystal that will guide him to the Silver Crystal. Usagi tries to tell Naru the man she loves is Nephrite in disguise, but doesn't believe her, saying Usagi's jealous. He convinces her to steal a crystal from her mother and bring it to him. "
		)
	,	("Sailor Moon",
		 24,
		 "Naru's Tears: Nephrite Dies for Love",
		 "Nephrite continues to investigate Naru, not understanding that his crystal is sensing her love for him. Zoisite, thinking he must be in love with the girl, kidnaps her in order to trap him."
		)
	,	("Sailor Moon",
		 25,
		 "Jupiter, the Powerful Girl in Love",
		 "Queen Beryl partially awakens the evil entity Queen Metalia and sends Zoisite and Kunzite to find the Seven Great Youma and their Rainbow Crystals. Meanwhile, the tomboyish Makoto Kino transfers into Usagi's school and quickly falls for a crane-game whiz at the arcade. "
		)
	,	("Sailor Moon",
		 26,
		 "Restore Naru's Smile: Usagi's Friendship",
		 "Naru is still very depressed about Nephrite, so Usagi and Umino take her to Yokohama to have fun. There, a kindly priest is attacked by Zoisite. Mamoru realizes that he is Tuxedo Mask, and drops a locket on the ground, where Usagi finds it. "
		)
	,	("Sailor Moon",
		 27,
		 "Crushing on Ami: The Boy Who Can See The Future",
		 "Ami is bested in a school test by Urawa, who can foresee the future and who has a crush on her. He also already knows that he is one of the Rainbow Crystal holders."
		)
	,	("Sailor Moon",
		 28,
		 "The Painting of Love: Usagi and Mamoru Get Closer",
		 "An artist asks a reluctant Usagi and Mamoru to model for one of her romantic love paintings. They encourage her to be less of a recluse. In battle, Sailor Moon learns that the locket she found belonged to Tuxedo Mask. "
		)
	,	("Sailor Moon",
		 29,
		 "Total Chaos: The Messy Love Rectangle",
		 "Makoto, like Usagi, develops a huge romantic crush on Motoki. The two decide to pursue him simultaneously, even after finding out that he has a girlfriend, who, meanwhile, is targeted by Zoisite and Kunzite. "
		)
	,	("Sailor Moon",
		 30,
		 "Grandpa Loses Control: Rei in Danger",
		 "Zoisite aggravates the Rainbow Crystal inside Rei's grandfather, who becomes hyperactive and unstable. A young man, Yūichirō Kumada, wanders into the shrine, falls in love with Rei, and asks to work there. "
		)	
	,	("Sailor Moon",
		 31,
		 "Love and Chased: Luna's Worst Day Ever",
		 "Luna becomes the object of a very fat ordinary cat's attentions. Both Zoisite and the Sailor Guardians detect traces of the last Rainbow Crystal around the home of this cat's owner and go to investigate."
		)
	,	("Sailor Moon",
		 32,
		 "Umino's Resolve: I'll Protect Naru",
		 "Luna reveals that she is from the moon, and so is the princess the guardians are looking for. Umino, having been told that Tuxedo Mask is attractive, adopts a similar persona in order to protect, and thereby woo, Naru. "
		)
	,	("Sailor Moon",
		 33,
		 "Enter Venus, the Last Sailor Guardian",
		 "Zoisite disguises himself as Sailor Moon in order to lure Tuxedo Mask and the guardians out into the open, where they are attacked by Kunzite. The Dark Kingdom injures Tuxedo Mask's identity, but they are foiled by the appearance of Sailor Venus. "
		)	
	,	("Sailor Moon",
		 34,
		 "The Shining Silver Crystal: The Moon Princess Appears",
		 "The new guardian, Sailor Venus, is also schoolgirl Minako Aino. Forbidden by Queen Beryl to kill Tuxedo Mask, Zoisite challenges him to duel for the Rainbow Crystals. Usagi follows him, and they are forced to reveal their identities to each other. "
		)
	,	("Sailor Moon",
		 35,
		 "Returning Memories: Usagi and Mamoru's Past",
		 "Usagi and Mamoru remember their former lives as Princess Serenity and Prince Endymion. The Dark Kingdom kidnaps the injured Mamoru, but Beryl executes Zoisite for his attempt to kill him. Luna and Artemis tell the Guardians about their tragic past. "
		)
	,	("Sailor Moon",
		 36,
		 "Usagi's Confusion: Is Tuxedo Mask Evil?",
		 "Minako takes a depressed Usagi to the hairdresser to cheer her up. There they are attacked by a youma who is convinced that Minako is Sailor Moon. Tuxedo Mask appears, alive and whole, but addresses himself as Endymion, seems to be fighting for the other side. "
		)
	,	("Sailor Moon",
		 37,
		 "Let's Become a Princess: Usagi's Bizarre Training",
		 "Usagi daydreams of her past and enrolls in a special seminar to become more like a princess. Kunzite and the evil Endymion argue about which is more important: obtaining the Silver Crystal or killing Sailor Moon. "
		)
	,	("Sailor Moon",
		 38,
		 "The Snow, the Mountains, Friendship and Monsters",
		 "Yūichirō takes the girls to a ski resort, where they enter a "Moon Princess" contest. Rei and Usagi, targeted by a youma, take the opportunity to reaffirm their friendship. Tuxedo Mask continues to fight against them. "
		)
	,	("Sailor Moon",
		 39,
		 "Paired with a Monster: Mako, the Ice Skating Queen",
		 "Discovering that the Moon Princess was once known for her graceful ice skating, Kunzite tries to use this information to trap Sailor Moon. The best skater among the girls, however, turns out to be Makoto. Tuxedo Mask appears to help them, but only works against Kunzite because he doesn't want to involve bystanders. "
		)
	,	("Sailor Moon",
		 40,
		 "The Legendary Lake Yokai: The Bond of Usagi's Family",
		 "Usagi and her family go on vacation at a hot springs, where legend holds that a terrible monster was once defeated. Endymion revives the monster, but regrets his action upon discovering that it is not a youma. "
		)
	,	("Sailor Moon",
		 41,
		 "I Won't Run Away from Love Anymore: Ami vs. Mamoru",
		 "Queen Beryl orders the seven people gathered who had carried Rainbow Crystals, intending to combine them into one huge youma. Ami is determined to protect Urawa. Sailor Moon tries to heal Endymion."
		)
	,	("Sailor Moon",
		 42,
		 "Sailor Venus' Past: Minako's Tragic Love",
		 "The Guardians look for an entrance to the Dark Kingdom, where Metalia will soon be awakened. Kunzite decides to try to get at Sailor V and attacks a woman Minako had been good friends with in England."
		)
	,	("Sailor Moon",
		 43,
		 "Usagi Abandoned: The Falling-Out of the Sailor Guardians",
		 "The Sailor Guardians stage a breakup, trying to make it look as though Sailor Moon has defected so that she can infiltrate the Dark Kingdom and save Endymion. She and Sailor Mars find it a little too easy to fight. "
		)
	,	("Sailor Moon",
		 44,
		 "Usagi's Awakening: A Message from the Distant Past",
		 "A blast of energy sends the Guardians to the ruined Moon Kingdom, where they meet a hologram of Queen Serenity and learn about their past. Luna and Artemis find the entrance to the Dark Kingdom. Kunzite attacks, but is finally defeated by Sailor Moon."
		)
	,	("Sailor Moon",
		 45,
		 "Death of the Sailor Guardians: The Tragic Final Battle",
		 "The Sailor Guardians travel to D Point to fight Queen Beryl, where they face her toughest youma yet, the DD Girls and the Inner Guardians are killed protecting Sailor Moon. "
		)
	,	("Sailor Moon",
		 46,
		 "Usagi's Eternal Wish: A Brand New Life",
		 "With her friends dead, Sailor Moon is transported inside the Dark Kingdom to face Queen Beryl and the brainwashed Prince Endymion. "
		)
;

INSERT INTO ANIME_SESSION(ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER, NUMBER_OF_EPISODES) VALUES
		("Sailor Moon", 0, 1, 2)
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