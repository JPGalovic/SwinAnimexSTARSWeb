<?php
	// Check for Collection in Bluray or DVD
	$get_anime_classification_collection_query = 'SELECT CLASSIFICATION FROM ANIME_VOLUME WHERE ANIME_TITLE = "'.$anime_title.'" AND (VOLUME_TYPE_ID = 3 OR VOLUME_TYPE_ID = 4)';

	$get_anime_classification_ok = true;
	$get_anime_classification = '';

	if(!$get_anime_classification_collection_data = $DB->query($get_anime_classification_collection_query))
	{
		echo($DB->error);
		echo($get_anime_classification_collection_query);
		$get_anime_classification_ok = false;
	}
	else
	{
		if(!$get_anime_classification_collection_data->num_rows == 0) // Collection Avalible
		{
			$anime_classification_row = $get_anime_classification_collection_data->fetch_assoc();
			$get_anime_classification = $anime_classification_row['CLASSIFICATION'];
		}
		else //No Collection Avalible Check for Stream
		{
			$get_anime_classification_stream_query = 'SELECT CLASSIFICATION FROM ANIME_VOLUME WHERE ANIME_TITLE = "'.$anime_title.'" AND VOLUME_TYPE_ID = 0';
			if(!$get_anime_classification_stream_data = $DB->query($get_anime_classification_stream_query))
			{
				echo($DB->error);
				echo($get_anime_classification_stream_query);
				$get_anime_classification_ok = false;
			}
			else
			{
				if(!$get_anime_classification_stream_data->num_rows == 0) // Stream Avalible
				{
					$anime_classification_row = $get_anime_classification_stream_data->fetch_assoc();
					$get_anime_classification = $anime_classification_row['CLASSIFICATION'];
				}
				else //No Stream Avalible Calculate Volume based on Session Number
				{
					//DVD Volumes
					$get_anime_classification_query = 'SELECT CLASSIFICATION, NUMBER_OF_EPISODES FROM ANIME_VOLUME WHERE ANIME_TITLE = "'.$anime_title.'" AND VOLUME_TYPE_ID = 1';
					if(!$get_anime_classification_data = $DB->query($get_anime_classification_query))
					{
						echo($DB->error);
						echo($get_anime_classification_query);
						$get_anime_classification_ok = false;
					}
					else
					{
						if(!$get_anime_classification_data->num_rows == 0)//No DVD Volumes Avalible
						{
							//Get Session Data for Calculation Purpuses
							$get_anime_sessions_query = 'SELECT SESSION_TYPE_ID, NUMBER_OF_EPISODES FROM ANIME_SESSION WHERE ANIME_TITLE = "'.$anime_title.'" AND SESSION_NUMBER <= '.$session_number.' AND SESSION_TYPE_ID = '.$session_type;

							if(!$get_anime_sessions_data = $DB->query($get_anime_sessions_query))
							{
								echo($DB->error);
								echo($get_anime_sessions_query);
								$get_anime_classification_ok = false;
							}
							else
							{
								switch($session_type)
								{
									case 0:	//Standard Session -> Calculate
										$episode_count = 0;
										while($event_session_row = $get_anime_sessions_data->fetch_assoc())
											$episode_count += $event_session_row['NUMBER_OF_EPISODES'];
										while($episode_count >= 0)
										{
											$anime_classification_row = $get_anime_classification_data->fetch_assoc();
											$get_anime_classification = $anime_classification_row['CLASSIFICATION'];
											$episode_count -= $anime_classification_row['NUMBER_OF_EPISODES'];
										}
										break;
									case 1:	//Special Session -> Calculate
										$episode_count = 0;
										while($event_session_row = $get_anime_sessions_data->fetch_assoc())
											$episode_count += $event_session_row['NUMBER_OF_EPISODES'];
										while($episode_count >= 0)
										{
											$anime_classification_row = $get_anime_classification_data->fetch_assoc();
											$get_anime_classification = $anime_classification_row['CLASSIFICATION'];
											$episode_count -= $anime_classification_row['NUMBER_OF_EPISODES'];
										}
										break;
									case 2: //Marathon -> Get Last Avalible Volume
										while($anime_classification_row = $get_anime_classification_data->fetch_assoc())
											$get_anime_classification = $anime_classification_row['CLASSIFICATION'];
										break;
									case 3: //Showcase -> Get First Avalible Volume
										$anime_classification_row = $get_anime_classification_data->fetch_assoc();
										$get_anime_classification = $anime_classification_row['CLASSIFICATION'];
										break;
								}
							}
						}
						else
						{
							//BD Volumes
							$get_anime_classification_query = 'SELECT CLASSIFICATION, NUMBER_OF_EPISODES FROM ANIME_VOLUME WHERE ANIME_TITLE = "'.$anime_title.'" AND VOLUME_TYPE_ID = 2';
							if(!$get_anime_classification_data = $DB->query($get_anime_classification_query))
							{
								echo($DB->error);
								echo($get_anime_classification_query);
								$get_anime_classification_ok = false;
							}
							else
							{
								if($get_anime_classification_data->num_rows == 0) //No BD volumes, what to do?
								{
									$get_anime_classification_ok = false;
								}
								else
								{
									//Get Session Data for Calculation Purpuses
									$get_anime_sessions_query = 'SELECT SESSION_TYPE_ID, NUMBER_OF_EPISODES FROM ANIME_SESSION WHERE ANIME_TITLE = "'.$anime_title.'" AND SESSION_NUMBER <= '.$session_number.' AND SESSION_TYPE_ID = '.$session_type;
									
									if(!$get_anime_sessions_data = $DB->query($get_anime_sessions_query))
									{
										echo($DB->error);
										echo($get_anime_sessions_query);
										$get_anime_classification_ok = false;
									}
									else
									{
										switch($session_type)
										{
											case 0:	//Standard Session -> Calculate
												$episode_count = 0;
												while($event_session_row = $get_anime_sessions_data->fetch_assoc())
													$episode_count += $event_session_row['NUMBER_OF_EPISODES'];
												while($episode_count >= 0)
												{
													$anime_classification_row = $get_anime_classification_data->fetch_assoc();
													$get_anime_classification = $anime_classification_row['CLASSIFICATION'];
													$episode_count -= $anime_classification_row['NUMBER_OF_EPISODES'];
												}
												break;
											case 1:	//Special Session -> Calculate
												$episode_count = 0;
												while($event_session_row = $get_anime_sessions_data->fetch_assoc())
													$episode_count += $event_session_row['NUMBER_OF_EPISODES'];
												while($episode_count >= 0)
												{
													$anime_classification_row = $get_anime_classification_data->fetch_assoc();
													$get_anime_classification = $anime_classification_row['CLASSIFICATION'];
													$episode_count -= $anime_classification_row['NUMBER_OF_EPISODES'];
												}
												break;
											case 2: //Marathon -> Get Last Avalible Volume
												while($anime_classification_row = $get_anime_classification_data->fetch_assoc())
													$get_anime_classification = $anime_classification_row['CLASSIFICATION'];
												break;
											case 3: //Showcase -> Get First Avalible Volume
												$anime_classification_row = $get_anime_classification_data->fetch_assoc();
												$get_anime_classification = $anime_classification_row['CLASSIFICATION'];
												break;
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}
?>