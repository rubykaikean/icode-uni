class CreateEstimationItems < ActiveRecord::Migration
  def change
    create_table :estimation_items do |t|
      t.string :part_detail
      t.string :material
      t.string :thk_dia
      t.integer :dimension_h
      t.integer :dimension_w
      t.integer :dimension_l
      t.float :wt_ibs_ft , :decimal, { :scale => 4, :precision => 10 }
      t.float :qty , :decimal, { :scale => 4, :precision => 10 }
      t.string :uom
      t.integer :weight
      t.string :remarks

      t.timestamps
    end

    add_column :estimation_items , :estimation_id , :integer
  end
end
