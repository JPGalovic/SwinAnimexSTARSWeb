<?php
	$lat = 0;
	$lng = 0;
	$zoom = 17;
	$text = '';

	// Display Map, Half Width
	echo('<section class="half" id="location_map">');
		echo('<div id="map"></div>');

		echo('<p>');
			echo($text);
		echo('</p>');

	echo('</section>');
?>

<script>
	function initMap() {
		var loc = {lat: "<?php echo($lat);?>", lng: "<?php echo($lng);?>"};
		var map = new google.maps.Map(document.getElementById('map'), {zoom: "<?php echo($zoom)?>", center: loc});
		var marker = new google.maps.Marker({position: loc, map: map});
	}
</script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh2DChK1HnsYWfIVxbIDU4agPC_BRl3UA&callback=initMap"></script>