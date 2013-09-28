class EstimationItem < ActiveRecord::Base

	belongs_to :estimation
	belongs_to :material


	#validates :dimension_l , :thk_dia , :uom , :qty ,:wt_ibs_ft ,  presence: :true
	validates :material ,:uom , :thk_dia ,  presence: :true

	def total_wt_ibs_ft
		if material.category_id == 1
			plate * thk_dia
		elsif material.category_id == 2
			material.wt_ibs_ft
		elsif material.category_id == 3
			material.wt_ibs_ft 
		elsif material.category_id == 4
			material.wt_ibs_ft
		elsif material.category_id == 5
			null
		end
	end

	def wt_ibs_ft
		if material.category_id == 1
			material.plate * thk_dia
		else
			material.wt_ibs_ft
		end
	end


	def fomular_1
		(dimension_w / 304.0) * (dimension_l / 304.0) * total_wt_ibs_ft * qty
	end

	def fomular_2
		(dimension_l / 1000.0) * total_wt_ibs_ft * 2.204
	end

	def fomular_3
		(dimension_l / 304.0) * total_wt_ibs_ft
	end

	def fomular_4
		(((dimension_w/1000) * (dimension_l/1000)) / 2.9768) * total_wt_ibs_ft * 2.20459
	end




	# total weight => estimation_item_weight


end
