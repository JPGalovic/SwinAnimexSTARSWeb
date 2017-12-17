<?php
	echo('<article class="flex_container" id="event_page_header">');
		//Event Image
		echo('<header class="full">');

			echo('<img src="image/event/'.strtolower($event_row['EVENT_TITLE']).'.png" alt="'.$event_row['EVENT_TITLE'].'">');

		echo('</header>');

		//Event Main Details
		echo('<section class="full">');

			echo('<h2>'.$event_row['EVENT_TITLE'].'</h2>');
			echo('<p>'.$event_details_row['EVENT_DESCRIPTION'].'</p>');

		echo('</section>');

		//Event Time & RSVP
		echo('<footer class="full">');
			echo('<p>Meet at '.date('g:ia', strtotime($event_time)).' on '.date('l jS F Y', strtotime($event_time)).'</p>');

			if(!$event_row['EVENT_FACEBOOK_ID'] == '0')
				echo('<a href="https://www.facebook.com/events/'.$event_row['EVENT_FACEBOOK_ID'].'/">RSVP on Facebook</a>');
			if(!$event_row['EVENT_UNIONE_URL'] == '0')
				echo('<a href="'.$event_row['EVENT_UNIONE_URL'].'">Unione Event</a>');

		echo('</footer>');

	echo('</article>');
?>