
var EstimationItem =
  {
     init: function()
     {
     	$(document).on("change", "#estimation_item_material_id", EstimationItem.getData);
     	$(document).on("change", "#estimation_item_dimension_w", EstimationItem.selectData);

     },
	 getData: function()
	 {
	 	var dimension_w = $("#estimation_item_dimension_w");
	 	var dimension_h = $("#estimation_item_dimension_h");
	 	var thk_dia = $("#estimation_item_thk_dia");
	 	var material_select = $("#estimation_item_material_id");


	 	var material_id = material_select.val();

	 	var load :function() {

	 	}
	 	var url = "/materials/" + material_id + "/estimation_item";
	 	$.getJSON(url, function(item){
	 		
	 		
	 	});


	 },
	 selectData: function()
	 {
	 	var dimension_h = $("#estimation_item_dimension_h");
	 	var dimension_w = $("#estimation_item_dimension_w");

	 }
		

  };

//   

  // var info = "<p> Dimension W= " + item.dimension_w + ", Dimension H = " + item.dimension_h + "Dimension L =" + item.dimension_l +  "</p>";
	 // 		// var total = item.thk_dia ;
	 // 		$("div#showData").html(info);

	 // estimation_item_dimension_w => dimension_w
	 // estimation_item_dimension_h => dimension_h
	 // estimation_item_thk_dia => thk_dia
	 // estimation_item_wt_ibs_ft => wt_ibs_ft
	 // estimation_item_weight => total_weight
	 		

		