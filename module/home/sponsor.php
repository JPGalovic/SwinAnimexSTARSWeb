<?php
	// Displays club's sponsors logos, Version 1.0, JAN18, JPGalovic

	include('sql/misc/get_company_data.php'); // Gets sponsor details

	if(!$get_company_data->num_rows == 0)
	{
		echo('<article class="sponsor"><h4>Sponsors:</h4><span>');

		while($company_row = $get_company_data->fetch_assoc())
		{
			echo('<a href="'.$company_row['COMPANY_URL'].'"><img src="image/sponsor/'.remove_illegal_char(strtolower($company_row['COMPANY_NAME'])).'.png" alt="'.$company_row['COMPANY_NAME'].'"/></a>');
		}

		echo('</span></article>');
	}
?>