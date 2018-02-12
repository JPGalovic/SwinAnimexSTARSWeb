<?php
	// Functions for Common elements of Event Cards, Version 1.0, FEB18, JPGalovic
	function event_card_location($campus, $room)
	{
		// Event Location
		echo('<p>'.$event_row['CAMPUS']);
		if($event_row['ROOM'] != NULL)
			echo(' - '.$event_row['ROOM'].'</p>');
		else
			echo('</p>');
	}

?>