class Project < ActiveRecord::Base

	scope :tender_type , where(tenders: '1')
	scope :quotation_type , where(tenders: '0')

	validates :client, :name , :date ,  presence: :true
	validates :name, uniqueness: :true

	belongs_to :client

	has_many :stations
	has_many :estimations
	has_one :user

	
	#has_many :estimations , :through => :stations  << use this when need to see estimation infro trough product

	ROLE = [
	    InventoryManagementSystem::PROJECT
	    # InventoryManagementSystem::CLIENT_ADD,
	    # InventoryManagementSystem::CLIENT_EDIT,
	    # InventoryManagementSystem::CLIENT_DELETE

	]
	
end
