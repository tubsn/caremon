<?php

namespace app\controller;
use flundr\mvc\Controller;
use flundr\auth\Auth;

class Clients extends Controller {

	public function __construct() {
		if (!Auth::logged_in() && !Auth::valid_ip()) {Auth::loginpage();}			
		$this->view('DefaultLayout');
		$this->models('Clients');
	}

	public function index() {
		$this->view->clients = $this->Clients->all();
		$this->view->render('clients/list');
	}

	public function edit($userID) {
		$client = $this->Clients->get($userID);
		$this->view->client = $client;

		$this->view->title = $client['firstname'] . ' ' . $client['lastname'] . ' [ID: ' . $userID . ']';
		$this->view->render('clients/edit');
	}

	public function update($userID) {
		$_POST = array_filter($_POST);
		if (empty($_POST)) {throw new \Exception("Bitte Felder ausfüllen!", 400);}
		$this->Clients->update($_POST,$userID);
		$this->view->redirect('/clients');
	}

	public function delete($userID) {
		$this->Clients->delete($userID);
		$this->view->redirect('/clients');
	}

	public function new() {
		$this->view->title = 'Klient Anlegen';
		$this->view->render('clients/edit');
	}

	public function create() {
		$_POST = array_filter($_POST);
		if (empty($_POST)) {throw new \Exception("Bitte Felder ausfüllen!", 400);}
		$this->Clients->create($_POST);
		$this->view->redirect('/clients');
	}

	public function copy($userID) {
		$this->Clients->copy($userID);
		$this->view->redirect('/clients');
	}

}
