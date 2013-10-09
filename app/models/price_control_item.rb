class PriceControlItem < ActiveRecord::Base

	belongs_to :material
	belongs_to :price_control

	validates :material , presence: :true
	validates :new_unit_price , numericality: :true
	
	
	# def duplicate_unit_price
	# 	if new_unit_price.present? && new_eff_date.present?
	# 		self.old_unit_price = "#{new_unit_price}"
	# 		self.old_eff_date = "#{new_eff_date}"
	# 	end
	# end




end
