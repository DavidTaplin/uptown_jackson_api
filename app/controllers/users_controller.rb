class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token, raise: false
    before_action :authenticate_devise_api_token!, only: [:update, :destroy]
  
    # def edit
    #   render_success(payload: @user)
    # end
  
    def update
      user = User.find_by(id: current_devise_api_token.resource_owner_id)
      
      if user.nil?
        render_error(errors: 'User not found', status: 404)
        return
      end
    
      if user.update(email: params[:email])
        render_success(payload: user)
      else
        render_error(errors: user.errors.full_messages, status: 422)
      end
    end
    
    
  
    def destroy
      @user.destroy
      render_success(message: 'User deleted successfully.')
    end
  
    private
  
    def find_user
      @user = User.find_by(id: params[:id])
      return if @user
  
      render_error(errors: 'User not found', status: 404)
    end
  
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

    # def get_user_buildings
    #     buildings = Building.find_by user_id: current_devise_api_token.resource_owner_id
    #     puts buildings
    # end
  end
  