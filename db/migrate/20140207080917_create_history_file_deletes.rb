class CreateHistoryFileDeletes < ActiveRecord::Migration
  def change
    create_table :history_file_deletes do |t|
      t.string :title
      t.string :dimension
      t.integer :user_id
      t.timestamps
    end

    remove_column :estimations , :issued_by

    add_column :estimations , :user_id , :integer
  	add_column :estimations , :kiv_status , :boolean , :default => false
  end
end
