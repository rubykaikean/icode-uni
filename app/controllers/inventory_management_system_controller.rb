class InventoryManagementSystemController < ApplicationController
  	has_many :roles, :dependent => :destroy
  	has_many :users, :through => :roles
end
