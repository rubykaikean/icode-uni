class Material < ActiveRecord::Base
	
	belongs_to :estimation

	has_many :estimation_items
	has_many :spreadsheets
	has_many :price_control_items, :dependent => :destroy

	validates :name , :category_id , :price_fomular_id,  presence: :true
	#validates :material_code , uniqueness: { case_sensitive: true, message: "must be unique "}
	# { case_sensitive: true, message: "must be unique "}
	before_save :generate_material_code

	# validates :name, uniqueness: { case_sensitive: false }
	# validates_uniqueness_of :material_code
	# validates :wt_ibs_ft , :dimension_h , numericality: { only_integer: true }
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


	def custom_name 
	  "#{name} - #{dimension_h} - #{dimension_w} - #{wt_ibs_ft}"
	end
	# private
	# material_code = name - thk - H - W - WT
	def generate_material_code
		self.material_code = "#{name}(#{custom_thk_dia}-#{custom_dimension_h}-#{custom_dimension_w}-#{custom_wt_ibs_ft})"
	end

	def custom_thk_dia
		thk_dia.blank? ? 0 : thk_dia
	end

	def custom_dimension_h
		dimension_h.blank? ? 0 : dimension_h
	end

	def custom_dimension_w
		dimension_w.blank? ? 0 : dimension_w
	end

	def custom_wt_ibs_ft
		wt_ibs_ft.blank? ? 0 : wt_ibs_ft
	end

	def code
	  if thk_dia.nil? && dimension_h.nil? && dimension_w.nil? && wt_ibs_ft.nil?
			"#{name}_-_-_-_-"
		else
			"#{name} / #{thk_dia.to_s} / #{dimension_h.to_s} / #{dimension_w.to_s} / #{wt_ibs_ft.to_s}"
		end
	end

end

