class ReportsController < ApplicationController
  def index
  end

  # def estimation
  # 	# @product = Product.all
  # 	# @station = Station.all
  # 	# @client = Client.all
  # 	@estimation = Estimation.find(params[:estimation_id]) 
  #   @estimation_item = EstimationItem.all
  #  #  @show_material = Material.all
    
  #   @info_estimation_items = Estimation.find(params[:estimation_id])      
  # end

  def list_estimation_report
    @estimation_item = Estimation.all
    @search = Estimation.search(params[:q])
    @estimations = @search.result(:distinct => true).paginate(:page => params[:page], :per_page=>5)
  end

  def pdf_estimation_report
    # @estimation_item_list = EstimationItem.find(params[:estimation_id])
    # @estimation_item_list = EstimationItem.all
    # @info_estimation_items = Estimation.find(params[:estimation_id])


    if params[:commit] == "PDF Report"
      if params[:estimation_ids].present?
        @estimation = Estimation.find(params[:estimation_ids])
        html = render_to_string(:layout => false , :action => "pdf_estimation_report.html.erb")
          @kit = PDFKit.new(html)
          @kit.stylesheets << "#{Rails.root.to_s}/app/assets/stylesheets/bootstrap.css"
          send_data(@kit.to_pdf, :filename => "pdf_estimation_report.pdf",
                                  :type => 'application/pdf',
                                  :disposition => "attachement")
      end
    elsif params[:commit] == "Show"
      if params[:estimation_ids].present?

         @estimation = Estimation.find(params[:estimation_ids])
          # render :text => @estimation.to_json
        respond_to do |format|
        format.html
        end
      end 
    else
      redirect_to estimation_report_reports_path
    end
  end  



end

# def pdf_pr_report
# #render :text => params[:pr_ids].to_json
#   if params[:commit] == "PDF Report"
#     if params[:pr_ids].present?
#       @detail_pr_report = PurchaseRequisition.find(params[:pr_ids])
#       html = render_to_string(:layout => false , :action => "pdf_pr_report.html.erb")
#           @kit = PDFKit.new(html)
#           send_data(@kit.to_pdf, :filename => "pdf_pr_report.pdf", 
#                                   :type => 'application/pdf' , 
#                                   :disposition => "attachement" )
#         #return # to avoid double render call
#     end
#     # elsif params[:commit] == "Show"
#     #   if params[:pr_ids].present?
#     #   @detail_pr_report = PurchaseRequisition.find(params[:pr_ids])
#     #     respond_to do |format|
#     #       format.html
#     #     end
#     #   end 
#       #render :text => "this is show function"
#     # elsif params[:commit] == "Excel Report"
#     #   if params[:pr_ids].present?
#     #     redirect_to excel_pr_report_reports_path(:pr_ids => params[:pr_ids] , :format => "xls")   #render to controller excel_pr_report
#     #   end
#     else
#       redirect_to pr_report_reports_path
#   end
    
# end