class PriceControlItem < ActiveRecord::Base

	belongs_to :materials
	belongs_to :price_control
	
	
end
