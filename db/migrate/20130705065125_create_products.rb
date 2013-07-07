class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :client_id
      t.string :date
      t.boolean :standard , :default => false
      t.boolean :non_standard , :default => false

      t.timestamps
    end
  end
end
