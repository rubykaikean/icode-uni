// var id = "ctl03_Tabs1";
// var lastFive = id.substr(id.length - 5); // => "Tabs1"
// var lastChar = id.substr(id.length - 1); // => "1"

// var res = str.substring(0,1);
$(document).ready(function () {  
	$( "#client_name" ).keypress(function() {

		client_name = $("#client_name").val();

		var client_first_code = client_name.substring();

	  $("#client_client_code").val(client_name);
	});
});