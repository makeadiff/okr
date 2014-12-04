<h2><?php echo $current_user['name'] ?> <span class="badge"><?php echo $person_grade ?></span></h2>

<form action="index.php" method="post">
<h4>Objectives</h4>
<ul class="objectives">
<?php foreach($objectives as $obj_id => $obj) { ?>
	<li>
		<span class="badge"><?php echo $obj['grade'] ?></span>
		<input type="text" name="objective[<?php echo $obj_id ?>]" value="<?php echo $obj['subject']; ?>" class="objective_field" />
		<ul class="key-results">
		<?php foreach ($obj['key_results'] as $key_id => $key) { ?>
			<li>
				<input type="text" class="grade" name="key_result_grade[<?php echo $key_id ?>]" value="<?php echo $key['grade']; ?>" />
				<input type="text" name="key_result[<?php echo $key_id ?>]" value="<?php echo $key['subject']; ?>"  class="key_result_field" />
			</li>
		<?php } ?>
		<li><input type="text" name="new_key_result_in[<?php echo $obj_id; ?>][]" value="" placeholder="New Key Result" class="key_result_entry" /></li>
		</ul></li>
<?php } ?>
<li><input type="text" name="new_objective[]" value="" placeholder="New Objective" class="objective_entry" /></li>
</ul>
<?php
if(isset($save_data) and $save_data) {
	if(!in_array($current_cycle, $archived)) { ?>
<input type="submit" name="action" value="Save" class="btn btn-primary" />
<input type="hidden" name="user_id" value="<?php echo $user_id ?>" />
<!-- <input type="hidden" name="return_to" value="person.php?user_id=<?php echo $user_id ?>" /> -->
<?php } else {
	print "<p>Data Archived! No further edits possible.</p>";
	}
} ?>
</form><br /><br />

<?php 
if(isset($save_data) and $save_data) {
	if(!in_array($current_cycle, $archived)) { ?>
<p>All targets set?</p>

<form action="index.php" method="post">
<input type="submit" name="action" value="Lock and Archive Data" class="btn btn-success btn-sm" />
<input type="hidden" name="user_id" value="<?php echo $user_id ?>" />
<input type="hidden" name="cycle" value="<?php echo $cycle ?>" />
<!-- <input type="hidden" name="return_to" value="person.php?user_id=<?php echo $user_id ?>" /> -->
</form>

<?php }
}
?>