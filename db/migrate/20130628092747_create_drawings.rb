class CreateDrawings < ActiveRecord::Migration
  def change
    create_table :drawings do |t|
      t.string :name

      t.timestamps
    end
  end
end
