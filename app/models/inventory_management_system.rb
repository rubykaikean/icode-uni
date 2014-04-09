class InventoryManagementSystem < ActiveRecord::Base

  has_many :roles, :dependent => :destroy
  has_many :users, through: :roles


  #MODULE
  CLIENT                      = 1
  MATERIAL                    = 2
  FITTING_MATERIAL            = 87
  PROJECT                     = 3
  STATION                     = 4
  ESTIMATION                  = 5
  ESTIMATION_ITEM             = 76  
  PRICE_CONTROL_ITEM          = 6
  DRAWING                     = 7
  HISTORY_FILE_DELETE         = 92
  REPORT                      = 94 

  #ACTION

  HISTORY_FILE_DELETE_DELETE  = 93 

  CLIENT_ADD                  = 10
  CLIENT_EDIT                 = 11
  CLIENT_DELETE               = 12

  MATERIAL_ADD                = 20
  MATERIAL_SHOW               = 21
  MATERIAL_EDIT               = 22
  MATERIAL_DELETE             = 23

  FITTING_MATERIAL_ADD        = 88
  FITTING_MATERIAL_SHOW       = 89
  FITTING_MATERIAL_EDIT       = 90
  FITTING_MATERIAL_DELETE     = 91

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

  PRICE_CONTROL_ITEM_ADD      = 60
  PRICE_CONTROL_ITEM_SHOW     = 61
  PRICE_CONTROL_ITEM_EDIT     = 62
  PRICE_CONTROL_ITEM_DELETE   = 63

  DRAWING_ADD                 = 70
  DRAWING_DELETE              = 71
  DRAWING_PRINT               = 72

  ESTIMATION_ITEM_ADD         = 73
  ESTIMATION_ITEM_SHOW        = 74
  ESTIMATION_ITEM_EDIT        = 77 
  ESTIMATION_ITEM_DELETE      = 75

  STANDARD_PROJECT            = 85 
  STANDARD_PROJECT_ADD        = 80 
  STANDARD_PROJECT_EDIT       = 78
  STANDARD_PROJECT_DELETE     = 79

  STANDARD_ESTIMATION         = 86
  STANDARD_ESTIMATION_ADD     = 81
  STANDARD_ESTIMATION_SHOW    = 82
  STANDARD_ESTIMATION_EDIT    = 83
  STANDARD_ESTIMATION_DELETE  = 84
  
  LIST_STATION_REPORT         = 95 
  LIST_STATION_REPORT_SHOW    = 96
  LIST_STATION_REPORT_PRINT   = 97

  LIST_ESTIMATION_REPORT      = 98
  LIST_ESTIMATION_REPORT_SHOW = 99
  LIST_ESTIMATION_REPORT_PRINT= 100 #until this number




 
end
