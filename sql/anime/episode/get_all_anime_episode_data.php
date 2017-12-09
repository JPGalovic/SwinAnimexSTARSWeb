<?php
	// Gets Data for Given Number of Episodes of a given Anime, Required Variables on Call $number_of_episodes, $anime_title.
	if(isset($anime_title))
	{
		$get_all_anime_episode_query = 'SELECT EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS FROM ANIME_EPISODE WHERE ANIME_TITLE = "'.$anime_title.'"';

		$get_all_anime_episode_ok = true;

		if(!$get_all_anime_episode_data = $DB->query($get_all_anime_episode_query))
		{
			echo($DB->error);
			echo($get_all_anime_episode_query);
			$get_all_anime_episode_ok = false;
		}
	}
	else
	{
		echo("Error: No anime title set.");
	}
?>