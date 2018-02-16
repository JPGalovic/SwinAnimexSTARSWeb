<?php 
	// Gets data for events, Version 1.0.0, FEB18, JPGalovic
	// Parameters $event_title, title of the event
	function get_event_details($event_title)
	{
		$db = open_db(NULL);
		
		// DB Query: volume_type_id, volume_number, number_of_episodes, classification, purchace url
		$query = 'SELECT EVENT_DESCRIPTION, MEETUP_INSTRUCTIONS, TICKETS FROM EVENT_DETAILS WHERE EVENT_TITLE = "'.$event_title.'"';
		
		if(!($result = $db->query($query)))
			send_error($db->error_no+1000, $db->error.' '.$query);
		else
		{
			close_db($db);
			return $result;
		}
	}
?>