# class Spreadsheet	


# 	def generate_material_code(material)
# 		if self.dimension_h.blank?	
# 		  material.material_code = "#{material.name} / - / #{material.dimension_w.to_s}"
		
# 		elsif self.dimension_w.blank?
# 		  material.material_code = "#{material.name} / #{material.dimension_h.to_s} / -"
		
# 		elsif self.dimension_w.blank? && self.dimension_h.blank?
# 		  material.material_code = "#{material.name} /-/- "
# 		else
# 		  material.material_code = "#{material.name} / #{material.dimension_h.to_s} / #{material.dimension_w.to_s}"
# 		end
# 		# return material_params[:material_code]
# 	end


# end