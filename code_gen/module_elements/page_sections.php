<?php
	// Section Elements, Version 1.0.1, MAR18, JPGalovic

	// Events display table
	// $n_events, number of events to show, default -1, shows all upcoming events.
	// $anime_title, anime_title to exclude when showing cards, used on detailed display for anime events
	// $begining_date, begining date to seartch from
	// $show_all_events, flag used to disable showing of all events.
	function event_dispay_table($n_events = -1, $anime_title = null, $begining_date = null, $show_all_events = false)
	{
		// Determine weather to show repeating titles.
		$display_repeat_titles = !($n_events < 0);
		
		// Preload used titles
		if($anime_title == null)
			$used_titles = array();
		else
			$used_titles = array($anime_title);
		
		// Get First Event
		if($begining_date != null)
			$event_data = get_event_data(null, $begining_date);
		else
			$event_data = get_event_data();
		
		if($event_data->num_rows > 0)
		{
			$event_row = $event_data->fetch_assoc();
			$past_events = false;
		}	
		else // No upcoming events, get past events
		{
			$event_data = get_past_event_data();
			if($event_data->num_rows > 0)
			{
				$event_row = $event_data->fetch_assoc();
				$past_events = true;
			}
			else // No past events, no display events table
				return;
		}
			
		// Build Events Table
		echo('<article class="flex_container" id="event_display">');
			if($past_events)
				echo('<header class="full"><h1>Past Events:</h1><img src="image/events_table.png" id="event_display_image"></header>');
			else
				echo('<header class="full"><h1>Upcoming Events:</h1><img src="image/events_table.png" id="event_display_image"></header>');
		
			echo('<section class="flex_container">');
				
				while($n_events != 0)
				{
					$current_event_time = $event_row['EVENT_TIME'];
					
					// Show Event Card
					switch($event_row['EVENT_TYPE_DESCRIPTION'])
					{
						case 'Screening Session Event':
							anime_event_card($event_row['EVENT_TIME'], $event_row, $used_titles, $show_all_events);
							break;
						case 'Social Episode Event':
						case 'Workshop Event':
						case 'General Meeting':
						case 'Other Event':
							general_event_card($event_row['EVENT_TIME'], $event_row);
							break;
						case 'Roleplay Event':
						case 'Tabletop Event':
						case 'Video Game Event':
							game_event_card($event_row['EVENT_TIME'], $event_row);
							break;
					}
					
					if($past_events)
						$event_data = get_past_event_data($begining_date, $current_event_time);
					else
						$event_data = get_event_data($begining_date, $current_event_time);
					
					$n_events--;
					
					if($event_data->num_rows > 0)
						$event_row = $event_data->fetch_assoc();
					else // No more events gotten, reset counter
						$n_events = 0;
				}
		
			echo('</section>');
		echo('</article>');
	}

?>	