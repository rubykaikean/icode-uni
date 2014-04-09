class AddColumnFromTable < ActiveRecord::Migration
  def change

  	add_column :estimation_items, :description, :string

  	add_column :estimation_items, :fitting_material_id, :integer

  	add_column :materials, :description, :string

  	remove_column :price_control_items, :old_unit_price

  	remove_column :price_control_items, :old_eff_date

  	remove_column :price_control_items, :price_control_id

  	add_column :price_control_items, :fitting_material_id, :integer
  end
end
