<?php
require_once('./common.php');
$saved = false;

if(i($QUERY, 'action')) {
	// Add new things.
	if(isset($QUERY['new_objective'])) {
		foreach ($QUERY['new_objective'] as $obj) {
			if(!trim($obj)) continue;

			$objective_id = $sql->insert("OKR_Objective", array(
					'subject'	=> $obj, 
					'user_id'	=> $user_id, 
					'type'		=> 'personal', 
					'timeframe' => $current_timeframe,
					'grade'		=> 0));
			if($objective_id) $saved = true;
		}
	}
	if(isset($QUERY['new_key_result_in'])) {
		foreach ($QUERY['new_key_result_in'] as $obj_id => $key_results) {
			foreach ($key_results as $value) {
				if(!trim($value)) continue; // If empty don't add.
				$key_results_id = $sql->insert("OKR_Key_Result", array(
					'subject'		=> $value,
					'objective_id'	=> $obj_id,
					'grade'			=> 0
				));
				if($key_results_id) $saved = true;
			}
		}
	}

	// Edit/Delete existing things
	if(isset($QUERY['key_result'])) {
		foreach ($QUERY['key_result'] as $key_id => $value) {
			if(!$value) {
				$sql->remove("OKR_Key_Result","id=$key_id");
				$saved = true;
			} else {
				if($sql->update("OKR_Key_Result", array("subject"=>$value),"id=$key_id")) {
					$saved = true;
				}
			}
		}
	}

	if(isset($QUERY['objective'])) {
		foreach ($QUERY['objective'] as $obj_id => $value) {
			if(!$value) {
				$sql->remove("OKR_Objective","id=$obj_id");
				$saved = true;
			} else {
				if($sql->update("OKR_Objective", array("subject"=>$value),"id=$obj_id")) {
					$saved = true;
				}
			}
		}
	}

	// Save grades
	if(isset($QUERY['key_result_grade'])) {
		foreach ($QUERY['key_result_grade'] as $key_id => $value) {
			if($sql->update("OKR_Key_Result", array("grade"=>$value),"id=$key_id")) {
				$saved = true;
			}
		}
	}

}

$objectives = $sql->getById("SELECT id,subject,grade FROM OKR_Objective WHERE user_id=$user_id AND type='personal' AND timeframe='$current_timeframe'");
foreach ($objectives as $key => $data) {
	$objectives[$key]['key_results'] = $sql->getById("SELECT id,subject,grade FROM OKR_Key_Result WHERE objective_id='$key'");

	if($saved) {
		$total = 0;
		$count = 0;
		foreach ($objectives[$key]['key_results'] as $result) {
			$total += $result['grade'];
			if($result['grade']) $count++;
		}
		if($count) {
			$grade = round($total / $count, 2);
			$objectives[$key]['grade'] = $grade;
			$sql->update("OKR_Objective", array('grade' => $grade), "id=$key");
		}
	}
}
$person_grade = getGrade(array('user_id'=>$user_id));

if(i($QUERY, 'action') == 'Lock and Archive Data') {
	$sql->insert("OKR_Archive", array('user_id'=>$user_id, 'timeframe'=>$current_timeframe));
	$current_timeframe++;
	$objectives = array();
}

if($saved) {
	$QUERY['success'] = 'Database updated.';
}

render();