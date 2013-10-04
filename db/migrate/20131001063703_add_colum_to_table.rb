class AddColumToTable < ActiveRecord::Migration
  def change


  	# add_column :price_control_items , :description , :string 
  	add_column :materials , :material_code , :string

  	add_column :materials , :material_price_fomular , :integer

  end
end
