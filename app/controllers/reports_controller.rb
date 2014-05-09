class ReportsController < ApplicationController
  before_filter :authenticate_user!
  layout "enter_data", :only => [:pdf_estimation_report, :pdf_project_report]
  autocomplete :station, :name

  def list_project_report
    @list_project_search = Project.search(params[:q])
    @list_project_report = @list_project_search.result(distinct: true).paginate(:page => params[:page], :per_page=>15)
  end

  def list_estimation_report
    @list_estimation_search = Station.search(params[:q])
    @list_estimation_report = @list_estimation_search.result(distinct: true).paginate(:page => params[:page], :per_page=>15)
  end

  def pdf_estimation_report
    if params[:estimation_ids].present?
      if params[:commit] == "PDF Report"
          # render :text => params[:estimation_ids].to_json
          @estimation = Estimation.find(params[:estimation_ids])
          #render :text => @estimation.to_json
          html = render_to_string(:layout => false , :action => "pdf_estimation_report.html.erb")
            @kit = PDFKit.new(html)
            @kit.stylesheets << "#{Rails.root.to_s}/app/assets/stylesheets/bootstrap.css"
            send_data(@kit.to_pdf, :filename => "pdf_estimation_report.pdf",
                                    :type => 'application/pdf',
                                    :disposition => "attachement")
          #render :text => @estimation.to_json
        
      elsif params[:commit] == "Show"
          @estimation = Estimation.find(params[:estimation_ids])
          respond_to do |format|
            format.html
          end
      elsif params[:commit] == "Excel Report"
        redirect_to excel_estimation_report_reports_path(:estimation_ids => params[:estimation_ids])
      end
    else
      redirect_to estimation_report_reports_path, notice: "please check at least one check box"
    end
    
  end

  def pdf_project_report
    if params[:project_ids].present?
      if params[:commit] == "PDF Report"
        @project_report = Project.find(params[:project_ids])
        html = render_to_string(:layout => false , :action => "pdf_project_report.html.erb")
          @kit = PDFKit.new(html)
          @kit.stylesheets << "#{Rails.root.to_s}/app/assets/stylesheets/bootstrap.css"
          send_data(@kit.to_pdf, :filename => "pdf_project_report.pdf",
                                  :type => 'application/pdf',
                                  :disposition => "attachement")
      elsif params[:commit] == "Show"
        @project_report = Project.find(params[:project_ids])
        respond_to do |format|
          format.html
        end
      elsif params[:commit] == "Excel Report"
        # render :text => params.to_json
        redirect_to excel_project_report_reports_path(:project_ids => params[:project_ids] , :format => "xls")
      end
    else
      redirect_to list_project_report_reports_path, notice:"please check one check box to continue."
    end
  end

  # ====================== start excel report ======================

  def excel_project_report
    @excel_project_report = Project.find(params[:project_ids])
    respond_to do |format|
      format.csv { render text: @excel_project_report.to_csv }
      format.xls
    end
  end

  def excel_estimation_report
    @excel_estimation_report = Estimation.find(params[:estimation_ids])
    respond_to do |format|
      format.csv { render text: @excel_estimation_report.to_csv }
      format.xls
    end
  end

  def testing_page
      html = render_to_string(:layout => false , :action => "testing_page.html.erb")
          @kit = PDFKit.new(html)
          send_data(@kit.to_pdf ,:filename => "testing_page.pdf",
                                :type => 'application/pdf' , 
                                :disposition => "attachement" )
  end



end
