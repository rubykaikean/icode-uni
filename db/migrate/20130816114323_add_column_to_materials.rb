class AddColumnToMaterials < ActiveRecord::Migration
  def change

  	add_column :materials , :category_id , :integer

  	add_column :materials , :type_id , :integer

  	add_column :materials , :thk_dia_1 , :decimal , :default => 0.00000, :scale => 5, :precision => 10

  	add_column :materials , :thk_dia_2 , :decimal , :default => 0.00000, :scale => 5, :precision => 10

  	add_column :materials , :dimension_h , :decimal , :default => 0.00000, :scale => 5, :precision => 10

  	add_column :materials , :dimension_w , :decimal, :default => 0.00000, :scale => 5, :precision => 10

    add_column :materials , :dimension_l , :decimal , :default => 0.00000 , :scale => 5 , :precision => 10

	  add_column :materials , :plate , :decimal , :default => 0.00000, :scale => 5, :precision => 10

	  add_column :materials , :wt_ibs_ft , :decimal , :default => 0.00000 , :scale => 5 , :precision => 10
  
  end
end
