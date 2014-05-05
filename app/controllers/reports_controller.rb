class ReportsController < ApplicationController
  before_filter :authenticate_user!
  layout "enter_data", :only => [:pdf_estimation_report]
  autocomplete :station, :name

  def list_station_report
    @list_station_report = Project.all
  end

  def list_estimation_report
    @list_estimation_search = Station.search(params[:q])
    @list_estimation_report = @list_estimation_search.result(distinct: true).paginate(:page => params[:page], :per_page=>5)
  end

  def pdf_estimation_report
    
    if params[:commit] == "PDF Report"
      if params[:estimation_ids].present?
        # render :text => params[:estimation_ids].to_json
        @estimation = Estimation.find(params[:estimation_ids])
        #render :text => @estimation.to_json
        # html = render_to_string(:layout => false , :action => "pdf_estimation_report.html.erb")
        #   @kit = PDFKit.new(html)
        #   @kit.stylesheets << "#{Rails.root.to_s}/app/assets/stylesheets/bootstrap.css"
        #   send_data(@kit.to_pdf, :filename => "pdf_estimation_report.pdf",
        #                           :type => 'application/pdf',
        #                           :disposition => "attachement")
        render :text => @estimation.to_json
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

  def excel_list_estimation_report
    # if params[:so_ids].present?
    #   #render :text => params[:search]
    #   @excel_so_customer_po_detail_report = SalesOrderItem.find(params[:so_ids])
    #     respond_to do |format|
    #       format.html
    #       format.csv {render text: @excel_so_customer_po_detail_report.to_csv}
    #       format.xls
    #     end
    #   else
    #     redirect_to so_customer_po_detail_report_reports_path
    #   end
  end


  def testing_page
      html = render_to_string(:layout => false , :action => "testing_page.html.erb")
          @kit = PDFKit.new(html)
          send_data(@kit.to_pdf ,:filename => "testing_page.pdf",
                                :type => 'application/pdf' , 
                                :disposition => "attachement" )
  end



end
