class SpreadsheetsController < ApplicationController
	# before_action :set_estimation_item, only: [:show, :edit, :update, :destroy]
	before_filter :authenticate_user!
	layout "enter_data"

	def index 
		#Spreadsheet.client_encoding = 'UTF-8'
		# book = Spreadsheet.open "#{Rails.root.to_s}/public/Materials_testing2.xls"
		# sheet1 = book.worksheet 0
		# result = ""
		# sheet1.each do |row|
		# 	result << "Col 1 : #{row[0]} , Col 3 :#{row[3]}, Col 4 :#{row[4]}, Col 5 :#{row[5]}, Col 5 :#{row[5]}, Col 6 :#{row[6]} <br/>  "
		# end
		#render :text => result
	end

	def show
		#render :text => "what is the hell"
	end

	def read_file
		book = Spreadsheet.open "#{Rails.root.to_s}/public/Materials_testing2.xls"
		@sheet1 = book.worksheet 0
		# @spreadsheet = Material.new
		#load_file
	end

	def save_file

		# render :text => params[:row].to_json

		params[:row].each do |key, value|
			@material = Material.new
			@material.name = value[:name]
			@material.thk_dia = value[:thk_dia]
			@material.dimension_h =  value[:dimension_h]
			@material.dimension_w = value[:dimension_w]
			@material.wt_ibs_ft = value[:wt_ibs_ft]
			@material.plate = value[:plate_thk_dia]
			@material.category_id = value[:category_id]
			@material.save
		end

		# render :text => @material.to_json


		# render :text => params[:row_one].to_json
		# params[:row_one] = params[:name][:spreadsheet]
		# params[:row_two] = params[:plate][:spreadsheet]
		# params[:row_three] = params[:dimension_h]
		# params[:row_four] = params[:dimension_w]
		# params[:row_five] = params[:wt_ibs_ft]
		# params[:row_six] = params[:category_id]

		# Material.new(spreadsheet_params)
		# if params[:row_ids].present?
		# 	render :text => "abc"
		# 	# @spreadsheet = Material.new(spreadsheet_params)
		# 	# render :text => params[:row_ids].to_json
		#  end
	end
	def load_file
		 # name = []
		# wt_ibs_ft = []
		# plate = []
		# dimension_w = []
		# dimension_h = []
		# category_id = []
		 # @sheet1.each do |row|
		 	# name << row[0].to_s 
		# 	material_name
		# 	# name = Material.new
		 	# plate << row[1].to_s
		# 	dimension_h << row[2].to_s << "<br/>"
		# 	dimension_w << row[3].to_s << "<br/>"
		# 	wt_ibs_ft << row[4].to_s << "<br/>"
		# 	category_id << row[5].to_s
		 # end
		#@sheet1 = Material.new(material_params)
		# render :text => plate
		# Material.new(name)
		#sheet1.plate = Material.new(params[:plate])
		#@sheet1.dimension_h = Material.new(params[:dimension_h])
		#@sheet1.dimension_w = Material.new(params[:dimension_w])
		#@sheet1.wt_ibs_ft = Material.new(params[:wt_ibs_ft])
		#@sheet1.category_id = Material.new(params[:category_id])
		#@sheet1.save
	end

end


# book = Spreadsheet.open "#{Rails.root.to_s}/public/Materials.xls"

# sheet1 = book.worksheet 0

# sheet1.each do |row|
#  	materials = row[0] 
#   	thickness = row[1] 
#   	dimension_h = row[2]
#   	dimension_w = row[3]
#   	 = row[4]
#   	category_id = row[5]
 	
#       # do something interesting with a row     data1 = row[0]     data2 = row[1]
# end

private

	def spreadsheet_params
      	params.require(:spreadsheet).permit(:name , :plate , :dimension_h, :dimension_w,:wt_ibs_ft,:category_id)
    end