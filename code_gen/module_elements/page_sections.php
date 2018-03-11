<?php
	// Section Elements, Version 1.0.8, MAR18, JPGalovic

	// Events display table
	// $n_events, number of events to show, default -1, shows all upcoming events.
	// $anime_title, anime_title to exclude when showing cards, used on detailed display for anime events
	// $begining_date, begining date to seartch from
	// $show_all_events, flag used to disable showing of all events.
	function event_dispay_table($n_events = -1, $anime_title = null, $begining_date = null, $show_all_events = false, $exclude_date = null)
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
					
					if($event_row['EVENT_TIME'] !== $exclude_date)
					{
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

						

						$n_events--;
					}
					
					if($past_events)
						$event_data = get_past_event_data($begining_date, $current_event_time);
					else
						$event_data = get_event_data($begining_date, $current_event_time);
					
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
			echo('image/anime/'.remove_illegal_char(strtolower($anime_title)).'/session/'.$session_type.$session_number.'.jpg" onerror="this.src='."'".'image/misc/no_event_image.png'."'".'" alt="'.$anime_title.'" width="'.$width.'">');
		else if ($game_title != null)
			echo('image/game/'.remove_illegal_char(strtolower($game_title)).'.png" alt="'.$game_title.'" onerror="this.src='."'".'image/misc/no_event_image.png'."'".'" width="'.$width.'">');
		else
			echo('image/event/'.remove_illegal_char(strtolower($event_title)).'.png" onerror="this.src='."'".'image/misc/no_event_image.png'."'".'" alt="'.$event_title.'" width="'.$width.'">');
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
	// Event Header contains Image, Description/Synopsys as well as Event Datetime and RSVP links.
	// $event_date, date of event
	function event_header($event_date)
	{
		$return_flag = true;
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
						$return_flag = false;
					}

				echo('</section>');
			
				//Event Time & RSVP
				echo('<footer class="full">');

					if(isset($anime_event_row))
						echo('<p>Showing from ');
					else if(isset($game_event_row))
						echo('<p>Playing from ');
					else
						echo('<p>Starting at ');
						 
					echo(date('g:ia', strtotime($event_date)).' on '.date('l jS F Y', strtotime($event_date)).'</p>');
						
					if(!$event_data_row['EVENT_FACEBOOK_ID'] == '0')
						echo('<a href="https://www.facebook.com/events/'.$event_data_row['EVENT_FACEBOOK_ID'].'/">RSVP on Facebook</a>');
					if(!$event_data_row['EVENT_UNIONE_URL'] == '0')
						echo('<a href="'.$event_data_row['EVENT_UNIONE_URL'].'">Unione Event</a>');
			
				echo('</footer>');


			echo('</article>');
		}
		return $return_flag;
	}

	// Prints Event Details section (Used on event details page)
	// $event_date, date of event
	// $post_description, flag to determine if description has been used in event header
	function event_page_details($event_date, $show_description)
	{
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
			
			$event_details_data = get_event_details($event_data_row['EVENT_TITLE']);
			if($event_details_data->num_rows > 0)
				$event_details_row = $event_details_data->fetch_assoc();
			
			echo('<article class="flex_container" id="event_page_details">');
				echo('<section class="half" id="event_details">');
					if(isset($anime_event_row))
					{
						$session_number = $anime_event_row['SESSION_NUMBER'];
						$session_type = $anime_event_row['SESSION_TYPE_ID'];
						$anime_clasification = get_anime_session_classification($anime_event_row['ANIME_TITLE'], $anime_event_row['SESSION_NUMBER'], $anime_event_row['SESSION_TYPE_ID']);
						echo('<img src="image/classification/'.$anime_clasification.'.png" alt="'.$anime_clasification.'" id="classification"/>');
						
						echo('<p>'.$anime_row['COPYRIGHT'].'</p>');
					}
					
			
					if(isset($event_details_row))
					{
						if($event_details_row['EVENT_DESCRIPTION'] != null && $show_description)
							echo('<p>'.$event_details_row['EVENT_DESCRIPTION'].'</p>');
						if($event_details_row['MEETUP_INSTRUCTIONS'] != null)
							echo('<p>'.$event_details_row['MEETUP_INSTRUCTIONS'].'</p>');
						if($event_details_row['TICKETS'] != null)
							echo('<p>'.$event_details_row['TICKETS'].'</p>');
					}
				echo('</section>');
			
				$location_id = $event_data_row['LOCATION_ID'];
				include('module/misc/map.php');
			
			echo('</article>');
		}
	}

	// Prints links with images for purchacable items.
	// $anime_title, title of anime
	function event_page_anime_volume($anime_title)
	{
		$volume_data = get_anime_volumes($anime_title);
		if($volume_data->num_rows > 0)
		{
			$anime_data = get_anime_data($anime_title);
			if($anime_data->num_rows > 0)
			{
				$anime_row = $anime_data->fetch_assoc();
				
				// Determine if DVD & BD are avalible.
				$has_stream = false;
				$has_dvd = false;
				$has_bd = false;

				while($volume_row = $volume_data->fetch_assoc())
				{
					switch($volume_row['VOLUME_TYPE_ID'])
					{
						case 0:
							$has_stream = true;
						case 1:
							$has_dvd = true;
							break;
						case 2:
							$has_bd = true;
							break;
						case 3:
							$has_dvd = true;
							break;
						case 4:
							$has_bd = true;
							break;
					}
				}

				$volume_data->data_seek(0);

				// Continue only if DVD or BD volume is avalible
				if($has_dvd || $has_bd)
				{
					echo('<article class="flex_container" id="anime_volume_table">');
						echo('<header class="full">');
							if($has_dvd && $has_bd)
								echo('<h2>Buy the DVD &amp; Bluray&trade; Today!</h2>');
							else if($has_dvd && !$has_bd)
								echo('<h2>Buy the DVD Today!</h2>');
							else if(!$has_dvd && $has_bd)
								echo('<h2>Buy the Bluray&trade; Today!</h2>');	
						echo('</header>');

						echo('<aside class="full">');
							echo('<p>'.$anime_title.' is avalible to be brought from '.$anime_row['COMPANY_NAME'].'&#39;s store!</p>');
						echo('</aside>');

						while($volume_row = $volume_data->fetch_assoc())
						{
							if(!$volume_row['VOLUME_TYPE_ID'] == 0)
							{
								echo('<section>');
									echo('<img src="image/anime/'.remove_illegal_char(strtolower($anime_title)).'/volume/'.$volume_row['VOLUME_TYPE_ID'].$volume_row['VOLUME_NUMBER'].'.png" onerror="this.src='."'image/no_cover_image.png'".'" alt="Volume Image">');

									echo('<a href="'.$volume_row['PURCHACE_URL'].'">');
										switch($volume_row['VOLUME_TYPE_ID'])
										{
											case 1:
												echo('Buy '.$volume_row['VOLUME_TYPE_DESCRIPTION'].' Volume '.$volume_row['VOLUME_NUMBER'].' Now!');
												break;
											case 2:
												echo('Buy '.$volume_row['VOLUME_TYPE_DESCRIPTION'].' Volume '.$volume_row['VOLUME_NUMBER'].' Now!');
												break;
											case 3:
												echo('Buy '.$volume_row['VOLUME_TYPE_DESCRIPTION'].' Now!');
												break;
											case 4:
												echo('Buy '.$volume_row['VOLUME_TYPE_DESCRIPTION'].' Now!');
												break;
										}
									echo('</a>');
								echo('</section>');
							}
						}

					echo('</article>');
				}
			}
		}
		
	}
	
	// Prints what you missed section if applicable to event
	function event_page_what_you_missed($anime_title, $session_number, $session_type)
	{
		$episode_range = get_anime_session_data($anime_title, $session_number, $session_type);
		if($episode_range['previous_episode'] > 0)
		{
			$episode_data = get_anime_episode_range_data($anime_title, $episode_range['previous_episode']);
			if($episode_data->num_rows > 0)
			{
				echo('<article class="flex_container" id="what_you_missed">');
					echo('<header class="full">');
						echo('<h1>What you Missed</h1>');
						echo('<img src="image/what_you_missed.png" id="what_you_missed_image">');
					echo('</header>');
				
					while($episode_row = $episode_data->fetch_assoc())
					{
						echo('<section class="quater">');
							echo('<img src="image/anime/'.remove_illegal_char(strtolower($anime_title)).'/episode/'.$episode_row['EPISODE_NUMBER'].'.jpg" alt="'.$anime_title.' Episode '.$episode_row['EPISODE_NUMBER'].'">');
							echo('<h4>Episode '.$episode_row['EPISODE_NUMBER'].', '.$episode_row['EPISODE_TITLE'].'</h4>');
							echo('<p>'.$episode_row['EPISODE_SYNOPSYS'].'</p>');
						echo('</section>');
					}

				echo('</article>');
			}
		}	
	}

?>	