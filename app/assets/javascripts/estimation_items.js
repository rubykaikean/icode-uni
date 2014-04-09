$(document).ready(function() {

		var estimation_item_total = $("#estimation_item_total_weight").text().replace(/\,/g,'');
        var estimation_item_total_weight = parseFloat(estimation_item_total);
		var estimation_item_title_weight = estimation_item_total_weight / 2204;
		var ton = "ton(s)";
		$("#total_weight").text(estimation_item_title_weight.toFixed(2) + " " + "ton(s)");	

		var estimation_item_index_count = $("#estimation_item_index_count").text();
		$("#index_count").text(estimation_item_index_count);
    	// $("#estimation_item_total").val();
    	// add class will let datatable lost css
    	// $().text().addClass();


        // keyin estimation item (raw material)
        //===================================================================================
		$(".estimation_button").click(function(sel){
            var material_id = $(this).attr("es_ma");
            var name = $("#name_"+ material_id).text();
            // $.trim will remove all the white space
            var dimension_h = $("#dimension_h_" + material_id ).text();
            var thk_dia = $("#thk_dia_" + material_id ).text();
            var dimension_w = $.trim($("#dimension_w_" + material_id ).text());
            var wt_ibs_ft = $.trim($("#wt_ibs_ft_" + material_id ).text());
            var unit_price = $("#unit_price_" + material_id ).text();
            var unit_measure = $.trim($("#unit_measure_" + material_id).text());

            var tk = []
            var tk = thk_dia.split(" ");
            var thk_dia_num = tk[0];
            var thk_dia_um = tk[1];
            //alert(typeof dimension_w);
            //hidden field for write down record and store in db

            $("#estimation_item_dimension_h").val(dimension_h);
            $("#dimension_h_hidden_field").val(dimension_h);
            //========================================================
            $("#estimation_item_dimension_w").val(dimension_w);
            $("#dimension_w_hidden_field").val(dimension_w);
            //========================================================
            $("#estimation_item_wt_ibs_ft").val(wt_ibs_ft);
            $("#wt_ibs_ft_hidden_field").val(wt_ibs_ft);
            //========================================================
            $("#estimation_item_unit_price").val(unit_price);
            $("#unit_price_hidden_field").val(unit_price);
            //========================================================
            $("#material_id").val(material_id);
            $("#estimation_item_material_id").val(name);
            //========================================================
            $("#estimation_item_thk_dia").val(thk_dia_num);
            $("#thk_dia_hidden_field").val(thk_dia_num);
            //========================================================
            $("#estimation_item_thk_dia_um").val(thk_dia_um);
            $("#thk_dia_um_hidden_field").val(thk_dia_um);
            //========================================================
            $("#estimation_item_uom").val(unit_measure);
            $("#uom_hidden_field").val(unit_measure);
            //========================================================
            
            
            //======================================================
            // below line is fitting material description field
            $("#estimation_item_description").attr('disabled', 'disabled');
            if (thk_dia_num.length > 0 )
            {
                $("#estimation_item_thk_dia").attr('disabled', 'disabled');
            }
            else
            {
                $("#estimation_item_thk_dia").attr('disabled');
                $("#estimation_item_thk_dia").removeAttr('disabled');
            }
            //========================================================
            if (thk_dia_um.length > 0 )
            {
                $("#estimation_item_thk_dia_um").attr('disabled' , 'disabled');
            }
            else
            {
                $("#estimation_item_thk_dia_um").attr('disabled');
                $("#estimation_item_thk_dia_um").removeAttr('disabled');
            }
            //========================================================
            if (unit_measure.length > 0 )
            {
                $("#estimation_item_uom").attr('disabled' , 'disabled');
            }
            else
            {
                $("#estimation_item_uom").attr('disabled');
                $("#estimation_item_uom").removeAttr('disabled');
            }
            //========================================================
            if (dimension_w.length > 0 )
            {
                $("#estimation_item_dimension_w").attr('disabled' , 'disabled');
            }
            else
            {
                $("#estimation_item_dimension_w").attr('disabled');
                $("#estimation_item_dimension_w").removeAttr('disabled');
            }
            //========================================================
            
        });

        
        $(".fitting_material_estimation_button").click(function(sel){
            var fitting_material_id = $(this).attr("es_ma");
            var name = $("#name_" + fitting_material_id).text();
            var material_code = $("#material_code_" + fitting_material_id).text();
            var unit_price = $("#unit_price_" + fitting_material_id).text();

            $("#fitting_material_id").val(fitting_material_id);
            $("#estimation_item_fitting_material_id").val(name);

            $("#estimation_item_description").val(material_code);
            $("#description_hidden_field").val(material_code);

            $("#estimation_item_unit_price").val(unit_price);
            $("#unit_price_hidden_field").val(unit_price);


            
            $("#estimation_item_thk_dia_um").attr('disabled', 'disabled');
            
            
            $("#estimation_item_thk_dia").attr('disabled', 'disabled');
            
            $("#estimation_item_dimension_l").attr('disabled', 'disabled');
            
            $("#estimation_item_dimension_w").attr('disabled', 'disabled');
            
        });

    $("#reset_button").click(function(){
            $("#estimation_item_dimension_w").val("");
            $("#estimation_item_dimension_h").val("");
            $("#estimation_item_wt_ibs_ft").val("");
            $("#estimation_item_dimension_l").val("");
            $("#estimation_item_thk_dia").val("");
            $("#estimation_item_thk_dia_um").val("");
            $("#estimation_item_material_id").val("");
            $("#estimation_item_uom").val("");
            $("#estimation_item_fitting_material_id").val("");
            $("#estimation_item_description").val("");
            $("#estimation_item_part_detail").val("");
            $("#estimation_item_qty").val("");
            $("#estimation_item_unit_price").val("");
    });

		
});

		