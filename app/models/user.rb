class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    validates :password_digest, presence: true


has_secure_password

def authenticate(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end


  def password=(new_password)
   @password = new_password
    self.password_digest = BCrypt::Password.create(new_password)
   end

   
end

    

    

    

    # self.primary_key = "user_id"


    

    


