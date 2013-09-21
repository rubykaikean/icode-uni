class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :staion_id

      t.timestamps
    end

    remove_column :estimation_items , :dimension_l

  	remove_column :estimation_items , :dimension_w

  	remove_column :estimation_items , :dimension_h
  end
end
