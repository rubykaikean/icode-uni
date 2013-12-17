class Material < ActiveRecord::Base
	
	belongs_to :estimation

	has_many :estimation_items
	has_many :spreadsheets
	has_many :price_control_items, :dependent => :destroy

	validates :name , :category_id , :price_fomular_id,  presence: :true
	validates :material_code , uniqueness: true
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
		# if thk_dia.nil? && dimension_h.nil? && dimension_w.nil? && wt_ibs_ft.nil?	
		#   	#self.material_code = "#{name} _ #{thk_dia.to_s} _-_#{dimension_w.to_s} _ #{wt_ibs_ft.to_s}"
		# 	self.material_code = "1111"
		# elsif dimension_h.nil? && dimension_w.nil? && wt_ibs_ft.nil? #name / thk / - / - / -  #name / - / H / W / WT
		# 	#self.material_code = "#{name} _-_ #{dimension_h.to_s} _ #{dimension_w.to_s} _ #{wt_ibs_ft .to_s} "
		# 	self.material_code = "124"
		# elsif thk_dia.nil? && dimension_w.nil? && wt_ibs_ft.nil? #name / - / H / - / - 
		#  	#self.material_code = "#{name} _ #{thk_dia.to_s} _#{dimension_h.to_s} _-_ #{wt_ibs_ft.to_s}"
		# 	self.material_code = "125"
		# elsif thk_dia.nil? && dimension_w.nil? && wt_ibs_ft.nil? #name / - / -  / W / -
		# 	#self.material_code = "#{name} _ #{thk_dia.to_s} _ #{dimension_h.to_s} _ #{dimension_w.to_s} _ - "
		# 	self.material_code = "126"
		# elsif thk_dia.nil? && dimension_h.nil? && dimension_w.nil? #name / - / - / - / WT
		# 	#self.material_code = "#{name} _ - _ - _#{dimension_w.to_s} _ #{wt_ibs_ft.to_s}"
		# 	self.material_code = "127"
		# elsif dimension_h.nil? && wt_ibs_ft.nil? #name / thk / - / W / -
		# 	#self.material_code = "#{name} _ - _#{dimension_h.to_s} _ - _#{wt_ibs_ft.to_s}"
		# 	self.material_code = "128"
		# elsif thk_dia.nil? && wt_ibs_ft.nil? #name / - / H / W / -
		# 	#self.material_code = "#{name} _ - _ #{dimension_h.to_s} _ #{dimension_w.to_s} _ - "
		# 	self.material_code = "129"
		# elsif dimension_h.nil? && dimension_w.nil? #name / thk / - / - / WT
		# 	#self.material_code = "#{name} _ #{thk_dia.to_s} _ - _ - _ #{wt_ibs_ft.to_s}"
		# 	self.material_code = "1210"
		# elsif dimension_w.nil? && wt_ibs_ft.nil? #name / thk / H / - / -
		# 	#self.material_code = "#{name} _ #{thk_dia.to_s} _ - _ #{dimension_w.to_s} _ -"
		# 	self.material_code = "1211"
		# elsif thk_dia.nil? && dimension_w.nil? #name / - / H / - / WT
		# 	#self.material_code = "#{name} _ #{dimension_h.to_s} _ - _ -"
		# 	self.material_code = "1212"
		# elsif thk_dia.nil? && dimension_h.nil? #name / - / - / W / WT
		# 	#self.material_code = "#{name} _ - _ - _ - _ #{wt_ibs_ft.to_s} "
		# 	self.material_code = "1213"
		# elsif wt_ibs_ft.nil? #name / thk / H / W / -
		# 	#self.material_code = "#{name} _ - _ - _ #{dimension_w.to_s} _ - "
		# 	self.material_code = "1214"
		# elsif dimension_w.nil? #name / thk / H / - / WT
		# 	#self.material_code = "#{name} _ - _ #{dimension_h.to_s} _ - _ - "
		# 	self.material_code = "1215"
		# elsif thk_dia.nil? #name / - / H / W / WT
		# 	#self.material_code = "#{name} _ #{thk_dia.to_s} _ - _ - _ -"
		# 	self.material_code = "116"
		# elsif dimension_h.nil? #name / thk / - / W / WT
		# 	#self.material_code = "#{name} _ - _ - _ - _ -"
		# 	self.material_code = "123"
		# else
		#   	self.material_code = "#{name} _ #{thk_dia.to_s}_#{dimension_h.to_s} _ #{dimension_w.to_s} _ #{wt_ibs_ft.to_s}"
		# end
		# return material_params[:material_code]
		# if thk_dia.nil? && dimension_h.nil? && dimension_w.nil? && wt_ibs_ft.nil?
		# 	self.material_code = "#{name}_-_-_-_-"
		# else
		# 	self.material_code = "#{name} - #{thk_dia.to_s} - #{dimension_h.to_s} - #{dimension_w.to_s} - #{wt_ibs_ft.to_s}"
		# end

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

