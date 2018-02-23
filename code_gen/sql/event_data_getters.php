<?php
	// SQL getters for Event Data, Version 1.0.0, FEB18, JPGalovic

	// Gets core event data based on a given date time.
	// this_event_time: datetime, used when on a page for a specific event. null by default
	// current_event_time: datetime, time of previously selected event. null by default
	// next_event: bool, flag to get next event. true by default
	function get_event_data($this_event_time = null, $current_event_time = null, $next_event = true)
	{
		if($current_event_time == null) // Check if current event time is set, if not sets it to current time.
			$current_event_time = current_time();
		
		if($this_event_time != null) // This event time is not null means page using has set event time
			if($next_event) // Call to get next event.
				$query = 'SELECT EVENT_DATA.EVENT_TIME, EVENT_TYPE.EVENT_TYPE_DESCRIPTION, EVENT_DATA.EVENT_TITLE, EVENT_DATA.EVENT_SUBTITLE, EVENT_LOCATION.CAMPUS, EVENT_LOCATION.ROOM, EVENT_LOCATION.ADDRESS, EVENT_LOCATION.LAT, EVENT_LOCATION.LNG, EVENT_LOCATION.ZOOM, EVENT_DATA.EVENT_FACEBOOK_ID, EVENT_DATA.EVENT_UNIONE_URL FROM EVENT_DATA LEFT JOIN EVENT_TYPE ON EVENT_DATA.EVENT_TYPE_ID = EVENT_TYPE.EVENT_TYPE_ID LEFT JOIN EVENT_LOCATION ON EVENT_DATA.EVENT_LOCATION = EVENT_LOCATION.LOCATION_ID WHERE EVENT_DATA.EVENT_TIME > "'.$current_event_time.'" AND EVENT_DATA.EVENT_TIME != "'.$this_event_time.'" LIMIT 1';
			else // Else, call to get this event.
				$query = 'SELECT EVENT_DATA.EVENT_TIME, EVENT_TYPE.EVENT_TYPE_DESCRIPTION, EVENT_DATA.EVENT_TITLE, EVENT_DATA.EVENT_SUBTITLE, EVENT_LOCATION.CAMPUS, EVENT_LOCATION.ROOM, EVENT_LOCATION.ADDRESS, EVENT_LOCATION.LAT, EVENT_LOCATION.LNG, EVENT_LOCATION.ZOOM, EVENT_DATA.EVENT_FACEBOOK_ID, EVENT_DATA.EVENT_UNIONE_URL FROM EVENT_DATA LEFT JOIN EVENT_TYPE ON EVENT_DATA.EVENT_TYPE_ID = EVENT_TYPE.EVENT_TYPE_ID LEFT JOIN EVENT_LOCATION ON EVENT_DATA.EVENT_LOCATION = EVENT_LOCATION.LOCATION_ID WHERE EVENT_DATA.EVENT_TIME = "'.$this_event_time.'" LIMIT 1';
		else // Else, call to get next event.
			$query = 'SELECT EVENT_DATA.EVENT_TIME, EVENT_TYPE.EVENT_TYPE_DESCRIPTION, EVENT_DATA.EVENT_TITLE, EVENT_DATA.EVENT_SUBTITLE, EVENT_LOCATION.CAMPUS, EVENT_LOCATION.ROOM, EVENT_LOCATION.ADDRESS, EVENT_LOCATION.LAT, EVENT_LOCATION.LNG, EVENT_LOCATION.ZOOM, EVENT_DATA.EVENT_FACEBOOK_ID, EVENT_DATA.EVENT_UNIONE_URL FROM EVENT_DATA LEFT JOIN EVENT_TYPE ON EVENT_DATA.EVENT_TYPE_ID = EVENT_TYPE.EVENT_TYPE_ID LEFT JOIN EVENT_LOCATION ON EVENT_DATA.EVENT_LOCATION = EVENT_LOCATION.LOCATION_ID WHERE EVENT_DATA.EVENT_TIME > "'.$current_event_time.'" LIMIT 1';
		
		return run_query($query);
	}
?>