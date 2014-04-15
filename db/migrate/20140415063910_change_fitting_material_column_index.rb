class ChangeFittingMaterialColumnIndex < ActiveRecord::Migration
  def change

  	add_index :fitting_materials , :material_code , :unique => true
  end
end
