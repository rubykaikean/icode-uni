class Client < ActiveRecord::Base
	has_many :products

	ROLE = [
	    InventoryManagementSystem::CLIENT
	]
end
