<?php
	// Card for display of Tabletop Events, Version 1.0, JAN18, JPGalovic
	echo('<section class="quater" id="event_card">');

		echo('<img src="image/event/'.remove_illegal_char(remove_illegal_char(strtolower($event_row['EVENT_TITLE']))).'.png" alt="'.$event_row['EVENT_TITLE'].'">');

		// Event Name
		echo('<h4>');
		echo($event_row['EVENT_TITLE']);

		if($event_row['EVENT_SUBTITLE'] != NULL)
		{
			echo(' - '.$event_row['EVENT_SUBTITLE']);
		}
		else
		{
			
		}
			
		echo('</h4>');


		echo('<p>'.date('l jS F Y - g:ia', strtotime($event_row['EVENT_TIME'])).'</p>');
		echo('<p>'.$event_row['CAMPUS'].' - '.$event_row['ROOM'].'</p>');

	echo('</section>');
?>


	
	
	
	
	


	
	
	
	
