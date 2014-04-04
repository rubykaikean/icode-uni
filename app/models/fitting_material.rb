class FittingMaterial < ActiveRecord::Base


	validates :name , presence: :true

	ROLE = [
	    InventoryManagementSystem::FITTING_MATERIAL
	]

	

end
