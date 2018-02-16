<?php
	// includes requiered codegen files, version 1.0.1, FEB18, JPGalovic
	include('code_gen/module_elements/event_cards.php');
	include('code_gen/module_elements/anime_details.php');

	include('code_gen/process/remove_illegal_char.php');
	include('code_gen/process/auto_version_control.php');
	
	include('code_gen/error_report.php');
		
	// Includes SQL Getters
	include('sql/anime/get_volume_data.php');
?>