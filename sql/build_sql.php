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
	// 	,	'data/anime/madman/assassination_classroom_data.sql'
	//	,	'data/anime/madman/absolute_duo_data.sql'
	//	,	'data/anime/madman/amagi_brilliant_park_data.sql'
	//	,	'data/anime/madman/angelic_layer_data.sql'
	//	,	'data/anime/madman/aquarion_lagos_data.sql'
		,	'data/anime/madman/assassination_classroom_data.sql'
		,	'data/anime/madman/assassination_classroom_season_2_data.sql'
	//	,	'data/anime/madman/astro_boy_data.sql'
	//	,	'data/anime/madman/atom_the_begining_data.sql'
	//	,	'data/anime/madman/attack_on_titan_data.sql'
	//	,	'data/anime/madman/azumanaga_daioh_data.sql'
	//	,	'data/anime/madman/bakuon_data.sql'
		,	'data/anime/madman/battle_girls_time_paradox_data.sql'
		,	'data/anime/madman/ben-to_data.sql'
		,	'data/anime/madman/berserk_data.sql'
		,	'data/anime/madman/bikini_warriors_data.sql'
	//	,	'data/anime/madman/blood_blockaid_battlefront_data.sql'
	//	,	'data/anime/madman/cardcaptor_sakura_data.sql'
		,	'data/anime/madman/cowboy_bebop_data.sql'
	//	,	'data/anime/madman/cross_ange_rondo_of_angels_and_dragons_data.sql'
	//	,	'data/anime/madman/cute_high_earth_defence_club_data.sql'
	//	,	'data/anime/madman/d-frag_data.sql'
	//	,	'data/anime/madman/dagashi_kashi_data.sql'
		,	'data/anime/madman/danganronpa_data.sql'
	//	,	'data/anime/madman/date_a_live_data.sql'
		,	'data/anime/madman/deadman_wonderland_data.sql'
		,	'data/anime/madman/death_note_data.sql'
	//	,	'data/anime/madman/death_note_data.sql'
	//	,	'data/anime/madman/dog_and_sizors_data.sql'
		,	'data/anime/madman/dot_hack_sign_data.sql'
	//	,	'data/anime/madman/dragonar_academy_data.sql'
		,	'data/anime/madman/dragonball_z_data.sql'
	//	,	'data/anime/madman/eurika_seven_ao_data.sql'
	//	,	'data/anime/madman/flip_flappers_data.sql'
		,	'data/anime/madman/food_wars_data.sql'
	//	,	'data/anime/madman/framatical_murder_data.sql'
	//	,	'data/anime/madman/freezing_data.sql'
	//	,	'data/anime/madman/full_metal_alchemest_brotherhood_data.sql'
		,	'data/anime/madman/gansta_data.sql'
	//	,	'data/anime/madman/gate_data.sql'
	//	,	'data/anime/madman/goldern_time_data.sql'
	//	,	'data/anime/madman/guilty_crown_data.sql'
	//	,	'data/anime/madman/guromet_girl_graffiti_data.sql'
	//	,	'data/anime/madman/gurren_legan_data.sql'
	//	,	'data/anime/madman/hanayamata_data.sql'
		,	'data/anime/madman/highschool_dxd_data.sql'
		,	'data/anime/madman/highschool_dxd_season_2_data.sql'
		,	'data/anime/madman/highschool_of_the_dead_data.sql'
	//	,	'data/anime/madman/himouto_umaru_chan_data.sql'
	//	,	'data/anime/madman/hyperdimention_neptunia_data.sql'
	//	,	'data/anime/madman/inuyasha_data.sql'
	//	,	'data/anime/madman/is_this_a_zombie_data.sql'
		,	'data/anime/madman/isuca_data.sql'
	//	,	'data/anime/madman/jatoi_the_sacred_slayer_data.sql'
	//	,	'data/anime/madman/junjo_romantica_data.sql'
	//	,	'data/anime/madman/kamisama_kiss_data.sql'
		,	'data/anime/madman/kancolle_data.sql'
		,	'data/anime/madman/magical_warfare_data.sql'
	//	,	'data/anime/madman/maria_the_virgin_witch_data.sql'
	//	,	'data/anime/madman/mobile_suit_gundam_iron_blooded_orphans_data.sql'
	//	,	'data/anime/madman/mr_osomatsu_data.sql'
	//	,	'data/anime/madman/naruto_data.sql'
	//	,	'data/anime/madman/nobunaga_the_fool_data.sql'
		,	'data/anime/madman/one_punch_man_data.sql'
		,	'data/anime/madman/oreimo_data.sql'
		,	'data/anime/madman/pandora_in_the_crimson_shell_data.sql'
	//	,	'data/anime/madman/pet_girl_of_sakurasou_data.sql'
		,	'data/anime/madman/puella_magi_madoka_magica_data.sql'
	//	,	'data/anime/madman/punchline_data.sql'
	//	,	'data/anime/madman/riddle_story_of_devil_data.sql'
	//	,	'data/anime/madman/sailor_moon_data.sql'
		,	'data/anime/madman/samurai_jack_data.sql'
		,	'data/anime/madman/samurai_warriors_data.sql'
	//	,	'data/anime/madman/scar-red_riders_xechs_data.sql'
		,	'data/anime/madman/school_live_data.sql'
	//	,	'data/anime/madman/seiyus_life_data.sql'
	//	,	'data/anime/madman/sword_oratoria_data.sql'
	//	,	'data/anime/madman/terror_in_resonance_data.sql'
		,	'data/anime/madman/three_leaves_three_colors_data.sql'
		,	'data/anime/madman/toriko_data.sql'
	//	,	'data/anime/madman/undefeted_bahamut_cronical_data.sql'
	//	,	'data/anime/madman/velkyrie_drive_mermaid_data.sql'
		,	'data/anime/madman/vividred_operation_data.sql'
		,	'data/anime/madman/yurikuma_arashi_data.sql'
	//	,	'data/anime/madman/yuru_yuri_data.sql'
		,	'data/anime/madman/zetman_data.sql'
	);

	$hanabee_anime_data_array = array(
			'data/anime/hanabee/accel_world_data.sql'
		,	'data/anime/hanabee/akb0048_data.sql'
		,	'data/anime/hanabee/alien_9_data.sql'
		,	'data/anime/hanabee/beautiful_bones_data.sql'
		,	'data/anime/hanabee/gatchaman_crowds_data.sql'
		,	'data/anime/hanabee/is_it_wrong_to_pick_up_girls_in_a_dungeon_data.sql'
		,	'data/anime/hanabee/kokoro_connect_data.sql'
		,	'data/anime/hanabee/little_busters_refrain_data.sql'
		,	'data/anime/hanabee/monster_museme_data.sql'
		,	'data/anime/hanabee/muv_luv_alternative_total_eclipse_data.sql'
		,	'data/anime/hanabee/no_game_no_life_data.sql'
		,	'data/anime/hanabee/plastic_memories_data.sql'
		,	'data/anime/hanabee/re-kan_data.sql'
		,	'data/anime/hanabee/the_irregular_at_magic_high_school_data.sql'
	);

	$siren_anime_data_array = array(
			'data/anime/siren/blasseiter_data.sql'
		,	'data/anime/siren/canaan_data.sql'
	//	,	'data/anime/siren/devil_is_a_part_timer_data.sql'
		,	'data/anime/siren/ghost_hound_data.sql'
	//	,	'data/anime/siren/kaiba_data.sql'
		,	'data/anime/siren/mawaru_penguindrum_data.sql'
		,	'data/anime/siren/nadia_secret_of_blue_water_data.sql'
		,	'data/anime/siren/queens_blade_2_data.sql'
		,	'data/anime/siren/queens_blade_3_data.sql'
		,	'data/anime/siren/welcome_to_irabus_office_data.sql'
		,	'data/anime/siren/tokyo_magnitude_8_data.sql'
		,	'data/anime/siren/un-go_data.sql'
	);

	$game_data_array = array(
			'data/game/game_company/game_company.sql'
		,	'data/game/jamestown_data.sql'
	);

	$event_data_array = array(
			'data/events/2018_summer.sql'
		,	'data/events/2018_semester_1.sql'
	//	,	'data/events/2018_winter.sql'
	//	,	'data/events/2018_semester_2.sql'
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

	foreach ($game_data_array as $data_file)
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
