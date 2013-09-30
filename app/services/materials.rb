class MaterialsDatatable
	delegate :name, :dimension_h, :dimension_w, :thk_dia, :wt_ibs_ft , :WT 

	def initialize(view)
		@view = view
	end



end