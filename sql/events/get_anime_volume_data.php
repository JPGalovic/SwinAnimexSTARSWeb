<?php
	$get_anime_volume_query = 'SELECT ANIME_VOLUME.VOLUME_TYPE_ID, ANIME_VOLUME.VOLUME_NUMBER, ANIME_VOLUME.NUMBER_OF_EPISODES, ANIME_VOLUME.PURCHACE_URL, ANIME_VOLUME_TYPE.VOLUME_TYPE_DESCRIPTION FROM ANIME_VOLUME LEFT JOIN ANIME_VOLUME_TYPE ON ANIME_VOLUME.VOLUME_TYPE_ID = ANIME_VOLUME_TYPE.VOLUME_TYPE_ID WHERE ANIME_TITLE = "'.$anime_title.'" ORDER BY ANIME_VOLUME.VOLUME_TYPE_ID, ANIME_VOLUME.VOLUME_NUMBER';

	$get_anime_volume_ok = true;

	if(!$get_anime_volume_data = $DB->query($get_anime_volume_query))
	{
		echo($DB->error);
		echo($get_anime_volume_query);
		$get_anime_volume_ok = false;
	}
?>