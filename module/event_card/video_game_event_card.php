<?php
	// Card for display of basic Video Game Event, Version 1.0, JAN18, JPGalovic
	// Get Game Event Data
	include('sql/events/get_game_event_data.php');

	echo('<section class="quater" id="event_card">');

	if(!$get_game_event_data->num_rows == 0)//Check for game data
	{
		$game_event_row = $get_game_event_data->fetch_assoc();
		$game_title = $game_event_row['GAME_TITLE'];
		// Get Game Specific Data
		include('sql/games/get_game_classification_data.php');
		
		if(!$get_game_classification_data->num_rows == 0)
		{
			$game_classification_row = $get_game_classification_data->fetch_assoc();
			
			echo('<img src="image/game/'.remove_illegal_char(remove_illegal_char(strtolower($game_event_row['GAME_TITLE']))).'/event_image.png" alt="'.remove_illegal_char(remove_illegal_char(strtolower($game_event_row['GAME_TITLE']))).'">');
			echo('<h4>'.$event_row['EVENT_TITLE'].' - '.$game_event_row['GAME_TITLE']);
			if(!$game_event_row['TYPE_ID'] == 1)
				echo(' - '.$game_event_row['DESCRIPTION'].'</h4>');
			else
				echo('</h4>');

			echo('<p>'.date('l jS F Y - g:ia', strtotime($event_row['EVENT_TIME'])).'</p>');
			echo('<p>'.$event_row['CAMPUS'].' - '.$event_row['ROOM'].'</p>');


			echo('<img src="image/classification/'.strtolower($game_classification_row['CLASSIFICATION']).'.png" alt="'.$game_classification_row['CLASSIFICATION'].'" id="classification">');
		}
	}
	else
	{
		echo('<img src="image/event/'.remove_illegal_char(remove_illegal_char(strtolower($event_row['EVENT_TITLE']))).'.png" alt="'.$event_row['EVENT_TITLE'].'">');
		echo('<h4>'.$event_row['EVENT_TITLE'].'</h4>');
		echo('<p>'.date('l jS F Y - g:ia', strtotime($event_row['EVENT_TIME'])).'</p>');
		echo('<p>'.$event_row['CAMPUS'].' - '.$event_row['ROOM'].'</p>');
	}

	echo('</section>');
?>


	
	
	
	
	


	
	
	
	
