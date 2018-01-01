<?php
	// Include Required Code-Gen
	include('code_gen/sql_login.php'); // Login and open connection to database
	include('code_gen/misc_var.php'); // Include Global Variables
	include('code_gen/process/remove_illegal_char.php'); // Include Fuctions for removal of illegal characters

	// Get page from url
	$page = 'home';

	if(isset($_GET['page']))
		$page = $_GET['page'];

	// site head
	echo('<!doctype html>');
	echo('<html>');
	
	echo('<head>');
		echo('<meta charset="utf-8">');
		echo('<meta name="viewport" content="width=device-width, initial-scale=1">');
		echo('<title>SwinAnime</title>');
		echo('<link href="css/main.css" rel="stylesheet" type="text/css">');
		echo('<link href="image/icon.png" rel="icon">');
	echo('</head>');

	// site header
	include('module/site_header.php');
	echo('<div class="buffer_top"></div>');


	// site body
	if($page == 'all_events')
		include('page/all_events.php');
	else if($page == 'anime_event')
		include('page/anime_event.php');
	else if($page == 'social_event')
		include('page/social_event.php');
	else if($page == 'anime_view')
		include('page/anime_view.php');
	else
		include('page/home.php');

	// site footer
	echo('<div class="buffer_bottom"></div>');
	include('module/site_footer.php');

	echo('</html>');

	include('code_gen/sql_close.php');
?>