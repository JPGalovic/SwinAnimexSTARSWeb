<?php
	// Section Elements, Version 1.0.1, MAR18, JPGalovic





	// Events display table
	function event_dispay_table($n_events = -1, $anime_title = null, $page_event_time = null)
	{
		// Determine weather to show repeating titles.
		$display_repeat_titles = !($n_events < 0);
		
		// Preload used titles
		if($anime_title == null)
			$used_titles = array();
		else
			$used_titles = array($anime_title);
		
		// Get First Event
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
							anime_event_card($event_row['EVENT_TIME'], $event_row, $used_titles, $display_repeat_titles);
							break;
						case 'Social Episode Event':
							include('module/event_card/social_event_card.php');
							break;
						case 'Workshop Event':
							include('module/event_card/workshop_event_card.php');
							break;
						case 'General Meeting':
							include('module/event_card/general_meeting_card.php');
							break;
						case 'Roleplay Event':
						case 'Tabletop Event':
						case 'Video Game Event':
							game_event_card($event_row['EVENT_TIME'], $event_row);
							break;
						case 'Other Event':
							include('module/event_card/other_event_card.php');
							break;
					}
					
					if($past_events)
						$event_data = get_past_event_data($page_event_time, $current_event_time);
					else
						$event_data = get_event_data($page_event_time, $current_event_time);
					
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