<?php
	// includes requiered codegen files, version 1.0.2, FEB18, JPGalovic
	include('code_gen/module_elements/event_cards.php');
	include('code_gen/module_elements/anime_details.php');

	include('code_gen/process/remove_illegal_char.php');
	include('code_gen/process/auto_version_control.php');
	
	include('code_gen/error_report.php');

	include('code_gen/misc_var.php');
		
	// Includes SQL Getters
	include('code_gen/sql/base.php');
	include('code_gen/sql/event_data_getters.php');
	include('code_gen/sql/news_data_getters.php');

	include('sql/anime/get_volume_data.php');
	include('sql/events/get_event_data_functions.php');
?>