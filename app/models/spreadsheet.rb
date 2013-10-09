class Spreadsheet < ActiveRecord::Base	


	# def self.generate_material_code(material)
	# 	if dimension_h.blank?	
	# 	  materail.material_code = "#{material.name} / - / #{material.dimension_w.to_s}"
		
	# 	elsif dimension_w.blank?
	# 	  material.material_code = "#{material.name} / #{material.dimension_h.to_s} / -"
		
	# 	elsif dimension_w.blank? && dimension_h.blank?
	# 	  material.material_code = "#{material.name} /-/- "
	# 	else
	# 	  material.material_code = "#{material.name} / #{material.dimension_h.to_s} / #{material.dimension_w.to_s}"
	# 	end
	# 	# return material_params[:material_code]
	# end


end