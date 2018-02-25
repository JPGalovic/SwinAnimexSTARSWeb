<?php // Codegen Module Elements for Anime Details, Version 1.1.1, FEB18, JPGalovic
	
	// Anime Event Card Volume Generation
	// Paramiters, $anime, title of the anime, $previous, bool indicating previous links displayed
	function anime_event_card_volume_links($anime_title, $previous)
	{
		for($volume_type_id = 0; $volume_type_id <= 4; $volume_type_id++)
		{
			$anime_volume_data = get_anime_volume_data($anime_title, $volume_type_id);
			
			if($anime_volume_data->num_rows > 0) // Check if any of volume type
			{
				$anime_volume_row = $anime_volume_data->fetch_assoc(); // get first (and only first) volume.
				
				if(!$previous)
					echo(' | ');
				
				echo('<a href="'.$anime_volume_row['PURCHACE_URL'].'">');
				
				switch($anime_volume_row['VOLUME_TYPE_ID'])
				{
					case 0:
						echo('Stream Now!');
						break;
					case 1:
						echo('Buy '.$anime_volume_row['VOLUME_TYPE_DESCRIPTION'].' Volume '.$anime_volume_row['VOLUME_NUMBER']);
						break;
					case 2:
						echo('Buy '.$anime_volume_row['VOLUME_TYPE_DESCRIPTION'].' Volume '.$anime_volume_row['VOLUME_NUMBER']);
						break;
					case 3:
						echo('Buy '.$anime_volume_row['VOLUME_TYPE_DESCRIPTION']);
						break;
					case 4:
						echo('Buy '.$anime_volume_row['VOLUME_TYPE_DESCRIPTION']);
						break;
				}
				
				echo('</a>');
				$previous = false;
			}
		}
		
		return $previous;
	}
?>