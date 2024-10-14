<?php

namespace app\controller;
use flundr\mvc\Controller;
use flundr\auth\Auth;

class Clients extends Controller {

	public function __construct() {
		if (!Auth::logged_in() && !Auth::valid_ip()) {Auth::loginpage();}			
		$this->view('DefaultLayout');
		$this->models('Clients,Slots');
	}

	public function index() {
		$this->view->clients = $this->Clients->all();
		
		$slots = $this->Slots->budgets();
		$this->view->hours = array_column($slots, 'hours', 'client_id');

		$this->view->referer($_SERVER['REQUEST_URI']);
		$this->view->render('clients/list');
	}

	public function edit($clientID) {
		$client = $this->Clients->get($clientID);
		$this->view->asds = $this->Clients->asd_list();
		$this->view->client = $client;

		$this->view->title = $client['firstname'] . ' ' . $client['lastname'] . ' - ID: ' . $clientID;
		$this->view->render('clients/edit');
	}

	public function update($clientID) {
		$_POST = array_filter($_POST);
		if (empty($_POST)) {throw new \Exception("Bitte Felder ausfüllen!", 400);}
		$this->Clients->update($_POST,$clientID);
		$this->view->back();
	}

	public function delete($clientID) {
		$this->Clients->delete($clientID);
		$this->view->back();
	}

	public function new() {
		$this->view->title = 'Klient Anlegen';
		$this->view->render('clients/edit');
	}

	public function create() {
		$_POST = array_filter($_POST);
		if (empty($_POST)) {throw new \Exception("Bitte Felder ausfüllen!", 400);}
		$this->Clients->create($_POST);
		$this->view->back();
	}

	public function copy($clientID) {
		$newID = $this->Clients->copy($clientID);
		$this->view->redirect('/clients/' . $newID);
	}

}
