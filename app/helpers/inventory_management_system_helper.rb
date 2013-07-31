module InventoryManagementSystemHelper
	def edit_module(check_authorize, ims_id)
		if check_authorize.present?
			check_box_tag "inventory_management_system[]", ims_id, check_authorize.include?(ims_id)
		else
			check_box_tag "inventory_management_system[]", ims_id
		end
	end
end
