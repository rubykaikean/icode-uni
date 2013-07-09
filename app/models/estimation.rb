class Estimation < ActiveRecord::Base

	belongs_to :product , :through => :station

end
