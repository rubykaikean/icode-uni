class Product < ActiveRecord::Base


	validates :client_id , :name , :date ,  presence: :true
	

	belongs_to :client

	has_many :station
	has_many :estimation , :through => :station



end
