<h2><?php echo $user_details['name']; ?> <span class="badge"><?php echo $person_grade ?></span></h2>

<h4>Objectives</h4>
<ul class="objectives">
<?php foreach($objectives as $obj_id => $obj) { ?>
	<li>
		<span class="badge"><?php echo $obj['grade'] ?></span>
		<?php echo $obj['subject']; ?>
		<ul class="key-results">
		<?php foreach ($obj['key_results'] as $key_id => $key) { ?>
			<li>
				<span class="badge"><?php echo $key['grade']; ?></span>
				<?php echo $key['subject']; ?>
			</li>
		<?php } ?>
		</ul></li>
<?php } ?>
</ul>
