<?php
	// Functions for Common elements of Event Cards, Version 1.0.2, FEB18, JPGalovic

	// Prints out location based on values of received data.
	// event_card_location($event_row['CAMPUS'], $event_row['ROOM'], $event_row['ADDRESS'], $event_row['LAT'], $event_row['LNG']);
	function event_card_location($campus, $room, $address, $lat, $lng)
	{
		// 1. On Campus Event
		// [CAMPUS]
		// [CAMPUS] - [ROOM]
		if($campus != NULL)
		{
			echo('<p>'.$campus);
			if($room != NULL)
				echo(' - '.$room.'</p>');
			else
				echo('</p>');
		}
		// 2. Off Campus Event
		// [ADDRESS]
		else
		{
			echo($address);
		}
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
?>