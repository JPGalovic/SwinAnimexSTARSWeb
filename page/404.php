<?php
	// Error 404 Page, Version 1.0.0, MAR18, JPGalovic
	echo('<article class="flex_container" id="page_header">');

		echo('<section class="half">');
			echo('<img src="image/shoko_logo.png" alt="Swinburne Anime Club Colour Logo">');
		echo('</section>');

		echo('<section class="half">');
			echo('<h1>Error 404: We cant find the page you are after!</h1>');
			echo('<p>Sorry Guys, we cant find the page you are after.</p>');
			if($page == 'event_details')
				echo('<p>The event you accessed does not exist.</p>');
		echo('</section>');

	echo('</article>');
?>