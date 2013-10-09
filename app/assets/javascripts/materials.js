var Material = 
{

    init: function()
      {
        //$(document).on("change", "#material_type_id" , Material.typeDiv);
        $(document).on("change", "#material_category_id" , Material.catogeryDiv);
      },
    // typeDiv: function()  
    //   {
    //     if ($('#material_type_id').val() == 1) {
    //             $('#id_a').show();
    //             $('#id_b').hide();
    //             $('#id_c').hide();
    //         }
    //         else if ($('#material_type_id').val() == 2 ) {
    //             $('#id_a').hide();
    //             $('#id_b').show();
    //             $('#id_c').show();
    //         }
    //         else if ($("#material_type_id").val() == 3 ){
    //             $('#id_a').hide();
    //             $('#id_b').show();
    //             $('#id_c').show();
    //         }
    //         else{
    //             $('#id_a').hide();
    //             $('#id_b').hide();
    //             $('#id_c').hide();
    //         }
    //   },
    catogeryDiv: function()
      {
            if ($('#material_category_id').val() == 1) {
                $('#id_a').show();
                $('#id_b').hide();
                $('#id_c').hide();
                $('#id_d').hide();
                $('#catogery_a').hide();
                $('#catogery_b').hide();
            }
            else if ($('#material_category_id').val() == 2 ) {
                $('#id_a').hide();
                $('#id_b').show();
                $('#id_c').show();
                $('#id_d').show();
                $('#catogery_a').show();
                $('#catogery_b').show();
            }
            else if ($('#material_category_id').val() == 3 ) {
                $('#id_a').hide();
                $("#id_b").show();
                $('#id_c').show();
                $('#id_d').show();
                $('#catogery_a').hide();
                $('#catogery_b').show();
            }
            else if ($('#material_category_id').val() == 4 ) {
                $('#id_a').hide();
                $('#id_b').show();
                $('#id_c').hide();
                $('#id_d').show();
                $('#catogery_a').hide();
                $("#catogery_b").hide();
            }
            else if ($('#material_category_id').val() == 5 ){
                $('#id_a').hide();
                $('#id_b').show();
                $('#id_c').hide();
                $('#id_d').show();
                $('#catogery_a').hide();
                $("#catogery_b").hide();

            }
            else if ($('#material_category_id').val() == 6 ){
                $('#id_a').hide();
                $('#id_b').show();
                $('#id_c').hide();
                $('#id_d').hide();
                $('#catogery_a').hide();
                $("#catogery_b").hide();

            }
            else{
                $('#id_a').hide();
                $('#id_b').hide();
                $('#id_c').hide();
                $('#id_d').hide();
                $('#catogery_a').hide();
                $('#catogery_b').hide();
            }
      }

};

    

//         