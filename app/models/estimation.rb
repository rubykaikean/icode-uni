class Estimation < ActiveRecord::Base
	 
	has_many :drawings
	# accepts_nested_attributes_for :estimation , allow_destroy => true

	has_many :materials
	has_many :estimation_items

	belongs_to :project
	belongs_to :station
	belongs_to :client
	belongs_to :user
	#validates :welding , :oxygen_acetylene , :painting , :sand_blasting , :transport ,:crane ,:shipment,:labour,:installation,:dismantle,:machining,:insulation,:civil_work,:electrik,:piling_work,:forming,:misc,:jkkp , numericality: true

	scope :result , -> {result(:distinct => true)}
	#scope :paginate , -> {paginate(:page => params[:page], :per_page=>5)}

	validates :title , :dimension , :date,  presence: :true

	ROLE = [
	    InventoryManagementSystem::ESTIMATION

	]


	def self.history_delete_file(title , dimension , current_user_id)
		title = title
		dimension = dimension
		@current_user_id = current_user_id
		  e = HistoryFileDelete.new(:title => title , :dimension => dimension ,:created_at => Date.today , :user_id => @current_user_id)
		  #e.user_id = @curent_user_id  #doc.authorize_print(params[doc_id]) 
		  e.save!
  	end






end
