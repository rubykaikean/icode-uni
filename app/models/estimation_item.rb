class EstimationItem < ActiveRecord::Base

	belongs_to :estimation
	belongs_to :material



	#validates :material ,:uom , :thk_dia , :weight ,  presence: :true

	def create_item_id
		
	end


end
