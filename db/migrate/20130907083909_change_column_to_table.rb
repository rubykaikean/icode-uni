class ChangeColumnToTable < ActiveRecord::Migration
  def change
  	# add_column :estimation_items , :dimension_l , :float
  	# add_column :estimation_items , :dimension_h , :float
  	# add_column :estimation_items , :dimension_w , :float

  	# remove_column :materials , :thk_dia

  	# add_column :materials , :thk_dia , :decimal , :scale => 5 , :precision => 10

  	# remove_column :estimation_items , :thk_dia
  	# remove_column :estimation_items , :decimal
  	# remove_column :estimation_items , :remarks
  	remove_column :materials , :type_id

  	add_column :estimation_items , :thk_dia , :decimal , :scale => 5 , :precision => 10

  end
end
