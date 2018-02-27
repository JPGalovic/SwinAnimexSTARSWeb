<?php
	echo('<style>@font-face {font-family: Nevis; src: url(http://swinanime.net/font/nevis.ttf);} * {font-family: Nevis;}</style>');

	// Club Newsletter Auto Designer, Version 1.0.4, FEB18, JPGalovic
	$newsletter_date = $_GET['date'];

	include('code_gen/include.php');

	$newsletter_data = get_newsletter_data($newsletter_date);
	if($newsletter_data->num_rows > 0)
		$newsletter_data_row = $newsletter_data->fetch_assoc();
	else
		die('Something Went Wrong!');

	// Club newsletter is built arround a table (confirmed compatable with web-view, gmail, windows 10 mail & android mail)
	echo('<table width="600px" border="0" cellspacing="0" cellpadding="10" style="border: 1px solid black;"><tbody>');

	echo('<tr><td colspan="4" bgcolor="#222222" style="border-bottom: 1px solid #FFFFFF"><img src="http://swinanime.net/image/logo.png" alt="SwinAnime x S.T.A.R.S." height="20"></td></tr>');
	
	// Newsletter Title
	echo('<tr><td colspan="4" bgcolor="#A6A6A6">');
		echo('<h1 style="color: #BA0000; font-size: 18px;">'.$newsletter_data_row['PUBLICATION_TITLE'].', Vol. '.$newsletter_data_row['PUBLICATION_VOLUME'].', '.date('jS F Y', strtotime($newsletter_date)).'</h1>');
	echo('</td></tr>');

	// Headline Article
	$data = get_newsletter_articles($newsletter_date, "0");
	while($data_row = $data->fetch_assoc())
	{
		echo('<tr><td colspan="4" bgcolor="#A6A6A6">');
			if($data_row['ARTICLE_IMAGE_URL'] != null)
				echo('<img src="'.$data_row['ARTICLE_IMAGE_URL'].'" alt="Showcase" width="100%">');
			echo('<h2 style="color: #555555; font-size: 18px;">'.$data_row['ARTICLE_HEADLINE'].'</h2>');
			echo('<p>'.$data_row['ARTICLE_TEXT'].'</p>');
			if($data_row['ARTICLE_LINK'] != null)
				echo('<a href="'.$data_row['ARTICLE_LINK'].'" style="color: #FF6767; text-decoration: none;">'.$data_row['ARTICLE_LINK_TEXT'].'</a>');
			echo('<p style="font-size: 12px; color: #A6A6A6;">Article written by: '.$data_row['ARTICLE_AUTHOR'].'</p>');
		echo('</td></tr>');
	}

	// This Week in News
	echo('<tr><td colspan="4" bgcolor="#555555">');
	echo('<h2 style="color: #A6A6A6; font-size: 18px;">This week in News!</h2>');
	echo('</td></tr>');

	$data = get_newsletter_articles($newsletter_date, "1");
	while($data_row = $data->fetch_assoc())
	{
		echo('<tr><td colspan="4">');
			if($data_row['ARTICLE_IMAGE_URL'] != null)
				echo('<img src="'.$data_row['ARTICLE_IMAGE_URL'].'" alt="Showcase" width="100%">');
			echo('<h2 style="color: #555555; font-size: 18px;">'.$data_row['ARTICLE_HEADLINE'].'</h2>');
			echo('<p>'.$data_row['ARTICLE_TEXT'].'</p>');
			if($data_row['ARTICLE_LINK'] != null)
				echo('<a href="'.$data_row['ARTICLE_LINK'].'" style="color: #FF6767; text-decoration: none;">'.$data_row['ARTICLE_LINK_TEXT'].'</a>');
			echo('<p style="font-size: 12px; color: #A6A6A6;">Article written by: '.$data_row['ARTICLE_AUTHOR'].'</p>');
		echo('</td></tr>');
	}

	// Upcoming Events
	echo('<tr><td colspan="4" bgcolor="#555555">');
	echo('<h2 style="color: #A6A6A6; font-size: 18px;">Upcoming Events</h2>');
	echo('</td></tr>');

	newsletter_event_card($newsletter_date);
	
	// In Other News
	echo('<tr><td colspan="4" bgcolor="#555555">');
	echo('<h2 style="color: #A6A6A6; font-size: 18px;">In Other News</h2>');
	echo('</td></tr>');

	$data = get_newsletter_articles($newsletter_date, "2");
	while($data_row = $data->fetch_assoc())
	{
		echo('<tr><td colspan="4">');
			if($data_row['ARTICLE_IMAGE_URL'] != null)
				echo('<img src="'.$data_row['ARTICLE_IMAGE_URL'].'" alt="Showcase" width="100%">');
			echo('<h2 style="color: #555555; font-size: 18px;">'.$data_row['ARTICLE_HEADLINE'].'</h2>');
			echo('<p>'.$data_row['ARTICLE_TEXT'].'</p>');
			if($data_row['ARTICLE_LINK'] != null)
				echo('<a href="'.$data_row['ARTICLE_LINK'].'" style="color: #FF6767; text-decoration: none;">'.$data_row['ARTICLE_LINK_TEXT'].'</a>');
			echo('<p style="font-size: 12px; color: #A6A6A6;">Article written by: '.$data_row['ARTICLE_AUTHOR'].'</p>');
		echo('</td></tr>');
	}

	echo('<tr><td colspan="4" bgcolor="#222222" style="text-align: center;">');
	echo('<p style="color: #A6A6A6; font-size: 12px;">&copy; Copyright SwinAnime x S.T.A.R.S. 2018</p>');
	echo('<span><a href="https://animelab.com"><img src="http://swinanime.net/image/sponsor/animelab.png" alt="AnimeLab" height="35"></a><a href="http://www.grainandnori.com.au/"><img src="http://swinanime.net/image/sponsor/grain and nori.png" alt="Grain and Nori" height="35"></a><a href="https://hanabee.com.au/"><img src="http://swinanime.net/image/sponsor/hanabee.png" alt="Hanabee" height="35"></a><a href="https://madman.com.au/"><img src="http://swinanime.net/image/sponsor/madman.png" alt="Madman" height="35"></a><a href="https://www.facebook.com/TheResistanceBarandCafe/" ><img src="http://swinanime.net/image/sponsor/resistance bar and cafe.png" alt="Resistance Bar and Cafe" height="35"></a><a href="https://patrons.rewardle.com/"><img src="http://swinanime.net/image/sponsor/rewardle.png" alt="Rewardle" height="35"></a><a href="https://sirenvisual.com.au/"><img src="http://swinanime.net/image/sponsor/siren.png" alt="Siren" height="35"></a></span>');
	echo('</td></tr>');

	// Newsletter Footer

	echo('</tbody></table><p>If the email does not display correctly please view it <a href="http://swinanime.net/friday_fill_volume.php?date='.$newsletter_date.'" style="color: #FF6767; text-decoration: none;">here</a></p>');

?>