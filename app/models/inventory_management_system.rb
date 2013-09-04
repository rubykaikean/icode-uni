class InventoryManagementSystem < ActiveRecord::Base

  has_many :roles, :dependent => :destroy
  has_many :users, through: :roles


  #MODULE
  CLIENT                      = 1  #ok
  MATERIAL                    = 20

  #SUB MODULE
  PRODUCT_STATION             = 2  #ok
  PRODUCT_MATERIAL            = 3

  #PRODUCT STATION
  PRODUCT_STATION_ADD					= 4
  PRODUCT_STATION_SHOW				= 5
  PRODUCT_STATION_EDIT				= 6
  PRODUCT_STATION_PRINTER			= 7

  #PRODUCT MATERIAL
  PRODUCT_MATERIAL_ADD				= 8
  PRODUCT_MATERIAL_SHOW				= 9	
  PRODUCT_MATERIAL_EDIT				= 10	
  PRODUCT_MATERIAL_PRINTER	  = 11

  MATERIAL                    = 12

 
end
