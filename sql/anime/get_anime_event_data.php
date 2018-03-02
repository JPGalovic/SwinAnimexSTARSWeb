<?php
	// Gets core anime data for a given event datetime, Version 1.0, FEB18, JPGalovic
	// Flags: event_time: datetime

	if(!isset($event_time))
	{
		$error_text = "Event time not set.";
		$error_no = 2001;
	}
	else
	{
		$get_anime_event_query = 'SELECT ANIME_TITLE, SESSION_TYPE_ID, SESSION_NUMBER FROM EVENT_ANIME_DATA WHERE EVENT_TIME ="'.$event_time.'"';
		if(!$get_anime_event_data = $DB->query($get_anime_event_query))
		{
			$error_text = $DB->error + $get_anime_event_query;
			$error_no = $DB->error_no;
		}
	}
?>