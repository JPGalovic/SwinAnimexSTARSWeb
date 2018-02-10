<?php
	// Gets session dates for anime, Version 1.0, FEB18, JPGalovic
	if(isset($anime_title))
	{
		include('sql/anime/get_anime_sessions.php');

		echo('<article class="flex_container" id="anime_volume">');
		echo('<header class="full">Related Event Runsheet Generation: </header>');
		
		while($session_row = $get_anime_sessions->fetch_assoc())
		{
			echo('<form action="code_gen/document/generate_screening_runsheet.php" method="post">');
				echo('<input type="hidden" name="event_datetime" value="'.$session_row['EVENT_TIME'].'">');
				echo('<input type="submit" value="'.$session_row['EVENT_TIME'].'">');
			echo('</form>');
		}
		
		echo('</article>');
	}
?>