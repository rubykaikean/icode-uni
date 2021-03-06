class EstimationItem < ActiveRecord::Base

	
	
	belongs_to :estimation
	belongs_to :material
	belongs_to :fitting_material

	validates :uom, :qty, presence: :true
	validates :qty, numericality: true

	attr_accessor :ccc

	ROLE = [
	    InventoryManagementSystem::ESTIMATION_ITEM
	]


	def total_wt_ibs_ft
		if material.category_id == 1
			material.plate * thk_dia.to_f
		elsif material.category_id == 2 || material.category_id == 3 || material.category_id == 4 || material.category_id == 5 || material.category_id == 6 
			material.wt_ibs_ft
		else
			null
		end
	end

	def unit_measurement
		if material.thk_dia_um.present?
			material.thk_dia_um
		end
	end

	def fitting_price_total
			qty * unit_price
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
		elsif material.price_fomular_id == 2
			(dimension_l / 6000) * qty * unit_price
		else	
			qty * unit_price
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
		(((dimension_w.to_f / 1000) * (dimension_l / 1000)) / 2.9768) * total_wt_ibs_ft * 2.20459 * qty
	end

	def weight_fomular_6
		material.thk_dia
	end




	# total weight => estimation_item_weight


end
