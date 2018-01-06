-- Table for Sponsors
CREATE TABLE IF NOT EXISTS COMPANY (
		COMPANY_NAME			VARCHAR(50)
	,	COMPANY_URL				VARCHAR(250)
	,	IS_SPONSOR				BOOLEAN 			NOT NULL
	,	PRIMARY KEY				(COMPANY_NAME)
);

-- Data for Sponsors
INSERT INTO COMPANY (COMPANY_NAME, COMPANY_URL, IS_SPONSOR) VALUES
		("Madman", "https://madman.com.au/", TRUE)
	,	("AnimeLab", "https://animelab.com", TRUE)
	,	("Hanabee", "https://hanabee.com.au/", TRUE)
	,	("Siren", "https://sirenvisual.com.au/", TRUE)
	,	("Rewardle", "https://patrons.rewardle.com/", TRUE)
	,	("Grain and Nori", "http://www.grainandnori.com.au/", TRUE)
	,	("Resistance Bar and Cafe", "https://www.facebook.com/TheResistanceBarandCafe/", TRUE)
	,	("Glenferrie Crepe Cafe", "http://www.glenferriecrepecafe.com.au/", TRUE)
;

