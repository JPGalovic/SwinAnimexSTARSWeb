<?php
	// Function removes illegal characters from a given string.
	function remove_illegal_char($string)
	{
		$illegal = array(
			'~', '#', '%', '*', '{', '}', ':', '<', '>', '?', '/', '+', '|', '"'
		);
		
		$replace = '';
		
		$string_temp = $string;
		
		$string = str_replace($illegal, $replace, $string_temp);
	}
?>