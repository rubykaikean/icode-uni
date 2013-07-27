class Material < ActiveRecord::Base

	belongs_to :estimation

	validates :name ,  presence: :true

end
