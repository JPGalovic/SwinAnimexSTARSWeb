<?php
	// Section Elements, Version 1.0.3, MAR18, JPGalovic

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

	// Prints image for event.
	// $event_title, title of event
	// $anime_title, title of anime, default null
	// $game_title, title of game, default null
	// $session_type, session type for screening events, default null
	// $session_number, session number for screening events, default null
	// $full url, flag to switch between showing full or relitive urls, default false (display relitive)
	// $width, set width of image overiding css?, default 100% (full with);
	function event_image($event_title, $anime_title = null, $game_title = null, $session_type = null, $session_number = null, $full_url = false, $width = "100%")
	{
		echo('<img src="');
			if($full_url)
				echo('http://swinanime.net/');
		if($anime_title != null && $session_type != null && $session_number != null)
			echo('image/anime/'.remove_illegal_char(strtolower($anime_title)).'/session/'.$session_type.$session_number.'.jpg" alt="'.$anime_title.'" width="'.$width.'">');
		else if ($game_title != null)
			echo('image/game/'.remove_illegal_char(strtolower($game_title)).'.png" alt="'.$game_title.'" width="'.$width.'">');
		else
			echo('image/event/'.remove_illegal_char(strtolower($event_title)).'.png" alt="'.$event_title.'" width="'.$width.'">');
	}

	// Generate Event Tile
	function event_title($event_title, $event_subtitle = null, $event_feature = null)
	{
		$result = $event_title;
		if($event_subtitle != null)
		{
			$result = $result.' - '.$event_subtitle;
			if($event_feature != null)
				$result = $result.' ft. '.$event_feature;
		}
		else
			if($event_feature != null)
			$result = $result.' - '.$event_feature;
		
		return $result;
	}
	
	// Prints Event Header (Used on event details page)
	// $event_date, date of event
	function event_header($event_date)
	{
		$return_flag = false;
		$event_data = get_event_data($event_date, null, false);
		if($event_data->num_rows > 0)
		{
			$event_data_row = $event_data->fetch_assoc();
			
			$anime_event_data = get_anime_event_data($event_date);
			if($anime_event_data->num_rows > 0)
			{
				$anime_event_row = $anime_event_data->fetch_assoc();
				$anime_data = get_anime_data($anime_event_row['ANIME_TITLE']);
				if($anime_data->num_rows > 0)
					$anime_row = $anime_data->fetch_assoc();
			}
				
			$game_event_data = get_game_event_data($event_date);
			if($game_event_data->num_rows > 0)
			{
				$game_event_row = $game_event_data->fetch_assoc();
				$game_data = get_game_data($game_event_row['GAME_TITLE']);
				if($game_data->num_rows > 0)
					$game_row = $game_data->fetch_assoc();
			}
		
			echo('<article class="flex_container" id="event_page_header">');
				// image
				echo('<header class="full">');
					if(isset($anime_event_row))
					event_image($event_data_row['EVENT_TITLE'], $anime_event_row['ANIME_TITLE'], null, $anime_event_row['SESSION_TYPE_ID'], $anime_event_row['SESSION_NUMBER']);
					else if(isset($game_event_row))
						event_image($event_data_row['EVENT_TITLE'], null, $game_event_row['GAME_TITLE']);
					else
						event_image($event_data_row['EVENT_TITLE']);
				echo('</header>');

				echo('<section class="full">');
					if(isset($anime_event_row))
					{
						echo('<h2>'.event_title($event_data_row['EVENT_TITLE'], $event_data_row['EVENT_SUBTITLE'], $anime_event_row['ANIME_TITLE']).'</h2>');
						echo('<p>'.$anime_row['ANIME_SYNOPSIS'].'</p>');
					}
					else if(isset($game_event_row))
					{
						echo('<h2>'.event_title($event_data_row['EVENT_TITLE'], $event_data_row['EVENT_SUBTITLE'], $game_event_row['GAME_TITLE']).'</h2>');
						echo('<p>'.$game_row['GAME_DESCIRPTION'].'</p>');
					}
					else
					{
						echo('<h2>'.event_title($event_data_row['EVENT_TITLE'], $event_data_row['EVENT_SUBTITLE']).'</h2>');
						event_details($event_data_row['EVENT_TITLE'], false, false);
						$return_flag = true;
					}

				echo('</section>');


			echo('</article>');
		}
		return $return_flag;
	}

?>	