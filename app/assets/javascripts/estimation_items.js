
// var EstimationItem =
//   {
//      init: function()
//      {
//      	//$(document).on("change", "#estimation_item_material_id", EstimationItem.getData);
//      	//$(document).on("change", "#estimation_item_dimension_w", EstimationItem.selectData);
//      	//$(document).on("checked" , "#estimation_material" , EstimationItem.getData);
//      },
// 	 getData: function()
// 	 {
	 	
// 	 	//$("input:checked").change(function(){

// 	 	// var dimension_w = $("#estimation_item_dimension_w");
// 	 	// var dimension_h = $("#estimation_item_dimension_h");
// 	 	// var thk_dia = $("#estimation_item_thk_dia");
// 	 	// var wt_ibs_ft = $("#estimation_item_wt_ibs_ft");
// 	 	// var material_select = $("#estimation_item_material_id");

// 	 	// var url = "/materials/" + material_id + "/estimation_item";
// 	 	// $.getJSON(url, function(item){
	 			
// 	 	// });
// 	 	//});


// 	 },
// 	 // selectData: function()
// 	 // {
// 	 // 	var dimension_h = $("#estimation_item_dimension_h");
// 	 // 	var dimension_w = $("#estimation_item_dimension_w");
// 	 // 	var thk_dia = $("#estimation_item_thk_dia");

// 	 // }
//   };

// //   

//   // var info = "<p> Dimension W= " + item.dimension_w + ", Dimension H = " + item.dimension_h + "Dimension L =" + item.dimension_l +  "</p>";
// 	 // 		// var total = item.thk_dia ;
// 	 // 		$("div#showData").html(info);

// 	 // estimation_item_dimension_w => dimension_w
// 	 // estimation_item_dimension_h => dimension_h
// 	 // estimation_item_thk_dia => thk_dia
// 	 // estimation_item_wt_ibs_ft => wt_ibs_ft
// 	 // estimation_item_weight => total_weight

// 	// function estimation_item_check_box(sel){
$(document).ready(function() {

		var estimation_item_total = $("#estimation_item_total_weight").text().replace(/\,/g,'');
        var estimation_item_total_weight = parseFloat(estimation_item_total);
		var estimation_item_title_weight = estimaton_item_total_weight / 2204;

		$("#total_weight").text(estimtaion_item_title_weight.toFixed(2));	

	// $("#estimation_item_total").val();
	// add class will let datatable lost css
	// $().text().addClass();
});

// $("select").change(function () {
//     var str = "";
//     $( "select option:selected" ).each(function() {
//       str += $( this ).text() + " ";
//     });
//     $("#total_weight").text( str );
//   })
//   .change();

//   var name = $("#name_"+ material_id).text();
	
	 		

		