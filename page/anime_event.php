<?php
	include('sql/sql_login.php'); // Database Login
	if(isset($_GET['session']))
	{
		$event_time = $_GET['session'];
		include('sql/events/get_specific_event_data.php');
		
		if($get_event_data_ok)
		{
			$event_row = $get_event_data->fetch_assoc(); // Base Event Data
			
			include('sql/events/get_anime_event_data.php');

			if($get_anime_event_ok)
			{
				if(!$get_anime_event_data->num_rows == 0) // No Anime Event Data what to do??
				{
					$anime_event_row = $get_anime_event_data->fetch_assoc(); // Anime Event Data
					$anime_title = $anime_event_row['ANIME_TITLE'];
					
					include('sql/events/get_anime_event_page_data.php');
					
					if($get_anime_event_page_ok)
					{
						$anime_row = $get_anime_event_page_data->fetch_assoc(); // Anime Data
						
						//Construct Page
						include('module/anime_event/event_header.php');
						include('module/anime_event/event_details.php');
						include('module/anime_event/volume_plug.php');
						include('module/anime_event/what_you_missed.php');
						include('module/events_table/4_events_table.php');
					}
				}
			}
		}
	}
?>