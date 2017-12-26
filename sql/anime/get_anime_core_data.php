<?php
	// Gets the core data for a given anime title
	if(isset($anime_title))
	{
		$get_anime_core_query = 'SELECT * FROM ANIME WHERE ANIME_TITLE = "'.$anime_title.'"';

		$get_anime_core_ok = true;

		if(!$get_anime_core_data = $DB->query($get_anime_core_query))
		{
			echo($DB->error);
			echo($get_anime_core_query);
			$get_anime_core_ok = false;
		}
	}
	else
	{
		echo("Error: No anime title set.");
	}
?>