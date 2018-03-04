<?php
	echo('<article class="flex_container" id="anime_volume">');
		echo('<header class="full">Avalible Volumes: </header>');

		for($i = 0; $i < 4; $i++)
		{
			$volume_data = get_anime_volume_data($anime_title, $i);

			if($volume_data->num_rows > 0)
			{
				echo('<section class="full">Volume Type: '.$i.'</section>');

				while($volume_row = $volume_data->fetch_assoc())
				{
					echo('<section>');
						echo('<img src="image/anime/'.remove_illegal_char(strtolower($anime_title)).'/volume/'.$volume_row['VOLUME_TYPE_ID'].$volume_row['VOLUME_NUMBER'].'.png" alt="Volume Image: '.$volume_row['VOLUME_TYPE_ID'].$volume_row['VOLUME_NUMBER'].'">');

						echo('<p>Volume Type: '.$volume_row['VOLUME_TYPE_DESCRIPTION'].'</p>');
						echo('<p>Volume Number: '.$volume_row['VOLUME_NUMBER'].'</p>');

						echo('<p>Volume Classification: '.$volume_row['CLASSIFICATION'].'</p>');
						echo('<img src="image/classification/'.$volume_row['CLASSIFICATION'].'.png" alt="'.$volume_row['CLASSIFICATION'].'" id="classification"/>');

						echo('<a href="'.$volume_row['PURCHACE_URL'].'"><p>Volume URL: '.$volume_row['PURCHACE_URL'].'</p></a>');
						echo('<p>Number of Episodes: '.$volume_row['NUMBER_OF_EPISODES'].'</p>');
					echo('</section>');
				}
			}
		}
	echo('</article>');
?>