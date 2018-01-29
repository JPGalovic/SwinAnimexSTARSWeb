<?php
	// Function removes illegal characters from a given string.
	function remove_illegal_char($string)
	{
		$length = strlen($string);
		
		$illegal = array(
			'~', '#', '%', '*', '{', '}', ':', '<', '>', '?', '/', '+', '|', '"'
		);
		
		$replace = '';
		
		return(str_replace($illegal, $replace, $string));
	}
?>