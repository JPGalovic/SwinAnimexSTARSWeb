<?php
	// Anime Session Fucntion
	function anime_session($event_time, &$event_session_time, &$runsheet_session_number)
	{
		// Get First Anime Event Data
		$anime_event_data = get_anime_event_data($event_time);
		if($anime_event_data->num_rows !=0)
		{
			$anime_event_data_row = $anime_event_data->fetch_assoc();

			$anime_title = $anime_event_data_row['ANIME_TITLE'];
			$session_number = $anime_event_data_row['SESSION_NUMBER'];
			$session_type = $anime_event_data_row['SESSION_TYPE_ID'];
			
			$anime_data = get_anime_data($anime_title);
			$anime_data_row = $anime_data->fetch_assoc();

			$anime_episode_data = get_anime_session_episode_data($anime_title, $session_number, $session_type);
			if($anime_episode_data->num_rows !=0)
			{
				// Flags & Keys
				$first_line_flag = true; // flag for indicating first line of rows
				$session_no_episodes = $anime_episode_data->num_rows;
				$runsheet_session_letter = 'A';
				$break_count = 0;

				while($session_no_episodes > 6) // count out to correct number of sessions
				{
					$break_count++;
					$session_no_episodes -= 4;
				}

				for($i = 0; $i < $session_no_episodes; $i++)
				{
					$episode_row = $anime_episode_data->fetch_assoc();
					if($first_line_flag)
					{
						echo('<tr>');
							echo('<td align="center">'.date('H:i', $event_session_time).'</td>');
							echo('<td rowspan="'.$session_no_episodes.'" align="center">Session '.$runsheet_session_number.'</td>');
							echo('<td rowspan="'.$session_no_episodes.'" align="center">'.$anime_title.'</td>');
							echo('<td align="center">'.$episode_row['EPISODE_NUMBER'].'</td>');
							echo('<td>'.$episode_row['EPISODE_TITLE'].'</td>');
							echo('<td rowspan="'.$session_no_episodes.'">'.get_anime_session_classification($anime_title, $session_number, $session_type).'</td>');
							echo('<td rowspan="'.$session_no_episodes.'" align="center">'.$anime_data_row['COMPANY_NAME'].'</td>');
							echo('<td rowspan="'.$session_no_episodes.'">&nbsp;</td>');
						echo('</tr>');

						$first_line_flag = false;
					}
					else
					{
						echo('<tr>');
							echo('<td align="center">'.date('H:i', $event_session_time).'</td>');
							echo('<td align="center">'.$episode_row['EPISODE_NUMBER'].'</td>');
							echo('<td>'.$episode_row['EPISODE_TITLE'].'</td>');
						echo('</tr>');
					}
					$event_session_time += 1800;
				}

				switch($session_no_episodes)
				{
					case 6:
						$lenght_of_break = 0; //  Max Episodes this session, no break allocated
						break;
					case 5:
						$lenght_of_break = 1800; // Half break eaten by extra episode
						break;
					default:
						$lenght_of_break = 3600; // Default Break is 60min
						break;
				}

				while($break_count > 0) // for each break add break
				{
					echo('<tr>');
						echo('<td align="center">'.date('H:i', $event_session_time).'</td>');
						echo('<td align="center">Break</td>');
						echo('<td colspan="5"></td>');
						echo('<td>&nbsp;</td>'); // TODO: Change Manager Section to pull data from database
					echo('</tr>');
					$event_session_time += $lenght_of_break; // end of break time of break

					$session_no_episodes = 4;
					$first_line_flag = true;
					$break_count--;
					$lenght_of_break = 3600;

					for($i = 0; $i < $session_no_episodes; $i++)
					{
						$episode_row = $anime_episode_data->fetch_assoc();
						if($first_line_flag)
						{
							echo('<tr>');
								echo('<td align="center">'.date('H:i', $event_session_time).'</td>');
								echo('<td rowspan="'.$session_no_episodes.'" align="center">Session '.$runsheet_session_number.'</td>');
								echo('<td rowspan="'.$session_no_episodes.'" align="center">'.$anime_title.'</td>');
								echo('<td align="center">'.$episode_row['EPISODE_NUMBER'].'</td>');
								echo('<td>'.$episode_row['EPISODE_TITLE'].'</td>');
								echo('<td rowspan="'.$session_no_episodes.'">'.get_anime_session_classification($anime_title, $session_number, $session_type).'</td>');
								echo('<td rowspan="'.$session_no_episodes.'" align="center">'.$anime_data_row['COMPANY_NAME'].'</td>');
								echo('<td rowspan="'.$session_no_episodes.'">&nbsp;</td>');
							echo('</tr>');

							$first_line_flag = false;
						}
						else
						{
							echo('<tr>');
								echo('<td align="center">'.date('H:i', $event_session_time).'</td>');
								echo('<td align="center">'.$episode_row['EPISODE_NUMBER'].'</td>');
								echo('<td>'.$episode_row['EPISODE_TITLE'].'</td>');
							echo('</tr>');
						}
						$event_session_time += 1800;
					}
				}
				return true;
			}
		}
		return false;
	}
	
	// Generation Script for the Generation of Runsheets, Version 1.1.0, FEB18, JPGalovic XBoyle
	if(isset($_POST['event_datetime']))
	{
		// Generate runsheet for download.
		$event_time = $_POST['event_datetime'];
		
		$event_data = get_event_data($event_time, null, false); // get core event data
		if($event_data->num_rows != 0)
		{
			$event_data_row = $event_data->fetch_assoc();
			$event_location = event_card_location($event_data_row['CAMPUS'], $event_data_row['ROOM'], $event_data_row['ADDRESS'], $event_data_row['LAT'], $event_data_row['LNG']);
			$event_date = date('jS F Y', strtotime($event_data_row['EVENT_TIME']));
		
			echo('<h1>Runsheet for: '.$event_data_row['EVENT_TITLE'].'</h1>');
			echo('<p>Event Date: '.$event_date.'<br> Event Location: '.$event_location.'</p>');

			// Runsheet Header
			echo('<table width="100%" border="1" bordercolor="black" cellpadding="2px" cellspacing="0"><tbody><tr>');
				echo('<th>Time</th>');
				echo('<th>Session</th>');
				echo('<th>Series Title</th>');
				echo('<th>Ep. No.</th>');
				echo('<th>Ep. Title</th>');
				echo('<th>Classification</th>');
				echo('<th>Licence</th>');
				echo('<th width="20%">Managers</th>');
			echo('</tr>');
			
			$event_session_time = strtotime($event_data_row['EVENT_TIME']) - 1800; //1800 = 30 min x 60 sec
			
			// Event Setup Row
			echo('<tr>');
				echo('<td align="center">'.date('H:i', $event_session_time).'</td>');
				echo('<td align="center">Setup</td>');
				echo('<td colspan="5"></td>');
				echo('<td>&nbsp;</td>'); // TODO: Change Manager Section to pull data from database
			echo('</tr>');
			
			$event_session_time += 1800; //Add 30min to clock for each new episode
			$runsheet_session_number = 1;
			
			if(anime_session($event_time, $event_session_time, $runsheet_session_number))
			{
				$continue = true;
				// get remainder of todays events.
				while($continue)
				{
					$runsheet_session_number++;
					$event_data = get_event_data(null, $event_time, true);
					if($event_data->num_rows != 0)
					{
						$event_data_row = $event_data->fetch_assoc();
						if($event_date == date('jS F Y', strtotime($event_data_row['EVENT_TIME'])))
						{
							$event_time = $event_data_row['EVENT_TIME'];
							if($event_session_time < strtotime($event_data_row['EVENT_TIME'])) // Insert Break
							{
								echo('<tr>');
									echo('<td align="center">'.date('H:i', $event_session_time).'</td>');
									echo('<td align="center">Break</td>');
									echo('<td colspan="5"></td>');
									echo('<td>&nbsp;</td>'); // TODO: Change Manager Section to pull data from database
								echo('</tr>');
								
								$event_session_time = strtotime($event_data_row['EVENT_TIME']);
								
								anime_session($event_time, $event_session_time, $runsheet_session_number);
							}
							else if($event_session_time > strtotime($event_data_row['EVENT_TIME'])) // overlapping event ??? need to work out handle
								$continue = false;
							else // no break from event_time
								anime_session($event_time, $event_session_time, $runsheet_session_number);
						}
						else
							$continue = false;
					}
					else
						$continue = false;
				}
				
				echo('<tr>');
					echo('<td align="center">'.date('H:i', $event_session_time).'</td>');
					echo('<td align="center">Packup</td>');
					echo('<td colspan="5"></td>');
					echo('<td>&nbsp;</td>'); // TODO: Change Manager Section to pull data from database
				echo('</tr>');
			}
			else
			{
				echo('<p>Event selcected does not have an anime title associated with it!');
				echo('<p>Please specify the datetime of the event you want to generate runsheet for. yyyy-mm-dd hh:mm:ss</p><p><form action="generate_runsheet.php" method="post">Event Date/Time to Generate: <input type="datetime" name="event_datetime"><br><input type="submit"></form></p>');
			}
		}
		else
		{
			// No event at specified datetime
			echo('<p>Entered date does not have any data that can be put into a runsheet</p>');
			echo('<p>Please specify the datetime of the event you want to generate runsheet for. yyyy-mm-dd hh:mm:ss</p><p><form action="generate_runsheet.php" method="post">Event Date/Time to Generate: <input type="datetime" name="event_datetime"><br><input type="submit"></form></p>');
		}
	}
	else
	{
		// No settings, show form.
		echo('<p>Please specify the datetime of the event you want to generate runsheet for. yyyy-mm-dd hh:mm:ss</p><p><form action="generate_runsheet.php" method="post">Event Date/Time to Generate: <input type="datetime" name="event_datetime"><br><input type="submit"></form></p>');
	}
?>