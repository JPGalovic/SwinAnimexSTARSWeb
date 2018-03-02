<?php
	// Gets session data for a given anime & session, Version 1.0, FEB18, JPGalovic
	// Flags: anime_title, session_type_id, session_number

	if(!isset($anime_title))
	{
		$error_text = "Anime Title not set.";
		$error_no = 2002;
	}
	else if(!isset($session_type_id))
	{
		$error_text = "Anime Session Type ID not set.";
		$error_no = 2003;
	}
	else if(!isset($session_number))
	{
		$error_text = "Anime Session Number not set.";
		$error_no = 2004;
	}
	else
	{
		// get first episode & number of episodes;
		$get_anime_session_data_first_episode = 1;
		$get_anime_session_data_number_of_episodes = 0;
		
		$get_anime_session_data_previous_query = 'SELECT NUMBER_OF_EPISODES FROM ANIME_SESSION WHERE ANIME_TITLE = "'.$anime_title.'" AND SESSION_TYPE_ID = "'.$session_type_id.'" AND SESSION_NUMBER < "'.$session_number.'"';
		if(!$get_anime_session_data_previous_data = $DB->query($get_anime_session_data_previous_query))
		{
			$error_text = $DB->error + $get_anime_session_data_previous_query;
			$error_no = $DB->error_no;
		}
		
		while($data_row = $get_anime_session_data_previous_data->fetch_assoc())
		{
			$get_anime_session_data_first_episode += $data_row['NUMBER_OF_EPISODES'];
		}
		
		$get_anime_session_data_query = 'SELECT NUMBER_OF_EPISODES FROM ANIME_SESSION WHERE ANIME_TITLE = "'.$anime_title.'" AND SESSION_TYPE_ID = "'.$session_type_id.'" AND SESSION_NUMBER = "'.$session_number.'"';
		if(!$get_anime_session_data = $DB->query($get_anime_session_data_query))
		{
			$error_text = $DB->error + $get_anime_session_data_query;
			$error_no = $DB->error_no;
		}
		
		while($data_row = $get_anime_session_data->fetch_assoc())
		{
			$get_anime_session_data_number_of_episodes = $data_row['NUMBER_OF_EPISODES'];
		}
	}
?>