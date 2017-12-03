<?php
	//Section gets next 4 Upcoming Events, in the case where no more upcoming events are found Section gets previous 4 events
	//Login to Database
	include('sql/sql_login.php');

	//Construct Section
	echo('<article class="flex_container" id="event_display">');

	//Get Next 4 Events
	include('sql/events/get_next_four.php');

	//Check Data OK
	if($get_next_four_ok)
	{
		if($get_next_four_data->num_rows == 0) //No future events found
		{
			//Get Previous 4 Events
			include('sql/events/get_previous_four.php');
			if($get_previous_four_ok)
			{
				echo('<header class="full"><h4>Past Events:</h4></header>');
				echo('<section class="flex_container">');
				
				while($event_row = $get_next_four_data->fetch_assoc())
				{
					$event_time = $event_row['EVENT_TIME'];
					switch($event_row['EVENT_TYPE_DESCRIPTION'])
					{
						case 'Screening Session Event':
							include('module/event_card/anime_event_card.php');
							break;
						case 'Social Episode Event':
							break;
						case 'Workshop Event':
							break;
						case 'General Meeting':
							break;
					}
				}
				
				echo('</section>');
			}
		}
		else
		{
			echo('<header class="full"><h4>Upcoming Events:</h4></header>');
			echo('<section class="flex_container">');
			
			while($event_row = $get_next_four_data->fetch_assoc())
			{
				$event_time = $event_row['EVENT_TIME'];
				switch($event_row['EVENT_TYPE_DESCRIPTION'])
				{
					case 'Screening Session Event':
						include('module/event_card/anime_event_card.php');
						break;
					case 'Social Episode Event':
						break;
					case 'Workshop Event':
						break;
					case 'General Meeting':
						break;
				}
			}
			
			echo('</section>');
		}
	}

	echo('</article>')
?>