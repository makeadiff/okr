<?php
require('./common.php');

if(!empty($QUERY['mode'])) $_SESSION['mode'] = $QUERY['mode'];
$all_regions = $sql->from('Region')->get();
$grades = getGrades('region_id');

render();