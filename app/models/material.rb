class Material < ActiveRecord::Base

	belongs_to :estimation
	has_one :estimation_item

	validates :name , :type_id , :category_id ,  presence: :true

	def total_wt_ibs_ft
		if type_id == 1
			plate * thk_dia
		elsif type_id == 2
			thk_dia
		elsif type_id == 3
			wt_ibs_ft
		end
	end

	def fomular_1
		(dimension_w/304.0) * (dimension_l/304.0) * total_wt_ibs_ft
	end

	def fomular_2
		(dimension_l/1000.0) * total_wt_ibs_ft * 2.204
	end

	def fomular_3
		(dimension_l/304.0) * total_wt_ibs_ft
	end

	def fomular_4
		[[(dimension_w/1000) * (dimension_l/1000)] / 2.9768] * total_wt_ibs_ft * 2.20459
	end


	

end
