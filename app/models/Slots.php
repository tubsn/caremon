<?php

namespace app\models;
use \flundr\database\SQLdb;
use \flundr\mvc\Model;

class Slots extends Model
{

	public function __construct() {

		$this->db = new SQLdb(DB_SETTINGS);
		$this->db->table = 'slots';

	}


	public function list() {
	
		$table = $this->db->table;

		$SQLstatement = $this->db->connection->prepare(
			"SELECT slots.*, clients.firstname, clients.lastname FROM $table
			INNER JOIN clients ON clients.id=client_id"
		);

		$SQLstatement->execute();
		$output = $SQLstatement->fetchall();
		return $output;

	}


	public function budgets() {
		$SQLstatement = $this->db->connection->prepare(
			"SELECT sum(timeframe) as hours, clients.budget, clients.firstname, clients.lastname FROM `slots` 
			INNER JOIN clients ON clients.id=client_id
			GROUP BY client_id
			ORDER BY clients.lastname
			"
		);

		$SQLstatement->execute();
		$output = $SQLstatement->fetchall();
		return $output;
	}

	public function by_category() {
		$SQLstatement = $this->db->connection->prepare(
			"SELECT sum(timeframe) as hours, category FROM `slots` 
			GROUP BY category ORDER BY category"
		);

		$SQLstatement->execute();
		$output = $SQLstatement->fetchall();
		return $output;
	}

	public function by_month() {
		$SQLstatement = $this->db->connection->prepare(
			"SELECT sum(timeframe) as hours, DATE_FORMAT(`date`, '%Y-%m') as month FROM `slots` 
			GROUP BY month ORDER BY month"
		);

		$SQLstatement->execute();
		$output = $SQLstatement->fetchall();
		return $output;
	}

	public function by_advisor() {
		$SQLstatement = $this->db->connection->prepare(
			"SELECT sum(timeframe) as hours, users.firstname as advisor FROM `slots` 
			INNER JOIN users ON users.id=advisor_id
			GROUP BY advisor ORDER BY advisor"
		);

		$SQLstatement->execute();
		$output = $SQLstatement->fetchall();
		return $output;
	}


}
