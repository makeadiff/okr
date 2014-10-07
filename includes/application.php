<?php
if(empty($_SESSION['user_id'])) {
	$url_parts = parse_url($config['site_url']);
	$domain = $url_parts['scheme'] . '://' . $url_parts['host'];
	$madapp_url = "http://makeadiff.in/madapp/";
	if(strpos($config['site_home'], 'localhost') !== false) $madapp_url = "http://localhost/Projects/Madapp/";

	header("Location: " . $madapp_url . "index.php/auth/login/" . base64_encode($domain . $config['PHP_SELF']));
	exit;
}

$user_id = $_SESSION['user_id'];
$current_user = $sql->from('User')->find($user_id);

$current_timeframe = i($QUERY,'timeframe',0);
if(!$current_timeframe) {
	$last_timeframe = $sql->getOne("SELECT timeframe FROM OKR_Archive WHERE user_id=$user_id ORDER BY timeframe DESC LIMIT 0,1");
	if($last_timeframe) $current_timeframe = $last_timeframe + 1;
	else $current_timeframe = 5;
}


function showGrade($id) {
	global $grades;
	echo ' <span class="badge">'. i($grades, $id, 0) . '</span>';
}

function getGrades($type) {
	global $sql, $QUERY, $current_timeframe;

	$wheres = array(
		"mode_id"	=> i($QUERY, 'mode', 'both'), 
		"user_id"	=> 0,
		"city_id"	=> i($QUERY,'city_id', 0),
		"region_id"	=> i($QUERY,'region_id', 0),
		"vertical_id"	=> i($QUERY, 'vertical_id', 0),
		"timeframe"	=> $current_timeframe,
	);
	unset($wheres[$type]);

	$grades = $sql->from("OKR_Grade")->select($type,"grade")->where($wheres)->get('byid');

	return $grades;

}

function color() {
	static $index = 0;
	//$col = array('#EEA2AD', '#4876FF', '#1E90FF', '#00BFFF', '#00FA9A', '#76EE00','#CD950C', '#FFDEAD', '#EED5B7', '#FFA07A', '#FF6347', '#EE6363', '#71C671');
	$col = array('#f1632a','#ffe800','#282829','#22bbb8','#7e3f98','#54b847','#f1632a','#ffe800','#282829','#22bbb8','#7e3f98','#54b847','#e5002f');
	$index++;

	if($index >= count($col)) $index = 0;
	return $col[$index];
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