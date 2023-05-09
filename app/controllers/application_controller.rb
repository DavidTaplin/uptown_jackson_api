class ApplicationController < ActionController::API
  include Pagy::Backend
  include PagyHelper
  #include JwtHelper

  

  
  before_action :authenticate, except: [:create]

  def authenticate
    authorization_header = request.headers['Authorization'];

    if authorization_header
      token = authorization_header.split(' ').last
      decoded_token = JwtHelper.decode(token)
    end

    if decoded_token && (user_id = decoded_token['user_id'])
      @current_user = User.find_by(id: user_id)
    end

    render json: { status: :unprocessable_entity } unless @current_user
  end

  def render_success(payload:, status: 200)
    render json: { success: true, data: payload }, status: status
  end

  def render_error(errors:, status: 400)
    render json: { success: false, errors: errors }, status: status
  end

  private

  def authenticate_user!
    if !user_signed_in?
      render json: { error: 'You need to sign in or sign up before continuing.' }, status: :unauthorized
    end
  end

  def user_signed_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
