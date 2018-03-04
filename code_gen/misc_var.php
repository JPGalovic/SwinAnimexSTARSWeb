<?php
	//Misc Variables and Getters, Verson 1.0.1, FEB18, JPGalovic

	//gets current time
	function current_time()
	{
		return date('Y-m-d H:i:s', time());
	}

	date_default_timezone_set('Australia/ACT');
	$now = date('Y-m-d H:i:s', time() + (120 * 60));
	$time = date('Y-m-d H:i:s', time());
?>