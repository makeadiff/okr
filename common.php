<?php
require_once('../common.php');

$modes = array(
	'vertical' => array(
			'verticals'	=> 'regions',
			'regions'	=> 'cities',
			'cities'	=> 'people',
			'people'	=> 'person'
		),
	'horizondal' => array(
			'regions'	=> 'verticals',
			'verticals'	=> 'cities',
			'cities'	=> 'people',
			'people'	=> 'person'
		),
	);
