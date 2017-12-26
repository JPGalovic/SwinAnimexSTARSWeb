<?php
	// Gets the core data for a given anime title
	if(isset($anime_title))
	{
		$get_anime_titles_query = 'SELECT ANIME_TITLE FROM ANIME WHERE ANIME_TITLE != "'.$anime_title.'" ORDER BY ANIME_TITLE';
	}
	else
	{
		$get_anime_titles_query = 'SELECT ANIME_TITLE FROM ANIME ORDER BY ANIME_TITLE';
	}

	$get_anime_titles_ok = true;

	if(!$get_anime_titles_data = $DB->query($get_anime_titles_query))
	{
		echo($DB->error);
		echo($get_anime_titles_query);
		$get_anime_titles_ok = false;
	}
?>