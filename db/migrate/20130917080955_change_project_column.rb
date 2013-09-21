class ChangeProjectColumn < ActiveRecord::Migration
  def change
  	add_column :projects , :client_id , :integer

  	add_column :projects , :date , :date

  	add_column :projects , :standard , :boolean , :default => false

  	add_column :projects , :non_standard , :boolean , :default => false

  	add_column :projects , :project_code, :string

  	#remove_column :projects , :staion_id

  end
end
