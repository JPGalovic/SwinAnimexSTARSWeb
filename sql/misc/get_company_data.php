<?php
	// Gets club sponsor data, Version 1.0, JAN18, JPGalovic
	// Flags: company_name: sting.

	if(isset($company_name)) // Company Name set, select details for given company
		$get_company_query = 'SELECT COMPANY_NAME, COMPANY_URL, IS_SPONSOR FROM COMPANY WHERE COMPANY_NAME = "'.$company_name.'"';
	else // Company Name not set, select details for all companies
		$get_company_query = 'SELECT COMPANY_NAME, COMPANY_URL, IS_SPONSOR FROM COMPANY';

	if(!$get_company_data = $DB->query($get_company_query))
	{
		$error_text = $DB->error + $get_company_query;
		$error_no = $DB->error_no;
	}
?>