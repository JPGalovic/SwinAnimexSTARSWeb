<?php
	if(isset($_GET['session']))
	{
		$event_time = $_GET['session'];
		include('sql/events/get_specific_event_data.php');
		if($get_event_data_ok)
		{
			$event_row = $get_event_data->fetch_assoc(); // Base Event Data
			$event_title = $event_row['EVENT_TITLE'];
			
			include('sql/events/get_event_details_data.php');
			if($get_event_details_data_ok)
			{
				$event_details_row = $get_event_details_data->fetch_assoc();
				
				include('module/social_event/event_header.php');
				include('module/social_event/event_details.php');
				include('module/events_table/4_events_table.php');
			}
		}
	}
?>