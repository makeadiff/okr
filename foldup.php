<?php
require('common.php');

$count_only_filled = true;
$user_id = $_SESSION['user_id'];

$city_id = $sql->from("User")->select("city_id")->where(array("id"=>$user_id))->get("one");
$region_id = $sql->from("City")->select("region_id")->where(array('id'=>$city_id))->get("one");
$vertical_id = 0;
$vertical_ids = $sql->getAll("SELECT G.vertical_id FROM `Group` G INNER JOIN UserGroup UG ON G.id=UG.group_id 
		WHERE (G.type='fellow' OR G.type='national') AND UG.user_id=$user_id"); // There might be fellows with more than one vertical
if(count($vertical_ids) == 1) $vertical_id = $vertical_ids[0]['vertical_id'];
$mode_id = 'horizontal';
$org_belongs = $belongs = compact('user_id', 'city_id', 'region_id', 'vertical_id', 'mode_id');

/// Person Foldup
foldUser($user_id, $belongs);

/// Horizondal Foldup
// City
$belongs['vertical_id'] = 0;
$everyone_in_city = $sql->getCol("SELECT U.id FROM User U
		INNER JOIN UserGroup UG ON U.id=UG.user_id 
		INNER JOIN `Group` G ON G.id=UG.group_id
		WHERE (G.type='fellow' OR G.type='national') AND U.city_id=$city_id AND U.status='1'");
saveGrade($city_id, $everyone_in_city, 'city', 'user');

// Region
$belongs['city_id'] = 0;
$every_city_in_region = $sql->from("City")->select("id")->where(array("region_id"=>$region_id))->get("col");
saveGrade($region_id, $every_city_in_region, 'region', 'city');

// Mode
$belongs['region_id'] = 0;
$every_region = $sql->from("Region")->select("id")->get("col");
saveGrade($belongs['mode_id'], $every_region, 'mode', 'region');

/// Vertical Foldup
$belongs = $org_belongs;
$belongs['mode_id'] = 'vertical';
foreach($vertical_ids as $vertical_id_collection) {
	$vertical_id = $vertical_id_collection['vertical_id'];

	// City Level - Every person of the said vertical in the city.
	$everyone_in_city = $sql->getCol("SELECT U.id FROM User U
			INNER JOIN UserGroup UG ON U.id=UG.user_id 
			INNER JOIN `Group` G ON G.id=UG.group_id
			WHERE (G.type='fellow' OR G.type='national') AND G.vertical_id=$vertical_id AND U.city_id=$city_id AND U.status='1'");
	saveGrade($city_id, $everyone_in_city, 'city', 'user');

	// Region
	$belongs['city_id'] = 0;
	$every_city_in_region = $sql->from("City")->select("id")->where(array("region_id"=>$region_id))->get("col");
	saveGrade($region_id, $every_city_in_region, 'region', 'city');

	// Vertical
	$belongs['region_id'] = 0;
	$every_vertical = $sql->from("Vertical")->select("id")->get("col");
	saveGrade($vertical_id, $every_vertical, 'vertical', 'region');

	// Mode
	$belongs['region_id'] = 0;
	$every_region = $sql->from("Region")->select("id")->get("col");
	saveGrade($belongs['mode_id'], $every_region, 'mode', 'vertical');
}

function saveGrade($master_id, $element_ids, $master_type, $element_type) {
	global $count_only_filled, $sql, $belongs, $current_timeframe;

	$limited_data = 0;
	$element_grades = $sql->from("OKR_Grade")->where("{$element_type}_id IN (". implode(",", $element_ids) .")")->get("col");

	if($count_only_filled) $element_count = count($element_grades);
	else $element_count = count($element_ids);

	if(count($element_ids) > count($element_grades)) $limited_data = 1;

	$element_total = 0;
	foreach ($element_grades as $grade) {
		$element_total += $grade['grade'];
		if($grade['limited_data']) $limited_data = 1;
	}
	$grade = round($element_total / $element_count, 2);

	if($element_type == 'city') $belongs['vertical_id'] = 0;
	$affected = $sql->remove("OKR_Grade", "{$master_type}_id='$master_id' AND {$element_type}_id=0 AND user_id=0 AND mode_id='$belongs[mode_id]'");
	print $sql->_query . ": $affected<br />";
	$insert_id = $sql->insert("OKR_Grade", array(
								'user_id'		=>0, 
								"{$master_type}_id"=>$master_id, 
								'grade'			=> $grade, 
								'updated_on'	=> 'NOW()',
								'timeframe'		=> $current_timeframe,
								'limited_data'	=> $limited_data) + $belongs);

	return $grade;
}

function foldUser($user_id, $belongs) {
	global $sql, $count_only_filled, $current_timeframe;
	$limited_data = 0;

	$objectives = $sql->from("OKR_Objective")->where(array('user_id' => $user_id))->get();
	$obj_total = 0;
	$obj_count = 0;
	if(!$count_only_filled) $obj_count = count($objectives);
	foreach ($objectives as $obj) {
		// Combine all Key Results to its objective
		$key_results = $sql->from("OKR_Key_Result")->where(array('objective_id' => $obj['id']))->get();
		$kr_total = 0;
		$kr_count = 0;
		if(!$count_only_filled) $kr_count = count($key_results);
		
		foreach ($key_results as $result) {
			$kr_total += $result['grade'];
			if($count_only_filled and $result['grade']) $kr_count++;
		}
		if($kr_count < count($key_results)) $limited_data = 1;

		$obj_grade = round($kr_total / $kr_count, 2);
		$sql->update("OKR_Objective", array('grade' => $obj_grade), "id=$obj[id]");

		$obj_total += $obj_grade;
		if($count_only_filled and $obj_grade) $obj_count++;
	}
	$person_grade = round($obj_total / $obj_count, 2);
	if($obj_count < count($objectives)) $limited_data = 1;

	$sql->remove("OKR_Grade", "user_id = $user_id");
	$sql->insert("OKR_Grade", array('user_id'	=> $user_id, 
									'grade'		=> $person_grade, 
									'mode_id'	=> 'both',
									'timeframe'	=> $current_timeframe,
									'updated_on'=> 'NOW()', 
									'limited_data' => $limited_data) + $belongs);
}