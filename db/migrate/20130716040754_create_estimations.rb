class CreateEstimations < ActiveRecord::Migration
  def change
    create_table :estimations do |t|
      t.integer :client_id
      t.string :title
      t.string :dimension
      t.integer :drawing_no_id
      t.string :date
      t.integer :issued_by

      t.timestamps
    end

    remove_column :estimation_items , :material 

    add_column :estimation_items , :material_id , :integer
  end
end
