<?php
	//Misc Variables and Getters, Verson 1.0.1, FEB18, JPGalovic

	//gets current time
	function current_time()
	{
		date_default_timezone_set('Australia/ACT');
		return date('Y-m-d H:i:s', time());
	}
?>