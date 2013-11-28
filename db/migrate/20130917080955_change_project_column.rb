class ChangeProjectColumn < ActiveRecord::Migration
  def change
  	add_column :projects , :client_id , :integer

  	add_column :projects , :date , :date

  	add_column :projects , :standard , :boolean , :default => false

  	add_column :projects , :non_standard , :boolean , :default => false

  	add_column :projects , :project_code, :string

    remove_column :projects , :staion_id

  	remove_column :materials , :thk_dia

  	add_column :materials , :thk_dia , :string

  	remove_column :materials , :dimension_w

  	add_column :materials , :dimension_w , :string

    add_column :materials , :thk_dia_um , :string

    remove_column :estimation_items , :dimension_w

    add_column :estimation_items , :dimension_w , :string

    add_column :estimation_items , :thk_dia_um , :string

    add_column :estimation_items , :unit_price , :float

  end
end
