<?php
	// Section displays next 8 events not including subsiqent part events

	//Section gets next 4 Upcoming Events, in the case where no more upcoming events are found Section gets previous 4 events
	//Login to Database
	include('sql/sql_login.php');

	//Construct Section
	echo('<article class="flex_container" id="event_display">');

	//Get Next Event
	include('sql/events/get_next_event.php');

	//Check Data OK
	if($get_next_ok)
	{
		if($get_next_data->num_rows == 0) //No future events found
		{
			// TODO: Show Previous Events?
		}
		else
		{
			
			$no_remaining = 8;
			
			$used_titles = array(); // Array to store anime titles
			
			
			echo('<header class="full"><h1>Upcoming Events:</h1><img src="image/events_table.png" id="event_display_image"></header>');
			echo('<section class="flex_container">');
			
			while($no_remaining > 0)
			{
				$is_ok = true;
				if($get_next_ok)
				{
					if(!$get_next_data->num_rows == 0)
					{
						$event_row = $get_next_data->fetch_assoc();
						$event_time = $event_row['EVENT_TIME']; // Set Event Time

						switch($event_row['EVENT_TYPE_DESCRIPTION'])
						{
							case 'Screening Session Event':
								include('module/event_card/anime_event_card.php');
								break;
							case 'Social Episode Event':
								include('module/event_card/social_event_card.php');
								break;
							case 'Workshop Event':
								break;
							case 'General Meeting':
								break;
						}
					}
				}
				include('sql/events/get_next_event.php');
				
				if($is_ok)
				{
					$no_remaining--;
				}
			}
			
			echo('</section>');
		}
	}

	echo('</article>')
?>