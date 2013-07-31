class UserRegister
  
  def self.generate_role(user, inventory_management_system)
    user.roles.delete_all if user.roles.present?
    inventory_management_system.each do |ims|
      user.roles.create!(:inventory_management_system_id => ims.to_i)
    end
  end

end