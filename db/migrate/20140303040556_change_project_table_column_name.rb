class ChangeProjectTableColumnName < ActiveRecord::Migration
  def change

  	remove_column :projects , :standard
  	remove_column :projects , :non_standard

  	add_column :projects , :tenders , :boolean , :default => false
  	add_column :projects , :projects , :boolean , :default => false

  end
end
