<?php
	// Function removes illegal characters from a given string, Vesion 1.1, JAN18, JPGalovic
	function remove_illegal_char($string)
	{
		$length = strlen($string);
		
		$illegal = array(
			'~', '#', '%', '*', '{', '}', ':', '<', '>', '?', '/', '+', '|', '"', '.', ','
		);
		
		$replace = '';
		
		return(str_replace($illegal, $replace, $string));
	}
?>