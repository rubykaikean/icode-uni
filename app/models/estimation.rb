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



	validates :title , :dimension , :date,  presence: :true

	ROLE = [
	    InventoryManagementSystem::ESTIMATION

	]


	def self.history_delete_file(id)
	@estimation_id = id
    # id.each do |estimation_id|
      e = HistoryFileDelete.new(:created_at => Date.today, :estimation_id => @estimation_id)
      #doc.authorize_print(params[doc_id]) 
      e.save!
    # end
  end


end
