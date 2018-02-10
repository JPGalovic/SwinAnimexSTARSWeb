<?php
	// Generation Script for the Generation of Runsheets, Version 1.0, FEB18, JPGalovic
	if(isset($_POST['event_datetime']))
	{
		// Generate runsheet for download.
		$event_time = $_POST['event_datetime'];
		echo('<p>Generating runsheet for event running at '.date('g:ia', strtotime($event_time)).' on '.date('l jS F Y', strtotime($event_time)));
		
		// Define constants
		$newln = "\r\n";
		
		// Create output runsheet file.
		$output_file_name = 'generated_runsheet\runsheet_'.date('Y-m-d_H-i-s', strtotime($event_time)).'.txt';
		$output_handle = fopen($output_file_name, 'w') or die('Cannot open file: '.$output_file_name);
		
		// Runsheet Header Generation
		// ┌─────────────────────────────────────────────────────────────────────────┐
		// │ SwinAnime x STARS Runsheet: HH:MM DD-MM-YYYY                            │
		// │ Title: ANIME_TITLE                                                      │
		// │ Session: SESSION_NUMBER - SESSION_TYPE_DESCRIPTION                      │
		// ├───────┬──────┬─────────────────────────────────────────┬────────────────┤
		// │ Time  │ Ep # │ Episode Title                           │ Staff          │
		// ├───────┼──────┼─────────────────────────────────────────┼────────────────┤
		
		// Set Anime & Session Data
		include('../sql_login.php');
		include('../../sql/anime/get_anime_event_data.php');
		if($anime_row = $get_anime_event_data->fetch_assoc())
		{
			$anime_title = $anime_row['ANIME_TITLE'];
			$session_type_id = $anime_row['SESSION_TYPE_ID'];
			$session_number = $anime_row['SESSION_NUMBER'];
			
			$anime_title_whitespace = '';
			for($i= 64 - strlen($anime_title); $i > 0; $i--)
				$anime_title_whitespace = $anime_title_whitespace.' ';
			
			switch($session_type_id)
			{
				case 0:
					$session_type = 'Screening Session - '.$session_number.'                                          │';
					break;
				case 1:
					$session_type = 'Special Session - '.$session_number.'                                            │';
					break;
				case 2:
					$session_type = 'Marathon                                                       │';
					break;
				case 3:
					$session_type = 'Showcase Session                                               │';
					break;
			}
			
			fwrite($output_handle, '┌─────────────────────────────────────────────────────────────────────────┐'.$newln);
			fwrite($output_handle, '│ SwinAnime x STARS Runsheet: '.date('Y-m-d H:i.s', strtotime($event_time)).'                         │'.$newln);
			fwrite($output_handle, '│ Title: '.$anime_title.$anime_title_whitespace.' │'.$newln);
			fwrite($output_handle, '│ Session: '.$session_type.$newln);
			fwrite($output_handle, '├───────┬──────┬─────────────────────────────────────────┬────────────────┤'.$newln);
			fwrite($output_handle, '│ Time  │ Ep # │ Episode Title                           │ Staff          │'.$newln);
			fwrite($output_handle, '├───────┼──────┼─────────────────────────────────────────┼────────────────┤'.$newln);
			
			// Write first 4 or 5 episodes
			// ├───────┼──────┼─────────────────────────────────────────┼────────────────┤
			// │ HH:MM │ NNNN │ EPISODE_TITLE                           │                │ x4 or x5
			// ├───────┼──────┼─────────────────────────────────────────┼────────────────┤
			
			include('../../sql/anime/get_anime_session_data.php');
			$first_episode = $get_anime_session_data_first_episode;
			$number_of_episodes = $get_anime_session_data_number_of_episodes;
			
			include('../../sql/anime/episode/get_runsheet_episode_data.php');
			
			$clock = strtotime($event_time);
			
			if($get_runsheet_episode_data->num_rows > 0)
			{
				$repeat = 0;
				while($number_of_episodes > 5) // Reduce number of episodes by 4 (used for inclusion of breaks)
				{
					$repeat++;
					$number_of_episodes -= 4;
				}
					
				do
				{
					$shortened = $number_of_episodes > 4; // when more than 4 episodes listed, shortened break
					while($number_of_episodes > 0)
					{
						$episode_row = $get_runsheet_episode_data->fetch_assoc();
						
						$episode_number = $episode_row['EPISODE_NUMBER'];
						$episode_number_whitespace = '';
						for($i= 4 - strlen($episode_number); $i > 0; $i--)
							$episode_number_whitespace = $episode_number_whitespace.' ';
						
						$episode_title = $episode_row['EPISODE_TITLE'];
						$episode_title_whitespace = '';
						if(39 - strlen($episode_number) < 0)
							$episode_title = substr($episode_title, 0, 39); // fix max length of episode title (honestly cbf wrap)
						for($i= 39 - strlen($episode_title); $i > 0; $i--)
							$episode_title_whitespace = $episode_title_whitespace.' ';
						
						fwrite($output_handle, '│ '.date('H:i', $clock).' │ '.$episode_number.$episode_number_whitespace.' │ '.$episode_title.$episode_title_whitespace.' │                │'.$newln);
						
						// Add 30min to time.
						$clock = strtotime("+30 minutes",$clock);
						
						$number_of_episodes--;
					}
					
					if($repeat > 0)
					{
						$number_of_episodes = 4;
						$repeat--;
						
						
						fwrite($output_handle, '├───────┼──────┼─────────────────────────────────────────┼────────────────┤'.$newln);
						fwrite($output_handle, '│ '.date('H:i', $clock).' │      │ Meal Break                              │                │'.$newln);
						fwrite($output_handle, '├───────┼──────┼─────────────────────────────────────────┼────────────────┤'.$newln);
						
						if($shortened)
						{
							// Add 30min to time.
							$clock = strtotime("+30 minutes",$clock);
						}
						else
						{
							// Add 60min to time.
							$clock = strtotime("+60 minutes",$clock);
						}
					}
					else
					{
						fwrite($output_handle, '└───────┴──────┴─────────────────────────────────────────┴────────────────┘');
						$repeat--;
					}
				} while ($repeat >= 0);	
				
				// Finalise file.
				fclose($output_handle);
				include('../sql_close.php');

				// Sucsessful write, display output.
				echo('<p>Runsheet Written.</p>');
				echo('<a href="generated_runsheet\">View all runsheets</a>');
			}
			else // Error state.
			{
				// Finalise file.
				fclose($output_handle);
				include('../sql_close.php');

				echo('<p>Error retreiving anime episodes</p>');
				echo('<p>Please spesify the datetime of the event you want to generate runsheet for. yyyy-mm-dd hh:mm:ss</p><p><form action="generate_screening_runsheet.php" method="post">Event Date/Time to Generate: <input type="datetime" name="event_datetime"><br><input type="submit"></form></p>');
			}
		}
		else // Error state.
		{
			// Finalise file.
			fclose($output_handle);
			include('../sql_close.php');
			
			echo('<p>Entered date does not have any data that can be put into a runsheet</p>');
			echo('<p>Please spesify the datetime of the event you want to generate runsheet for. yyyy-mm-dd hh:mm:ss</p><p><form action="generate_screening_runsheet.php" method="post">Event Date/Time to Generate: <input type="datetime" name="event_datetime"><br><input type="submit"></form></p>');
		}
	}
	else
	{
		// No settings, show form.
		echo('<p>Please spesify the datetime of the event you want to generate runsheet for. yyyy-mm-dd hh:mm:ss</p><p><form action="generate_screening_runsheet.php" method="post">Event Date/Time to Generate: <input type="datetime" name="event_datetime"><br><input type="submit"></form></p>');
	}
?>