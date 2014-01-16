class EstimationService

	def initialize(new_estimation_id , old_estimation_id)
		@estimation = old_estimation_id
		@estimation_id = new_estimation_id
		# @estimation_item = EstimationItem.where("estimation_id = ?" , non_standard_estimation_id)
	end

	def create_non_standard_estimation_item

		@estimation.each do |item|

        new_estimation_item = EstimationItem.new

        new_estimation_item = item.dup #duplicate all old record 

        new_estimation_item.estimation_id = @estimation_id
        
        new_unit_price_control = new_estimation_item.material.price_control_items.where("new_eff_date >= ?" , Date.today).order("new_eff_date").first
        
        new_estimation_item.unit_price = new_unit_price_control.new_unit_price if new_unit_price_control
        
        new_estimation_item.save!

        end


	end



end