class CreateFittingMaterials < ActiveRecord::Migration
  def change
    create_table :fitting_materials do |t|
      t.string :name
      t.string :thk_dia
      t.string :brand
      t.string :modal
      t.string :type_1
      t.string :pump_capacity
      t.string :head
      t.string :material_type
      t.string :pump_speed
      t.string :fan_speed
      t.string :motor_power
      t.string :motor_pole
      t.string :air_flow
      t.string :static_pressure
      t.string :other
      t.string :remark
      t.string :material_code
      t.timestamps
    end
  end
end
