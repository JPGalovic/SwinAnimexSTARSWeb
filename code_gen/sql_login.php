<?php
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