<?php
	include('sql/anime/get_anime_volume_data.php');

	if($get_anime_volume_ok)
	{
		if(!$get_anime_volume_data->num_rows == 0) //Has Volume Info
		{
			$has_dvd = false;
			$has_bd = false;
			
			while($volume_row = $get_anime_volume_data->fetch_assoc())
			{
				switch($volume_row['VOLUME_TYPE_ID'])
				{
					case 1:
						$has_dvd = true;
						break;
					case 2:
						$has_bd = true;
						break;
					case 3:
						$has_dvd = true;
						break;
					case 4:
						$has_bd = true;
						break;
				}
			}
			
			$get_anime_volume_data->data_seek(0);
			
			if($has_dvd || $has_dvd)
			{
				echo('<article class="flex_container" id="anime_volume">');

					echo('<header class="full">Avalible Volumes: </header>');


					while($volume_row = $get_anime_volume_data->fetch_assoc())
					{
						if(!$volume_row['VOLUME_TYPE_ID'] == 0)
						{
							echo('<section>');
								echo('<img src="image/anime/'.strtolower($anime_title).'/volume/'.$volume_row['VOLUME_TYPE_ID'].$volume_row['VOLUME_NUMBER'].'.png" alt="Volume Image: '.$volume_row['VOLUME_TYPE_ID'].$volume_row['VOLUME_NUMBER'].'">');
							
								echo('<p>Volume Type: '.$volume_row['VOLUME_TYPE_DESCRIPTION'].'</p>');
								echo('<p>Volume Number: '.$volume_row['VOLUME_NUMBER'].'</p>');
								echo('<p>Volume Classification: '.$volume_row['CLASSIFICATION'].'</p>');
								echo('<a href="'.$volume_row['PURCHACE_URL'].'"><p>Volume URL: '.$volume_row['PURCHACE_URL'].'</p></a>');
								echo('<p>Number of Episodes: '.$volume_row['NUMBER_OF_EPISODES'].'</p>');

								
							echo('</section>');
						}
					}

				echo('</article>');
			}
		}
	}
?>