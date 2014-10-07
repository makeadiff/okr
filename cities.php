<?php
require('./common.php');

$all_cities = $sql->from('City')->where(array('region_id'=>$QUERY['region_id']))->sort('name')->get();
$grades = getGrades('city_id');

render();