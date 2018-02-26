<?php
	// SQL getters for Anime Data, Version 1.0.5, FEB18, JPGalovic
	
	// Gets Anime Data for a given Event
	// $event_time = datetime of event
	function get_anime_event_data($event_time)
	{
		$query = 'SELECT ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER FROM EVENT_ANIME_DATA WHERE EVENT_TIME ="'.$event_time.'"';
		return run_query($query);
	}

	function get_anime_data($anime_title)
	{
		$query = 'SELECT * FROM ANIME WHERE ANIME_TITLE = "'.$anime_title.'"';
		return run_query($query);
	}
	
	// Gets Anime Episode Data for a given Anime and Session Number
	// EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS
	function get_anime_session_episode_data($anime_title, $session_number, $session_type)
	{
		// Get Episode Range
		$episode_range = get_anime_session_data($anime_title, $session_number, $session_type);
		$previous_episode = $episode_range['previous_episode'];
		$number_of_episodes = $episode_range['number_of_episodes'];
		
		$query = 'SELECT EPISODE_NUMBER, EPISODE_TITLE FROM ANIME_EPISODE WHERE ANIME_TITLE = "'.$anime_title.'" AND EPISODE_NUMBER > "'.$previous_episode.'" LIMIT '.$number_of_episodes;
		
		return run_query($query);
	}

	// Gets data for session of given anime
	// First Episode Number, Number of Episodes
	function get_anime_session_data($anime_title, $session_number, $session_type)
	{
		$result = array(
			'previous_episode' => 0,
			'number_of_episodes' => 0
		);
		
		// Previous Episode Numer (Get > This episode number for first episode)
		$query = 'SELECT NUMBER_OF_EPISODES FROM ANIME_SESSION WHERE ANIME_TITLE = "'.$anime_title.'" AND SESSION_TYPE_ID = "'.$session_type.'" AND SESSION_NUMBER < "'.$session_number.'"';
		$data = run_query($query);
		while($data_row = $data->fetch_assoc())
			$result['previous_episode'] += $data_row['NUMBER_OF_EPISODES'];
		
		// This Session number of episodes
		$query = 'SELECT NUMBER_OF_EPISODES FROM ANIME_SESSION WHERE ANIME_TITLE = "'.$anime_title.'" AND SESSION_TYPE_ID = "'.$session_type.'" AND SESSION_NUMBER = "'.$session_number.'"';
		$data = run_query($query);
		while($data_row = $data->fetch_assoc())
			$result['number_of_episodes'] = $data_row['NUMBER_OF_EPISODES'];
		
		return $result;
	}

	// Gets classification for given anime session
	function get_anime_session_classification($anime_title, $session_number, $session_type)
	{
		// First check for BD or DVD Volume
		$query = 'SELECT CLASSIFICATION FROM ANIME_VOLUME WHERE ANIME_TITLE = "'.$anime_title.'" AND (VOLUME_TYPE_ID = 3 OR VOLUME_TYPE_ID = 4)';
		$result = run_query($query);
		if($result->num_rows > 0) //Check for sucsess
		{
			$result_row = $result->fetch_assoc();
			return $result_row['CLASSIFICATION'];
		}
		
		// Next check for Stream
		$query = 'SELECT CLASSIFICATION FROM ANIME_VOLUME WHERE ANIME_TITLE = "'.$anime_title.'" AND VOLUME_TYPE_ID = 0';
		$result = run_query($query);
		if($result->num_rows > 0) //Check for sucsess
		{
			$result_row = $result->fetch_assoc();
			return $result_row['CLASSIFICATION'];
		}
		
		// Finnaly if no result still Calculate Volume based on Session
		// Get all DVD Volumes
		$query = 'SELECT CLASSIFICATION, NUMBER_OF_EPISODES FROM ANIME_VOLUME WHERE ANIME_TITLE = "'.$anime_title.'" AND VOLUME_TYPE_ID = 1';
		$result = run_query($query);
		if($result->num_rows == 0) //Check for sucsess
		{
			// Failure, get BD Volumes
			$query = 'SELECT CLASSIFICATION, NUMBER_OF_EPISODES FROM ANIME_VOLUME WHERE ANIME_TITLE = "'.$anime_title.'" AND VOLUME_TYPE_ID = 2';
			$result = run_query($query);
			if($result->num_rows == 0) //Check for sucsess
			{
				die('No DB Volumes, What do?');
			}
		}
		
		switch($session_type)
		{
			case 0: // Standard Session Calculate
			case 1: // Special Session Calculate
				// Get Episode Range
				$episode_range = get_anime_session_data($anime_title, $session_number, $session_type);
				$previous_episode = $episode_range['previous_episode'];
				
				while($previous_episode > 0)
				{
					if(!$result_row = $result->fetch_assoc())
						$previous_episode = 0;
					$previous_episode -= $result_row['NUMBER_OF_EPISODES'];
				}
				return $result_row['CLASSIFICATION'];
				break;
			case 2: // Marathon Get Last Avalible Session
				while($result_row = $result->fetch_assoc()){}
				return $result_row['CLASSIFICATION'];
				break;
			case 3: // Showcase Get First Avalible Session
				$result_row = $result->fetch_assoc();
				return $result_row['CLASSIFICATION'];
				break;
		}
	}
?>