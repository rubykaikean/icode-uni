class DrawingsController < ApplicationController
  #before_action :check_role
  before_filter :authenticate_user!
  before_action :set_drawing, only: [:show, :edit, :update, :destroy ]
  # toDo
  # delete the 'enter_data' and use logic in application.html.erb
  layout "enter_data", :only => [:pdf_drawing_pic]

  # GET /drawings
  # GET /drawings.json
  def index
    @drawings = Drawing.all


    #render :test => params[:estimation_id].to_json
    @info_estimations = Estimation.find(params[:estimation_id])
    #@search = Drawing.search(params[:q])
    #@drawings = @search.result(:distinct => true).paginate(:page => params[:page], :per_page=>5)

  end

  # GET /drawings/1
  # GET /drawings/1.json
  def show


  end

  # GET /drawings/new
  def new
    
    @drawing = Drawing.new
  end

  # GET /drawings/1/edit
  def edit
  end

  # POST /drawings
  # POST /drawings.json
  def create
    @drawing = Drawing.new(drawing_params)
    @drawing.photo = params[:drawing][:photo]
    # @drawing.save

    respond_to do |format|
      if @drawing.save
        format.html { redirect_to drawings_path(:estimation_id => params[:drawing][:estimation_id]), notice: 'Drawing was successfully created.' }
        format.json { render action: 'show', status: :created, location: @drawing }
      else
        format.html { render action: 'new' }
        format.json { render json: @drawing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drawings/1
  # PATCH/PUT /drawings/1.json
  def update
    respond_to do |format|
      if @drawing.update(drawing_params)
        format.html { redirect_to drawins_path, notice: 'Drawing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @drawing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drawings/1
  # DELETE /drawings/1.json
  def destroy
    @drawing.destroy
    respond_to do |format|
      format.html { redirect_to estimations_path }
      format.json { head :no_content }
    end
  end

  def pdf_drawing_pic
    # if params[:commit] == "Print PDF"
    # #if params[:pr_ids].present?
    # #@drawing.photo = params[:drawing][:photo]

       @pdf_drawing_picture = Drawing.find(params[:drawing])
      html = render_to_string(:layout => false , :action => "pdf_drawing_pic.html.erb")
          @kit = PDFKit.new(html)
          send_data(@kit.to_pdf, :filename => "pdf_#{@pdf_drawing_picture.name}.pdf", 
                                  :type => 'application/pdf' , 
                                  :disposition => "attachement" )
    #     #return # to avoid double render call
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drawing
      @drawing = Drawing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drawing_params
      params.require(:drawing).permit(:name  , :estimation_id )
    end

    def check_role
      unless role(Station::ROLE)
        flash[:notice] = "You are not authorize!"
        redirect_to root_url
      end
    end
end



# html = render_to_string(:layout => false , :action => "pdf_so_customer_po_detail_report.html.erb")
#           @kit = PDFKit.new(html)
#           send_data(@kit.to_pdf ,:filename => "pdf_so_customer_po_detail_report.pdf",
#                                 :type => 'application/pdf' , 
#                                 :disposition => "attachement")
