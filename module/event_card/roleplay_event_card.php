<?php
	// Card for display of Roleplay Events, Version 1.0, JAN18, JPGalovic
	echo('<section class="quater" id="event_card">');

		echo('<img src="image/event/'.$event_row['EVENT_TITLE'].'.png" alt="'.$event_row['EVENT_TITLE'].'">');
		echo('<h4>'.$event_row['EVENT_TITLE'].'</h4>');
		echo('<p>'.date('l jS F Y - g:ia', strtotime($event_row['EVENT_TIME'])).'</p>');
		echo('<p>'.$event_row['CAMPUS'].' - '.$event_row['ROOM'].'</p>');

	echo('</section>');
?>


	
	
	
	
	


	
	
	
	
