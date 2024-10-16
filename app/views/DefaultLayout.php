<?php

namespace app\views;
use \flundr\mvc\views\htmlView;

class DefaultLayout extends htmlView {

	// Page Header Information is available in the Templates
	// as a $page Array. It can be accessed via $page['title']

	public $title = 'Caremon';
	public $description = 'Caremon tutoring Monitor';
	public $css = ['/styles/flundr/css/defaults.css', '/styles/css/main.css'];
	public $fonts = 'https://fonts.googleapis.com/css?family=Fira+Sans:400,400i,600|Fira+Sans+Condensed:400,600';
	public $js = '/styles/js/main.js';
	public $framework = ['https://cdn.jsdelivr.net/npm/vue/dist/vue.js', '/styles/flundr/components/fl-dialog.js'];
	public $meta = [
		'author' => 'flundr',
		'robots' => 'index, follow',
		'favicon' => '/styles/flundr/img/flundr-logo.svg',
	];

	// You can add some "default" Variables to the Template
	// which can be easily overwritten in the Controller by setting view->varname
	// One usage example could be the path to a template of a Subnavigation for that Page
	// which you can include by using the tpl() helper function "include tpl($navigation)"

	public $templateVars = [
		'layout' => 'overview',
		'navigation' => 'nav/nav-overview',
	];

	// Place the Templateblocks to build your Page here.
	// The "main" Section is usually overwritten in the Controller in the Render function.
	// You can add as many template Blocks as you like or none, if you are just using one "main" template.

	public $templates = [
		'tinyhead' => 'layout/html-doc-header',
		'header' => 'navigation/main-nav',
		'main' => null,
		'footer' => null,
		'tinyfoot' => 'layout/html-doc-footer',
	];

}
