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
	<li><a href="http://makeadiff.in/madapp/index.php/dashboard/dashboard_view">MADApp Dashboard</a></li>
	<li><a href="person.php?user_id=0&amp;cycle=<?php echo $current_cycle ?>">Random ;-)</a></li>
	<li><a href="verticals.php?mode=vertical&amp;cycle=<?php echo $current_cycle ?>">Vertical View</a></li>
	<li><a href="regions.php?mode=horizondal&amp;cycle=<?php echo $current_cycle ?>">Horizontal View</a></li>
	<li><a href="people.php?city_id=<?php echo $current_user['city_id'] ?>&amp;cycle=<?php echo $current_cycle ?>">Team View</a></li>
	<li><form action="" method="post" id="cycle-chooser"><select name="cycle">
		<?php
		$all_cycles = array(
				'1'	=> 'Cycle 1',
				'2'	=> 'Cycle 2',
				'3'	=> 'Cycle 3',
				'4'	=> 'Cycle 4',
				'5'	=> 'Cycle 5'
			);
		foreach ($all_cycles as $cycle => $name) {
			print "<option value='$cycle'";
			if($cycle == $current_cycle) print " selected='selected'";
			print ">" . $name . "</option>";
		}
		?>
	</select><input type="submit" name="change-cycle" value="Change" class="btn btn-default btn-xs" /></form></li>
	</ul><br />

	<form action="search.php" method="post" id="search-area" class="input-group input-group-sm pull-right col-md-3">
	<input type="text" name="search" id="search" placeholder="Search..." value="<?php echo i($QUERY,'search'); ?>" class="form-control" />
	<span class="input-group-btn"><button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button></span>
	</form>

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
<script type="text/javascript" src="http://makeadiff.in/madapp/js/uservoice.js"></script>

</body>
</html>