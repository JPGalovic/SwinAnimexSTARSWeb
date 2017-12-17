<?php
	echo('<article class="flex_container" id="anime_details">');
		echo('<section class="half" id="event_details">');
			//Anime Classification
			$session_number = $anime_event_row['SESSION_NUMBER'];
			$session_type = $anime_event_row['SESSION_TYPE_ID'];
			include('sql/events/get_anime_classification.php');
			echo('<img src="image/classification/' . $get_anime_classification . '.png" alt="' . $get_anime_classification . '" id="classification"/>');

			//Anime Copyright
			echo('<p>'.$anime_row['COPYRIGHT'].'</p>');
		echo('</section>');
		
		$location_id = $event_row['LOCATION_ID'];
		include('module/misc/map.php');
	echo('</article>');
?>