class SessionsController < ApplicationController

  include JwtHelper

    def new
    end
  
    
        def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
          jwt_token = JwtHelper.encode(user_id: user.id)
          render json: { success: true, jwt_token: jwt_token }, status: :ok
        else
          render json: { success: false, message: 'Invalid email or password' }, status: :unprocessable_entity
        end
    end
  
    def destroy
      session[:user_id] = nil
      redirect_to root_url, notice: 'Logged out!'
    end


end
