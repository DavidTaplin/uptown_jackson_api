class User < ApplicationRecord
   validates :password, presence: true
has_secure_password

  def password=(new_password)
   @password = new_password
    self.password_digest = BCrypt::Password.create(new_password)
   end
end

    

    

    

    # self.primary_key = "user_id"


    

    


