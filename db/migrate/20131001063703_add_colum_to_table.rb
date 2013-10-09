class AddColumToTable < ActiveRecord::Migration
  def change


  	# add_column :price_control_items , :description , :string 
  	add_column :materials , :material_code , :string

  	add_column :materials , :price_fomular_id , :integer

  	remove_column :price_control_items , :material_id

  	add_column :price_control_items , :material_id , :integer

  end
end
