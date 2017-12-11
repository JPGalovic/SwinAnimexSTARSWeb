<?php
	// Core Data
	include('drop_data.sql');
	include('company_data.sql');
	include('classification_data.sql');
	include('anime_data_core.sql');
	include('event_data_core.sql');
	
	// Anime Data
	include('anime/hanabee/plastic_memories_data.sql');

	include('anime/madman/assassination_classroom_data.sql');
	include('anime/madman/assassination_classroom_season_2_data.sql');
	include('anime/madman/ben-to_data.sql');
	include('anime/madman/highschool_dxd_data.sql');
	include('anime/madman/highschool_dxd_season_2_data.sql');
	include('anime/madman/yurikuma_arashi_data.sql');
	
	include('anime/siren/mawaru_penguindrum_data.sql');
	include('anime/siren/queens_blade_2_data.sql')
	
	// Events Data
	include('events/summer_2018.sql');
?>