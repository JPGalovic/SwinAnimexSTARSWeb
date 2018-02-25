<?php
	// Auto Version Control for Cashe Bursting, Version 1.0.0, FEB18, JPGalovic
	// CSS File versions
	define('CSS_MAIN', '3.3.0');

	function auto_version($url) // Autoversion control for CSS sheets
	{
		return $url.'?v='.CSS_MAIN;
	}
?>