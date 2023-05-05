class SessionsController < ApplicationController

    def new
    end
  
    def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        redirect_to root_url, notice: 'Logged in!'
      else
        flash.now.alert = 'Email or password is invalid'
        render 'new'
      end
    
  
    def destroy
      session[:user_id] = nil
      redirect_to root_url, notice: 'Logged out!'
    end

end
end