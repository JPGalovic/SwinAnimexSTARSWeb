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
	,	("PG - Mild sexual references and animated violence")
	,	("PG - Mild sexual references and coarse language")
	,	("PG - Mild themes and animated violence")
	,	("PG - Mild themes and coarse language")
	,	("PG - Mild themes, sexual references and infrequent coarse language")
	,	("PG - Mild themes, sexual references and coarse language")
	,	("PG - Mild violence, themes, drug references and coarse language")
	,	("PG - Mild themes, animated violence and coarse language")
;

-- Data for M Classifications
INSERT INTO CLASSIFICATION (CLASSIFICATION) VALUES
		("M - Adult themes")
	,	("M - Animated science fiction violence")
	,	("M - Animated violence")
	,	("M - Animated violence and sexual references")
	,	("M - Animated violence and supernatural themes")
	,	("M - Animated violence, sexualised imagery and sexual references")
	,	("M - Crude humour, sexual references and coarse language")
	,	("M - Coarse language and mature themes")
	,	("M - Coarse language")
	,	("M - Mature themes")
	,	("M - Mature themes and sexual refernces")
	,	("M - Mature themes and animated violence")
	,	("M - Mature themes, animated violence and coarse language")
	,	("M - Mature themes, drug references, sexual references and animated violence")
	,	("M - Sexual references")
	,	("M - Sexual references, animated violence and nudity")
	,	("M - Sexual references and sexualised imagery")
	,	("M - Sexual references and animated nudity")
	,	("M - Mature themes and sexual references")
	,	("M - Sexual themes")
	,	("M - Supernatural themes and animated violence")
	,	("M - Violence, sexual references and nudity")
	,	("M - Fantasy themes and violence")
	,	("M - Infrequent coarse language")
	,	("M - Infrequent animated violence and sexual references")
	,	("M - Animated violence and infrequent coarse language")
	,	("M - Sexualised imagery and animated nudity")
	,	("M - Mature themes, sexual references and coarse language")
;

-- Data for MA15+ Classifications
INSERT INTO CLASSIFICATION (CLASSIFICATION) VALUES
		("MA15+ - Frequent animated nudity and sexualised imagery")
	,	("MA15+ - Strong animated violence")
	,	("MA15+ - Strong animated violence and sex scenes")
	,	("MA15+ - Strong themes and animated violence")
	,	("MA15+ - Strong themes, animated violence, sex scenes and nudity")
	,	("MA15+ - Strong themes and bloody violence")
	,	("MA15+ - Strong sexual themes, sexual references and animated violence")
	,	("MA15+ - Strong sexual themes, frequent animated nudity and sexualised imagery")
	,	("MA15+ - Strong sexual themes, frequent animated nudity, sex and sexual violence")
	,	("MA15+ - Strong sexualised imagery, crude sexual humour and coarse language")
	,	("MA15+ - Strong supernatural themes and violence")
	,	("MA15+ - Strong sexual references and frequent animated nudity")
	,	("MA15+ - Strong sexual references, animated nudity and violence")
;

