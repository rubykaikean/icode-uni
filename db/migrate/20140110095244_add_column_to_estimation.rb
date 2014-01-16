class AddColumnToEstimation < ActiveRecord::Migration
  def change

  	add_column :estimations , :project_id , :integer 

  	add_column :estimations , :status , :boolean , :default => false

  end
end
