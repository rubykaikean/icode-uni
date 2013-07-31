class AddAndRemoveColumn < ActiveRecord::Migration
  def change

  	add_column :stations , :estimation_id , :integer

  	remove_column :stations , :estimation_id

  end
end
