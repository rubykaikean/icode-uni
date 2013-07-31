class Product < ActiveRecord::Base


	validates :client , :name , :date ,  presence: :true
	

	belongs_to :client

	has_many :stations
	has_many :estimations , :through => :stations



end
