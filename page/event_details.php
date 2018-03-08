<?php
	// Event Details Page, Version 1.0.0, MAR18, JPGalovic
	// Generates page for Detailed Event
	
	if(isset($_GET['event_date']))
	{
		$event_date = $_GET['event_date'];
		
		$event_data = get_event_data($event_date, null, false);
		if($event_data->num_rows > 0)
		{
			$event_data_row = $event_data->fetch_assoc();
			
			$anime_event_data = get_anime_event_data($event_date);
			if($anime_event_data->num_rows > 0)
				$anime_event_row = $anime_event_data->fetch_assoc();
				
			$game_event_data = get_game_event_data($event_date);
			if($game_event_data->num_rows > 0)
				$game_event_row = $game_event_data->fetch_assoc();
			
			// Event Header
			$event_description_shown = event_header($event_date);

			// Event Details
			event_page_details($event_date, $event_description_shown);
			
			if(isset($anime_event_row))
				event_page_anime_volume($anime_event_row['ANIME_TITLE']);

			// Upcoming Events Table
			event_dispay_table(4, null, null, false, $event_date);
		}
		else
			include('page/404.php');
	}
	else
		include('page/404.php'); // Event Date Specified display 404 page;
	
?>