<?php
	// Get Anime Event Card Date (Anime_Description, Copyright)
	$get_anime_event_card_query = 'SELECT ANIME_DESCRIPTION, COPYRIGHT FROM ANIME WHERE ANIME_TITLE = "'.$anime_title.'"';

	$get_anime_event_card_ok = true;

	if(!$get_anime_event_card_data = $DB->query($get_anime_event_card_query))
	{
		echo($DB->error);
		echo($get_anime_event_card_query);
		$get_anime_event_card_ok = false;
	}
	
?>