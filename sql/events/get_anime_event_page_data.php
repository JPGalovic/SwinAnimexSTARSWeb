<?php
	// Get Anime Event Page Date (Synopsys, Number of Episodes, Copyright)
	$get_anime_event_page_query = 'SELECT ANIME_SYNOPSIS, NUMBER_OF_EPISODES, COPYRIGHT FROM ANIME WHERE ANIME_TITLE = "'.$anime_title.'"';

	$get_anime_event_page_ok = true;

	if(!$get_anime_event_page_data = $DB->query($get_anime_event_page_query))
	{
		echo($DB->error);
		echo($get_anime_event_page_query);
		$get_anime_event_page_ok = false;
	}
?>