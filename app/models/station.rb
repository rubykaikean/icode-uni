class Station < ActiveRecord::Base

	belongs_to :products
	belongs_to :estimation


end
