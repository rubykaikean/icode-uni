module ApplicationHelper


	def iproduct(quantity, unit_price)
   		number_with_precision(quantity * unit_price, :precision => 2, :separator => '.', :delimiter => ',') rescue '-'
  	end

	def four_precision(unit_price)
	   number_with_precision(unit_price, :precision => 4, :separator => '.', :delimiter => ',') rescue '-'
	end
	    
	def three_precision(unit_price)
	   number_with_precision(unit_price, :precision => 3, :separator => '.', :delimiter => ',') rescue '-'
	end

	def link_save_button
    	submit_tag "Save", :class => "k-button font_bold", :id => "save_button", :style => "cursor: pointer;"
  	end

  	

  	def link_home_button
    	link_to 'Home' , root_url , :class=>"btn btn-info"
  	end
end
