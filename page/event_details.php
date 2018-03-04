<?php
	// Event Details Page, Version 1.0.0, MAR18, JPGalovic
	// Generates page for Detailed Event
	
	if(isset($_GET['event_date']))
		$event_date = $_GET['event_date'];
	else
		include('page/404.php'); // Event Date Specified display 404 page;

	$event_data = get_event_data($event_date, null, true);
	if($event_data->num_rows > 0)
		$event_row = $event_data->fetch_assoc();
	else
		include('page/404.php');

	// Generate Page
	// Event Image

	// Event Title - [Subtitle] [ft] [Game Title] [Anime Title] Ect.
	
	// Anime, Game or Base Event Description

	// Location Information     ->     RSVP Links

	// Finer Event Information     ->     MAP to Location
	// Classification
	// Coyright
	// Event Description (if not displayed above)
	// Event Meetup Instructions
	// Event Ticketing Info

	// Purchace Links (Volumes and Games)

	// What You Missed (Anime Volumes Only)
	
?>