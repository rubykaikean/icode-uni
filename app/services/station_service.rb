class StationService



	def initialize(station_value)
		@station_value = station_value
		
	end

	def create_estimation
		@station_value.each do |estimation_key , estimation_value|
			@estimation = Estimation.find(estimation_key)
            @new_estimation = Estimation.new
  		# @new_estimation = new_estimation
		# @estimation = estimation

            @new_estimation = @estimation.dup  #duplicate
            @new_estimation.station_id = estimation_key
            @new_estimation.save!
        end
	end


end 