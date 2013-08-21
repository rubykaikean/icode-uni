class AddColumnToTable < ActiveRecord::Migration
  def change

  	add_column :products, :product_code, :string

  	#add_column :estimations , :materails , :integer
  	# no add in materails because it is auto calculate

  	add_column :estimations , :welding, :integer

  	add_column :estimations , :oxygen_acetylene, :integer

  	add_column :estimations , :painting, :integer

  	add_column :estimations , :sand_blasting, :integer

  	add_column :estimations , :transport , :integer

  	add_column :estimations , :crane , :integer

  	add_column :estimations , :shipment , :integer

  	add_column :estimations , :labour , :integer

  	add_column :estimations , :installation , :integer

  	add_column :estimations , :dismantle , :integer

  	add_column :estimations , :machining , :integer

  	add_column :estimations , :insulation , :integer

  	add_column :estimations , :civil_work , :integer

  	add_column :estimations , :electrik , :integer

  	add_column :estimations , :piling_work , :integer

  	add_column :estimations , :forming , :integer

  	add_column :estimations , :misc , :integer

  	add_column :estimations , :jkkp , :integer

  end
end
