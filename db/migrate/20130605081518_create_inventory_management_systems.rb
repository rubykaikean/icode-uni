class CreateInventoryManagementSystems < ActiveRecord::Migration
  def change
    create_table :inventory_management_systems do |t|

      t.timestamps
    end
  end
end
