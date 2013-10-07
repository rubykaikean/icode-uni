class Material < ActiveRecord::Base
	# before_save :generate_material_code
	belongs_to :estimation

	has_many :estimation_items
	has_many :spreadsheets
	has_many :price_control_items

	validates :name , :category_id ,  presence: :true

	attr_accessor :row_ids

	# def total_wt_ibs_ft
	# 	if type_id == 1
	# 		wt_ibs_ft
	# 	elsif type_id == 2
	# 		thk_dia
	# 	elsif type_id == 3
	# 		wt_ibs_ft
	# 	elsif type_id == 4
			
	# 	end
	# end

	def generate_material_code(name , dimension_w , dimension_h)
		if dimension_h.blank?	
			material_code = name << "/-" << "/" << dimension_w
		elsif dimension_w.blank?
			material_code = name << "/" << dimension_h << "/-"
		else
			material_code = name << "/" << dimension_h << "/" << dimension_w
		end
		material_code
	end

	

	ROLE = [
	    InventoryManagementSystem::MATERIAL
	]
	

end
