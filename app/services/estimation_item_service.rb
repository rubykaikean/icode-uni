class EstimationItemService

	def initialize(params)
		@params = params
	end

	def create_estimation_item
		
	    @params.estimation_item.material_id = @params.material_id
	    @estimation_item = EstimationItem.new(estimation_item_params)
	    
	    
	   	if @params.thk_dia.present?
	    	check_thk_dia  
	    end

	    if @params.thk_dia_um.present?
	      	check_thk_dia_um
	    end

	    if params[:dimension_w].present?
	      @estimation_item.dimension_w = params[:dimension_w]
	    end

	    if params[:unit_measure].present?
	      @estimation_item.uom = params[:unit_measure]
	    end

	    if @estimation_item.save
	    	result

	end

	def check_thk_dia
		if @params.thk_dia.present?
			@estimation_item.thk_dia = @params.thk_dia
		end
	end

	def check_thk_dia_um
	
	end

end
	
    # params[:estimation_item][:material_id] = params[:material_id]
    # @estimation_item = EstimationItem.new(estimation_item_params)
    
    
    # if params[:thk_dia].present?
    #   @estimation_item.thk_dia = params[:thk_dia]
    # end

    # if params[:thk_dia_um].present?
    #   @estimation_item.thk_dia_um = params[:thk_dia_um]
    # end

    # if params[:dimension_w].present?
    #   @estimation_item.dimension_w = params[:dimension_w]
    # end

    # if params[:unit_measure].present?
    #   @estimation_item.uom = params[:unit_measure]
    # end