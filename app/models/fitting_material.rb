class FittingMaterial < ActiveRecord::Base

	has_many :price_control_items
	has_many :estimation_items

	validates :name , presence: :true

	ROLE = [
	    InventoryManagementSystem::FITTING_MATERIAL
	]

	def fitting_material_code
		"#{name} - #{material_code}"
	end

	

end
