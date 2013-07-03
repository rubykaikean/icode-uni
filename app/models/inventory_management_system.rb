class InventoryManagementSystem < ActiveRecord::Base

  has_many :roles, :dependent => :destroy
  has_many :users, :through => :roles

end
