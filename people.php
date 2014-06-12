<?php
require('./common.php');

if(!empty($QUERY['vertical_id'])) $vertical = "AND G.vertical_id=$QUERY[vertical_id]";

$people = $sql->getById("SELECT U.id,U.name FROM User U
		INNER JOIN UserGroup UG ON U.id=UG.user_id 
		INNER JOIN `Group` G ON G.id=UG.group_id
		WHERE (G.type='fellow' OR G.type='national') $vertical AND U.city_id=$QUERY[city_id] AND U.status='1'
		ORDER BY U.name");
$grades = $sql->from("OKR_Grade")->select(array("user_id", "grade"))->where('user_id != 0')->get('byid');

render();