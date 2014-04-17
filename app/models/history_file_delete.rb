class HistoryFileDelete < ActiveRecord::Base


	belongs_to :estimation
	belongs_to :user


	ROLE = [
	    InventoryManagementSystem::HISTORY_FILE_DELETE
	    # InventoryManagementSystem::CLIENT_ADD,
	    # InventoryManagementSystem::CLIENT_EDIT,
	    # InventoryManagementSystem::CLIENT_DELETE

	]
end
