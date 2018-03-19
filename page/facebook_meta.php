<?php

	function image_url($event_title, $fetaured_title = null, $session_type = null, $session_number = null)
	{
		$image_url = 'http://swinanime.net/'; //base url
		
		if($fetaured_title != null && $session_type != null && $session_number != null) // title, session and type number, means title is anime
			$image_url = $image_url.'image/anime/'.remove_illegal_char(strtolower($fetaured_title)).'/session/'.$session_type.$session_number.'.jpg';
		else if($fetaured_title != null) // no session and type, means title is game
			$image_url = $image_url.'image/game/'.remove_illegal_char(strtolower($fetaured_title)).'.png';
		else
			$image_url = $image_url.'image/event/'.remove_illegal_char(strtolower($event_title)).'.png';
		
		echo($image_url);
		return $image_url;
	}

	function get_image_url()
	{
		if(isset($_GET['event_date']))
		{
			$event_date = $_GET['event_date'];
			
			$event_data = get_event_data(null, $event_date);
			
			if($event_data->num_rows > 0)
			{
				switch($event_row['EVENT_TYPE_DESCRIPTION'])
					{
						case 'Screening Session Event':
							$anime_event_data = get_anime_event_data($event_time);
							if($anime_event_data->num_rows > 0)
								$anime_event_row = $anime_event_data->fetch_assoc();
						
							if(isset($anime_event_row))
								$image = image_url($event_row['EVENT_TITLE'], $anime_event_row['ANIME_TITLE'], $anime_event_row['SESSION_TYPE_ID'], $anime_event_row['SESSION_NUMBER']);
							else
								$image = image_url($event_row['EVENT_TITLE']);
						case 'Social Episode Event':
						case 'Workshop Event':
						case 'General Meeting':
						case 'Other Event':
							return image_url($event_row['EVENT_TITLE']);
						case 'Roleplay Event':
						case 'Tabletop Event':
						case 'Video Game Event':
							$game_event_data = get_game_event_data($event_time);
							
							if($game_event_data->num_rows > 0)
							{
								$game_event_row = $game_event_data->fetch_assoc();
								$game_data = get_game_data($game_event_row['GAME_TITLE']);
								if($game_data->num_rows > 0)
									$game_row = $game_data->fetch_assoc();
							}
						
							if(isset($game_event_row))
								return image_url($event_row['EVENT_TITLE'], $game_event_row['GAME_TITLE']);
							else
								return image_url($event_row['EVENT_TITLE']);
					}
			}
		}
		return 'http://swinanime.net/image.png';
	}

	function facebook_metadata()
	{
		echo('<meta property="og:image" content="'.get_image_url().'" />');
	}
	
?>