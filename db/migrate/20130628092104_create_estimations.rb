class CreateEstimations < ActiveRecord::Migration
  def change
    create_table :estimations do |t|
      t.string :part_detail
      t.string :material
      t.float :thk_dia, :decimal, {:default => 0.0000, :scale => 4, :precision => 10 }
      t.integer :dimension_h
      t.integer :dimension_w
      t.integer :dimension_l
      t.string :remarks
      t.integer :station_id

      t.timestamps
    end
  end
end
