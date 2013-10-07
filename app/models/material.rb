class Material < ActiveRecord::Base
	# before_save :generate_material_code
	belongs_to :estimation

	has_many :estimation_items
	has_many :spreadsheets
	has_many :price_control_items, :dependent => :destroy

	validates :name , :category_id , :price_fomular_id,  presence: :true
	validates :material_code, uniqueness: true
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

	def generate_material_code
		if dimension_h.blank?	
		  self.material_code = "#{name} / - / #{dimension_w.to_s}"
		
		elsif dimension_w.blank?
		  self.material_code = "#{name} / #{dimension_h.to_s} / -"
		
		elsif dimension_w.blank? && dimension_h.blank?
		  self.material_code = "#{name} /-/- "
		
		else
		  self.material_code = "#{name} / #{dimension_h.to_s} / #{dimension_w.to_s}"
		end
		# return material_params[:material_code]
	end

	

	ROLE = [
	    InventoryManagementSystem::MATERIAL
	]
	

end
