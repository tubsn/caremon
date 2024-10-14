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

	public function asd_list() {
	
		$table = $this->db->table;

		$SQLstatement = $this->db->connection->prepare(
			"SELECT DISTINCT `asd` FROM $table"
		);

		$SQLstatement->execute();
		$output = $SQLstatement->fetchall(\PDO::FETCH_COLUMN);
		$output = array_filter($output);
		return $output;		

	}

	public function client_list() {

		$table = $this->db->table;

		$SQLstatement = $this->db->connection->prepare(
			"SELECT 
			clients.id AS id,
			CONCAT(clients.firstname, ' ', clients.lastname) AS name,

			GROUP_CONCAT(DISTINCT DATE_FORMAT(slots.date, '%M %Y') 
			ORDER BY slots.date ASC SEPARATOR ', ') AS monthfull,

			GROUP_CONCAT(DISTINCT DATE_FORMAT(slots.date, '%b %Y') 
			ORDER BY slots.date ASC SEPARATOR ', ') AS months

			FROM slots JOIN clients ON slots.client_id = clients.id
			GROUP BY name ORDER BY name;"
		);

		$SQLstatement->execute();
		$output = $SQLstatement->fetchall();

		$output = array_map(function($entry) {
			$entry['months'] = explode_and_trim(',', $entry['months']);
			$entry['monthfull'] = explode_and_trim(',', $entry['monthfull']);
			return $entry;
		}, $output);

		return $output;	

	}

	public function copy($id) {
		$copy = $this->db->read($id);
		unset($copy['id']);
		return $this->db->create($copy);
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
