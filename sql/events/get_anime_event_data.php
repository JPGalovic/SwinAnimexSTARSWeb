<?php
	if(isset($this_event_time))
		$get_anime_event_query = 'SELECT ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER FROM EVENT_ANIME_DATA WHERE EVENT_TIME ="'.$this_event_time.'"';
	else
		$get_anime_event_query = 'SELECT ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER FROM EVENT_ANIME_DATA WHERE EVENT_TIME ="'.$event_time.'"';

	$get_anime_event_ok = true;
	
	if(!$get_anime_event_data = $DB->query($get_anime_event_query))
	{
		echo($DB->error);
		echo($get_anime_event_query);
		$get_anime_event_ok = false;
	}
?>