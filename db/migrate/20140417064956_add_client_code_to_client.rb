class AddClientCodeToClient < ActiveRecord::Migration
  def change

  	add_column :clients, :client_code, :string

  	add_index :clients , :client_code , :unique => true

  end
end
