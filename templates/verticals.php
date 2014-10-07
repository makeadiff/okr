<div id="content" class="container">
	<?php foreach($all_verticals as $vertical) { ?>
	<div class="vertical col-md-3" style="background-color:<?php echo color() ?>"><a href="<?php 
		echo getLink(getNext(). '.php', array('vertical_id' => $vertical['id'], 'region_id' => i($QUERY, 'region_id', 0)));
	?>"><?php echo $vertical['name'] ?><?php showGrade($vertical['id']); ?></a></div>
	<?php } ?>
</div> 
