<?php
	include('sql/events/get_anime_volume_data.php');

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
				echo('<article class="flex_container" id="anime_volume_table">');

					echo('<header class="full">');
						if($has_dvd && $has_bd)
							echo('<h2>Buy the DVD &amp; Bluray&trade; Today!</h2>');
						else if($has_dvd && !$has_bd)
							echo('<h2>Buy the DVD Today!</h2>');
						else if(!$has_dvd && $has_bd)
							echo('<h2>Buy the Bluray&trade; Today!</h2>');	
					echo('</header>');


					echo('<aside class="full">');
						echo('<p>'.$anime_event_row['ANIME_TITLE'].' is avalible to be brought from '.$anime_row['COMPANY_NAME'].'&#39;s store!</p>');
					echo('</aside>');


					while($volume_row = $get_anime_volume_data->fetch_assoc())
					{
						if(!$volume_row['VOLUME_TYPE_ID'] == 0)
						{
							echo('<section>');
								echo('<img src="image/anime/'.remove_illegal_char(strtolower($anime_event_row['ANIME_TITLE'])).'/volume/'.$volume_row['VOLUME_TYPE_ID'].$volume_row['VOLUME_NUMBER'].'.png" onerror="this.src='."'image/no_cover_image.png'".'" alt="Volume Image">');

								echo('<a href="'.$volume_row['PURCHACE_URL'].'">');
									switch($volume_row['VOLUME_TYPE_ID'])
									{
										case 1:
											echo('Buy '.$volume_row['VOLUME_TYPE_DESCRIPTION'].' Volume '.$volume_row['VOLUME_NUMBER'].' Now!');
											break;
										case 2:
											echo('Buy '.$volume_row['VOLUME_TYPE_DESCRIPTION'].' Volume '.$volume_row['VOLUME_NUMBER'].' Now!');
											break;
										case 3:
											echo('Buy '.$volume_row['VOLUME_TYPE_DESCRIPTION'].' Now!');
											break;
										case 4:
											echo('Buy '.$volume_row['VOLUME_TYPE_DESCRIPTION'].' Now!');
											break;
									}
								echo('</a>');
							echo('</section>');
						}
					}

				echo('</article>');
			}
		}
	}
?>