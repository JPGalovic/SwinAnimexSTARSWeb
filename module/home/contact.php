<?php
	echo('<section class="flex_container" id="contact_display">');

		// Contact Us
		echo('<article class="half" id="contact_card">');
			echo('<section>');
				echo('<h3>Contact Us</h3>');
				echo('<p>We can be contacted at any time, send us an email, or give us a call.</p>');

				echo('<p>');
					echo('<h4>General Contact:</h4>');
					echo('<br>Email: <a href="mailto:info@swinanime.net">info@swinanime.net</a>');
				echo('</p>');

				echo('<p>');
					echo('<h4>Committee Contacts:</h4>');
					echo('<br>President: <a href="mailto:president@swinanime.net">president@swinanime.net</a>');
					echo('<br>Vice President: <a href="mailto:vp@swinanime.net">vp@swinanime.net</a>');
					echo('<br>Secretary: <a href="mailto:secretary@swinanime.net">secretary@swinanime.net</a>');
					echo('<br>Treasurer: <a href="mailto:treasury@swinanime.net">treasury@swinanime.net</a>');
				echo('</p>');

				echo('<p>');
					echo('<h4>Club Contacts</h4>');
					echo('<br>Events: <a href="mailto:events@swinanime.net">events@swinanime.net</a>');
					echo('<br>Screenings: <a href="mailto:screenings@swinanime.net">screenings@swinanime.net</a>');
					echo('<br>Marketing: <a href="mailto:marketing@swinanime.net">marketing@swinanime.net</a>');
				echo('</p>');
			
			echo('</section>');
		echo('</article>');

		$location_text = 'Hawthorn Screenings every Friday.<br>Starting, 12:30am, 3:30pm, 5:30pm &amp; 8:30pm.<br>Showcase Screenings every Monday. <br> Starting, 3:30pm &amp; 4:30pm.<br>See the events above for more details.';
		// Find Us
		include('module/misc/map.php');
		
	echo('</section>');
?>