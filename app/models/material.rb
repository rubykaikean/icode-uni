class Material < ActiveRecord::Base

	belongs_to :estimation
	has_many :estimation_items

	validates :name , :type_id , :category_id ,  presence: :true

	def total_wt_ibs_ft
		if type_id == 1
			plate * thk_dia
		elsif type_id == 2
			thk_dia
		elsif type_id == 3
			wt_ibs_ft 
		end
	end

	


	

end
