class AddColumnToMaterials < ActiveRecord::Migration
  def change

  	add_column :materials , :category_id , :integer

  	add_column :materials , :type_id , :integer

  	add_column :materials , :thk_dia , :decimal, :scale => 5, :precision => 10

  	add_column :materials , :dimension_h , :decimal , :scale => 5, :precision => 10

  	add_column :materials , :dimension_w , :decimal, :scale => 5, :precision => 10

	add_column :materials , :plate , :decimal , :scale => 5, :precision => 10

	add_column :materials , :wt_ibs_ft , :decimal  , :scale => 5 , :precision => 10
  
  end
end
