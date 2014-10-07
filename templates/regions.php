<div id="content" class="container">
	<?php foreach($all_regions as $region) { ?>
	<div class="vertical col-md-3" style="background-color:<?php echo color() ?>"><a href="<?php 
		if($region == 'national')
			echo getLink('people.php', array('city_id' => 26, 'region_id' => $region['id']));
		else
			echo getLink(getNext(). '.php', array('vertical_id' => i($QUERY, 'vertical_id', 0), 'region_id' => $region['id']));
	?>"><?php echo $region['name'] ?><?php showGrade($region['id']); ?></a></div>
	<?php } ?>
</div> 
