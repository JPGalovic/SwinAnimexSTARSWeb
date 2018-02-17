<?php
	// Card for display of Roleplay Events, Version 1.0.2, FEB18, JPGalovic
	echo('<section class="quater" id="event_card">');

		echo('<img src="image/event/'.remove_illegal_char(remove_illegal_char(strtolower($event_row['EVENT_TITLE']))).'.png" alt="'.$event_row['EVENT_TITLE'].'">');
		echo('<h4>'.$event_row['EVENT_TITLE'].'</h4>');
		echo('<p>'.date('l jS F Y - g:ia', strtotime($event_row['EVENT_TIME'])).'</p>');
		event_card_location($event_row['CAMPUS'], $event_row['ROOM'], $event_row['ADDRESS'], $event_row['LAT'], $event_row['LNG']);

		// Event Details Display
		$event_details_data = get_event_details($event_row['EVENT_TITLE']);
		$event_details_row = $event_details_data->fetch_assoc();
		echo('<p>'.$event_details_row['EVENT_DESCRIPTION'].'</p>');

		// Links
		$first_link = true;
		$first_link = event_card_end_links($event_row['EVENT_TIME'], $event_row['EVENT_TYPE_DESCRIPTION'], $event_row['EVENT_FACEBOOK_ID'], $event_row['EVENT_UNIONE_URL'], $first_link);

	echo('</section>');
?>
	
