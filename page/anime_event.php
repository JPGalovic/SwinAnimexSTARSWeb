<?php
	if(isset($_GET['session']))
	{
		$event_time = $_GET['session'];
		include('sql/events/get_specific_event_data.php');
		
		if($get_event_data_ok)
		{
			$event_row = $get_event_data->fetch_assoc(); // Base Event Data
			
			$anime_event_data = get_anime_event_data($event_time);
			if($anime_event_data->num_rows > 0)
				$anime_event_row = $anime_event_data->fetch_assoc();
			
			$anime_data = get_anime_data($anime_event_row['ANIME_TITLE']);
			if($anime_data->num_rows > 0)
				$anime_row = $anime_data->fetch_assoc();
			
			$anime_title = $anime_event_row['ANIME_TITLE'];
					

			//Construct Page
			include('module/anime_event/event_header.php');
			include('module/anime_event/event_details.php');
			include('module/anime_event/volume_plug.php');
			include('module/anime_event/what_you_missed.php');
			event_dispay_table(4);
		}
	}
?>