class Station < ActiveRecord::Base
	
	belongs_to :product

	has_many :estimations

	validates :name , :product_id ,  presence: :true


end
