PDFKit.configure do |config|
#  config.wkhtmltopdf = '/usr/local/bin/wkhtmltopdf'
#  config.wkhtmltopdf = 'C:\Program Files\wkhtmltopdf\wkhtmltopdf.exe'

#   config.wkhtmltopdf = '/usr/local/bin/wkhtmltopdf'
#   config.root_url = "#http://localhost:3000"
#   config.default_options = {
#     :encoding       => "UTF-8",
#     :page_size      => "Letter",
#     :margin_top     => "0.25in",
#     :margin_right   => "0.25in",
#     :margin_bottom  => "0.25in",
#     :margin_left    => "0.25in",
#     :disable_smart_shrinking => false
#   }
   
  config.wkhtmltopdf = '/home/khong/.rvm/gems/ruby-2.0.0-p247@icode-uni/bin/wkhtmltopdf'
  config.root_url = "#http://localhost:3000"
  config.default_options = {
    :encoding => "UTF-8",
    :page_size => "A4",
    :margin_top => "0.25in",
    :margin_right => "0.25in",
    :margin_bottom => "0.25in",
    :margin_left => "0.25in",
    :orientation => 'Landscape',
    :disable_smart_shrinking => false,
      # :page_size => 'Legal',
    # :print_media_type => true
  }
end

ActionController::Base.asset_host = Proc.new { |source, request|
  if request.format.pdf?
    "#{request.protocol}#{request.host_with_port}"
  else
    nil
  end
}