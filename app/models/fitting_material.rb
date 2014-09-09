class FittingMaterial < ActiveRecord::Base

	has_many :price_control_items
	has_many :estimation_items

	validates :name , presence: true, :presence => {:message => ' Name Cannot be Blank!'}
	validates :material_code, uniqueness: true, allow_blank: true , :presence => {:message => "Material code duplicated"}
	ROLE = [
	    InventoryManagementSystem::FITTING_MATERIAL
	]

	def fitting_material_code
		"#{name} - (#{material_code})"
	end

	

end
