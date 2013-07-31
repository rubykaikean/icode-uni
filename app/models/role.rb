class Role < ActiveRecord::Base

  belongs_to :inventory_management_system
  belongs_to :user

end
