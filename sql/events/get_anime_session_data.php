<?php
	$get_anime_session_query = 'SELECT NUMBER_OF_EPISODES FROM ANIME_SESSION WHERE ANIME_TITLE = "'.$anime_title.'" AND SESSION_NUMBER < "'.$session_number.'"';

	$get_anime_session_ok = true;

	if(!$get_anime_session_data = $DB->query($get_anime_session_query))
	{
		echo($DB->error);
		echo($get_anime_session_query);
		$get_anime_session_ok = false;
	}
?>