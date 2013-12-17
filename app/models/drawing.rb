class Drawing < ActiveRecord::Base
	belongs_to :estimation
  	has_attached_file :photo , :style => { :small => "200x200>" , :big => "500x500>" }, 
  	  :default_url => "/images/missing.png",
      :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
      :url => "/system/:attachment/:id/:style/:filename"


    validates_attachment_presence :photo
	validates_attachment_size :photo, :less_than => 5.megabytes
	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png' , 'image/jpg']


	ROLE = [
	    InventoryManagementSystem::DRAWING
	]
end
