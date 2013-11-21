class Station < ActiveRecord::Base

	
	belongs_to :project

	has_many :estimations

	validates :name , :project_id ,  presence: :true

	# def station_estimation_id
	# 	@station_estimation_id = Estimation.all
	# 	@station_estimation_id.each do |p|
	# 		p.id
	# 	end
	# end


	# def self.create_estimation_item(new_estimation , estimation)
		def self.create_new_estimation(new_estimation , estimation)
			@estimation = Estimation.find(new_estimation)
            @new_estimation = Estimation.new

            @new_estimation = @estimation.dup  #duplicate

            # logger.debug @estimation.title
			# logger.debug @new_estimation
			# logger.debug @estimation
			# @new_estimation = new_estimation
			# @estimation = estimation
		    # @new_estimation.title = @estimation.title
            # @new_estimation.dimension = @estimation.dimension
    		# @new_estimation.date = @estimation.date
		  	# @new_estimation.welding = @estimation.welding
	   		# @new_estimation.oxygen_acetylene = @estimation.oxygen_acetylene
	   		# @new_estimation.painting = @estimation.painting
	   		# @new_estimation.sand_blasting = @estimation.sand_blasting
	   		# @new_estimation.transport = @estimation.transport
	   		# @new_estimation.crane = @estimation.crane
	   		# @new_estimation.shipment = @estimation.shipment
	   #    @new_estimation.labour = @estimation.labour
	   #    @new_estimation.installation = @estimation.installation
	   #    @new_estimation.dismantle = @estimation.dismantle
	   #    @new_estimation.machining = @estimation.machining
	   #    @new_estimation.insulation = @estimation.insulation
	   #    @new_estimation.civil_work = @estimation.civil_work
	   #    @new_estimation.electrik = @estimation.electrik
	   #    @new_estimation.piling_work = @estimation.piling_work
	   #    @new_estimation.forming = @estimation.forming
	   #    @new_estimation.misc = @estimation.misc
	   #    @new_estimation.jkkp = @estimation.jkkp
	      	@new_estimation.save!
			# return @new_estimation
	end

	ROLE = [
	    InventoryManagementSystem::STATION
	    # InventoryManagementSystem::CLIENT_ADD,
	    # InventoryManagementSystem::CLIENT_EDIT,
	    # InventoryManagementSystem::CLIENT_DELETE

	]
end
