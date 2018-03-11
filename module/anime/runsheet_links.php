<?php
	// Gets session dates for anime, Version 1.2.0, FEB18, JPGalovic
	$anime_events = get_anime_events_data($anime_title);
	if($anime_events->num_rows > 0)
	{
		echo('<article class="flex_container" id="anime_volume">');
		echo('<header class="full">Related Event Runsheet Generation: </header>');
		
		while($event_row = $anime_events->fetch_assoc())
		{
			echo('<form action="generate_runsheet.php" method="post" style="padding: 5px;">');
				echo('<input type="hidden" name="event_datetime" value="'.$event_row['EVENT_TIME'].'">');
				echo('<input type="submit" value="'.date('d-m-y', strtotime($event_row['EVENT_TIME'])).'">');
			echo('</form>');
		}
		
		echo('</article>');
	}
?>