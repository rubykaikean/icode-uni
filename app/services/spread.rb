class Spread
	#include Roo

# 	def location
# 		book = Spreadsheet.open "#{Rails.root.to_s}/public/Materials.xls"
# 	end

	def initialize
		book = Spreadsheet.open "#{Rails.root.to_s}/public/Materials_testing.xls"
		# open_spreadsheet(book)
		read_file(book)
	end

	def read_file(book)
		book = book1
		sheet1 = book1.worksheet 0

		sheet1.each do |row|
			#id = row[0]
			name = row[1]
			#created_id = row[2]
			#updated_id = row[3]
			estimation_id = row[4]
			category_id = row[5]
			dimension_h = row[6]
			dimension_w = row[7]
			plate = row[8]
			wt_ibs_ft = row[9]
			thk_dia = row[10]
			puts name
			puts estimation_id
			puts category_id
		end
	end

	# def open_spreadsheet(book)
 #      case Book.extname(book.path)
 #        when ".csv" then Csv.new(book.path, nil, :ignore)
 #        when ".xls" then Excel.new(book.path, nil, :ignore)
 #        when ".xlsx" then Excelx.new(book.path, nil, :ignore)
 #        else raise "Unknown file type: #{book.original_filename}"
 #      end
 #    end

# 	def import_excel
# 		book = Spreadsheet::Workbook.new
# 		sheet1 = book.create_worksheet

# 		sheet1.name = 'My First Worksheet'
# 		sheet1.row(0).concat %w{Name Country Acknowlegement}
# 		  sheet1[1,0] = 'Japan'
# 		  row = sheet1.row(1)
# 		  row.push 'Creator of Ruby'
# 		  row.unshift 'Yukihiro Matsumoto'
# 		  sheet1.row(2).replace [ 'Daniel J. Berger', 'U.S.A.',
# 		                          'Author of original code for Spreadsheet::Excel' ]
# 		  sheet1.row(3).push 'Charles Lowe', 'Author of the ruby-ole Library'
# 		  sheet1.row(3).insert 1, 'Unknown'
# 		  sheet1.update_row 4, 'Hannes Wyss', 'Switzerland', 'Author'


# 		  # sheet1.row(0).height = 18

# 		  # format = Spreadsheet::Format.new :color => :blue,
# 		  #                                  :weight => :bold,
# 		  #                                  :size => 18
# 		  # sheet1.row(0).default_format = format

# 		  # bold = Spreadsheet::Format.new :weight => :bold
# 		  # 4.times do |x| sheet1.row(x + 1).set_format(0, bold) 

# 		  # end



# 		   #book.write '/path/to/output/excel-file.xls'
# 	end

end



# def initialize(uploaded_file)
#     @tmp_destination = "#{Rails.root}/tmp/tag-import.xls"
#     @file_path = save_file_to_tmp(uploaded_file)
#     @file = File.new(@file_path)
#     read_file(@file)
#   end 

#   private 
#     def save_file_to_tmp(uploaded_file)
#       FileUtils.mv(uploaded_file.tempfile.path, @tmp_destination )
#       @tmp_destination
#     end

#     def read_file(file)
#       @spreadsheet = open_spreadsheet(file)
#       @spreadsheet.each_with_pagename do |name,sheet|    
#         Rails.logger.debug( sheet )
#       end    
#     end

#     def open_spreadsheet(file)
#       case File.extname(file.path)
#         when ".csv" then Csv.new(file.path, nil, :ignore)
#         when ".xls" then Excel.new(file.path, nil, :ignore)
#         when ".xlsx" then Excelx.new(file.path, nil, :ignore)
#         else raise "Unknown file type: #{file.original_filename}"
#       end
#     end


# workbook = RubyXL::Parser.parse("#{Rails.root.to_s}/public/Materials_testing.xls")

# workbook.worksheet[1].extract_data
# workbook.worksheet[9].extract_data
# workbook.worksheet[7].extract_data
# workbook.worksheet[8].extract_data
# workbook.worksheet[10].extract_data
# workbook.worksheet[6].extract_data
