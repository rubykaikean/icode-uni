class ChangeColumnName < ActiveRecord::Migration
  def change

  	remove_column :estimations , :material , :string
  	add_column :estimations , :material_id , :integer
  end
end