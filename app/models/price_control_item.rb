class PriceControlItem < ActiveRecord::Base

	scope :desc, order("created_at DESC")
	scope :new_eff_date, where("new_eff_date >= ?" , Date.today)
	
	belongs_to :material
	belongs_to :fitting_material
	belongs_to :price_control

	validates :new_unit_price , :new_eff_date, presence: :true
	validates :new_unit_price , numericality: :true


	ROLE = [
	    InventoryManagementSystem::PRICE_CONTROL_ITEM
	    # InventoryManagementSystem::CLIENT_ADD,
	    # InventoryManagementSystem::CLIENT_EDIT,
	    # InventoryManagementSystem::CLIENT_DELETE

	]


	



end
