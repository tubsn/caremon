<?php

namespace app\controller;
use flundr\mvc\Controller;
use flundr\auth\Auth;
use flundr\date\Datepicker;


class Timetable extends Controller {

	public function __construct() {
		if (!Auth::logged_in() && !Auth::valid_ip()) {Auth::loginpage();}		
		$this->view('DefaultLayout');
		$this->models('Clients,Slots,Advisors');
	}

	public function index() {

		$datepicker = new Datepicker();
		$maxAge = '2024-02-01';
		$this->view->months = $datepicker->months($maxAge);

		if (!empty($_GET['month'])) {
			$selection = $_GET['month'];
			if (isset($this->view->months[$selection])) {
				$selectedMonth = $this->view->months[$selection];
				$this->view->selectedMonth = $selection;
				$start = $selectedMonth['start'];
				$end = $selectedMonth['end'];
			}
		}

		$this->view->budgets = $this->Slots->budgets();
		$this->view->monthHours = $this->Slots->by_month();
		$this->view->categorieHours = $this->Slots->by_category();
		$this->view->advisorHours = $this->Slots->by_advisor();
		$this->view->slots = $this->Slots->list();
		$this->view->render('timetable/list');
	}



	public function new() {
		$this->view->clients = $this->Clients->all();
		$this->view->advisors = $this->Advisors->list();
		$this->view->render('timetable/edit');
	}

	public function create() {
		$_POST = array_filter($_POST);
		if (empty($_POST)) {throw new \Exception("Bitte Felder ausfüllen!", 400);}		
		$this->Slots->create($_POST);
		$this->view->redirect('/');
	}

	public function edit($slotID) {
		$this->view->clients = $this->Clients->all();
		$this->view->advisors = $this->Advisors->list();		
		$this->view->slot = $this->Slots->get($slotID);
		$this->view->render('timetable/edit');
	}

	public function update($slotID) {
		$_POST = array_filter($_POST);
		if (empty($_POST)) {throw new \Exception("Bitte Felder ausfüllen!", 400);}		
		$this->Slots->update($_POST,$slotID);
		$this->view->redirect('/');
	}

	public function delete($slotID) {
		$this->Slots->delete($slotID);
		$this->view->redirect('/');
	}





}
