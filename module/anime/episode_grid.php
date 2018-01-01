<?php
	include('sql/anime/get_anime_core_data.php');
	if($get_anime_core_ok)
	{
		if(!$get_anime_core_data->num_rows == 0)
		{
			$anime_core_row = $get_anime_core_data->fetch_assoc();
			$number_of_episodes = $anime_core_row['NUMBER_OF_EPISODES'];
		
			include('sql/anime/episode/get_anime_episode_data.php');
			if($get_anime_episode_ok)
			{
				echo('<article class="flex_container" id="anime_details">');

					echo('<header class="full">Anime Episodes:</header>');

					while($episode_row = $get_anime_episode_data->fetch_assoc())
					{
						echo('<section class="quater">');
							echo('<img src="image/anime/'.remove_illegal_char(strtolower($anime_title)).'/episode/'.$episode_row['EPISODE_NUMBER'].'.jpg" alt="'.$anime_title.' Episode '.$episode_row['EPISODE_NUMBER'].'">');
							echo('<h4>Episode '.$episode_row['EPISODE_NUMBER'].', '.$episode_row['EPISODE_TITLE'].'</h4>');
							echo('<p>'.$episode_row['EPISODE_SYNOPSYS'].'</p>');
						echo('</section>');
					}

				echo('</article>');
			}
		}
	}
?>