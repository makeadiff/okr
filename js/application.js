//Framework Specific
function showMessage(data) {
	if(data.success) $("#success-message").html(stripSlashes(data.success)).show();
	if(data.error) $("#error-message").html(stripSlashes(data.error)).show();
}
function stripSlashes(text) {
	if(!text) return "";
	return text.replace(/\\([\'\"])/,"$1");
}


function ajaxError() {
	alert("Error communicating with server. Please try again");
}
function loading() {
	$("#loading").show();
}
function loaded() {
	$("#loading").hide();
}
function siteInit() {
	$("a.confirm").click(function(e) { //If a link has a confirm class, confrm the action
		var action = (this.title) ? this.title : "do this";
		action = action.substr(0,1).toLowerCase() + action.substr(1); //Lowercase the first char.
		
		if(!confirm("Are you sure you want to " + action + "?")) {
			e.stopPropagation();
		}
	});

	if(window.init && typeof window.init == "function") init(); //If there is a function called init(), call it on load
}
$ = jQuery.noConflict();
jQuery(window).load(siteInit);