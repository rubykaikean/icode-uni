
var EstimationItem =
  {
     init: function()
     {
     	$(document).on("change", "#estimation_item_material_id", EstimationItem.getData);
     },
	 getData: function()
	 {
	 	var material_select = $("#estimation_item_material_id");
	 	var material_id = material_select.val();
	 	var url = "/materials/" + material_id + "/estimation_item";
	 	$.getJSON(url, function(item){
	 		// var dimension_l = item.dimension_l
	 		// var dimension_w = item.dimension_w
	 		// var dimension_h = item.dimension_h
	 		// var thk_dia_2 = item.thk_dia_2
	 		// var thk_dia_1 = item.thk_dia_1
	 		var info = "<p> Dimension W= " + item.dimension_w + ", Dimension H = " + item.dimension_h + "Dimension L =" + item.dimension_l +  "</p>";
	 		// var total = item.thk_dia ;
	 		$("div#showData").html(info);
	 		// $("#totalData").html(total);
	 		// $("#dimension_l").html(dimension_l);
	 		// $("#dimension_w").html(dimension_w);
	 		// $("#dimension_h").html(dimension_h);
	 		// $("#thk_dia_2").html(thk_dia_2);
	 		// $("#thk_dia_1").html(thk_dia_1);
	 	});
	 }
		

  };
	
		