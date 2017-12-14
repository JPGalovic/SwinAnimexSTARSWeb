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
					echo('<br>Phone: President - 0400 805 284 , Vice President - 0410 279 719');
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
		include('module/msic/map.php');
		
	echo('</section>');
?>

<script>
	function initMap() {
		var h_loc = {lat:-37.822576, lng:145.037561};
		var h_map = new google.maps.Map(document.getElementById('h_map'), {zoom: 17, center: h_loc});
		var h_marker = new google.maps.Marker({position: h_loc, map: h_map});
	}
</script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh2DChK1HnsYWfIVxbIDU4agPC_BRl3UA&callback=initMap"></script>