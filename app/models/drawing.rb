class Drawing < ActiveRecord::Base
	belongs_to :estimation

	#before_save :basename
  	has_attached_file :photo , :style => { :small => "200x200>" , :big => "500x500>" }, 
  	  :default_url => "/images/missing.png",
      :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
      :url => "/system/:attachment/:id/:style/:filename"
      #:url => "/system/:attachment/:id/:style/jhgjhg"
		#/system/:attachment/:id/:style/:filename

    validates_attachment_presence :photo
	validates_attachment_size :photo, :less_than => 5.megabytes
	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png' , 'image/jpg']


	ROLE = [
	    InventoryManagementSystem::DRAWING
	]


 	

#   has_attached_file :image,
#           :styles => { :original => ["300x250>", :png], :small => ["165x138>", :png] },
#           :url  => "/images/lille/:style/:id/:basename.:extension",
#           :path => ":rails_root/public/images/lille/:style/:id/:basename.:extension"

 private

  def basename
  	self.photo_file_name = "hiughgj"
  end




end
