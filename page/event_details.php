<?php
	// Event Details Page, Version 1.0.0, MAR18, JPGalovic
	// Generates page for Detailed Event
	
	if(isset($_GET['event_date']))
	{
		$event_date = $_GET['event_date'];
		
		// Event Header
		$event_description_shown = event_header($event_date);
		
		// Event Details
		event_page_details($event_date, $event_description_shown);
	}
	else
		include('page/404.php'); // Event Date Specified display 404 page;
	
?>