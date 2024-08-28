<?php

namespace app\models;
use \flundr\database\SQLdb;
use \flundr\mvc\Model;

class Advisors extends Model
{

	public function __construct() {

		$this->db = new SQLdb(DB_SETTINGS);
		$this->db->table = 'users';

	}


	public function list() {
	
		$table = $this->db->table;

		$SQLstatement = $this->db->connection->prepare(
			"SELECT id, firstname, lastname FROM $table
			WHERE `groups` = 'Betreuer'"
		);

		$SQLstatement->execute();
		$output = $SQLstatement->fetchall();
		return $output;

	}




}
