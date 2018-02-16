<?php
	// Card for display of Anime Screening Events, Version 1.1.4, FEB18, JPGalovic
	// Flags: ignor_title_repeat, all titles are of evan if repeating
	include('sql/events/get_anime_event_data.php');

	if($get_anime_event_ok)
	{
		if(!$get_anime_event_data->num_rows == 0) // No Anime Event Data what to do??
		{
			$anime_event_row = $get_anime_event_data->fetch_assoc();
			$anime_title = $anime_event_row['ANIME_TITLE'];
			
			if(!isset($used_titles))
			{
				$is_ok = true;
			}
			else
			{
				if(!$ignor_title_repeat)
				{
					if(in_array($anime_title, $used_titles))
					{
						$is_ok = false; // Title alredy shown, goto next;
					}
					else
					{
						$is_ok = true;
						array_push($used_titles, $anime_title);
					}
				}
				else
				{
					$is_ok = true;
				}
			}
			
			if($is_ok)
			{
				
				include('sql/events/get_anime_event_card_data.php');
				if($get_anime_event_card_ok)
				{
					if(!$get_anime_event_card_data->num_rows == 0) // Same as above what to do when no data is found
					{
						$anime_event_card_row = $get_anime_event_card_data->fetch_assoc();

						/** Event Card Code Generation **/
						echo('<section class="quater" id="event_card">');
							//Event Image
							echo('<img src="image/anime/'.remove_illegal_char(remove_illegal_char(strtolower($anime_event_row['ANIME_TITLE']))).'/session/'.$anime_event_row['SESSION_TYPE_ID'].$anime_event_row['SESSION_NUMBER'].'.jpg" alt="'.$anime_event_row['ANIME_TITLE'].'">');

							//Core Event Info
							echo('<h4>'.$event_row['EVENT_TITLE'].' - '.$anime_event_row['ANIME_TITLE'].'</h4>');
							echo('<p>'.date('l jS F Y - g:ia', strtotime($event_row['EVENT_TIME'])).'</p>');
							event_card_location($event_row['CAMPUS'], $event_row['ROOM'], $event_row['ADDRESS'], $event_row['LAT'], $event_row['LNG']);

							//Anime Specific Details
							$session_number = $anime_event_row['SESSION_NUMBER'];
							$session_type = $anime_event_row['SESSION_TYPE_ID'];
							include('sql/events/get_anime_classification.php');
							echo('<img src="image/classification/' . $get_anime_classification . '.png" alt="' . $get_anime_classification . '" id="classification"/>');

							echo('<p>'.$anime_event_card_row['ANIME_DESCRIPTION'].'</p>');
							echo('<p>'.$anime_event_card_row['COPYRIGHT'].'</p>');
						
							// Link
							$first_link = true;
							$first_link = anime_event_card_volume_links($anime_title, $first_link);
							$first_link = event_card_end_links($event_row['EVENT_TIME'], $event_row['EVENT_TYPE_DESCRIPTION'], $event_row['EVENT_FACEBOOK_ID'], $event_row['EVENT_UNIONE_URL'], $first_link);

						echo('</section>');
					}
				}
			}
		}
	}
?>