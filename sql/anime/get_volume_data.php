<?php
	// Gets data for anime volumes, Version 1.0.0, FEB18, JPGalovic
	// Parameters $anime_title, title of the anime, $volume_type_id, volume type of anime, $db, link to db connection
	function get_anime_volume_data($anime_title, $volume_type_id)
	{
		// DB Query: volume_type_id, volume_number, number_of_episodes, classification, purchace url
		$query = 'SELECT ANIME_VOLUME.VOLUME_TYPE_ID, ANIME_VOLUME.VOLUME_NUMBER, ANIME_VOLUME.NUMBER_OF_EPISODES, ANIME_VOLUME.CLASSIFICATION, ANIME_VOLUME.PURCHACE_URL, ANIME_VOLUME_TYPE.VOLUME_TYPE_DESCRIPTION FROM ANIME_VOLUME LEFT JOIN ANIME_VOLUME_TYPE ON ANIME_VOLUME.VOLUME_TYPE_ID = ANIME_VOLUME_TYPE.VOLUME_TYPE_ID WHERE ANIME_TITLE = "'.$anime_title.'" AND VOLUME_TYPE_ID = "'.$volume_type_id.'" ORDER BY ANIME_VOLUME.VOLUME_NUMBER';
		
		if(!($result = $DB->query($query)))
		{
			send_error($DB->error_no+1000, $DB->error.' '.$query);
		}
		else
			return $result;
	}