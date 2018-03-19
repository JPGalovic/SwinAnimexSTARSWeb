<?php
	// Main Index Page Builder, Version 1.4.3, FEB18, JPGalovic
	// Include Required Code-Gen
	include('code_gen/include.php'); // Include other Fuctions.
	open_db($DB);

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
		facebook_metadata();
		echo('<title>SwinAnime</title>');
		echo('<link href="'.auto_version('css/main.css').'" rel="stylesheet" type="text/css">');
		echo('<link href="image/icon.png" rel="icon">');
	echo('</head>');

	// Site Header
	include('module/site_header.php');
	echo('<div class="buffer_top"></div>');


	// Generate Site Body
	// Debug Pages
	if($page == 'all_events')
		include('page/all_events.php');
	else if($page == 'anime_view')
		include('page/anime_view.php');
	
	// Special Pages
	else if($page == 'event_details')
		include('page/event_details.php');
	
	// Home Page
	else
		include('page/home.php');

	// Site Footer
	echo('<div class="buffer_bottom"></div>');
	include('module/site_footer.php');

	echo('</html>');
?>