<?php
	$get_event_details_data_query = 'SELECT EVENT_DESCRIPTION, MEETUP_INSTRUCTIONS, TICKETS FROM EVENT_DETAILS WHERE EVENT_TITLE = "'.$event_title.'"';

	$get_event_details_data_ok = true;
	
	if(!$get_event_details_data = $DB->query($get_event_details_data_query))
	{
		echo($DB->error);
		echo($get_event_details_data_query);
		$get_event_details_data_ok = false;
	}
?>