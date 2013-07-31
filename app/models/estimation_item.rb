class EstimationItem < ActiveRecord::Base

	belongs_to :estimation
	belongs_to :material



	validates :part_detail, :material ,:uom , :thk_dia , :weight ,  presence: :true

	def create_item_id
		
	end


end
