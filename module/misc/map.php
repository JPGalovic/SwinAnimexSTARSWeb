<?php
	// Map generator, Version 1.0.2, MAR18, JPGalovic
	// Generates map based on a given location id
	if(!isset($location_id))
		$location_id = 0;
	
	$location_data = get_location_data($location_id);
	if($location_data->num_rows > 0)
		$location_row = $location_data->fetch_assoc();

	if(isset($location_row))
	{
		$lat = $location_row['LAT'];
		$lng = $location_row['LNG'];
		$zoom = $location_row['ZOOM'];
		if(!isset($location_text))
		{
			$location_text = '';
			if(!($location_row['CAMPUS'] == null))
			{
				$location_text = $location_text.$location_row['CAMPUS'];
				if(!($location_row['ROOM'] == null))
				{
					$location_text = $location_text.' - '.$location_row['ROOM'];
					if(!($location_row['ADDRESS'] == null))
					{
						$location_text = $location_text.', '.$location_row['ADDRESS'];
					}
				}
				else if(!($location_row['ADDRESS'] == null))
				{
					$location_text = $location_text.', '.$location_row['ADDRESS'];
				}
			}
			else if(!($location_row['ADDRESS'] == null))
			{
				$location_text = $location_row['ADDRESS'];
			}
		}
		
		echo('<section class="half" id="location_map">');
			echo('<div id="map"></div>');

			echo('<p>');
				echo($location_text);
			echo('</p>');

		echo('</section>');
	}
?>

<script>
	function initMap() {
		var loc = {lat:<?php echo($lat);?>, lng:<?php echo($lng);?>};
		var map = new google.maps.Map(document.getElementById('map'), {zoom:<?php echo($zoom)?>, center: loc});
		var marker = new google.maps.Marker({position: loc, map: map});
	}
</script>
<script async defer type="text/javascript" src="//maps.googleapis.com/maps/api/js?key=AIzaSyCh2DChK1HnsYWfIVxbIDU4agPC_BRl3UA&callback=initMap"></script>