class PriceControlItem < ActiveRecord::Base

	belongs_to :material
	belongs_to :price_control

	validates :material , presence: :true
	validates :new_unit_price , numericality: { only_integer: true }
	
	
end
