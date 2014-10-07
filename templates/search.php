<h2>Results for '<?php echo $search; ?>'</h2>

<h4>Objectives</h4>

<ul class="objectives">
<?php foreach($objectives as $obj) { ?>
	<li><?php echo $obj['subject']; ?> (<?php echo $obj['name'] ?>)</li>
<?php } ?>
</ul>

<h4>Key Results</h4>

<ul class="key_results">
<?php foreach($key_results as $key) { ?>
	<li><?php echo $key['subject']; ?> (<?php echo $key['name'] ?>)</li>
<?php } ?>
</ul>
