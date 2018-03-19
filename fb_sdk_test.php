<?php
	// Facebook Auto Poster, Version 1.0.0, MAR18, J.P.Galovic

	// Load Facebook SDK
	require_once(__DIR__.'/sdk/facebook/autoload.php');

	$debug = false;
	

	include('code_gen/include.php');

	function fb_login()
	{
		return new \Facebook\Facebook([
			'app_id' => '2101063340108182',
			'app_secret' => 'de05c47c3c5e61a8d4f50d7227a0aa01',
			'default_graph_version' => 'v2.10',
			'default_access_token' => 'EAAd25ZB4JqZAYBACSwtYNWGO5rHcgJd4urVZCZCTqKcPoguq3ZCCDK4w3ZAWzkypJVgpF4Yias6PUZClF2ZCSkLdxBQcJ9Vo7OZCn8m7EjKzHJ1isgKhQCRzOnwrZBeqaw0pXLxCepd0wSfnItsKQZB5fKDojxIlofrdCpmUBVtSWZAwrkPKzsZABsIsfugWZBmOZBYSikudeD7CKs7twZDZD'
		]);
	}

	$fb = fb_login();

	function fb_image($event_title, $fetaured_title = null, $session_type = null, $session_number = null)
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

	// Facebook Posting Function, Posts to Facebook Page
	function fb_post($msg, $date, $link = null, $image = null)
	{
		global $fb;
		if($link != null && $image != null)
			$data = array(
				'link' => $link,
				'picture' => $image,
				'message' => $msg,
				'scheduled_publish_time' => $date,
				'published' => 'false'
			);
		else
			$data = array(
				'message' => $msg,
				'scheduled_publish_time' => $date,
				'published' => 'false'
			);
		
		try {
			$res = $fb->post('134815860030558/feed', $data);
			echo('Post Scheduled');
		}
		catch(\Facebook\Exceptions\FacebookResponseException $e) {
			echo('Graph returned an error: ' . $e->getMessage());
			exit();
		}
		catch(\Faceboon\Exceptions\FacebookSDKException $e) {
			echo('Facebook SDK returned an error: ' . $e->getMessage());
			exit();
		}
	}

	function fb_post_check($msg, $date, $link = null, $image = null)
	{
		echo('<p> Post to be posted on '.date('Y-m-d H:i:s', $date).'<br>Messae: '.$msg);
		if($link != null)
			echo('<br>Link: <a href="'.$link.'">'.$link.'</a>');
		if($image != null)
			echo('<br>Image URL: <a href="'.$image.'">'.$image.'</a>');
		echo('</p>');
		
		global $debug;
		
		if($debug == false) // not debug, post msg
			fb_post($msg, $date, $link, $image);
	}

	// Post Generation
	function fb_anime_event_post($event_time, $event_row, $post_time)
	{
		$anime_event_data = get_anime_event_data($event_time);
		if($anime_event_data->num_rows > 0)
			$anime_event_row = $anime_event_data->fetch_assoc();
		
		$title = $event_row['EVENT_TITLE'];
			if($event_row['EVENT_SUBTITLE'] != null)
			{
				$title = $title.' - '.$event_row['EVENT_SUBTITLE'];
				if(isset($anime_event_row))
					$title = $title.' ft. '.$event_row['ANIME_TITLE'];	
			}
			else
				if(isset($anime_event_row))
					$title = $title.' ft. '.$anime_event_row['ANIME_TITLE'];
		
		$msg = 'In the next few days we will be running our event, '.$title.', come along to '.event_card_location($event_row['CAMPUS'], $event_row['ROOM'], $event_row['ADDRESS'], $event_row['LAT'], $event_row['LNG']).' in you want to join in on the fun! For more info see the event below!';

		$link = 'http://swinanime.net/index.php?page=event_details&event_date='.$event_time;
		
		if(isset($anime_event_row))
			$image = fb_image($event_row['EVENT_TITLE'], $anime_event_row['ANIME_TITLE'], $anime_event_row['SESSION_TYPE_ID'], $anime_event_row['SESSION_NUMBER']);
		else
			$image = fb_image($event_row['EVENT_TITLE']);
		
		fb_post_check($msg, $post_time, $link, $image);
	}

	function fb_game_event_post($event_time, $event_row, $post_time)
	{
		$game_event_data = get_game_event_data($event_time);
		if($game_event_data->num_rows > 0)
		{
			$game_event_row = $game_event_data->fetch_assoc();
			$game_data = get_game_data($game_event_row['GAME_TITLE']);
			if($game_data->num_rows > 0)
				$game_row = $game_data->fetch_assoc();
		}
		
		$title = $event_row['EVENT_TITLE'];
			if($event_row['EVENT_SUBTITLE'] != null)
			{
				$title = $title.' - '.$event_row['EVENT_SUBTITLE'];
				if(isset($game_event_row))
					$title = $title.' ft. '.$game_event_row['GAME_TITLE'];	
			}
			else
				if(isset($game_event_row))
					$title = $title.' ft. '.$game_event_row['GAME_TITLE'];
		
		$msg = 'In the next few days we will be running our event, '.$title.', come along to '.event_card_location($event_row['CAMPUS'], $event_row['ROOM'], $event_row['ADDRESS'], $event_row['LAT'], $event_row['LNG']).' in you want to join in on the fun! For more info see the event below!';

		$link = 'http://swinanime.net/index.php?page=event_details&event_date='.$event_time;
		if(isset($game_event_row))
			$image = fb_image($event_row['EVENT_TITLE'], $game_event_row['GAME_TITLE']);
		else
			$image = fb_image($event_row['EVENT_TITLE']);
		
		fb_post_check($msg, $post_time, $link, $image);
	}

	function fb_general_event_post($event_time, $event_row, $post_time)
	{
		$msg = 'In the next few days we will be running our event, '.$event_row['EVENT_TITLE'].', come along to '.event_card_location($event_row['CAMPUS'], $event_row['ROOM'], $event_row['ADDRESS'], $event_row['LAT'], $event_row['LNG']).' in you want to join in on the fun! For more info see the event below!';

		$link = 'http://swinanime.net/index.php?page=event_details&event_date='.$event_time.'';
		$image = fb_image($event_row['EVENT_TITLE']);
		
		fb_post_check($msg, $post_time, $link, $image);
	}
	
	function fb_event_posts($n_events = 8) // Pre process next 8 event worth of FB Posts (not event)
	{
		// Get First Event
		$event_data = get_event_data();

		if($event_data->num_rows > 0)
		{
			$event_row = $event_data->fetch_assoc();
			
			while($n_events != 0)
			{
				$current_event_time = $event_row['EVENT_TIME'];
				$post_time = strtotime('-4 days', strtotime($event_row['EVENT_TIME']));
				$current_time = strtotime(current_time());
				if($post_time > $current_time)
				{
					echo('<p>Scheduling post for event: '.$event_row['EVENT_TIME'].'</p>');
					
					// Show Event Card
					switch($event_row['EVENT_TYPE_DESCRIPTION'])
					{
						case 'Screening Session Event':
							fb_anime_event_post($event_row['EVENT_TIME'], $event_row, $post_time);
							break;
						case 'Social Episode Event':
						case 'Workshop Event':
						case 'General Meeting':
						case 'Other Event':
							fb_general_event_post($event_row['EVENT_TIME'], $event_row, $post_time);
							break;
						case 'Roleplay Event':
						case 'Tabletop Event':
						case 'Video Game Event':
							fb_game_event_post($event_row['EVENT_TIME'], $event_row, $post_time);
							break;
					}
					$n_events--;
				}
				else
				{
					echo('<p>Cannot schedule post in the past, skipping event: '.$event_row['EVENT_TIME'].'</p>');
				}
				
				$event_data = get_event_data(null, $current_event_time);

				if($event_data->num_rows > 0)
					$event_row = $event_data->fetch_assoc();
				else // No more events gotten, reset counter
					$n_events = 0;
			}
		}	
	}

	fb_event_posts(1);
?>	