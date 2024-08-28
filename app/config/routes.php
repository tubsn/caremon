<?php
/*
Complete Documentation on: https://github.com/nikic/FastRoute
Example Routes:
$routes->get('/urlpath[/{optionalparameter}]', 'Controller@Action');
$routes->post('/article/{id:\d+}', 'Controller@Action'); With ID-Parameter (Numeric)
*/

$routes->get('/', 'Timetable@index');

// Slots
$routes->get('/slots/new', 'Timetable@new');
$routes->post('/slots/new', 'Timetable@create');
$routes->get('/slots/{slotID:\d+}', 'Timetable@edit');
$routes->get('/slots/{slotID:\d+}/delete', 'Timetable@delete');
$routes->get('/slots/{slotID:\d+}/copy', 'Timetable@copy');
$routes->post('/slots/{slotID:\d+}', 'Timetable@update');




// Clients
$routes->get('/clients', 'Clients@index');
$routes->get('/clients/new', 'Clients@new');
$routes->get('/clients/{userID:\d+}', 'Clients@edit');
$routes->get('/clients/{userID:\d+}/delete', 'Clients@delete');
$routes->get('/clients/{userID:\d+}/copy', 'Clients@copy');
$routes->post('/clients/{userID:\d+}', 'Clients@update');
$routes->post('/clients/new', 'Clients@create');









// You can delete these if you don´t need Users in your App

// Authentication Routes
$routes->get('/login', 'Authentication@login');
$routes->post('/login', 'Authentication@login');
$routes->get('/logout', 'Authentication@logout');
$routes->get('/profile', 'Authentication@profile');
$routes->get('/password-reset', 'Authentication@password_reset_form');
$routes->post('/password-reset', 'Authentication@password_reset_send_mail');
$routes->get('/password-change[/{resetToken}]', 'Authentication@password_change_form');
$routes->post('/password-change[/{resetToken}]', 'Authentication@password_change_process');
$routes->get('/profile/edit', 'Authentication@edit_profile');
$routes->post('/profile/edit', 'Authentication@edit_profile');

// Usermanagement / Admin Routes
$routes->get('/admin', 'Usermanagement@index');
$routes->get('/admin/new', 'Usermanagement@new');
$routes->post('/admin', 'Usermanagement@create');
$routes->get('/admin/{id:\d+}', 'Usermanagement@show');
$routes->get('/admin/{id:\d+}/delete/{token}', 'Usermanagement@delete');
$routes->post('/admin/{id:\d+}', 'Usermanagement@update');
