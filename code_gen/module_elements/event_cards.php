<?php
	// Functions for Common elements of Event Cards, Version 1.0.5, FEB18, JPGalovic

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
	// 
	function event_card_image($event_title, $anime_title, $game_title, $session_type, $session_number, $full_url = false, $width = null)
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
?>