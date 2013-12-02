class Material < ActiveRecord::Base
	before_save :generate_material_code
	# before_save :generate_material_code
	belongs_to :estimation

	has_many :estimation_items
	has_many :spreadsheets
	has_many :price_control_items, :dependent => :destroy

	validates :name , :category_id , :price_fomular_id,  presence: :true
	validates :material_code , uniqueness: { case_sensitive: true, message: "must be unique "}

	# { case_sensitive: true, message: "must be unique "}

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
	# private
	# material_code = name - H - W - WT
	def generate_material_code
		if dimension_h.nil?	#name / - / W / WT
		  	self.material_code = "#{name} _ #{dimension_w.to_s} _ #{wt_ibs_ft.to_s}"
			
		elsif dimension_w.nil? #name / H / - / WT
		  	self.material_code = "#{name} _ #{dimension_h.to_s} _-_ #{wt_ibs_ft.to_s}"

		elsif wt_ibs_ft.nil? && dimension_h.nil? #name / - / W / -
			self.material_code = "#{name} _ - _ #{dimension_w.to_s} _ -"
			
		elsif wt_ibs_ft.nil? && dimension_w.nil? #name / h / - / -
			self.material_code = "#{name} _ #{dimension_h.to_s} _ - _ - "

		elsif dimension_h.nil? && dimension_w.nil? #name / - / - / WT
			self.material_code = "#{name} _ - _ - _ #{wt_ibs_ft.to_s} "

		elsif dimension_w.nil? && dimension_h.nil? && wt_ibs_ft.nil? #name / - / - / -
		  	self.material_code = "#{name} _ - _ - _ - "			

		else
		  	self.material_code = "#{name} _ #{dimension_h.to_s} _ #{dimension_w.to_s} _ #{wt_ibs_ft.to_s}"
		end
		# return material_params[:material_code]
	end

end

