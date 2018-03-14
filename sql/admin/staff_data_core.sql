-- Staff Data Core, Version 1.0.2, MAR18, J.P.Galovic
-- Staff Type Key Table, Contains Data and Descriptors for the differnt types of Staff
CREATE TABLE IF NOT EXISTS STAFF_TYPE (
		TYPE					VARCHAR(10)
	,	TYPE_DESCRIPTION		VARCHAR(150)
	,	PRIMARY KEY				(TYPE)
)

-- Staff Type Data Definitions
INSERT INTO STAFF_TYPE(TYPE, TYPE_DESCRIPTION) VALUES
		("Club Committee", "Staff Role for Club Committee members.")
	,	("Webteam", "Staff Role for those on the club's Web Development Team")
	,	("Volunteer", "StaffGeneral Volunteer")
;

-- Staff Table
-- No local data is created
CREATE TABLE IF NOT EXISTS STAFF (
		NAME					VARCHAR(150)
	,	STUDENT_ID				VARCHAR(15)
	,	CONTACT_NUMBER			INT(11)
	,	CONTACT_EMAIL			VARCHAR(150)
	,	PASS					VARCHAR(100)
	,	SALT					VARCHAR(25)
)