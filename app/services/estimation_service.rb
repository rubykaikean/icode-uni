class EstimationService
	def initialize(estimation_id , non_standard_estimation)
		@estimation = estimation_id
		@non_standard_estimation = non_standard_estimation
	end

	def create_standard_estimation
		
		new_non_standard_estimation = Estimation.new
		standard_estimation = Estimation.find(@estimation)

		new_non_standard_estimation = standard_estimation.dup

		new_non_standard_estimation.station_id = @non_standard_estimation
		new_non_standard_estimation.project_id = ""
		new_non_standard_estimation.save!

		@new_estimation_id = new_non_standard_estimation.id
		@old_estimation_id = EstimationItem.where("estimation_id = ?" , @estimation)
	  	
	  	create_non_standard_estimation_item
	end


	def create_non_standard_estimation_item
		@old_estimation_id.each do |item|
	        new_estimation_item = EstimationItem.new
	        #duplicate all old record 
	        new_estimation_item = item.dup 
	        new_estimation_item.estimation_id = @new_estimation_id
	        new_unit_price_control = new_estimation_item.material.price_control_items.where("new_eff_date >= ?" , Date.today).order("new_eff_date").first
	        new_estimation_item.unit_price = new_unit_price_control.new_unit_price if new_unit_price_control
	        new_estimation_item.save!
        end
	end



end