class UsersController < ApplicationController

   before_action :authenticate, except: [:create]

  def show
    render json: { user: @current_user}
  end

  def update
    if @current_user.update(user_params)
      render json: { user: @current_user }
    else
      render json: { error: @current_user.errors.full_messages.join(", ") }, status: :unprocessable_entity
    end


  def index
    users = User.all
    render json: users
  end

 def new 
    user = User.new
 end

 def create
    user = User.find(user_params)
    user.password = params[:password]
  user.password_confirmation = params[:password_confirmation]

    if user.save
      render json: user, jwt: @token ,status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end

    def destroy
      session[:user_id] = nil
      redirect_to root_path, notice: "Logged out successfully."
    end
  
  
  
  

# private

    def user_params
        params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation)
    end

  end

end



