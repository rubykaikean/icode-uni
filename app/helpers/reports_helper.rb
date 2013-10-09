module ReportsHelper
	def my_helper(estimation)
		estimation_remarks = []
		estimation_remarks << "Materials :"
		estimation_remarks << "Welding   : #{estimation.welding rescue'-'}"
		estimation_remarks << "Oxygen & Acetylene : #{estimation.oxygen_acetylene rescue'-'}"
		estimation_remarks << "Painting  : #{estimation.painting rescue'-'}"
		estimation_remarks << "Sand Blasting : #{estimation.sand_blasting rescue'-'}"
		estimation_remarks << "Transport : #{estimation.transport rescue'-'}"
		estimation_remarks << "Crane  : #{estimation.crane rescue'-'}"
		estimation_remarks << "Shipment  : #{estimation.shipment rescue'-'}"
		estimation_remarks << "Labour : #{estimation.labour rescue'-'}"
		estimation_remarks << "Installation : #{estimation.installation rescue'-'}"
		estimation_remarks << "Dismantle : #{estimation.dismantle rescue'-'}"
		estimation_remarks << "Machining : #{estimation.machining rescue'-'}"
		estimation_remarks << "Insulation : #{estimation.insulation rescue'-'}"
		estimation_remarks << "Civil Work : #{estimation.civil_work rescue'-'}"
		estimation_remarks << "Electrik  : #{estimation.electrik rescue'-'}"
		estimation_remarks << "Pilling Work : #{estimation.piling_work rescue'-'}"
		estimation_remarks << "Forming   : #{estimation.forming rescue'-'}"
		estimation_remarks << "Misc   : #{estimation.misc rescue'-'}"
		estimation_remarks << "JKKP   : #{estimation.jkkp rescue'-'}"
		return estimation_remarks
	end
end


# if variable --> my_helper
# 	if html --> render
