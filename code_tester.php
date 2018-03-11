<?php
	// Code Testing Platform, Used to test functionality of codegen.
	include('code_gen/include.php'); // include base required files.2018-01-05 11:30:00

	$query = 'SELECT * FROM CLASSIFICATION';
	$classificaiton_data = run_query($query);

	while($classification_row = $classificaiton_data->fetch_assoc())
	{
		echo('<div style="padding: 10px; display: inline-row;"><img src="image/classification/'.$classification_row['CLASSIFICATION'].'.png" alt="'.$classification_row['CLASSIFICATION'].'"/> '.$classification_row['CLASSIFICATION'].'.png</div>');
	}
	

?>
				
				
