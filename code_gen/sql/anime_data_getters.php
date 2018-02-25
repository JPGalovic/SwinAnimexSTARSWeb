<?php
	// SQL getters for Anime Data, Version 1.0.0, FEB18, JPGalovic
	
	// Gets Anime Data for a given Event
	// $event_time = datetime of event
	function get_anime_event_data($event_time)
	{
		$query = 'SELECT ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER FROM EVENT_ANIME_DATA WHERE EVENT_TIME ="'.$event_time.'"';
		
		return run_query($query);
	}
?>