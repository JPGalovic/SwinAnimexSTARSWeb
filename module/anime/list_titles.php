<?php
	$anime_titles = get_anime_titles_data();
	if($anime_titles->num_rows > 0)
	{
		echo('<article class="flex_container" id="anime_details">');

			echo('<header class="full">Anime in Database:</header>');

			echo('<section>');

			$first_anime_title = true;

			while($anime_titles_row = $anime_titles->fetch_assoc())
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
?>