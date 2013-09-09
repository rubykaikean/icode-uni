class EstimationItem < ActiveRecord::Base

	belongs_to :estimation
	belongs_to :material


	#validates :dimension_l , :thk_dia , :uom , :qty ,:wt_ibs_ft ,  presence: :true
	# validates :part_detail, :material ,:uom , :thk_dia , :weight ,  presence: :true

	# def total_weight
	# 	if category_id == 1
	# 		fomular_1 * qty
	# 	elsif catogery_id == 2
	# 		fomular_2 * qty
	# 	elsif catogery_id == 3
	# 		fomular_3 * qty
	# 	elsif catogery_id == 4
	# 		fomular_4 * qty
	# 	else
	# 		0
	# 	end
	# end

	def total_wt_ibs_ft
		if material.type_id == 1
			materials.wt_ibs_ft = material.plate * material.thk_dia
		elsif material.type_id == 2
			material.thk_dia 
		elsif material.type_id == 3
			material.wt_ibs_ft 
		end
	end


	def fomular_1
		(dimension_w/304.0) * (dimension_l/304.0) * total_wt_ibs_ft * qty
	end

	def fomular_2
		(dimension_l/1000.0) * total_wt_ibs_ft * 2.204
	end

	def fomular_3
		(dimension_l/304.0) * total_wt_ibs_ft
	end

	def fomular_4
		(((dimension_w/1000) * (dimension_l/1000)) / 2.9768) * total_wt_ibs_ft * 2.20459
	end




	# total weight => estimation_item_weight


end
