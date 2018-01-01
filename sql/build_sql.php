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
	$core_data_array = array(
			'data/drop_data.sql'
		,	'data/company_data.sql'
		,	'data/classification_data.sql'
		,	'data/anime_data_core.sql'
		,	'data/game_data_core.sql'
		,	'data/event_data_core.sql'
	);
		
	$madman_anime_data_array = array(
			'data/anime/madman/a_boring_world_where_the_concept_of_dirty_jokes_dont_exsist_data.sql'
		,	'data/anime/madman/assassination_classroom_season_2_data.sql'
		,	'data/anime/madman/ben-to_data.sql'
		,	'data/anime/madman/cowboy_bebop_data.sql'
		,	'data/anime/madman/danganronpa_data.sql'
		,	'data/anime/madman/deadman_wonderland_data.sql'
		,	'data/anime/madman/death_note_data.sql'
		,	'data/anime/madman/food_wars_data.sql'
		,	'data/anime/madman/highschool_dxd_data.sql'
		,	'data/anime/madman/highschool_dxd_season_2_data.sql'
		,	'data/anime/madman/magical_warfare_data.sql'
		,	'data/anime/madman/one_punch_man_data.sql'
		,	'data/anime/madman/pandora_in_the_crimson_shell_data.sql'
		,	'data/anime/madman/samurai_jack_data.sql'
		,	'data/anime/madman/school_live_data.sql'
		,	'data/anime/madman/three_leaves_three_colors_data.sql'
		,	'data/anime/madman/vividred_operation_data.sql'
		,	'data/anime/madman/yurikuma_arashi_data.sql'
	);

	$hanabee_anime_data_array = array(
			'data/anime/hanabee/little_busters_refrain_data.sql'
		,	'data/anime/hanabee/plastic_memories_data.sql'
		,	'data/anime/hanabee/muv_luv_alternative_total_eclipse_data.sql'
		,	'data/anime/hanabee/is_it_wrong_to_pick_up_girls_in_a_dungeon_data.sql'
		,	'data/anime/hanabee/the_irregular_at_magic_high_school_data.sql'
	);

	$siren_anime_data_array = array(
			'data/anime/siren/canaan_data.sql'
		,	'data/anime/siren/mawaru_penguindrum_data.sql'
		,	'data/anime/siren/queens_blade_2_data.sql'
		,	'data/anime/siren/queens_blade_3_data.sql'
		,	'data/anime/siren/welcome_to_irabus_office_data.sql'
		,	'data/anime/siren/tokyo_magnitude_8_data.sql'
		,	'data/anime/siren/blasseiter_data.sql'
		,	'data/anime/siren/ghost_hound_data.sql'
		,	'data/anime/siren/un-go_data.sql'
		,	'data/anime/siren/nadia_secret_of_blue_water_data.sql'
	);

	$event_data_array = array(
			'data/events/2018_summer.sql'
		,	'data/events/2018_semester_1.sql'
	);

	// Write Data to File

	foreach ($core_data_array as $data_file)
	{
		$read_handle = fopen($data_file, 'r') or die("Cannot open file: ".$data_file);
		$data = fread($read_handle, filesize($data_file));
		fwrite($write_handle, $data);
		fclose($read_handle);
	}

	foreach ($madman_anime_data_array as $data_file)
	{
		$read_handle = fopen($data_file, 'r') or die("Cannot open file: ".$data_file);
		$data = fread($read_handle, filesize($data_file));
		fwrite($write_handle, $data);
		fclose($read_handle);
	}

	foreach ($hanabee_anime_data_array as $data_file)
	{
		$read_handle = fopen($data_file, 'r') or die("Cannot open file: ".$data_file);
		$data = fread($read_handle, filesize($data_file));
		fwrite($write_handle, $data);
		fclose($read_handle);
	}

	foreach ($siren_anime_data_array as $data_file)
	{
		$read_handle = fopen($data_file, 'r') or die("Cannot open file: ".$data_file);
		$data = fread($read_handle, filesize($data_file));
		fwrite($write_handle, $data);
		fclose($read_handle);
	}

	foreach ($event_data_array as $data_file)
	{
		$read_handle = fopen($data_file, 'r') or die("Cannot open file: ".$data_file);
		$data = fread($read_handle, filesize($data_file));
		fwrite($write_handle, $data);
		fclose($read_handle);
	}
	
	fclose($write_handle);
	
	echo('<p>SQL File Written.</p>');
	echo('<a href="data/swin_anime_database.sql">Get SQL File</a>')
?>
