<?php
	$get_event_location_query = 'SELECT CAMPUS, ROOM, ADDRESS, LAT, LNG, ZOOM FROM EVENT_LOCATION WHERE LOCATION_ID = "'.$location_id.'"';

	$get_event_location_ok = true;
	
	if(!$get_event_location_data = $DB->query($get_event_location_query))
	{
		echo($DB->error);
		echo($get_event_location_query);
		$get_event_location_ok = false;
	}
?>