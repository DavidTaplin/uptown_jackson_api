class UsersController < ApplicationController

 def new 
    user = User.new
 end

 def create
    user = User.create(user_params)
    user.password = params[:password]
  user.password_confirmation = params[:password_confirmation]

    if user.save
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end

    def destroy
      session[:user_id] = nil
      redirect_to root_path, notice: "Logged out successfully."
    end
  
  end
  
  

# private

    def user_params
        params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation)
    end

end
