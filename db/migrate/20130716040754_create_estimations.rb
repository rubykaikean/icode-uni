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
  end
end
