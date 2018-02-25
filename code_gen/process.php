<?php
	// Functions for running processing on the club's website, Version 1.0.0, FEB18, JPGalovic
	
	// Misc Definitions
	// CSS File Version
	define('CSS_MAIN', '3.3.0');
	
	// Changes URL provided to include current CSS Version in the form or URL?v=[CSS_VERSION]
	// $url: url to update
	function auto_version($url) // Autoversion control for CSS sheets
	{
		return $url.'?v='.CSS_MAIN;
	}

	// Removes illegal characters from a string, function both updates $string and returns updated string
	// $string: refernce to string to remove illegal characters from. 
	function remove_illegal_char(&$string)
	{
		$str_len = strlen($string);
		$illegal = array(
			'~', '#', '%', '*', '{', '}', ':', '<', '>', '?', '/', '+', '|', '"', '.', ',', '\''
		);
		$string = str_replace($illegal, '', $string);
		return($string);
	}
?>