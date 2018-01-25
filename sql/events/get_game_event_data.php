<?php
	// Gets Game Data for a set event datetime, Version 1.0, JAN18, JPGalovic
	// Flags: event_time: datetime REQUIRED

	if(isset($event_time))
	{
		$get_game_event_query = 'SELECT EVENT_GAME_DATA.GAME_TITLE, GAME_EVENT_TYPE.DESCRIPTION, GAME_EVENT_TYPE.TYPE_ID FROM EVENT_GAME_DATA LEFT JOIN GAME_EVENT_TYPE ON EVENT_GAME_DATA.GAME_EVENT_TYPE = GAME_EVENT_TYPE.TYPE_ID WHERE EVENT_GAME_DATA.EVENT_TIME = "'.$event_time.'"';
		if(!$get_game_event_data = $DB->query($get_game_event_query))
		{
			$error_text = $DB->error + $get_company_query;
			$error_no = $DB->error_no;
			include('code_gen/error_report.php');
		}
	}
	else
	{
		$error_text = "Variable event_time not set.";
		$error_no = 91;
		include('code_gen/error_report.php');
	}
?>