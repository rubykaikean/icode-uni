class PriceControlItem < ActiveRecord::Base

	scope :desc , order("created_at DESC")

	belongs_to :material
	belongs_to :price_control

	validates :material ,:new_unit_price , :new_eff_date, presence: :true
	validates :new_unit_price , numericality: :true
	
	
	# def duplicate_unit_price
	# 	if new_unit_price.present? && new_eff_date.present?
	# 		self.old_unit_price = "#{new_unit_price}"
	# 		self.old_eff_date = "#{new_eff_date}"
	# 	end
	# end

	def custom_name
		"#{name} - #{dimension_h} - #{dimension_w} - #{wt_ibs_ft}"
	end

	ROLE = [
	    InventoryManagementSystem::PRICE_CONTROL_ITEM
	    # InventoryManagementSystem::CLIENT_ADD,
	    # InventoryManagementSystem::CLIENT_EDIT,
	    # InventoryManagementSystem::CLIENT_DELETE

	]



end
