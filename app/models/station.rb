class Station < ActiveRecord::Base

	belongs_to :project

	has_many :estimations

	validates :name , :project_id ,  presence: :true

	
	def self.create_new_estimation(new_estimation , estimation)
		@estimation = Estimation.find(new_estimation)
        @new_estimation = Estimation.new

        @new_estimation = @estimation.dup  #duplicate
        @new_estimation.save!
	end

	ROLE = [
	    InventoryManagementSystem::STATION
	    # InventoryManagementSystem::CLIENT_ADD,
	    # InventoryManagementSystem::CLIENT_EDIT,
	    # InventoryManagementSystem::CLIENT_DELETE

	]
end
