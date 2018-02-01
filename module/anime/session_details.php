<?php
	include('sql/anime/get_session_data.php');
	if($get_session_ok)
	{
		if(!$get_session_data->num_rows == 0)
		{
			echo('<article class="flex_container" id="anime_details">');
				echo('<header class="full">Sessions Details:</header>');
			
				if(!isset($session_id_type))
					$session_id_type = 0;
			
				while($session_row = $get_session_data->fetch_assoc())
				{
					if(!isset($start_episode)) // Update Episode Counts
						$start_episode = 1;
					if(!isset($end_episode))
						$end_episode = $session_row['NUMBER_OF_EPISODES'];
					else
						$end_episode += $session_row['NUMBER_OF_EPISODES'];
					
					if($session_id_type != $session_row['SESSION_TYPE_ID']) // Reset Episode Counts
					{
						$session_id_type = $session_row['SESSION_TYPE_ID'];
						$start_episode = 1;
						$end_episode = $session_row['NUMBER_OF_EPISODES'];
					}
						
					// Session Card
					echo('<section class="quater">');
					
						echo('<img src="image/anime/'.remove_illegal_char(strtolower($anime_title)).'/session/'.$session_row['SESSION_TYPE_ID'].$session_row['SESSION_NUMBER'].'.jpg" alt="'.$anime_title." Session Image: ".$session_row['SESSION_TYPE_ID'].$session_row['SESSION_NUMBER'].'">');
					
						echo('<p>Session Number: '.$session_row['SESSION_NUMBER'].'</p>');
						echo('<p>Session Type: '.$session_row['SESSION_TYPE_DESCRIPTION'].'</p>');
						echo('<p>Number of Episodes: '.$session_row['NUMBER_OF_EPISODES'].'</p>');
						echo('<p>Start Episode Number: '.$start_episode.'</p>');
						echo('<p>End Episode Number: '.$end_episode.'</p>');
						
					
					echo('</section>');
					
					$start_episode += $session_row['NUMBER_OF_EPISODES'];
				}
			
			echo('</article>');
		}
	}

?>
	