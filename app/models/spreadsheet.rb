class Spreadsheet < ActiveRecord::Base	


	def generate_material_code
		if dimension_h.blank?	
		  self.material_code = "#{name} / - / #{dimension_w.to_s}"
		
		elsif dimension_w.blank?
		  self.material_code = "#{name} / #{dimension_h.to_s} / -"
		
		elsif dimension_w.blank? && dimension_h.blank?
		  self.material_code = "#{name} /-/- "

		else
		  self.material_code = "#{name} / #{dimension_h.to_s} / #{dimension_w.to_s}"
		end
		# return material_params[:material_code]
	end


end