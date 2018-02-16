<?php
	// Card for display of Tabletop Events, Version 1.2, FEB18, JPGalovic
	// Get Game Data
	include('sql/events/get_game_event_data.php');
	if($get_game_event_data->num_rows > 0)
	{
		$game_row = $get_game_event_data->fetch_assoc();
		$game_title = $game_row['GAME_TITLE'];
		include('sql/games/get_game_data.php');
		$game_data_row = $get_game_data->fetch_assoc();
	}

	echo('<section class="quater" id="event_card">');

		echo('<img src="image/event/'.remove_illegal_char(remove_illegal_char(strtolower($event_row['EVENT_TITLE']))).'.png" alt="'.$event_row['EVENT_TITLE'].'">');

		// Event Name
		echo('<h4>');
		echo($event_row['EVENT_TITLE']);

		if($event_row['EVENT_SUBTITLE'] != NULL)
		{
			echo(' - '.$event_row['EVENT_SUBTITLE']);
			if(isset($game_row))
				echo(' ft. '.$game_row['GAME_TITLE']);	
		}
		else
			if(isset($game_row))
				echo(' ft. '.$game_row['GAME_TITLE']);

		echo('</h4>');


		echo('<p>'.date('l jS F Y - g:ia', strtotime($event_row['EVENT_TIME'])).'</p>');
		
		event_card_location($event_row['CAMPUS'], $event_row['ROOM'], $event_row['ADDRESS'], $event_row['LAT'], $event_row['LNG']);

		if(isset($game_data_row))
				echo('<p>'.$game_data_row['GAME_DESCIRPTION'].'</p>');

		// Links
		$first_link = true;
		$first_link = event_card_end_links($event_row['EVENT_TIME'], $event_row['EVENT_TYPE_DESCRIPTION'], $event_row['EVENT_FACEBOOK_ID'], $event_row['EVENT_UNIONE_URL'], $first_link);

	echo('</section>');
	

	unset($game_row);
	unset($game_data_row);
?>

