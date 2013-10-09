class ReportsController < ApplicationController

  layout "enter_data", :only => [:pdf_estimation_report] 


  def index
  end

  def list_estimation_report
    @estimation_item = Estimation.all
    @search = Estimation.search(params[:q])
    @estimations = @search.result(:distinct => true).paginate(:page => params[:page], :per_page=>5)
  end

  def pdf_estimation_report
    
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
