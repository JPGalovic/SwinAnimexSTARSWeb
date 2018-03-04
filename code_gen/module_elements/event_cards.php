<?php
	// Functions for Common elements of Event Cards, Version 1.0.7, MAR18, JPGalovic

	// Event Card Commons

	// Prints out location based on values of received data.
	// event_card_location($event_row['CAMPUS'], $event_row['ROOM'], $event_row['ADDRESS'], $event_row['LAT'], $event_row['LNG']);
	function event_card_location($campus, $room, $address, $lat, $lng)
	{
		// 1. On Campus Event
		// [CAMPUS]
		// [CAMPUS] - [ROOM]
		if($campus != null)
		{
			$return = $campus;
			if($room != null)
				$return .= ' - '.$room;
		}
		// 2. Off Campus Event
		// [ADDRESS]
		else
			$return = $address;
		
		return($return);
	}

	// Common Links
	// $first_link = event_card_end_links($event_row['EVENT_TIME'], $event_row['EVENT_TYPE_DESCRIPTION'], $event_row['EVENT_FACEBOOK_ID'], $event_row['EVENT_UNIONE_URL'], $first_link);
	function event_card_end_links($event_date, $event_type, $fb_id, $unione_id, $previous)
	{
		if($fb_id != '0')
		{
			if(!$previous)
					echo(' | ');
			echo('<a href="https://www.facebook.com/events/'.$fb_id.'/">RSVP on Facebook</a>');
			$previous = false;
		}
		if($unione_id != '0')
		{
			if(!$previous)
					echo(' | ');
			echo('<a href="'.$unione_id.'">Unione Event</a>');
			$previous = false;
		}

		if(!$previous)
				echo(' | ');
		
		echo('<a href="index.php?page=');
		
		switch($event_type)
		{
			case 'Screening Session Event':
				echo('anime_event');
				break;
			case 'Social Episode Event':
				echo('social_event');
				break;
			case 'Workshop Event':
				echo('workshop_event');
				break;
			case 'General Meeting':
				echo('general_meeting_event');
				break;
			case 'Roleplay Event':
				echo('roleplay_event');
				break;
			case 'Tabletop Event':
				echo('tabletop_event');
				break;
			case 'Video Game Event':
				echo('video_game_event');
				break;
			case 'Other Event':
				echo('other_event');
				break;
		}
		
		echo('&session='.$event_date.'">Event Info.</a>');
		
		$previous = false;
		
		return $previous;
	}
	
	// prints image from given settings for event card
	function event_card_image($event_title, $anime_title = null, $game_title = null, $session_type = null, $session_number = null, $full_url = false, $width = null)
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

	// Prints Event Details based on "Event Title"
	// event_details($event_data_row['EVENT_TITLE']);
	// event_details($event_data_row['EVENT_TITLE'], false, false);
	// event_details($event_data_row['EVENT_TITLE'], false);
	// event_details($event_data_row['EVENT_TITLE'], true, false);
	function event_details($event_title, $show_meetup = true, $show_tickets = true)
	{
		$event_details_data = get_event_details($event_title);
		if($event_details_data->num_rows > 0)
			$event_details_row = $event_details_data->fetch_assoc();
		if(isset($event_details_row))
		{
			if($event_details_row['EVENT_DESCRIPTION'] != null)
				echo('<p>'.$event_details_row['EVENT_DESCRIPTION'].'</p>');
			if($event_details_row['MEETUP_INSTRUCTIONS'] != null && $show_meetup)
				echo('<p>'.$event_details_row['MEETUP_INSTRUCTIONS'].'</p>');
			if($event_details_row['TICKETS'] != null && $show_tickets)
				echo('<p>'.$event_details_row['TICKETS'].'</p>');
		}
	}

	// Minimal Event Cards

	// Prints Event Card for Newsletter
	function newsletter_event_card($newsletter_date)
	{
		$event_time = $newsletter_date;
		for($i = 0; $i < 8; $i++)
		{
			$event_data = get_event_data(null, $event_time, true);
			if($event_data->num_rows > 0)
				$event_data_row = $event_data->fetch_assoc();
			else
				return;
			
			$event_time = $event_data_row['EVENT_TIME'];
			
			$anime_data = get_anime_event_data($event_time);
			if($anime_data->num_rows > 0)
				$anime_data_row = $anime_data->fetch_assoc();
			
			//$game_data = get_anime_event_data($event_time);
			//if($game_data->num_rows > 0)
			//	$game_data_row = $game_data->fetch_assoc();
			
			$event_title = $event_data_row['EVENT_TITLE'];
			
			if(isset($anime_data_row))
			{
				$anime_title = $anime_data_row['ANIME_TITLE'];
				$session_type = $anime_data_row['SESSION_TYPE_ID'];
				$session_number = $anime_data_row['SESSION_NUMBER'];
			}
			else
			{
				$anime_title = null;
				$session_type = null;
				$session_number = null;
			}
			
			if(isset($game_data_row))
				$game_title = $game_data_row['GAME_TITLE'];
			else
				$game_title = null;
			
			switch($event_data_row['EVENT_TYPE_DESCRIPTION'])
			{
				case 'Screening Session Event':
					$event_type = 'anime_event';
					break;
				case 'Social Episode Event':
					$event_type = 'social_event';
					break;
				case 'Workshop Event':
					$event_type = 'workshop_event';
					break;
				case 'General Meeting':
					$event_type = 'general_meeting_event';
					break;
				case 'Roleplay Event':
					$event_type = 'roleplay_event';
					break;
				case 'Tabletop Event':
					$event_type = 'tabletop_event';
					break;
				case 'Video Game Event':
					$event_type = 'video_game_event';
					break;
				case 'Other Event':
					$event_type = 'other_event';
					break;
			}
			
			echo('<tr>');
		
				echo('<td>');
					event_card_image($event_title, $anime_title, $game_title, $session_type, $session_number, true, 120);
				echo('</td>');

				echo('<td colspan="3">');
					if($anime_title != null)
						echo('<p>'.$event_title.' - '.$anime_title);
					else if($game_title != null)
						echo('<p>'.$event_title.' - '.$game_title);
					else
						echo('<p>'.$event_title);
					echo('<br>'.date('l jS F Y - g:ia', strtotime($event_data_row['EVENT_TIME'])));
					echo('<br>'.event_card_location($event_data_row['CAMPUS'], $event_data_row['ROOM'], $event_data_row['ADDRESS'], $event_data_row['LAT'], $event_data_row['LNG']).' | <a href="http://www.swinanime.net/index.php?page='.$event_type.'&session='.$event_time.'" style="color: #FF6767; text-decoration: none;">More info.</a></p>');
				echo('</td>');

			echo('</tr>');
			
			unset($event_data);
			unset($event_data_row);
			unset($anime_data);
			unset($anime_data_row);
			unset($game_data);
			unset($game_data_row);
		}
	}

	
	// Event Table Event Cards

	// Prints Event Card for Anime Events
	function anime_event_card($event_date, $event_data_row, &$used_titles, $ignor_title_repeat = false)
	{
		// get anime data
		$anime_event_data = get_anime_event_data($event_date);
		if($anime_event_data->num_rows > 0)
			$anime_event_row = $anime_event_data->fetch_assoc();
		else
			return false; // event date does not have anime associated with it.
		
		// filter out used titles
		if(!$ignor_title_repeat)
		{
			if(in_array($anime_event_row['ANIME_TITLE'], $used_titles))
				return false;
			else
				array_push($used_titles, $anime_event_row['ANIME_TITLE']); // title not used, add to array of used titles and continue.
		}
		
		$anime_data = get_anime_data($anime_event_row['ANIME_TITLE']);
		if($anime_data->num_rows > 0)
			$anime_row = $anime_data->fetch_assoc();
		
		// Build Event Card
		echo('<section class="quater" id="event_card">');
			// Image
			event_card_image($event_data_row['EVENT_TITLE'], $anime_event_row['ANIME_TITLE'], null, $anime_event_row['SESSION_TYPE_ID'], $anime_event_row['SESSION_NUMBER']);
			
			//Core Event Info
			echo('<h4>'.$event_data_row['EVENT_TITLE'].' - '.$anime_event_row['ANIME_TITLE'].'</h4>');
			date_default_timezone_set('Australia/ACT');
			echo('<p>'.date('l jS F Y - g:ia', strtotime($event_data_row['EVENT_TIME'])).'</p>');
			echo('<p>'.event_card_location($event_data_row['CAMPUS'], $event_data_row['ROOM'], $event_data_row['ADDRESS'], $event_data_row['LAT'], $event_data_row['LNG']).'</p>');

			//Anime Specific Details
			$session_number = $anime_event_row['SESSION_NUMBER'];
			$session_type = $anime_event_row['SESSION_TYPE_ID'];
			$anime_clasification = get_anime_session_classification($anime_event_row['ANIME_TITLE'], $anime_event_row['SESSION_NUMBER'], $anime_event_row['SESSION_TYPE_ID']);
			echo('<img src="image/classification/'.$anime_clasification.'.png" alt="'.$anime_clasification.'" id="classification"/>');

			echo('<p>'.$anime_row['ANIME_DESCRIPTION'].'</p>');
			echo('<p>'.$anime_row['COPYRIGHT'].'</p>');
			
			// Links
			$first_link = true;
			$first_link = anime_event_card_volume_links($anime_event_row['ANIME_TITLE'], $first_link);
			$first_link = event_card_end_links($event_data_row['EVENT_TIME'], $event_data_row['EVENT_TYPE_DESCRIPTION'], $event_data_row['EVENT_FACEBOOK_ID'], $event_data_row['EVENT_UNIONE_URL'], $first_link);
		
		echo('</section>');
	}
	
	// Game Event Gard (for all game events)
	function game_event_card($event_dete, $event_data_row)
	{
		$game_event_data = get_game_event_data($event_dete);
		if($game_event_data->num_rows > 0)
		{
			$game_event_row = $game_event_data->fetch_assoc();
			$game_data = get_game_data($game_event_row['GAME_TITLE']);
			if($game_data->num_rows > 0)
				$game_row = $game_data->fetch_assoc();
		}
		
		// Build Event Card
		echo('<section class="quater" id="event_card">');
			// Image
			event_card_image($event_data_row['EVENT_TITLE']);
		
			// Core Event Info
			echo('<h4>'.$event_data_row['EVENT_TITLE']);
			if($event_data_row['EVENT_SUBTITLE'] != null)
			{
				echo(' - '.$event_data_row['EVENT_SUBTITLE']);
				if(isset($game_event_row))
					echo(' ft. '.$game_event_row['GAME_TITLE']);	
			}
			else
				if(isset($game_event_row))
					echo(' ft. '.$game_event_row['GAME_TITLE']);
			echo('</h4>');
		
			date_default_timezone_set('Australia/ACT');
			echo('<p>'.date('l jS F Y - g:ia', strtotime($event_data_row['EVENT_TIME'])).'</p>');
			echo('<p>'.event_card_location($event_data_row['CAMPUS'], $event_data_row['ROOM'], $event_data_row['ADDRESS'], $event_data_row['LAT'], $event_data_row['LNG']).'</p>');
		
			// Descriptions
			event_details($event_data_row['EVENT_TITLE'], false, false);

			if(isset($game_row))
				echo('<p> Game Description'.$game_row['GAME_DESCIRPTION'].'</p>');
		
			// Links
			$first_link = true;
			$first_link = event_card_end_links($event_data_row['EVENT_TIME'], $event_data_row['EVENT_TYPE_DESCRIPTION'], $event_data_row['EVENT_FACEBOOK_ID'], $event_data_row['EVENT_UNIONE_URL'], $first_link);
		echo('</section>');
	}

	// General Event Card
	function general_event_card($event_dete, $event_data_row)
	{
		echo('<section class="quater" id="event_card">');
			// Image
			event_card_image($event_data_row['EVENT_TITLE']);
		
			// Core Event Info
			echo('<h4>'.$event_data_row['EVENT_TITLE'].'</h4>');
		
			date_default_timezone_set('Australia/ACT');
			echo('<p>'.date('l jS F Y - g:ia', strtotime($event_data_row['EVENT_TIME'])).'</p>');
			echo('<p>'.event_card_location($event_data_row['CAMPUS'], $event_data_row['ROOM'], $event_data_row['ADDRESS'], $event_data_row['LAT'], $event_data_row['LNG']).'</p>');
		
			// Descriptions
			event_details($event_data_row['EVENT_TITLE']);
		
			// Links
			$first_link = true;
			$first_link = event_card_end_links($event_data_row['EVENT_TIME'], $event_data_row['EVENT_TYPE_DESCRIPTION'], $event_data_row['EVENT_FACEBOOK_ID'], $event_data_row['EVENT_UNIONE_URL'], $first_link);
		echo('</section>');
	}
?>