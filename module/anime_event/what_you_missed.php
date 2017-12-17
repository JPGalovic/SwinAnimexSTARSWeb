<?php
	$session_number = $anime_event_row['SESSION_NUMBER'];
	include('sql/events/get_anime_session_data.php');

	if($get_anime_session_ok)
	{
		$number_of_episodes = 0;
		while($session_row = $get_anime_session_data->fetch_assoc())
			$number_of_episodes += $session_row['NUMBER_OF_EPISODES'];
		if($number_of_episodes > 0)
		{
			include('sql/anime/episode/get_anime_episode_data.php');
			if($get_anime_episode_ok)
			{
				echo('<article class="flex_container" id="what_you_missed">');
				
				echo('<header class="full">');
					echo('<h1>What you Missed</h1>');
					echo('<img src="image/what_you_missed.png" id="what_you_missed_image">');
				echo('</header>');
				
				while($episode_row = $get_anime_episode_data->fetch_assoc())
				{
					echo('<section class="quater">');
						echo('<img src="image/anime/'.strtolower($anime_event_row['ANIME_TITLE']).'/episode/'.$episode_row['EPISODE_NUMBER'].'.jpg" alt="'.$anime_event_row['ANIME_TITLE'].' Episode '.$episode_row['EPISODE_NUMBER'].'">');
						echo('<h4>Episode '.$episode_row['EPISODE_NUMBER'].', '.$episode_row['EPISODE_TITLE'].'</h4>');
						echo('<p>'.$episode_row['EPISODE_SYNOPSYS'].'</p>');
					echo('</section>');
				}
				
				echo('</article>');
			}
		}
	}
?>