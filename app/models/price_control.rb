class PriceControl < ActiveRecord::Base

	validates :pp_date, :client_id ,:presence => true
	has_many :price_control_items, :dependent => :destroy

	 belongs_to :trade_company
	 belongs_to :client

	ROLE = [
	    InventoryManagementSystem::PRICE_CONTROL
	    # InventoryManagementSystem::CLIENT_ADD,
	    # InventoryManagementSystem::CLIENT_EDIT,
	    # InventoryManagementSystem::CLIENT_DELETE

	]

end
