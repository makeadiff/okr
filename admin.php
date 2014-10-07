<?php
require_once('./common.php');
$config['site_folder'] = dirname(__FILE__);

$person = new Crud('app_highflyers_person');
$person->title = 'High Flyer';
$person->title_plural = 'High Flyers';
$person->folder['uploads'] = 'uploads';

$person->addField('photo', 'Photo', 'file', array(), array(), 'file');

$person->render();