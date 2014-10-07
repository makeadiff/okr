function init() {
	$(".key_result_entry").change(newThisField);
	$(".objective_entry").change(newThisField);
}

function newThisField(e) {
	if(this.value != "") {
		var li = $(this).parent();
		var new_li = li.clone();
		new_li.children("input").change(newThisField).val("");
		li.parent().append(new_li);
	}
}