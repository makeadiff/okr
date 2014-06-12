<?php
require('./common.php');

if(!empty($QUERY['mode'])) $_SESSION['mode'] = $QUERY['mode'];
$all_verticals = $sql->from('Vertical')->get();
$grades = getGrades("vertical_id");

render();