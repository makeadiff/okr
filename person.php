<?php
require('./common.php');

$user_id = intval($QUERY['user_id']);

if($user_id == 0) {
	$user_id = $sql->getOne("SELECT U.id FROM User U 
		INNER JOIN UserGroup UG ON U.id=UG.user_id 
		INNER JOIN `Group` G ON UG.group_id=G.id
		WHERE (G.type='national' OR G.type='fellow') AND U.status='1' ORDER BY RAND() LIMIT 0,1");
}

$user_details = $sql->from('User')->find($user_id);
$objectives = $sql->getById("SELECT id,subject,grade FROM OKR_Objective WHERE user_id=$user_id AND type='personal'");
foreach ($objectives as $key => $data) {
	$objectives[$key]['key_results'] = $sql->getById("SELECT id,subject,grade FROM OKR_Key_Result WHERE objective_id='$key'");
}
$person_grade = getGrade(array('user_id'=>$user_id));

render();

