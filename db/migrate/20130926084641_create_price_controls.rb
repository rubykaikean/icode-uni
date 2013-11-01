class CreatePriceControls < ActiveRecord::Migration
  def change
    # create_table :price_controls do |t|
    #   t.integer :pp_no
    #   t.date :pp_date
    #   t.integer :client_id
    #   t.string :reference
    #   t.integer :user_id

    #   t.timestamps
    # end

    # remove_column :stations , :product_id

    add_column :stations , :project_id , :integer

    remove_column :estimation_items , :thk_dia
    add_column :estimation_items , :thk_dia , :string

  end
end
