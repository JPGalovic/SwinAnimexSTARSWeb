<?php
	// Gets session dates for a given anime, Version 1.0, FEB18, JPGalovic
	// Flags: anime_title
	if(isset($anime_title))
	{
		$get_anime_sessions_query = 'SELECT EVENT_TIME FROM EVENT_ANIME_DATA WHERE ANIME_TITLE = "'.$anime_title.'"';

		if(!$get_anime_sessions = $DB->query($get_anime_sessions_query))
		{
			$error_text = $DB->error + $get_anime_sessions_query;
			$error_no = $DB->error_no;
			include('code_gen/error_report.php');
		}
	}
?>