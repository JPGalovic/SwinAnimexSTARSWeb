<?php
	// SQL Connection & Login Details
	$sql_server = 'localhost';
	$sql_user	= 'swinan01';
	$sql_pass	= 'qdVbzdb498';
	$sql_data	= 'swinan01_smart_web';

	$DB = new MySQLi($sql_server, $sql_user, $sql_pass, $sql_data);

	if($DB->connect_errno > 0)
		die('SwinAnime is unable to connect to the Website Database, please let a site admin know by emailing info@swinanime.net with the following information, [' . $DB->connect_error . ']');
		
	// Date Data Values (used for event searching)
	$now = date('Y-m-d H:i:s', time() + (120 * 60));
	$time = date('Y-m-d H:i:s', time());
?>