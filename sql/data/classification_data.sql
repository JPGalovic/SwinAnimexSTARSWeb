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
	,	("PG - Mild animated violence")
	,	("PG - Mild sexual references and animated violence")
	,	("PG - Mild sexual references and coarse language")
	,	("PG - Mild themes and animated violence")
	,	("PG - Mild themes and coarse language")
	,	("PG - Mild Themes and infrequent coarse language")
	,	("PG - Mild themes")
	,	("PG - Mild themes, animated violence and coarse language")
	,	("PG - Mild themes, sexual references and coarse language")
	,	("PG - Mild themes, sexual references and infrequent coarse language")
	,	("PG - Mild violence, themes, drug references and coarse language")
	,	("PG - Mild animated violence, sexual references, coarse language and nudity")
	,   ("PG - Mild fantasy themes, animated violence and nudity, sexual references and coarse language")
;

-- Data for M Classifications
INSERT INTO CLASSIFICATION (CLASSIFICATION) VALUES
		("M - Adult themes")
	,	("M - Animated nudity and sexualised imagery")
	,	("M - Animated science fiction violence")
	,	("M - Animated violence and coarse language")
	,	("M - Animated violence and infrequent coarse language")
	,	("M - Animated violence and sexual references")
	,	("M - Animated violence and supernatural themes")
	,	("M - Animated violence")
	,	("M - Animated violence, sexualised imagery and sexual references")
	,	("M - Coarse language and mature themes")
	,	("M - Coarse language")
	,	("M - Crude humour, sexual references and coarse language")
	,	("M - Fantasy themes and violence")
	,	("M - Infrequent animated violence and sexual references")
	,	("M - Infrequent coarse language")
	,	("M - Mature themes and animated violence")
	,	("M - Mature themes and sexual references")
	,	("M - Mature themes")
	,	("M - Mature themes, animated violence and coarse language")
	,	("M - Mature themes, drug references, sexual references and animated violence")
	,	("M - Mature themes, mild violence")
	,	("M - Mature themes, sexual references and coarse language")
	,	("M - Medium level violence")
	,	("M - Moderate violence, drug use")
	,	("M - Nudity")
	,	("M - Sexual references and animated nudity")
	,	("M - Sexual references and sexualised imagery")
	,	("M - Sexual references")
	,	("M - Sexual references, animated violence and nudity")
	,	("M - Sexual themes")
	,	("M - Sexualised imagery and animated nudity")
	,	("M - Sexualised imagery and sexual innuendo")
	,	("M - Supernatural themes and animated violence")
	,	("M - Violence, sexual references and nudity")
	,	("M - War themes and animated violence")
;

-- Data for MA15+ Classifications
INSERT INTO CLASSIFICATION (CLASSIFICATION) VALUES
		("MA15+ - Frequent animated nudity and sexualised imagery")
	,	("MA15+ - Strong animated violence and nudity")
	,	("MA15+ - Strong animated violence and sex scenes")
	,	("MA15+ - Strong animated violence and sexual references")
	,	("MA15+ - Strong animated violence")
	,	("MA15+ - Strong coarse language and animated violence")
	,	("MA15+ - Strong sexual innuendo")
	,	("MA15+ - Strong sexual references and frequent animated nudity")
	,	("MA15+ - Strong sexual references, animated nudity and violence")
	,	("MA15+ - Strong sexual themes")
	,	("MA15+ - Strong sexual themes, frequent animated nudity and sexualised imagery")
	,	("MA15+ - Strong sexual themes, frequent animated nudity, sex and sexual violence")
	,	("MA15+ - Strong sexual themes, references and innuendo, sexualised imagery and coarse language")
	,	("MA15+ - Strong sexual themes, sexual references and animated violence")
	,	("MA15+ - Strong sexual themes, sexual innuendo and animated nudity")
	,	("MA15+ - Strong sexualised imagery, crude sexual humour and coarse language")
	,	("MA15+ - Strong supernatural themes and animated violence")
	,	("MA15+ - Strong supernatural themes and violence")
	,	("MA15+ - Strong themes and animated violence")
	,	("MA15+ - Strong themes and bloody violence")
	,	("MA15+ - Strong themes, animated violence, sex scenes and nudity")
	,	("MA15+ - Strong violence")
	,	("MA15+ - Strong violence, drug use")
;

-- Data for R18+ Classifications
INSERT INTO CLASSIFICATION (CLASSIFICATION) VALUES
		("R18+ - High impact sexual themes")
;

