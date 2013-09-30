class Material < ActiveRecord::Base

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

	

	ROLE = [
	    InventoryManagementSystem::MATERIAL
	]
	

end
