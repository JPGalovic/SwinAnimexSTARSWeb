<?php
	// Card for display of basic Video Game Event, Version 1.0, JAN18, JPGalovic
	// Get Game Event Data
	include('sql/events/get_game_event_data.php');
?>

<section class="quater" id="event_card">
	<img src="image/game/[GAME_TITLE]/event_image.png" alt="[GAME_TITLE]">
	<h4>[EVENT_TITLE] - [GAME_TITLE] - [TORNIMENT/MARATHON/LAN]</h4>
	<p>[EVENT_DATETIME]</p>
	<p>[EVENT_CAMPUS] - [EVENT-ROOM]</p>
	<img src="image/classification/[CLASSIFICATION]" alt="[CLASSIFICATION]" id="classification">
</section>