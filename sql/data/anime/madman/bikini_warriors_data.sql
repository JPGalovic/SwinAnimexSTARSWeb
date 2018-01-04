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
		("Bikini Warriors", 1, 1, 12)
	,	("Bikini Warriors", 2, 1, 12)
	,	("Bikini Warriors", 3, 1, 12)
;

