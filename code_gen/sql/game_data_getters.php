<?php
	// SQL getters for Anime Data, Version 1.0.2, MAR18, JPGalovic
	
	// Gets Game Event Data
	function get_game_event_data($event_time)
	{
		$query = 'SELECT EVENT_GAME_DATA.GAME_TITLE, GAME_EVENT_TYPE.DESCRIPTION, GAME_EVENT_TYPE.TYPE_ID FROM EVENT_GAME_DATA LEFT JOIN GAME_EVENT_TYPE ON EVENT_GAME_DATA.GAME_EVENT_TYPE = GAME_EVENT_TYPE.TYPE_ID WHERE EVENT_GAME_DATA.EVENT_TIME = "'.$event_time.'"';
		return run_query($query);
	}

	// Gets Game Data
	function get_game_data($game_title)
	{
		$query = 'SELECT GAME_DESCIRPTION, MIN_NUMBER_OF_PLAYERS, MAX_NUMBER_OF_PLAYERS, RECOMMENDED_NUMBER_OF_PLAYERS, COMPANY_NAME, CLASSIFICATION FROM GAME WHERE GAME_TITLE = "'.$game_title.'"';
		return run_query($query);
	}

	// Gets Game Classification
	function get_game_classification($game_title)
	{
		$query = 'SELECT CLASSIFICATION FROM GAME WHERE GAME_TITLE = "'.$game_title.'"';
		return run_query($query);
	}
?>