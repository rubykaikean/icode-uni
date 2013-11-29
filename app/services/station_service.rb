class StationService



	def initialize(station_value)
		@station_value = station_value
	end

	def create_estimation
		@station_value.each do |estimation_key , estimation_value|
			estimation = Estimation.find(estimation_key)
            new_estimation = Estimation.new
  		# @new_estimation = new_estimation
		# @estimation = estimation

            new_estimation = estimation.dup  #duplicate
            new_estimation.station_id = estimation_key
            new_estimation.save!
            @estimation_item = EstimationItem.where("estimation_id = ?" , estimation_key)
            create_estimation_item
        end
	end

	def create_estimation_item
		# @estimation_item = EstimationItem.where("estimation_id = ?" , @estimation_key)
		# @material = Material.all
		@estimation_item.each do |item|
			new_estimation_item = EstimationItem.new
			
			new_estimation_item = item.dup
			new_estimation_item.estimation_id = item.id
			
			new_unit_price_control = new_estimation_item.material.price_control_items.where("new_eff_date >= ?" , Date.today).order("new_eff_date").first
			
			new_estimation_item.unit_price = new_unit_price_control.new_unit_price if new_unit_price_control
			
			new_estimation_item.save!
		end
	end


end 