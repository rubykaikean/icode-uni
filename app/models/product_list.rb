class ProductList < ActiveRecord::Base

	belongs_to :product_list   

	has_many :estimation , :through => :station


end
