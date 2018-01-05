<?php
	// Displays Table made up of N event cards, Version 1.0, JAN18, JPGalovic
	// Flags: n_events: int
	if(!isset($n_events)) // Number of events not set, show all future events
		$n_events = -1;

	echo('<article class="flex_container" id="event_display">');

	// Container for list of used anime's<br>
	if(isset($anime_title))
		$used_titles = array($anime_title); // Array to store anime titles
	else
		$used_titles = array(); // Array to store anime titles

	echo('<header class="full"><h1>Upcoming Events:</h1><img src="image/events_table.png" id="event_display_image"></header>');
	echo('<section class="flex_container">');

	include('sql/events/get_core_event_data.php'); // Get Core Event Data.

	if($get_core_event_data->num_rows == 0) // No future events
	{
		// TODO: Past Events?
	}
	else
	{
		while(!$n_events == 0)
		{
			$is_ok = true; // Set OK flag

			if(!$get_core_event_data->num_rows == 0) // Next Event Got
			{
				$event_row = $get_core_event_data->fetch_assoc();
				$event_time = $event_row['EVENT_TIME'];

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
			else // No more events
			{
				$n_events = 0;
				break;
			}

			include('sql/events/get_core_event_data.php');

			if($is_ok) // Decrement number of events if event displayed.
				$n_events--;
		}
	}
	
	echo('</section>');
	echo('</article>');
?>