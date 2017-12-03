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