<?php
	// Code Testing Platform, Used to test functionality of codegen.
	include('code_gen/include.php'); // include base required files.2018-01-05 11:30:00

	$data = get_event_data();
	$data_row = $data->fetch_assoc();
	print_r(array_values($data_row));
	
	echo(current_time());
	

?>

<table>
	<tr>
		<td colspan="4">
			<img src="http://swinanime.net/image/news/volunteer_poster.png" alt="Showcase" width="100%">
			<h2 style="color: #555555; font-size: 18px;">SwinAnime x S.T.A.R.S. Wants You</h2>
			<p>We are always looking for volunteers to help us run and plan our events, as such if you would like to help us to run or plan our events, simply visit <a href="volunteer.swinanime.net" style="color: #FF6767; text-decoration: none;">volunteer.swinanime.net</a> and submit your interest today!</p>
			<p style="font-size: 12px; color: #A6A6A6;">Article written by: James P. Galovic</p>
		</td>  
	</tr>
</table>