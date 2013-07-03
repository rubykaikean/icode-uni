class ProductList < ActiveRecord::Base

	belongs_to :client   

	has_many :estimation , :through => :station


end
