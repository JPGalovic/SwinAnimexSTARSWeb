<?php
	// Clear and Prepare file for writing.
	$full_sql = "swin_anime_database.sql";
	unlink($full_sql);
	$write_handle = fopen($full_sql, 'w') or die("Cannot open file: ".$full_sql);

	// Data Collation
	$data_array = array(
			0 => 'drop_data.sql'
		,	1 => 'company_data.sql'
		,	2 => 'classification_data.sql'
		,	3 => 'anime_data_core.sql'
		,	4 => 'event_data_core.sql'
		
		,	5 => 'anime/hanabee/little_busters_refrain_data.sql'
		,	6 => 'anime/hanabee/plastic_memories_data.sql'
		
		,	7 => 'anime/madman/assassination_classroom_season_2_data.sql'
		,	8 => 'anime/madman/ben-to_data.sql'
		,	9 => 'anime/madman/danganronpa_data.sql'
		,	10 => 'anime/madman/death_note_data.sql'
		,	11 => 'anime/madman/highschool_dxd_data.sql'
		,	12 => 'anime/madman/highschool_dxd_season_2_data.sql'
		,	13 => 'anime/madman/one_punch_man_data.sql'
		,	14 => 'anime/madman/yurikuma_arashi_data.sql'
		
		,	15 => 'anime/siren/mawaru_penguindrum_data.sql'
		,	16 => 'anime/siren/queens_blade_2_data.sql'
		,	17 => 'anime/siren/queens_blade_3_data.sql'
		
		,	18 => 'events/summer_2018.sql'
	);

	//,	n => ''

	// Write Data to File

	foreach ($data_array as $data_file)
	{
		$read_handle = fopen($data_file, 'r') or die("Cannot open file: ".$data_file);
		$data = fread($read_handle, filesize($data_file));
		fwrite($write_handle, $data);
		fclose($read_handle);
	}
	
	fclose($write_handle);
	echo('SQL File Written.');
?>