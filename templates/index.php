<h2><?php echo $_SESSION['name'] ?> <span class="badge"><?php echo $person_grade ?></span></h2>

<form action="" method="post">
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
<input type="submit" name="action" value="Save" class="btn btn-primary" />
<input type="submit" name="action" value="Lock and Archive Data" class="btn btn-success btn-sm" />
</form>
