<?php
	include('sql/anime/get_session_data.php');
	if($get_session_ok)
	{
		if(!$get_session_data->num_rows == 0)
		{
			echo('<article class="flex_container" id="anime_details">');
				echo('<header class="full">Sessions Details:</header>');
			
				while($session_row = $get_session_data->fetch_assoc())
				{
					// Session Card
					echo('<section class="quater">');
					
						echo('<img src="image/anime/'.remove_illegal_char(strtolower($anime_title)).'/session/'.$session_row['SESSION_TYPE_ID'].$session_row['SESSION_NUMBER'].'.jpg" alt="'.$anime_title." Session Image: ".$session_row['SESSION_TYPE_ID'].$session_row['SESSION_NUMBER'].'">');
					
						echo('<p>Session Number: '.$session_row['SESSION_NUMBER'].'</p>');
						echo('<p>Session Type: '.$session_row['SESSION_TYPE_DESCRIPTION'].'</p>');
					
					echo('</section>');
				}
			
			echo('</article>');
		}
	}

?>
	