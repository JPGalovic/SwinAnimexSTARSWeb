<?php // Codegen Module Elements for Anime Details, Version 1.0.0, FEB18, JPGalovic
	
	// Anime Event Card Volume Generation
	// Paramiters, $anime, title of the anime, $previous, bool indicating previous links displayed
	function anime_event_card_volume_links($anime_title, $previous)
	{
		include('sql/anime/get_volume_data.php'); // include required sql functionality
		if($previous)
			echo(' | ');
		
		for($volume_type_id = 0; $volume_type_id <= 4; $volume_type_id++)
		{
			$anime_volume_data = get_anime_volume_data($anime_title, $volume_type_id);
		}
		
		return $previous;
	}
?>