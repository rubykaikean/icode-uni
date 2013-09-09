class ChangeColumnToTable < ActiveRecord::Migration
  def change
  	add_column :estimation_items , :dimension_l , :decimal , :scale => 5, :precision => 10
  	add_column :estimation_items , :dimension_h , :decimal , :scale => 5, :precision => 10
  	add_column :estimation_items , :dimension_w , :decimal , :scale => 5, :precision => 10

  end
end
