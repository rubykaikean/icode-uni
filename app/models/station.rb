class Station < ActiveRecord::Base

	belongs_to :product_list
	belongs_to :estimation


end
