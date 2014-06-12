<div id="content" class="container">
	<?php foreach($all_cities as $city) { ?>
	<div class="vertical col-md-3" style="background-color:<?php echo color() ?>"><a href="<?php 
		echo getLink(getNext(). '.php', array('vertical_id' => $QUERY['vertical_id'], 'region_id' => $QUERY['region_id'], 'city_id'=>$city['id']));
	?>"><?php echo $city['name'] ?><?php showGrade($city['id']); ?></a></div>
	<?php } ?>
</div> 
