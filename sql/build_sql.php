<?php
	// Clear and Prepare file for writing.
	$full_sql = "data/swin_anime_database.sql";
	unlink($full_sql);
	$write_handle = fopen($full_sql, 'w') or die("Cannot open file: ".$full_sql);

	// Checks if build is for local database, used for Xampp SQL intergration.
	if(isset($_GET['local']))
		if($_GET['local'] == 'true')
		{
			$data_file = 'data/prepare_local_database.sql';
			$read_handle = fopen($data_file, 'r') or die("Cannot open file: ".$data_file);
			$data = fread($read_handle, filesize($data_file));
			fwrite($write_handle, $data);
			fclose($read_handle);
		}
			

	// Data Collation
	$data_array = array(
			0 =>  'data/drop_data.sql'
		,	1 =>  'data/company_data.sql'
		,	2 =>  'data/classification_data.sql'
		,	3 =>  'data/anime_data_core.sql'
		,	4 =>  'data/game_data_core.sql'
		,	5 =>  'data/event_data_core.sql'
		
		,	6 =>  'data/anime/hanabee/little_busters_refrain_data.sql'
		,	7 =>  'data/anime/hanabee/plastic_memories_data.sql'
		
		,	8 =>  'data/anime/madman/assassination_classroom_season_2_data.sql'
		,	9 =>  'data/anime/madman/ben-to_data.sql'
		,	10 => 'data/anime/madman/danganronpa_data.sql'
		,	11 => 'data/anime/madman/death_note_data.sql'
		,	12 => 'data/anime/madman/food_wars_data.sql'
		,	13 => 'data/anime/madman/highschool_dxd_data.sql'
		,	14 => 'data/anime/madman/highschool_dxd_season_2_data.sql'
		,	15 => 'data/anime/madman/one_punch_man_data.sql'
		,	16 => 'data/anime/madman/pandora_in_the_crimson_shell_data.sql'
		,	17 => 'data/anime/madman/samurai_jack_data.sql'
		,	18 => 'data/anime/madman/school_live_data.sql'
		,	19 => 'data/anime/madman/three_leaves_three_colors_data.sql'
		,	20 => 'data/anime/madman/vividred_operation_data.sql'
		,	21 => 'data/anime/madman/yurikuma_arashi_data.sql'
		
		,	22 => 'data/anime/siren/canaan_data.sql'
		,	23 => 'data/anime/siren/mawaru_penguindrum_data.sql'
		,	24 => 'data/anime/siren/queens_blade_2_data.sql'
		,	25 => 'data/anime/siren/queens_blade_3_data.sql'
		,	26 => 'data/anime/siren/welcome_to_irabus_office_data.sql'
		
		,	27 => 'data/events/summer_2018.sql'
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

	$read_handle = fopen($full_sql, 'r') or die("Cannot open file: ".$full_sql);
	$data = fread($read_handle, filesize($full_sql));
	
	echo('<p>SQL File Written.</p>');
	echo('<a href="data/swin_anime_database.sql">Get SQL File</a>')
?>
