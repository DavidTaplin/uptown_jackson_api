class UsersController < ApplicationController
    before_action :authenticate_devise_api_token!
    before_action :find_user, only: [:edit, :update, :destroy]


def edit
    render_success(payload: @user)
end

def update
    if @user.update(user_params)
        render_success(payload: @user)
    
  else
    render_error(errors: @user.error.full_messages, status: 422)
    
  
  end

end

def destroy
    @user.destroy
    render_success(message: "User deleted successfully.")
end

private

def find_user
    @user = User.find(params[:id])
rescue ActiveRecord::RecordNotFound
    render_error(errors: "User not found", status: 404)
end

def user_params
    params.require(:user).permit(:name, email: :password)
end
    