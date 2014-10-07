<?php
require('./common.php');
$person_id = 0;
if(!empty($QUERY['action'])) {
	$person_id = $sql->insert("app_highflyers_person", array(
			'name' => $QUERY['name'], 
			'description' => $QUERY['description'],
			'city'=>$QUERY['city'],
			'vertical' => $QUERY['vertical'],
			'added_on' => 'NOW()',
			'status'	=> '0',
		));
}
$html = new HTML;
include('header.php');
?>
<div id="content" class="container">
<h2>Submit a High Flyer</h2>
<?php if($person_id) print "<div class='alert alert-success'>'$QUERY[name]' added to database</div>"; ?>
<form action="" method="post">
<?php 
$html->buildInput("name");
$html->buildInput("description", "Why?", "textarea");
$html->buildInput("city","City", "select", 'bangalore', array('options' => array(
	'bangalore' => 'Bangalore',
	'mangalore' => 'Mangalore',
	'trivandrum' => 'Trivandrum',
	'mumbai' => 'Mumbai',
	'pune' => 'Pune',
	'chennai' => 'Chennai',
	'vellore' => 'Vellore',
	'cochin' => 'Cochin',
	'hyderabad' => 'Hyderabad',
	'delhi' => 'Delhi',
	'chandigarh' => 'Chandigarh',
	'kolkata' => 'Kolkata',
	'nagpur' => 'Nagpur',
	'coimbatore' => 'Coimbatore',
	'vizag' => 'Vizag',
	'vijayawada' => 'Vijayawada',
	'gwalior' => 'Gwalior',
	'lucknow' => 'Lucknow',
	'bhopal' => 'Bhopal',
	'mysore' => 'Mysore',
	'guntur' => 'Guntur',
	'ahmedabad' => 'Ahmedabad',
	'dehradun' => 'Dehradun',
)));
$html->buildInput("vertical", "Vertical", "select", 'pr', array('options' => $verticals));
$html->buildInput("action","&nbsp;","submit","Save")
?>
</form>
<div id="footer"></div>
</div>
</body>
</html>