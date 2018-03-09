<?php
	// Database Core Object, Allows Data Services on Club Website, Version 1.0.2, MAR18, J.P.Galovic

	class data_service
	{
		// Database Connection Settings.
		protected $host = 'localhost';
		protected $user = 'swinan01';
		protected $pass = 'EgLcxZ8uHT';
		protected $dtbs = 'swinan01_smart_web';
		
		protected $debug = false;
		
		// Database Connection Object.
		protected $db;
		
		// Opens database.
		protected function open_db()
		{
			if($this->debug)
				echo('<p>data_service: Connecting to Database; '.$this->host.', '.$this->user.', '.$this->pass.', '.$this->dtbs.'</p>');
			
			$this->db = new MySQLi($this->host, $this->user, $this->pass, $this->dtbs);
			if($this->db->connect_errno > 0)
				send_error($this->db->connect_errno+1000,'Unable to connect to Website Database, ['.$this->db->connect_errno.', '.$this->db->connect_error.']');
		}
		
		// Closes database.
		protected function close_db()
		{
			if($this->debug)
				echo('<p>data_service: Closing Database;</p>');
			
			$this->db->close();
		}
		
		// Runs a given query on the Database.
		// $query, query text to run on Database.
		// return, result of query.
		public function run_query($query)
		{
			$this->open_db();
			
			if($this->debug)
				echo('<p>data_service: Runnig Query, '.$query.';</p>');
			
			if(!($result = $this->db->query($query)))
				send_error($db->errno+1000, $db->error.' '.$query);
			
			$this->close_db();
			return($result);
		}
		
		// Debug Flag Setter.
		// $flag, value to set debug flag to.
		public function debug($flag)
		{
			if($flag)
				echo('<p>data_service: debug enabled;</p>');
			if(!$flag && $this->debug)
				echo('<p>data_service: debug disabled;</p>');
			$this->debug = $flag;
		}
	}


?>