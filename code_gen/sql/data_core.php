<?php
	// Database Core Object, Allows Data Services on Club Website, Version 1.0.0, MAR18, J.P.Galovic

	class Data_Service
	{
		// Database Connection Settings.
		protected $host = 'localhost';
		protected $user = 'swinan01';
		protected $pass = 'EgLcxZ8uHT';
		protected $dtbs = 'swinan01_smart_web';
		
		// Database Connection Object.
		private $db;
		
		// Opens database.
		private function open_db()
		{
			$this->db = new MySQLi($this->host, $this->user, $this->pass, $this->dtbs);
			if($this->db->connect_errno > 0)
				send_error($this->db->connect_errno+1000,'Unable to connect to Website Database, ['.$this->db->connect_errno.', '.$this->db->connect_error.']');
		}
		
		// Closes database.
		private function close_db()
		{
			$this->db->close();
		}
		
		// Runs a given query on the Database.
		// $query, query text to run on Database.
		public function run_query($query)
		{
			$this->open_db();
			if(!($result = $this->db->query($query)))
				send_error($db->errno+1000, $db->error.' '.$query);
			$this->close_db();
			return($result);
		}
	}


?>