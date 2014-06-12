<div id="content" class="container">
<?php foreach($people as $id => $person) { ?>
<div class="person col-md-3" style="background-color:<?php echo color() ?>">
<a href="person.php?user_id=<?php echo $id ?>"><?php echo "$person"; ?><?php showGrade($id); ?></a>
</div>
<?php } ?>
</div>