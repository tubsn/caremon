<?php

namespace app\controller;
use flundr\mvc\Controller;
use flundr\auth\Auth;

class Stats extends Controller {

	public function __construct() {
		if (!Auth::logged_in() && !Auth::valid_ip()) {Auth::loginpage();}			
		$this->view('DefaultLayout');
		$this->models('Clients,Slots');
	}

	public function index() {

		$this->view->budgets = $this->Slots->budgets();
		$this->view->monthHours = $this->Slots->by_month();
		$this->view->categorieHours = $this->Slots->by_category();
		$this->view->advisorHours = $this->Slots->by_advisor();

		$this->view->render('careing/stats');
	}

}
