<?php
	echo('<section class="quater" id="event_card">');
		// Event Image
		echo('<img src="image/event/'.$event_row['EVENT_TITLE'].'.png" alt="'.$event_row['EVENT_TITLE'].'">');

		// Event Title & Info
		echo('<h4>'.$event_row['EVENT_TITLE'].'</h4>');
		echo('<p>'.date('l jS F Y - g:ia', strtotime($event_row['EVENT_TIME'])).'</p>');
		echo('<P>'.$event_row['ADDRESS'].'</P>');
		
		//RSVP Links
		$first_link = true;
		if(!$event_row['EVENT_FACEBOOK_ID'] == '0')
		{
			if(!$first_link)
			{
				echo(' | ');
			}
			echo('<a href="https://www.facebook.com/events/'.$event_row['EVENT_FACEBOOK_ID'].'/">RSVP on Facebook</a>');
			$first_link = false;
		}
		if(!$event_row['EVENT_UNIONE_URL'] == '0')
		{
			if(!$first_link)
			{
				echo(' | ');
			}
			echo('<a href="'.$event_row['EVENT_UNIONE_URL'].'">Unione Event</a>');
			$first_link = false;
		}

		//More Info Link
		if(!$first_link)
		{
			echo(' | ');
		}
		echo('<a href="index.php?page=social_event&session=' . $event_row['EVENT_TIME'] . '">Event Info.</a>');

	echo('</section>');
?>