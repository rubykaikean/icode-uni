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

	def read_material_file
		material = Spreadsheet.open "#{Rails.root.to_s}/public/material_data_fomuler03102013.xls"
		# material = Spreadsheet.open "#{Rails.root.to_s}/public/Materials_testing2.xls"
		@sheet1 = material.worksheet 0
		# @spreadsheet = Material.new
		#load_file
	end

	def save_material_file
		#render :text => params[:row].to_json
		params[:row].each do |key, value|
			m = Material.new
			m.name = value[:name]
			m.thk_dia = value[:thk_dia]
			m.thk_dia_um = value[:thk_dia_um]
			m.dimension_h =  value[:dimension_h]
			m.dimension_w = value[:dimension_w]
			m.wt_ibs_ft = value[:wt_ibs_ft]
			m.plate = value[:plate_thk_dia]
			m.unit_measure = value[:unit_measure]
			m.category_id = value[:category_id]
			m.price_fomular_id = value[:price_fomular_id]
			m.save!
			# SpreadSheetsService.new(value).create_spreadsheets
		end
	end

	def read_client_file
		client = Spreadsheet.open "#{Rails.root.to_s}/public/client_data17042014.xls"
	
		@client = client.worksheet 0
	end

	def save_client_file
		# render :text => params[:row].to_json
		params[:row].each do |key, value|
			c = Client.new
			c.client_code = value[:client_code]
			c.name = value[:client_name]
			c.save!
		end
		redirect_to root_url, notice: "complete import client excel file!"
	end

	def read_fitting_material_file
		fitting_material = Spreadsheet.open "#{Rails.root.to_s}/public/fitting_material_data.xls"

		@fitting_material = fitting_material.worksheet 0
	end

	def save_fitting_material_file 
		params[:row].each do |key, value|
			f = FittingMaterial.new
			f.name = value[:name]
			f.thk_dia = value[:thk_dia]
			f.brand = value[:brand]
			f.modal = value[:modal]
			f.type_1 = value[:type_1]
			f.pump_capacity = value[:pump_capacity]
			f.head = value[:head]
			f.material_type = value[:material_type]
			f.pump_speed = value[:pump_speed]
			f.fan_speed = value[:fan_speed]
			f.motor_power = value[:motor_power]
			f.motor_pole = value[:motor_pole]
			f.air_flow = value[:air_flow]
			f.static_pressure = value[:static_pressure]
			f.other = value[:other]
			f.remark = value[:remark]
			f.save!
		end
		redirect_to root_url, notice: "All Record had been store to database!!"
	end


end