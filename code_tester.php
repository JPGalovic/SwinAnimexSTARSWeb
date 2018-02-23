<?php
	// Code Testing Platform, Used to test functionality of codegen.
	include('code_gen/include.php'); // include base required files.2018-01-05 11:30:00

	$data = get_event_data();
	$data_row = $data->fetch_assoc();
	print_r(array_values($data_row));
	
	echo(current_time());

?>