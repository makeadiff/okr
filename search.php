<?php
require('./common.php');

$search = $QUERY['search'];

$objectives = $sql->getAll("SELECT O.*,U.name FROM OKR_Objective O INNER JOIN User U ON O.user_id=U.id WHERE O.subject LIKE '%$search%'");
$key_results = $sql->getAll("SELECT K.*,U.name FROM OKR_Key_Result K INNER JOIN OKR_Objective O ON K.objective_id=O.id INNER JOIN User U ON O.user_id=U.id WHERE K.subject LIKE '%$search%'");

render();