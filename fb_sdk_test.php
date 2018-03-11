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
			'default_access_token' => 'EAAd25ZB4JqZAYBAMsqjEIoXnwuwNdon7SCDWxSzSuymIZBgwWwHQC1yR5XxMJqvTLZB92lE2sJIriVwm8d6SIncPDtj5YCwVYTMwv3RMK1szIQITZBRPyNItWqO9q4wZB29Qd99f4nZBC0SU3tiJfBINVoiRup5kLzk2fTO0fd3hwTzFZAG4zZBPCnOT8DQchPZA7cnpZBhXQn6OQZDZD'
		]);
	}

	$fb = fb_login();

	// Facebook Posting Function, Posts to Facebook Page
	function fb_post($msg, $date, $link = null)
	{
		global $fb;
		if($link != null)
			$data = array(
				'link' => $link,
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

	function fb_post_check($msg, $date, $link = null)
	{
		echo('<p> Post to be posted on '.date('Y-m-d H:i:s', $date).'<br>Messae: '.$msg);
		if($link != null)
			echo('<br>Link: <a href="'.$link.'">'.$link.'</a>');
		global $debug;
		
		if($debug == false) // not debug, post msg
			fb_post($msg, $date, $link);
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
		
		fb_post_check($msg, $post_time, $link);
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
		
		fb_post_check($msg, $post_time, $link);
	}

	function fb_general_event_post($event_time, $event_row, $post_time)
	{
		$msg = 'In the next few days we will be running our event, '.$event_row['EVENT_TITLE'].', come along to '.event_card_location($event_row['CAMPUS'], $event_row['ROOM'], $event_row['ADDRESS'], $event_row['LAT'], $event_row['LNG']).' in you want to join in on the fun! For more info see the event below!';

		$link = 'http://swinanime.net/index.php?page=event_details&event_date='.$event_time.'';
		
		fb_post_check($msg, $post_time, $link);
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

	fb_event_posts();
?>	