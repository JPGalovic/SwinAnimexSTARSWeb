<?php
	echo('<article class="flex_container" id="event_page_header">');
		//Event Image
		echo('<header class="full">');

			echo('<img src="image/anime/'.$anime_event_row['ANIME_TITLE'].'/session/'.$anime_event_row['SESSION_TYPE_ID'].$anime_event_row['SESSION_NUMBER'].'.jpg" alt="'.$anime_event_row['ANIME_TITLE'].'">');

		echo('</header>');

		//Event Main Details
		echo('<section class="full">');

			echo('<h2>'.$event_row['EVENT_TITLE'].' - '.$anime_event_row['ANIME_TITLE'].'</h2>');
			echo('<p>'.$anime_row['ANIME_SYNOPSIS'].'</p>');

		echo('</section>');

		//Event Time & RSVP
		echo('<footer class="full">');
			echo('<p>Showing from '.date('g:ia', strtotime($event_time)).' on '.date('l jS F Y', strtotime($event_time)).'</p>');

			if(!$event_row['EVENT_FACEBOOK_ID'] == '0')
				echo('<a href="https://www.facebook.com/events/'.$event_row['EVENT_FACEBOOK_ID'].'/">RSVP on Facebook</a>');
			if(!$event_row['EVENT_UNIONE_URL'] == '0')
				
				echo('<a href="'.$event_row['EVENT_UNIONE_URL'].'">Unione Event</a>');
		echo('</footer>');

	echo('</article>');
?>