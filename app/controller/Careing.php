<?php

namespace app\controller;
use flundr\mvc\Controller;
use flundr\auth\Auth;
use flundr\date\Datepicker;

class Careing extends Controller {

	public $start = null;
	public $end = null;

	public function __construct() {
		if (!Auth::logged_in() && !Auth::valid_ip()) {Auth::loginpage();}			
		$this->view('DefaultLayout');
		$this->models('Clients,Slots,Advisors');
		$this->prepareDatepicker();
	}

	public function index() {
		$this->view->clients = $this->Clients->client_list();
		$this->view->referer($_SERVER['REQUEST_URI']);		
		$this->view->render('careing/index');	
	}

	public function client($clientID) {
		$client = $this->Clients->get($clientID);

		$month = $this->view->selectedMonth;

		$careingHours = $this->Slots->careing_hours($clientID, $month);
		$advisors = array_unique(array_column($careingHours,'advisor'));
		$usedBudget = array_sum(array_column($careingHours,'timeframe'));

		$this->view->usedBudget = $usedBudget;
		$this->view->hours = $careingHours;
		$this->view->advisors = $advisors;
		$this->view->client = $client;
		$this->view->referer($_SERVER['REQUEST_URI']);
		$this->view->render('careing/invoice');
	}


	public function prepareDatepicker() {

		$datepicker = new Datepicker();
		
		$thisMonth = date('M Y', strtotime('first day of this month'));
		$this->view->selectedMonth = $thisMonth;
		$this->view->selectedMonthGerman = $this->german_month($thisMonth);

		$startPicker = date('Y-m-d', strtotime('first day of this month last year'));
		$endPicker = date('Y-m-d', strtotime('first day of next month'));
		$months = $datepicker->months($startPicker, $endPicker);

		foreach ($months as $month => $data) {
			$months[$month]['german'] = $this->german_month($month);
		}

		if (!empty($_GET['month'])) {
			$selection = $_GET['month'];
			$this->view->selectedMonth = $selection;
			$this->view->selectedMonthGerman = $this->german_month($selection);
		}

		$this->view->months = $months;

	}

	public function german_month($month) {
		$parts = explode(' ', $month);
		$englishMonth = $parts[0];
		$year = $parts[1];
		$germanMonth = GERMONTHS[$englishMonth];
		return $germanMonth . ' ' . $year;
	}	

}
