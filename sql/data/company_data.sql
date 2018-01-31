-- Table for Sponsors
CREATE TABLE IF NOT EXISTS COMPANY (
		COMPANY_NAME			VARCHAR(50)
	,	COMPANY_URL				VARCHAR(250)
	,	IS_SPONSOR				BOOLEAN 			NOT NULL
	,	FREE_MEMBER_BENIFIT		VARCHAR(1000)
	,	PREMIUM_MEMBER_BENIFIT	VARCHAR(1000)
	,	REDEMPTION_INSTRUCTIONS	VARCHAR(1000)
	,	PRIMARY KEY				(COMPANY_NAME)
);

-- Data for Sponsors
INSERT INTO COMPANY (COMPANY_NAME, COMPANY_URL, IS_SPONSOR, FREE_MEMBER_BENIFIT, PREMIUM_MEMBER_BENIFIT, REDEMPTION_INSTRUCTIONS) VALUES
		("Madman",
		 "https://madman.com.au/",
		 TRUE,
		 "Free Members are elegable for special prize packs.",
		 "Premium Members are elegable for all offered prize packs and upto 20% discount on purchaces made via the club.",
		 "All competitions can be entered by either attendance, or by spending the required points on the clubs Rewardle Tablet. Purchace Orders are to be submitted to the Club's Treasurer at any event, payment been maid via Eftpos or Credit Card, paid to Swinburne Student Life, All Purchace Orders are processed at the end of the calandar month, only after payment has been made, Goods from Purchace Orders can be collected from the next club Screening Session once package has arrived and been processed.")
	,	("AnimeLab",
		 "https://animelab.com",
		 TRUE,
		 "Free Members are not eleagible for any benifit.",
		 "Premium Members are elegable for a discount on purchaces of annual premium membership.",
		 "Premium Members who have accepted the conditions to recive premium discounts will recive usable codes for purchace.")
	,	("Hanabee",
		 "https://hanabee.com.au/",
		 TRUE,
		 "Free Members are elegable for special prize packs.",
		 "Premium Members are elegable for all offered prize packs and a discount on purchaces on the Hanabee website.",
		 "All competitions can be entered by either attendance, or by spending the required points on the clubs Rewardle Tablet. Premium Members who have accepted the conditions to recive premium discounts will recive usable codes for purchace.")
	,	("Siren",
		 "https://sirenvisual.com.au/",
		 TRUE,
		 "Free Members are elegable for special prize packs.",
		 "Premium Members are elegable for all offered prize packs and a discount on purchaces on the Hanabee website.", 
		 "All competitions can be entered by either attendance, or by spending the required points on the clubs Rewardle Tablet. Premium Members who have accepted the conditions to recive premium discounts will recive usable codes for purchace.")
	,	("Rewardle",
		 "https://patrons.rewardle.com/",
		 TRUE,
		 NULL,
		 NULL,
		 NULL)
	,	("Grain and Nori",
		 "http://www.grainandnori.com.au/",
		 TRUE,
		 "All Club members are eleigable to recive a free drink with any purchace over $10.",
		 NULL,
		 "Show your membership card at time of purchace to claim your benifit")
	,	("Resistance Bar and Cafe",
		 "https://www.facebook.com/TheResistanceBarandCafe/",
		 TRUE,
		 "All members are eleagble to recive a 5% discount on purchaces.",
		 NULL,
		 "Show your membership card at time of purchace to claim your benifit")
	,	("Glenferrie Crepe Cafe",
		 "http://www.glenferriecrepecafe.com.au/",
		 TRUE,
		 "All members are eleagble to recive a discount on purchaces.",
		 NULL,
		 "Show your membership card at time of purchace to claim your benifit")
	,	("Pumpt Gym",
		 "http://pumptgym.net/",
		 TRUE,
		 "All members are elevable to recive a special deal on Foundation Membership for just $16.95 per week.",
		 NULL,
		 "Simply visit Pumpt Gym and show your membership card when you sign up to their package!"
		)
;

