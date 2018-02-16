<?php
	// Database Access, Verson 1.2.2, FEB18, JPGALOVIC
	// Opens Connection to Database using mysqli
	function open_db($db)
	{

		$db = new MySQLi('localhost', 'swinan01', 'qdVbzdb498', 'swinan01_smart_web');
		if($db->connect_errno > 0)
			send_error($db->connect_errno+1000,'Unable to connect to Website Database, ['.$DB->connect_errno.', '.$DB->connect_error.']');
		return $db;
	}

	// Closes Connection to Database
	function close_db($db)
	{
		$db->close();
	}
	

// SQL Access Login
	$sql_server = 'localhost';
	$sql_user	= 'swinan01';
	$sql_pass	= 'qdVbzdb498';
	$sql_data	= 'swinan01_smart_web';

	$DB = new MySQLi('localhost', 'swinan01', 'qdVbzdb498', 'swinan01_smart_web');

	if($DB->connect_errno > 0)
	{
		// On error report 503: Service Unavalible
		$error_no = 503;
		$error_text = 'Unable to connect to Website Database, ['.$DB->connect_errno.', '.$DB->connect_error.']';
		include('code_gen/error_report.php');
	}

	
?>