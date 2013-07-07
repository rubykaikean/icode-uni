class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :client_id
      t.date :date

      t.timestamps
    end
  end
end
