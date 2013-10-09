class Client < ActiveRecord::Base
	has_many :products

	ROLE = [
	    InventoryManagementSystem::CLIENT
	    # InventoryManagementSystem::CLIENT_ADD,
	    # InventoryManagementSystem::CLIENT_EDIT,
	    # InventoryManagementSystem::CLIENT_DELETE

	]
end
