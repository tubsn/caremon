<?php

namespace app\models;
use \flundr\database\SQLdb;
use \flundr\mvc\Model;

class Clients extends Model
{

	public function __construct() {

		$this->db = new SQLdb(DB_SETTINGS);
		$this->db->table = 'clients';

	}


	/*
	public function budget($clientID) {
	
		$table = $this->db->table;

		$SQLstatement = $this->db->connection->prepare(
			"SELECT timeframe FROM 'slots'
			WHERE client_id = :client_id"
		);

		$SQLstatement->execute([':client_id' => $clientID]);
		$output = $SQLstatement->fetchall();
		return $output;

	}
	*/

}
