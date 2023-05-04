class UsersController < ApplicationController

# def new 
 #   user = User.new
# end

def create
    user = User.new(user_params)
    if user.save
     render json: user, status: :created
    else
     render json: user.error, status: :unprocessable_entity
    end
   end
  

# private

def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password_digest)
end

end
