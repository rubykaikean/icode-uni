class AddColumnToDrawings < ActiveRecord::Migration
  def change
  	add_column :drawings , :estimation_id , :integer

  end
end

