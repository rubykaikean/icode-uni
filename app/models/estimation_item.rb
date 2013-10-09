class EstimationItem < ActiveRecord::Base

	belongs_to :estimation
	belongs_to :material


	#validates :dimension_l , :thk_dia , :uom , :qty ,:wt_ibs_ft ,  presence: :true
	validates :material_id ,:uom , :dimension_l,  presence: :true

	def total_wt_ibs_ft
		if material.category_id == 1
			material.plate * thk_dia.to_f
		elsif material.category_id == 2
			material.wt_ibs_ft
		elsif material.category_id == 3
			material.wt_ibs_ft
		elsif material.category_id == 4
			material.wt_ibs_ft
		elsif material.category_id == 5
			material.wt_ibs_ft
		elsif material.category_id == 6
			material.wt_ibs_ft
		else
			null
		end
	end

	def price_total
		if material.price_fomular_id == 1
			if material.category_id == 1
				unit_price * weight_fomular_1
			elsif material.category_id == 2
				unit_price * weight_fomular_2
			elsif material.category_id == 3
				unit_price * weight_fomular_3
			elsif material.category_id == 4
				unit_price * weight_fomular_4
			elsif material.category_id == 5
				unit_price * weight_fomular_5
			elsif material.category_id == 6
				qty * unit_price
			else
				null
			end								
		else
			(dimension_l / 6000) * qty * unit_price
		end
	end

	def weight_fomular_1
		(dimension_w.to_f / 304.8) * (dimension_l / 304.8) * total_wt_ibs_ft * qty
	end

	def weight_fomular_2
		(dimension_l / 1000.0) * total_wt_ibs_ft * 2.20459 * qty
	end

	def weight_fomular_3
		(dimension_l / 304.8) * total_wt_ibs_ft * qty
	end

	def weight_fomular_4
		(dimension_w.to_f / 1000) * (dimension_l * 1000) * total_wt_ibs_ft * qty * 2.20459 		
	end

	def weight_fomular_5
		(((dimension_w.to_f / 1000) * (dimension_l/1000)) / 2.9768) * total_wt_ibs_ft * 2.20459 * qty
	end

	def weight_fomular_6
		material.thk_dia
	end




	# total weight => estimation_item_weight


end
