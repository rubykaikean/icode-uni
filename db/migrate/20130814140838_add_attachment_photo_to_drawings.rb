class AddAttachmentPhotoToDrawings < ActiveRecord::Migration
  def self.up
    change_table :drawings do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :drawings, :photo
  end
end
