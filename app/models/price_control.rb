class PriceControl < ActiveRecord::Base

	validates :pp_date, :presence => true
	has_many :price_control_items, :dependent => :destroy


end
