class InventoryManagementSystem < ActiveRecord::Base

  has_many :roles, :dependent => :destroy
  has_many :users, through: :roles


  #MODULE
  CLIENT                      = 1  #ok
  MATERIAL                    = 2
  PROJECT                     = 3
  STATION                     = 4
  ESTIMATION                  = 5
  PRICE_CONTROL               = 6

  #ACTION
  CLIENT_ADD                  = 10
  CLIENT_EDIT                 = 11
  CLIENT_DELETE               = 12

  MATERIAL_ADD                = 20
  MATERIAL_SHOW               = 21
  MATERIAL_EDIT               = 22
  MATERIAL_DELETE             = 23

  PROJECT_ADD                 = 30
  PROJECT_SHOW                = 31
  PROJECT_EDIT                = 32
  PROJECT_DELETE              = 33

  STATION_ADD                 = 40
  STATION_SHOW                = 41
  STATION_EDIT                = 42
  STATION_DELETE              = 43

  ESTIMATION_ADD              = 50
  ESTIMATION_SHOW             = 51    
  ESTIMATION_EDIT             = 52
  ESTIMATION_DELETE           = 53

  PRICE_CONTROL_ADD           = 60
  PRICE_CONTROL_SHOW          = 61
  PRICE_CONTROL_EDIT          = 62
  PRICE_CONTROL_DELETE        = 63








 
end
