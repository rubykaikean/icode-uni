class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :user_id
      t.integer :inventory_management_system_id

      t.timestamps
    end
  end
end
