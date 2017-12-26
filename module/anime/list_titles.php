<?php
	include('sql/anime/get_anime_titles_data.php');
	if($get_anime_titles_ok)
	{
		if(!$get_anime_titles_data->num_rows == 0)
		{
			echo('<article class="flex_container" id="anime_details">');

				echo('<header class="full">Anime in Database:</header>');
			
				echo('<section>');
			
				$first_anime_title = true;

				while($anime_titles_row = $get_anime_titles_data->fetch_assoc())
				{
					if(!$first_anime_title)
						echo('&nbsp;&nbsp;|&nbsp;&nbsp;');
					else
						$first_anime_title = false;
					echo('<a href="index.php?page=anime_view&anime='.$anime_titles_row['ANIME_TITLE'].'">'.$anime_titles_row['ANIME_TITLE'].'</a>');
				}
			
				echo('</section>');

			echo('</article>');
		}
	}
?>