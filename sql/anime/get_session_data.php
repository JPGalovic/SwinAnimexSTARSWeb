<?php
	// Gets the core data for a given anime title
	if(isset($anime_title))
	{
		$get_session_query = 'SELECT ANIME_SESSION.SESSION_TYPE_ID, ANIME_SESSION.SESSION_NUMBER, ANIME_SESSION.NUMBER_OF_EPISODES, ANIME_SESSION_TYPE.SESSION_TYPE_DESCRIPTION FROM ANIME_SESSION LEFT JOIN ANIME_SESSION_TYPE ON ANIME_SESSION.SESSION_TYPE_ID = ANIME_SESSION_TYPE.SESSION_TYPE_ID WHERE ANIME_TITLE = "'.$anime_title.'"';

		$get_session_ok = true;

		if(!$get_session_data = $DB->query($get_session_query))
		{
			echo($DB->error);
			echo($get_session_query);
			$get_session_ok = false;
		}
	}
	else
	{
		echo("Error: No anime title set.");
	}
?>