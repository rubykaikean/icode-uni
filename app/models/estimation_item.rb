class EstimationItem < ActiveRecord::Base

	belongs_to :estimation
	belongs_to :material



	# validates :part_detail, :material ,:uom , :thk_dia , :weight ,  presence: :true

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

	# total weight => estimation_item_weight


end
