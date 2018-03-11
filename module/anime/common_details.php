<?php
	$anime_data = get_anime_data($anime_title);
	if($anime_data->num_rows > 0)
	{
		$anime_core_row = $anime_data->fetch_assoc();

		echo('<article id="anime_details">');

			echo('<header>Anime Details for: '.$anime_core_row['ANIME_TITLE'].'</header>');

			echo('<section>');

				echo('<p>Total Number of Episodes: '.$anime_core_row['NUMBER_OF_EPISODES'].'</p>');
				echo('<p>Anime Synopsis: '.$anime_core_row['ANIME_SYNOPSIS'].'</p>');
				echo('<p>Anime Description: '.$anime_core_row['ANIME_DESCRIPTION'].'</p>');
				echo('<p>Licenced Company: '.$anime_core_row['COMPANY_NAME'].'</p>');
				echo('<p>Copyright: '.$anime_core_row['COPYRIGHT'].'</p>');

			echo('</section>');

		echo('</article>');
	}
?>