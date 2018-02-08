<?php
	// CSS File versions
	define('CSS_MAIN', '1.0.0');

	function auto_version($url) // Autoversion control for CSS sheets
	{
		return $url.'?v='.CSS_MAIN;
	}
?>