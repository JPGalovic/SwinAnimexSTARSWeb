<?php
	// Event card for friday fill, Version 1.0.0, FEB18, JPGalovic
	
	echo('<tr>');
	// event image
		echo('<td>');
			switch($event_row['EVENT_TYPE_DESCRIPTION'])
			{
				case 'Screening Session Event':
					event_card_image($event_row['EVENT_TITLE'], $anime_row['ANIME_TITLE'], NULL, $anime_row['SESSION_TYPE_ID'], $anime_row['SESSION_NUMBER'], TRUE);
					break;
				case 'Social Episode Event':
					event_card_image($event_row['EVENT_TITLE'], NULL, NULL, NULL, NULL, TRUE);
					break;
				case 'Workshop Event':
					event_card_image($event_row['EVENT_TITLE'], NULL, NULL, NULL, NULL, TRUE);
					break;
				case 'General Meeting':
					event_card_image($event_row['EVENT_TITLE'], NULL, NULL, NULL, NULL, TRUE);
					break;
				case 'Roleplay Event':
					event_card_image($event_row['EVENT_TITLE'], NULL, NULL, NULL, NULL, TRUE);
					break;
				case 'Tabletop Event':
					event_card_image($event_row['EVENT_TITLE'], NULL, $game_row['GAME_TITLE'], NULL, NULL, TRUE);
					break;
				case 'Video Game Event':
					event_card_image($event_row['EVENT_TITLE'], NULL, $game_row['GAME_TITLE'], NULL, NULL, TRUE);
					break;
				case 'Other Event':
					event_card_image($event_row['EVENT_TITLE'], NULL, NULL, NULL, NULL, TRUE);
					break;
			}
		echo('</td>');


	echo('</tr>');
?>




<td colspan="3">
	<p>Adventurers Anonymous
	<br>Thursday 1st March 2018 - 4:30pm
	<br>Swinburne Hawthorn - AD108| <a href="http://www.swinanime.net/index.php?page=roleplay_event&session=2018-03-01%2016:30:00" style="color: #FF6767; text-decoration: none;">More info.</a></p>
</td>
