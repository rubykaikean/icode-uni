class Station < ActiveRecord::Base
	
	belongs_to :project

	has_many :estimations

	# validates :name , :project_id ,  presence: :true

	# def station_estimation_id
	# 	@station_estimation_id = Estimation.all
	# 	@station_estimation_id.each do |p|
	# 		p.id
	# 	end
	# end

	ROLE = [
	    InventoryManagementSystem::STATION
	    # InventoryManagementSystem::CLIENT_ADD,
	    # InventoryManagementSystem::CLIENT_EDIT,
	    # InventoryManagementSystem::CLIENT_DELETE

	]
end
