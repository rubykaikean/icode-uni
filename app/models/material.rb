class Material < ActiveRecord::Base

	belongs_to :estimation
	has_one :estimation_item

	validates :name , :type_id , :category_id ,  presence: :true

	def total_wt_plate
		if type_id == 1
			plate * thk_dia_1
		elsif type_id == 2
			thk_dia_2
		else
			0
		end
	end

	def fomular_1
		(dimension_w/304.0) * (dimension_l/304.0) * total_wt_plate
	end

	def fomular_2
		(dimension_l/1000.0) * total_wt_plate * 2.204
	end

	def fomular_3
		(dimension_l/304.0) * total_wt_plate
	end

	def total_weight
		if catogery_id == 1
			fomular_1 * amount_qty
		elsif category_id == 2
			fomular_2 * amount_qty
		elsif category_id == 3
			fomular_3 * amount_qty
		else
			0
		end
	
	end


	

end
