<?php
	// Code Testing Platform, Used to test functionality of codegen.
	include('code_gen/include.php'); // include base required files.2018-01-05 11:30:00

	$data = get_newsletter_articles("2018-02-23 12-00-00", "2");
	//$data_row = $data->fetch_assoc();
	//print_r(array_values($data_row));
	
	echo(current_time());

	echo('<table width="600px" border="0" cellspacing="0" cellpadding="10" style="border: 1px solid black;"><tbody>');

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


	echo('</tbody></table>');
	

?>
				
				
