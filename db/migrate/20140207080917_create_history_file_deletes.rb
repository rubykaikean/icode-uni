class CreateHistoryFileDeletes < ActiveRecord::Migration
  def change
    create_table :history_file_deletes do |t|
      t.integer :estimation_id

      t.timestamps
    end

    remove_column :estimations , :issued_by

    add_column :estimations , :user_id , :integer
  end
end
