<?php
	$anime_episode_data = get_anime_session_episode_data($anime_title);
	if($anime_episode_data->num_rows > 0)
	{
		echo('<article class="flex_container" id="anime_details">');
			echo('<header class="full">Anime Episodes:</header>');
			while($episode_row = $anime_episode_data->fetch_assoc())
			{
				echo('<section class="quater">');
					echo('<img src="image/anime/'.remove_illegal_char(strtolower($anime_title)).'/episode/'.$episode_row['EPISODE_NUMBER'].'.jpg" alt="'.$anime_title.' Episode '.$episode_row['EPISODE_NUMBER'].'">');
					echo('<h4>Episode '.$episode_row['EPISODE_NUMBER'].', '.$episode_row['EPISODE_TITLE'].'</h4>');
					echo('<p>'.$episode_row['EPISODE_SYNOPSYS'].'</p>');
				echo('</section>');
			}
		echo('</article>');
	}
?>