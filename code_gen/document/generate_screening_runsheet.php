<?php
	if(isset($_POST['event_datetime']))
	{
		// Generate Runsheet for Download
		$event_time = $_POST['event_datetime'];
		echo('<p>Generating runsheet for event running at '.date('g:ia', strtotime($event_time)).' on '.date('l jS F Y', strtotime($event_time)));
	}
	else
	{
		// No settings, show form.
		echo('<p>Please spesify the datetime of the event you want to generate runsheet for. yyyy-mm-dd hh:mm:ss</p><p><form action="generate_screening_runsheet.php" method="post">Event Date/Time to Generate: <input type="datetime" name="event_datetime"><br><input type="submit"></form></p>');
	}
?>