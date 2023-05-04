class ApplicationController < ActionController::API
  include Pagy::Backend
  include PagyHelper
  def render_success(payload:, status: 200)
    render json: { success: true, data: payload }, status: status
  end

  def render_error(errors:, status: 400)
    render json: { success: false, errors: errors }, status: status
  end
end
