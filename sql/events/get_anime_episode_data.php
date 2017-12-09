<?php
	$get_anime_episode_query = 'SELECT EPISODE_NUMBER, EPISODE_TITLE, EPISODE_SYNOPSYS FROM ANIME_EPISODE WHERE ANIME_TITLE = "'.$anime_title.'" AND EPISODE_NUMBER <= "'.$number_of_episodes.'"';

	$get_anime_episode_ok = true;

	if(!$get_anime_episode_data = $DB->query($get_anime_episode_query))
	{
		echo($DB->error);
		echo($get_anime_episode_query);
		$get_anime_episode_ok = false;
	}
?>