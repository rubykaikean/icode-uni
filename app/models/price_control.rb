class PriceControl < ActiveRecord::Base

	validates :pp_date, :client_id ,:presence => true
	has_many :price_control_items, :dependent => :destroy

	 belongs_to :trade_company
	 belongs_to :client

end
