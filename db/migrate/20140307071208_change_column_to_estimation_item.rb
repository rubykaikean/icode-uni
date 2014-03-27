class ChangeColumnToEstimationItem < ActiveRecord::Migration
  def change

  	remove_column :estimation_items , :weight

  	add_column :estimation_items , :status_id , :boolean , :default => false

  end
end
