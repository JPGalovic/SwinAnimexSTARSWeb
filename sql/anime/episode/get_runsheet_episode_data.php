<?php
	// Gets core anime data for a given event datetime, Version 1.0, FEB18, JPGalovic
	// Flags: anime_title, first_episode, number_of_episodes

	if(!isset($event_time))
	{
		$error_text = "Event time not set.";
		$error_no = 2001;
		include('code_gen/error_report.php');
	}
	else
	{
		$get_runsheet_episode_query = 'SELECT EPISODE_NUMBER, EPISODE_TITLE FROM ANIME_EPISODE WHERE ANIME_TITLE = "'.$anime_title.'" AND EPISODE_NUMBER >= "'.$first_episode.'" LIMIT '.$number_of_episodes;
		
		if(!$get_runsheet_episode_data = $DB->query($get_runsheet_episode_query))
		{
			$error_text = $DB->error + $get_runsheet_episode_query;
			$error_no = $DB->error_no;
			include('code_gen/error_report.php');
			die($get_runsheet_episode_query);
		}
	}
?>