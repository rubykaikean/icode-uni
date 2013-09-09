class UserRules

	def initialize(user)
		@user = user 
    end

    def user_roles
    	@user.roles.map(&:inventory_management_system_id)
    end


end