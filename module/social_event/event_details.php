<?php
	echo('<article class="flex_container" id="anime_details">');
		echo('<section class="half" id="event_details">');
			// Event & Meetup Details
			echo('<p>'.$event_details_row['MEETUP_INSTRUCTIONS'].'</p>');
			// Event Cost Details
			echo('<p>'.$event_details_row['TICKETS'].'</p>');
		echo('</section>');
		
		$location_id = $event_row['LOCATION_ID'];
		include('module/misc/map.php');
	echo('</article>');
?>