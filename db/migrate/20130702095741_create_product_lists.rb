class CreateProductLists < ActiveRecord::Migration
  def change
    create_table :product_lists do |t|
      t.string :estimation_no
      t.string :description
      t.integer :qty
      t.string :batch_no
      t.string :issue_by
      t.date :issue_date
      t.string :remark
      t.integer :client_id

      t.timestamps
    end
  end
end
