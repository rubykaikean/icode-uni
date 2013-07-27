class Station < ActiveRecord::Base
	
	belongs_to :estimation
	belongs_to :product

	validates :name , :product_id ,  presence: :true


end
