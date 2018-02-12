<?php
	// Functions for Common elements of Event Cards, Version 1.0, FEB18, JPGalovic

	// Prints out location based on values of received data.	
	function event_card_location($campus, $room, $address, $lat, $lng)
	{
		// 1. On Campus Event
		// [CAMPUS]
		// [CAMPUS] - [ROOM]
		if($campus != NULL)
		{
			echo('<p>'.$campus);
			if($room != NULL)
				echo(' - '.$room.'</p>');
			else
				echo('</p>');
		}
		// 2. Off Campus Event
		// [ADDRESS]
		else
		{
			echo($address);
		}
	}

?>