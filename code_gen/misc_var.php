<?php
	//Misc Variables and Getters, Verson 1.0.2, MAR18, JPGalovic

	//gets current time
	function current_time()
	{
		date_default_timezone_set('Australia/ACT');
		return date('Y-m-d H:i:s', time());
	}
	
	//gets current time delayed by 2 hours
	function delayed_time()
	{
		date_default_timezone_set('Australia/ACT');
		return date('Y-m-d H:i:s', strtotime('-2 hours', time()));
	}

	$time = current_time();
?>