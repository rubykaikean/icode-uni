class ChangeMaterialTable < ActiveRecord::Migration
  def change

  	remove_column :materials , :wt_ibs_ft

  	remove_column :materials , :dimension_h

  	add_column :materials , :wt_ibs_ft , :decimal , :scale => 2, :precision => 10

  	add_column :materials , :dimension_h , :decimal , :scale => 2, :precision => 10

  end
end
