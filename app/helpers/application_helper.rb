module ApplicationHelper


	def link_save_button
    	submit_tag "Save", :class => "k-button font_bold", :id => "save_button", :style => "cursor: pointer;"
  	end

  	def link_home_button
    	link_to 'Home' , root_url , :class=>"btn btn-info"
  	end
end
