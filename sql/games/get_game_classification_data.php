<?php
	// Gets Game's Classification, Version 1.0, JAN18, JPGalovic
	// Flags: game_title: datetime REQUIRED

	if(isset($game_title))
	{
		$get_game_classification_query = 'SELECT CLASSIFICATION FROM GAME WHERE GAME_TITLE = "'.$game_title.'"';
		if(!$get_game_classification_data = $DB->query($get_game_classification_query))
		{
			$error_text = $DB->error + $get_company_query;
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