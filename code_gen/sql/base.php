<?php
	// SQL Core Functions, Version 1.0.0, FEB18, JPGalovic

	// Opens Connection to Database using mysqli
	// db: refernce to database variable
	function open_db(&$db)
	{
		$db = new MySQLi('localhost', 'swinan01', 'qdVbzdb498', 'swinan01_smart_web');
		if($db->connect_errno > 0)
			send_error($db->connect_errno+1000,'Unable to connect to Website Database, ['.$DB->connect_errno.', '.$DB->connect_error.']');
	}

	// Closes Connection to Database
	// db: refernce to database variable
	function close_db(&$db)
	{
		$db->close();
	}

	// Runs query on database and returns result
	// query: sql query to run
	function run_query($query)
	{
		open_db($db);
		
		if(!($result= $db->query($query)))// if query fails to run, report error.
			send_error($db->errno+1000, $db->error.' '.$query);
		else
		{
			close_db($db);
			return $result;
		}
	}

?>


