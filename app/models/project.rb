class Project < ActiveRecord::Base

	# scope :type,where(non_standard: '1')

	validates :client , :project_code, :name , :date ,  presence: :true
	validates :name, uniqueness: :true

	belongs_to :client

	has_many :stations

	
	#has_many :estimations , :through => :stations  << use this when need to see estimation infro trough product

	ROLE = [
	    InventoryManagementSystem::PROJECT
	    # InventoryManagementSystem::CLIENT_ADD,
	    # InventoryManagementSystem::CLIENT_EDIT,
	    # InventoryManagementSystem::CLIENT_DELETE

	]
	
end
