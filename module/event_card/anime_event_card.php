<?php
	include('sql/events/get_anime_event_data.php');

	if($get_anime_event_ok)
	{
		if(!$get_anime_event_data->num_rows == 0) // No Anime Event Data what to do??
		{
			$anime_event_row = $get_anime_event_data->fetch_assoc();
			$anime_title = $anime_event_row['ANIME_TITLE'];
			include('sql/events/get_anime_event_card_data.php');
			if($get_anime_event_card_ok)
			{
				if(!$get_anime_event_card_data->num_rows == 0) // Same as above what to do when no data is found
				{
					$anime_event_card_row = $get_anime_event_card_data->fetch_assoc();
					
					/** Event Card Code Generation **/
					echo('<section class="quater" id="event_card">');
						//Event Image
						echo('<img src="image/anime/'.strtolower($anime_event_row['ANIME_TITLE']).'/session/'.$anime_event_row['SESSION_TYPE_ID'].$anime_event_row['SESSION_NUMBER'].'.jpg" alt="'.$anime_event_row['ANIME_TITLE'].'">');
					
						//Core Event Info
						echo('<h4>'.$event_row['EVENT_TITLE'].' - '.$anime_event_row['ANIME_TITLE'].'</h4>');
						echo('<p>'.date('l jS F Y - g:ia', strtotime($event_row['EVENT_TIME'])).'</p>');
						echo('<P>'.$event_row['CAMPUS'].' - '.$event_row['ROOM'].'</P>');
					
						//Anime Specific Details
						$session_number = $anime_event_row['SESSION_NUMBER'];
						$session_type = $anime_event_row['SESSION_TYPE_ID'];
						include('sql/events/get_anime_classification.php');
						echo('<img src="image/classification/' . $get_anime_classification . '.png" alt="' . $get_anime_classification . '" id="classification"/>');
					
						echo('<p>'.$anime_event_card_row['ANIME_DESCRIPTION'].'</p>');
						echo('<p>'.$anime_event_card_row['COPYRIGHT'].'</p>');
					
						//Volume Links
						include('sql/events/get_anime_volume_data.php');
						$first_link = true;
						if($get_anime_volume_ok)
						{
							if(!$get_anime_volume_data->num_rows == 0) //Has Volume Info
							{
								while($volume_row = $get_anime_volume_data->fetch_assoc())
								{
									if(!$first_link)
									{
										echo(' | ');
									}
									echo('<a href="'.$volume_row['PURCHACE_URL'].'">');
									switch($volume_row['VOLUME_TYPE_ID'])
									{
										case 0:
											echo('Stream Now!');
											break;
										case 1:
											echo('Buy '.$volume_row['VOLUME_TYPE_DESCRIPTION'].' Volume '.$volume_row['VOLUME_NUMBER']);
											break;
										case 2:
											echo('Buy '.$volume_row['VOLUME_TYPE_DESCRIPTION'].' Volume '.$volume_row['VOLUME_NUMBER']);
											break;
										case 3:
											echo('Buy '.$volume_row['VOLUME_TYPE_DESCRIPTION']);
											break;
										case 4:
											echo('Buy '.$volume_row['VOLUME_TYPE_DESCRIPTION']);
											break;
									}
									echo('</a>');
									$first_link = false;
								}
							}
						}
						
						//RSVP Links
						if(!$event_row['EVENT_FACEBOOK_ID'] == '0')
						{
							if(!$first_link)
							{
								echo(' | ');
							}
							echo('<a href="https://www.facebook.com/events/'.$event_row['EVENT_FACEBOOK_ID'].'/">RSVP on Facebook</a>');
							$first_link = false;
						}
						if(!$event_row['EVENT_UNIONE_URL'] == '0')
						{
							if(!$first_link)
							{
								echo(' | ');
							}
							echo('<a href="'.$event_row['EVENT_UNIONE_URL'].'">Unione Event</a>');
							$first_link = false;
						}
					
						//More Info Link
						if(!$first_link)
						{
							echo(' | ');
						}
						echo('<a href="index.php?page=anime_event&session=' . $event_row['EVENT_TIME'] . '">Event Info.</a>');
					
					echo('</section>');
				}
			}
		}
	}
?>