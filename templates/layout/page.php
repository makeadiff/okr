<!DOCTYPE HTML>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo $title?></title>
<link href="<?php echo $config['site_home'] ?>css/style.css" rel="stylesheet" type="text/css" />
<link href="<?php echo $config['site_url'] ?>images/silk_theme.css" rel="stylesheet" type="text/css" />
<link href="<?php echo $config['site_url'] ?>bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="<?php echo $config['site_url'] ?>bower_components/bootstrap/dist/css/bootstrap-theme.min.css" rel="stylesheet">

<?php echo $css_includes ?>
</head>
<body>
<div id="wrapper" class="container">
<div id="header" class="navbar navbar-fixed-top navbar-inverse" role="navigation">
<div id="nav" class="container">
	<div class="navbar-brand"><a href="<?php echo $config['site_home'] ?>"><img src="images/logo.png" height="100" /></a></div>

	<div class="collapse navbar-collapse">
	<ul id="nav-links" class="nav navbar-nav pull-right">
	<li><a href="index.php?timeframe=<?php echo $current_timeframe ?>">Home</a></li>
	<li><a href="person.php?user_id=0&amp;timeframe=<?php echo $current_timeframe ?>">Random ;-)</a></li>
	<li><a href="verticals.php?mode=vertical&amp;timeframe=<?php echo $current_timeframe ?>">Vertical View</a></li>
	<li><a href="regions.php?mode=horizondal&amp;timeframe=<?php echo $current_timeframe ?>">Horizondal View</a></li>
	<li><a href="people.php?city_id=<?php echo $current_user['city_id'] ?>&amp;timeframe=<?php echo $current_timeframe ?>">Team View</a></li>
	<li><form action="" method="post" id="timeframe-chooser"><select name="timeframe">
		<?php
		$all_timeframes = array(
				'1'	=> 'Jan - Feb',
				'2'	=> 'Feb - Mar',
				'3'	=> 'Mar - Apr',
				'4'	=> 'Apr - May',
				'5'	=> 'May - June',
				'6'	=> 'June - July',
				'7'	=> 'July - Aug',
				'8'	=> 'Aug - Sept',
				'9'	=> 'Sept - Oct',
				'10'=> 'Oct - Nov',
				'11'=> 'Nov - Dec',
				'12'=> 'Dec - Jan'
			);
		$archived_timeframes = $sql->getCol("SELECT timeframe FROM OKR_Archive WHERE user_id=$user_id");
		array_push($archived_timeframes, $current_timeframe);
		$archived_timeframes = array_unique($archived_timeframes);
		foreach ($archived_timeframes as $timeframe) {
			print "<option value='$timeframe'";
			if($timeframe == $current_timeframe) print " selected='selected'";
			print ">";
			print $all_timeframes[$timeframe] . "</option>";
		}
		?>
	</select><input type="submit" name="action" value="Change" class="btn btn-default btn-xs" /></form></li>
	</ul>
	</div>
</div>
</div>
<div id="content" class="container">

<?php include($GLOBALS['template']->template); ?>

</div>
<div id="footer"></div>
</div>

<script src="<?php echo $config['site_url'] ?>bower_components/jquery/dist/jquery.min.js" type="text/javascript"></script>
<script src="<?php echo $config['site_url'] ?>bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="<?php echo $config['site_home'] ?>js/application.js" type="text/javascript"></script>

<?php echo $js_includes ?>
</body>
</html>