<?php
	// Gets Game's Data, Version 1.0, JAN18, JPGalovic
	// Flags: game_title: datetime REQUIRED

	if(isset($game_title))
	{
		$get_game_data_query = 'SELECT GAME_DESCIRPTION, MIN_NUMBER_OF_PLAYERS, MAX_NUMBER_OF_PLAYERS, RECOMMENDED_NUMBER_OF_PLAYERS, COMPANY_NAME, CLASSIFICATION FROM GAME WHERE GAME_TITLE = "'.$game_title.'"';
		if(!$get_game_data = $DB->query($get_game_data_query))
		{
			$error_text = $DB->error + $get_game_data_query;
			$error_no = $DB->error_no;
			include('code_gen/error_report.php');
		}
	}
	else
	{
		$error_text = "Variable game_title not set.";
		$error_no = 91;
		include('code_gen/error_report.php');
	}
?>