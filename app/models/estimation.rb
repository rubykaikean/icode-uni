class Estimation < ActiveRecord::Base

	has_one :drawing_no

	has_many :materials
	has_many :estimation_item

	belongs_to :station
	belongs_to :client

	
	


	validates :title , :dimension , :date,  presence: :true


end
