class AddColumnToClient < ActiveRecord::Migration
  def change

  	add_column :clients , :contact_person_one , :string

  	add_column :clients , :contact_person_two , :string

  	add_column :clients , :contact_person_three , :string

  	add_column :clients , :address , :text 

  	add_column :clients , :email , :string

  	add_column :clients , :contact_number , :integer

  	add_column :materials , :unit_measure , :string

  end
end
