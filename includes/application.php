<?php
require_once('../support/includes/application.php');

if(isset($QUERY['change-cycle']) and isset($QUERY['cycle'])) {
	$current_cycle = $QUERY['cycle'];
	$_SESSION['current_cycle'] = $current_cycle;

} elseif(isset($_SESSION['current_cycle'])) {
	$current_cycle = $_SESSION['current_cycle'];

} else {
	$current_cycle = get_cycle();
}

function showGrade($id) {
	global $grades;
	echo ' <span class="badge">'. i($grades, $id, 0) . '</span>';
}

function getGrades($type) {
	global $sql, $QUERY, $current_cycle;

	$wheres = array(
		"mode_id"	=> i($QUERY, 'mode', 'both'), 
		"user_id"	=> 0,
		"city_id"	=> i($QUERY,'city_id', 0),
		"region_id"	=> i($QUERY,'region_id', 0),
		"vertical_id"	=> i($QUERY, 'vertical_id', 0),
		"cycle"		=> $current_cycle,
	);
	unset($wheres[$type]);

	$grades = $sql->from("OKR_Grade")->select($type,"grade")->where($wheres)->get('byid');

	return $grades;

}

function getNext() {
	global $modes, $template;

	$current_page = basename($template->template, '.php');

	return $modes[$_SESSION['mode']][$current_page];
}

function getGrade($where) {
	global $sql;
	return $sql->from("OKR_Grade")->select("grade")->where($where)->get("one");
}