class CreatePriceControlItems < ActiveRecord::Migration
  def change
    create_table :price_control_items do |t|
      t.integer :material_id
      t.float :old_unit_price
      t.date :old_eff_date
      t.float :new_unit_price
      t.date :new_eff_date
      t.integer :price_control_id

      t.timestamps
    end
  end
end
