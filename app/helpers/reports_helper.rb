module ReportsHelper
	def my_helper(estimation)
			# estimation_remarks = []
			estimation_remarks = ""
			estimation_remarks << "<b style='text-align: left;'>"
			estimation_remarks << "Materials :" << "<br/>"
			estimation_remarks << "Welding   : #{estimation.welding rescue'-'}"  << "<br/>"
			estimation_remarks << "Oxygen & Acetylene : #{estimation.oxygen_acetylene rescue'-'}"  << "<br/>"
			estimation_remarks << "Painting  : #{estimation.painting rescue'-'}"  << "<br/>"
			estimation_remarks << "Sand Blasting : #{estimation.sand_blasting rescue'-'}"  << "<br/>"
			estimation_remarks << "Transport : #{estimation.transport rescue'-'}"  << "<br/>"
			estimation_remarks << "Crane  : #{estimation.crane rescue'-'}"  << "<br/>"
			estimation_remarks << "Shipment  : #{estimation.shipment rescue'-'}"  << "<br/>"
			estimation_remarks << "Labour : #{estimation.labour rescue'-'}"  << "<br/>"
			estimation_remarks << "Installation : #{estimation.installation rescue'-'}"  << "<br/>"
			estimation_remarks << "Dismantle : #{estimation.dismantle rescue'-'}"  << "<br/>"
			estimation_remarks << "Machining : #{estimation.machining rescue'-'}"  << "<br/>"
			estimation_remarks << "Insulation : #{estimation.insulation rescue'-'}"  << "<br/>"
			estimation_remarks << "Civil Work : #{estimation.civil_work rescue'-'}"  << "<br/>"
			estimation_remarks << "Electrik  : #{estimation.electrik rescue'-'}"  << "<br/>"
			estimation_remarks << "Pilling Work : #{estimation.piling_work rescue'-'}"  << "<br/>"
			estimation_remarks << "Forming   : #{estimation.forming rescue'-'}"  << "<br/>"
			estimation_remarks << "Misc   : #{estimation.misc rescue'-'}"  << "<br/>"
			estimation_remarks << "JKKP   : #{estimation.jkkp rescue'-'}"
			estimation_remarks << "</b>"
			return estimation_remarks
		
	end
end


# if variable --> my_helper
# 	if html --> render
