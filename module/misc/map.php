<?php
	if(!isset($location_id))
		$location_id = 0;
	include('sql/events/get_event_location.php');
	if($get_event_location_ok)
	{
		$event_location_row = $get_event_location_data->fetch_assoc();
		
		$lat = $event_location_row['LAT'];
		$lng = $event_location_row['LNG'];
		$zoom = $event_location_row['ZOOM'];
		if(!isset($location_text))
		{
			$location_text = '';
			if(!($event_location_row['CAMPUS'] == null))
			{
				$location_text = $location_text.$event_location_row['CAMPUS'];
				if(!($event_location_row['ROOM'] == null))
				{
					$location_text = $location_text.' - '.$event_location_row['ROOM'];
					if(!($event_location_row['ADDRESS'] == null))
					{
						$location_text = $location_text.', '.$event_location_row['ADDRESS'];
					}
				}
				else if(!($event_location_row['ADDRESS'] == null))
				{
					$location_text = $location_text.', '.$event_location_row['ADDRESS'];
				}
			}
			else if(!($event_location_row['ADDRESS'] == null))
			{
				$location_text = $event_location_row['ADDRESS'];
			}
		}

		// Display Map, Half Width
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