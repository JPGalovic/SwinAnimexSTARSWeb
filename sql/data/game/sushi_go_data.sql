-- Sushi Go Data, Version 1.0, FEB18, JPGalovic
INSERT INTO GAME (GAME_TITLE, GAME_DESCIRPTION, MIN_NUMBER_OF_PLAYERS, MAX_NUMBER_OF_PLAYERS, RECOMMENDED_NUMBER_OF_PLAYERS, COMPANY_NAME, CLASSIFICATION) VALUES
		("Sushi Go",
		 "In the super-fast sushi card game Sushi Go!, you are eating at a sushi restaurant and trying to grab the best combination of sushi dishes as they whiz by. Score points for collecting the most sushi rolls or making a full set of sashimi. Dip your favorite nigiri in wasabi to triple its value! And once you've eaten it all, finish your meal with all the pudding you've got! But be careful which sushi you allow your friends to take; it might be just what they need to beat you!",
		 2,
		 5,
		 4,
		 "Adventureland Games",
		 null
		)
;

INSERT INTO GAME_PLATFORM (GAME_TITLE, PLATFORM_ID) VALUES
		("Sushi Go",
		 10
		)
;